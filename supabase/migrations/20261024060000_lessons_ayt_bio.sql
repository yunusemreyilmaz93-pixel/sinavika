-- 20261024060000_lessons_ayt_bio. Yayına alınır, notlar yalnızca yöneticiye görünür. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sıcak bir tencereye dokunduğunda elini düşünmeden çekersin. Bir arkadaşının sesini duyunca kim olduğunu tanırsın. Bu hızlı ve koordineli tepkilerin hepsini **sinir sistemi** yönetir. Bu konuda **nöronun yapısını**, **dinlenme ve aksiyon potansiyelini**, **sinapsta iletimi**, **merkezi ve çevresel sinir sistemini** ve **refleks yayını** öğreneceksin. AYT Biyoloji'de nöronda iyon hareketleri, sinaps ve otonom sinir sistemi her yıl sorulur.

:::hedefler
1. Nöronun bölümlerini ve görevlerini açıklamak.
2. Dinlenme potansiyelini ve aksiyon potansiyelinin evrelerini iyon hareketleriyle anlatmak.
3. Miyelinli ve miyelinsiz aksonda iletimi karşılaştırmak.
4. Sinapsta impuls aktarımının basamaklarını sıralamak.
5. Sempatik ve parasempatik sistemin etkilerini ayırt etmek.
6. Refleks yayının yolunu çizmek.
:::

:::ipucu
Aksiyon potansiyelinde iyon sırasını ezberle: **önce Na⁺ girer** (depolarizasyon), **sonra K⁺ çıkar** (repolarizasyon). Na⁺/K⁺ pompası ise bunun **ters yönünde** ve enerji harcayarak çalışır: 3 Na⁺ dışarı, 2 K⁺ içeri.
:::

::video{id="Ff59PYlEE_g" etiket="Konu anlatımı videosu" baslik="Sinir Sistemi" kanal="Selin Hoca Biyoloji"}

## 1. Nöron

Sinir sisteminin yapı ve işlev birimi **nörondur**.

![Nöronun bölümleri: dendrit, hücre gövdesi, akson, miyelin kılıf, Ranvier boğumu ve akson ucu](/lessons/ayt-bio/noron.svg "İmpuls dendritten gövdeye, oradan akson boyunca akson ucuna ilerler")

- **Dendrit:** İmpulsu **alır** ve hücre gövdesine taşır. Kısa ve çok dallıdır.
- **Hücre gövdesi:** Çekirdek ve organelleri taşır.
- **Akson:** İmpulsu gövdeden **uzaklaştırır**. Uzundur ve genellikle tektir.
- **Miyelin kılıf:** Aksonu saran yağlı yalıtkan tabakadır (Schwann hücreleri). Kılıflar arasındaki boşluklara **Ranvier boğumu** denir.

Görevlerine göre nöronlar üçe ayrılır: **duyu** (reseptörden merkeze), **ara** (merkezi sinir sisteminde, bağlantı kurar), **motor** (merkezden efektöre, yani kas ya da bez).

## 2. Dinlenme potansiyeli

Uyarılmamış nöronda zarın iç yüzü dışa göre negatiftir, yaklaşık $-70\ \text{mV}$. Bu fark şunlarla sağlanır:

- **Na⁺/K⁺ pompası** (ATP harcar): $3\ \text{Na}^+$'yı dışarı, $2\ \text{K}^+$'yı içeri taşır.
- Zar, dinlenmede **K⁺'a** Na⁺'dan çok daha geçirgendir. K⁺ sızıntıyla dışarı çıkar.
- Hücre içinde büyük, negatif yüklü proteinler kalır.

Sonuçta dışarıda Na⁺, içeride K⁺ yoğundur.

## 3. Aksiyon potansiyeli

Uyaran **eşik değere** (yaklaşık $-55\ \text{mV}$) ulaşırsa aksiyon potansiyeli oluşur. Eşik altı uyaran yanıt vermez, eşik ve üstü uyaranlar aynı büyüklükte yanıt oluşturur. Buna **ya hep ya hiç yasası** denir. Uyaranın şiddeti yanıtın **büyüklüğünü** değil **sıklığını** artırır.

1. **Depolarizasyon:** Voltaj kapılı **Na⁺ kanalları** açılır, Na⁺ hızla içeri girer. Zar iç yüzü pozitifleşir (yaklaşık $+30\ \text{mV}$).
2. **Repolarizasyon:** Na⁺ kanalları kapanır, **K⁺ kanalları** açılır, K⁺ dışarı çıkar. İç yüz tekrar negatifleşir.
3. **Hiperpolarizasyon:** K⁺ kanalları geç kapandığından potansiyel kısa süre dinlenmeden de aşağı iner.
4. **Dinlenmeye dönüş:** Na⁺/K⁺ pompası iyonları eski yerlerine taşır.

Aksiyon potansiyeli sırasında nöron yeni bir uyarana yanıt veremez. Buna **refraktör (dinlenme) dönemi** denir. Böylece impuls tek yönlü ilerler.

::sim{tur="aksiyon"}

**İletim hızı:** Miyelinsiz aksonda aksiyon potansiyeli bitişik bölgeleri sırayla uyarır, yavaştır (yaklaşık $1\ \text{m/s}$). **Miyelinli** aksonda yalnızca **Ranvier boğumlarında** oluşur, impuls boğumdan boğuma **sıçrar** (saltatör iletim) ve $100\ \text{m/s}$ civarına çıkar. Akson çapı arttıkça da hız artar. Miyelin yıkımı (multipl skleroz) iletimi yavaşlatır.

## 4. Sinaps

İki nöron ya da nöron ile efektör arasındaki bağlantıya **sinaps** denir. Arada **sinaptik aralık** bulunur ve impuls kimyasal olarak aktarılır.

1. İmpuls **akson ucuna** ulaşır, $\text{Ca}^{2+}$ kanalları açılır, $\text{Ca}^{2+}$ içeri girer.
2. Nörotransmitter dolu **veziküller** presinaptik zarla birleşir.
3. Nörotransmitter (**asetilkolin**, noradrenalin, dopamin) sinaptik aralığa **boşalır**.
4. Postsinaptik zardaki **reseptörlere** bağlanır, uyarıcı ya da engelleyici etki oluşturur.
5. Nörotransmitter enzimle yıkılır ya da geri alınır.

Sinapsta iletim **tek yönlüdür**, çünkü nörotransmitter yalnızca akson ucunda bulunur.

## 5. Merkezi ve çevresel sinir sistemi

**Merkezi sinir sistemi (MSS):** Beyin ve omurilik.

- **Büyük beyin:** Düşünme, bellek, bilinçli hareket, duyu merkezleri.
- **Beyincik:** Denge ve kas koordinasyonu.
- **Omurilik soğanı:** Solunum, kalp atışı gibi yaşamsal otomatik işlevler.
- **Hipotalamus:** Vücut ısısı, açlık, susuzluk ve hormon kontrolü. Hipofizle bağlantılıdır.
- **Omurilik:** Beyinle çevre arasında yol, refleks merkezi.

**Çevresel sinir sistemi:** Sinirler ve gangliyonlar. **Somatik** (istemli, iskelet kası) ve **otonom** (istemsiz, düz kas, kalp kası, bez) olarak ikiye ayrılır.

| | Sempatik | Parasempatik |
| --- | --- | --- |
| Genel etki | Uyarır, stresle başa çıkar | Dinlendirir, onarır |
| Kalp atışı | Artar | Azalır |
| Göz bebeği | Genişler | Daralır |
| Bronşlar | Genişler | Daralır |
| Sindirim | Yavaşlar | Hızlanır |
| Mesane | Gevşer | Kasılır |

## 6. Refleks yayı

Refleks, uyarana karşı **istemsiz ve hızlı** yanıttır. Yol: **reseptör → duyu nöronu → omurilik (ara nöron) → motor nöron → efektör.** Beyin yola karışmaz. Bu yüzden yanıt çok hızlıdır, kişi sonradan acıyı fark eder. Diz kapağı refleksi, el çekme refleksi örnektir.

## 7. Sık yapılan hatalar

- Na⁺/K⁺ pompasının aksiyon potansiyelini oluşturduğunu sanmak. Pompa dinlenme dengesini kurar ve geri getirir.
- Depolarizasyonda K⁺'ın girdiğini sanmak.
- Uyaran şiddeti arttıkça aksiyon potansiyelinin büyüdüğünü sanmak. Ya hep ya hiç yasası geçerlidir.
- Sempatik ve parasempatiği karıştırmak. Sempatik hep "kaç ya da savaş" demektir.
- Refleks yolunda beynin görev aldığını düşünmek.

:::baglanti
Sinir sistemi, **endokrin sistemle** birlikte vücudu düzenler. Hipotalamus ikisini birbirine bağlar. **Duyu organlarında** reseptörlerin oluşturduğu impulslar bu sistemle iletilir. **Destek ve hareket sisteminde** kasın kasılması bir motor nöronun uyarısıyla başlar. **Fizikte** elektriksel potansiyel ve iyonların yük taşıması bu konunun temelidir.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Dinlenme potansiyeli | $-70\ \text{mV}$, pompa ve K⁺ sızıntısı |
| Depolarizasyon | Na⁺ girer |
| Repolarizasyon | K⁺ çıkar |
| Ya hep ya hiç | Eşik altı yanıt yok, üstü aynı |
| Saltatör iletim | Miyelinli, Ranvier boğumları, hızlı |
| Sinaps | $\text{Ca}^{2+}$, vezikül, nörotransmitter, reseptör |
| Refleks | Reseptör, duyu, omurilik, motor, efektör |

## Mini test

:::soru{cevap="B"}
Bir nöronda aksiyon potansiyelinin repolarizasyon evresinde aşağıdakilerden hangisi gerçekleşir?

- A) Voltaj kapılı Na⁺ kanalları açılır ve Na⁺ hücre içine girer.
- B) Voltaj kapılı K⁺ kanalları açılır ve K⁺ hücre dışına çıkar.
- C) Na⁺/K⁺ pompası üç Na⁺'yı içeri alıp iki K⁺'yı dışarı verir.
- D) Cl⁻ iyonları hücre dışına çıkarak zarı pozitifleştirir.
- E) Ca²⁺ kanalları açılır ve nörotransmitter salgılanır.

---

1. Depolarizasyonda Na⁺ içeri girmiş, zarın iç yüzü pozitifleşmiştir.
2. Repolarizasyonda Na⁺ kanalları kapanır, K⁺ kanalları açılır ve K⁺ dışarı çıkar. İç yüz tekrar negatifleşir. Doğru cevap B.

Diğer şıklar: **A** depolarizasyon evresi / **C** pompa ters yönde çalışır, üç Na⁺ dışarı iki K⁺ içeri / **D** Cl⁻ bu evrede rol oynamaz / **E** Ca²⁺ girişi akson ucunda sinaps olayıdır.
:::

:::soru{cevap="C"}
Miyelinli bir aksonda impuls iletimiyle ilgili aşağıdakilerden hangisi doğrudur?

- A) Miyelin kılıf boyunca aksiyon potansiyeli kesintisiz oluşur.
- B) İletim hızı miyelinsiz aksona göre daha düşüktür.
- C) Aksiyon potansiyeli yalnızca Ranvier boğumlarında oluşur.
- D) Ranvier boğumlarında voltaj kapılı kanal bulunmaz.
- E) Miyelin kılıf iyonların aksondan geçişini kolaylaştırır.

---

1. Miyelin kılıf yağlı yalıtkan bir tabakadır, iyon geçişini engeller.
2. İyon geçişi ve aksiyon potansiyeli yalnızca kılıfsız Ranvier boğumlarında olur. İmpuls bir boğumdan diğerine sıçrar (saltatör iletim) ve iletim çok hızlanır. Doğru cevap C.

Diğer şıklar: **A** kılıfın olduğu yerde iyon geçişi yok / **B** miyelinli akson daha hızlıdır / **D** Ranvier boğumlarında yoğun kanal bulunur / **E** miyelin yalıtkandır, iyon geçişini engeller.
:::

:::soru{cevap="E"}
Sempatik sinir sistemi uyarıldığında aşağıdakilerden hangisi gerçekleşir?

- A) Göz bebeği daralır ve sindirim hızlanır.
- B) Kalp atış hızı azalır ve bronşlar daralır.
- C) Sindirim salgıları artar ve mesane kasılır.
- D) Bronşlar daralır ve göz bebeği genişler.
- E) Kalp atış hızı artar ve bronşlar genişler.

---

1. Sempatik sistem, vücudu stres ya da tehlikeye hazırlar (kaç ya da savaş).
2. Kalp atışı hızlanır, bronşlar genişler, göz bebeği genişler, sindirim yavaşlar. Doğru cevap E.

Diğer şıklar: **A** göz bebeği daralması ve sindirimin hızlanması parasempatik etki / **B** kalbin yavaşlaması ve bronşların daralması parasempatik etki / **C** salgı artışı ve mesanenin kasılması parasempatik etki / **D** bronşların daralması parasempatik etki, yalnızca göz bebeği doğru.
:::

:::soru{cevap="E"}
Aşağıdaki olaylar sinapsta impuls aktarımında yaşanan basamaklardır.

I. $\text{Ca}^{2+}$ iyonlarının presinaptik uca girmesi

II. Nörotransmitter dolu veziküllerin zarla birleşmesi

III. Nörotransmitterin sinaptik aralığa boşalması

IV. Nörotransmitterin postsinaptik reseptörlere bağlanması

Bu olayların doğru sıralaması aşağıdakilerden hangisidir?

- A) II - I - III - IV
- B) I - III - II - IV
- C) III - II - I - IV
- D) I - II - IV - III
- E) I - II - III - IV

---

1. İmpuls akson ucuna ulaşınca önce $\text{Ca}^{2+}$ kanalları açılır ve $\text{Ca}^{2+}$ içeri girer (I).
2. $\text{Ca}^{2+}$ veziküllerin zarla birleşmesini sağlar (II).
3. Nörotransmitter aralığa boşalır (III) ve postsinaptik reseptörlere bağlanır (IV). Doğru cevap E.

Diğer şıklar: **A** vezikül birleşmesi $\text{Ca}^{2+}$ girişinden önce konmuş / **B** boşalma birleşmeden önce konmuş / **C** boşalma başa alınmış / **D** bağlanma boşalmadan önce konmuş.
:::

## Kendini dene

:::dene
1. Depolarizasyonda hangi iyon hücreye girer? => Na⁺.
2. Na⁺/K⁺ pompası kaç Na⁺ ve kaç K⁺ taşır? => 3 Na⁺ dışarı, 2 K⁺ içeri.
3. İmpulsu hücre gövdesinden uzaklaştıran uzantı hangisidir? => Akson.
4. Refleks yayında beyin görev alır mı? => Hayır, omurilik merkezdir.
5. Sinapsta iletimin tek yönlü olmasının nedeni nedir? => Nörotransmitter yalnızca akson ucunda bulunur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-bio' and name = 'Sinir Sistemi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sınav heyecanında kalbin neden hızlı atar? Yemekten sonra kan şekerin neden sabit kalır? Büyüme neden belirli bir yaşta durur? Bunların hepsini **hormonlar** düzenler. Sinir sistemi saniyeler içinde, hormonlar dakikalar ve saatler içinde etki eder. Bu konuda **hormonların özelliklerini**, **endokrin bezleri ve hormonlarını**, **negatif geri bildirimi**, **kan şekeri düzenlenmesini** ve **hormon bozukluklarını** öğreneceksin. AYT Biyoloji'de hormon-bez-etki eşleştirmesi ve geri bildirim soruları çıkar.

:::hedefler
1. Hormonların ortak özelliklerini sıralamak.
2. Hipofizin ön ve arka lobunun hormonlarını ayırt etmek.
3. Tiroit, paratiroit, adrenal ve pankreas hormonlarının etkilerini açıklamak.
4. Negatif geri bildirimi bir örnekle anlatmak.
5. Kan şekerinin insülin ve glukagonla nasıl dengelendiğini yorumlamak.
6. Hormon fazlalığı ve eksikliğinde görülen hastalıkları eşleştirmek.
:::

:::ipucu
Hormonu görünce üç soruyu sor: **Hangi bez salgılar? Hangi doku ya da organı etkiler? Etkisi ne?** Salgısı fazlaysa ya da azsa **hangi hastalığa yol açar?** Bu dört bilgi her hormon sorusunun anahtarıdır.
:::

::video{id="3Yaq-QrozyM" etiket="Konu anlatımı videosu" baslik="Endokrin Sistem" kanal="Biosem Biyoloji"}

## 1. Hormonların ortak özellikleri

- **Endokrin bezler** salgılarını kanala verir, kanalı yoktur.
- Çok **az miktarda** etkilidir.
- Yalnızca **hedef hücrelerin** uygun reseptörüne bağlanınca etki eder.
- Yapı olarak **peptit/protein** (insülin, GH), **steroid** (kortizol, östrojen, testosteron) veya amin (adrenalin, tiroksin) olabilir.
- Etkilerini bitirince karaciğerde yıkılır ve böbrekten atılır.
- Dengeyi genelde **negatif geri bildirimle** sağlarlar.

## 2. Hipotalamus ve hipofiz

**Hipotalamus** sinir sistemi ile endokrin sistemi bağlar. Hipofizin ön lobunu uyaran ve baskılayan hormonlar salgılar.

**Hipofiz ön lob** (kendi hormonlarını üretir):

| Hormon | Etki |
| --- | --- |
| GH (büyüme hormonu) | Kemik ve kas büyümesi |
| TSH | Tiroiti uyarır |
| ACTH | Adrenal korteksi uyarır |
| FSH, LH | Eşey bezlerini uyarır |
| Prolaktin | Süt oluşumu |

**Hipofiz arka lob** (hipotalamusta üretilen hormonları **depolar ve salar**): **ADH** (böbrekte su geri emilimini artırır, kan basıncını yükseltir) ve **oksitosin** (doğum kasılmaları, süt salgılama).

## 3. Diğer endokrin bezler

| Bez | Hormon | Etki |
| --- | --- | --- |
| Tiroit | Tiroksin | Metabolizma hızı, büyüme |
| | Kalsitonin | Kan kalsiyumunu **düşürür** |
| Paratiroit | Parathormon (PTH) | Kan kalsiyumunu **yükseltir** |
| Pankreas | İnsülin (β) | Kan şekerini **düşürür** |
| | Glukagon (α) | Kan şekerini **yükseltir** |
| Adrenal medulla | Adrenalin, noradrenalin | Kaç ya da savaş tepkisi |
| Adrenal korteks | Kortizol | Stres, kan şekerini artırır |
| | Aldosteron | Böbrekte Na⁺ geri emilimi |
| Epifiz | Melatonin | Uyku-uyanıklık ritmi |
| Timus | Timosin | T lenfosit olgunlaşması |
| Yumurtalık | Östrojen, progesteron | Dişi özellikler, döngü |
| Testis | Testosteron | Erkek özellikler, sperm |

## 4. Negatif geri bildirim

Bir hormonun etkisi, o hormonun salgısını **azaltırsa** negatif geri bildirim vardır. Denge böyle korunur.

**Tiroksin örneği:** Hipotalamus TRH salgılar $\rightarrow$ hipofiz TSH salgılar $\rightarrow$ tiroit tiroksin salgılar. Kanda tiroksin artınca hipotalamus ve hipofiz baskılanır, TRH ve TSH azalır. Böylece tiroksin düzeyi düşer.

**Kan şekeri:**

- Kan şekeri **artınca** pankreas **β hücreleri insülin** salgılar. Hücreler glikozu alır, karaciğer ve kas **glikojen** depolar, kan şekeri düşer.
- Kan şekeri **azalınca** **α hücreleri glukagon** salgılar. Karaciğerde **glikojen yıkılır**, kana glikoz verilir, kan şekeri yükselir.

İnsülin ve glukagon birbirine **zıt** (antagonist) çalışır.

## 5. Hormon bozuklukları

| Durum | Neden | Sonuç |
| --- | --- | --- |
| Cücelik | Çocukta GH eksikliği | Boy kısa kalır |
| Devlik | Çocukta GH fazlalığı | Aşırı uzun boy |
| Akromegali | Erişkinde GH fazlalığı | El, ayak, çene büyür |
| Guatr | İyot eksikliği, tiroit büyür | Boyunda şişlik |
| Hipertiroidi | Tiroksin fazlalığı | Hızlı metabolizma, kilo kaybı |
| Hipotiroidi (miksödem) | Tiroksin eksikliği | Yavaş metabolizma, kilo artışı |
| Şeker hastalığı (diyabet) | İnsülin eksikliği ya da etkisizliği | Yüksek kan şekeri |
| Şekersiz diyabet | ADH eksikliği | Çok idrar, aşırı susama |
| Addison | Adrenal korteks yetersizliği | Halsizlik, düşük tansiyon |

## 6. Sık yapılan hatalar

- Hipofiz arka lobun hormon ürettiğini sanmak. Hipotalamus üretir, arka lob depolar.
- İnsülin ile glukagonun işlevlerini karıştırmak.
- Kalsitonin ile parathormonu karıştırmak. Kalsitonin düşürür, PTH yükseltir.
- Büyüme hormonu fazlalığında yaşı dikkate almamak. Çocukta devlik, erişkinde akromegali.
- Negatif geri bildirimi "hormon artar, daha çok salgılanır" diye düşünmek.

:::baglanti
Endokrin sistem, **sinir sistemiyle** birlikte vücut dengesini sağlar. Hipotalamus iki sistemi bağlar. **Boşaltım sisteminde** ADH ve aldosteron böbrekte su ve tuz dengesini kurar. **Üreme sisteminde** FSH, LH, östrojen, progesteron ve testosteron döngüleri yönetir. **Sindirim sisteminde** pankreas hem enzim hem hormon üretir. **Destek ve hareket sisteminde** GH, kalsitonin ve PTH kemik gelişimini ve kalsiyum dengesini düzenler.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Hormon | Kanala verilir, az miktar, hedef reseptör |
| Hipofiz arka | ADH, oksitosin (depolar) |
| İnsülin | Kan şekerini düşürür |
| Glukagon | Kan şekerini yükseltir |
| Kalsitonin / PTH | Kalsiyumu düşürür / yükseltir |
| Negatif geri bildirim | Etki, salgıyı azaltır |
| GH fazlalığı | Çocukta devlik, erişkinde akromegali |

## Mini test

:::soru{cevap="D"}
Yemekten sonra kan şekeri yükseldiğinde aşağıdakilerden hangisi gerçekleşir?

- A) Pankreasın α hücreleri glukagon salgılar ve karaciğerde glikojen yıkılır.
- B) Pankreasın β hücreleri glukagon salgılar ve kan şekeri yükselir.
- C) Pankreasın α hücreleri insülin salgılar ve glikoz glikojene çevrilir.
- D) Pankreasın β hücreleri insülin salgılar ve glikoz hücrelere alınır.
- E) Adrenal bezden adrenalin salgılanır ve kan şekeri düşer.

---

1. Kan şekeri artınca pankreasın $\beta$ hücreleri insülin salgılar.
2. İnsülin, glikozun hücrelere alınmasını ve glikojene çevrilmesini sağlar, kan şekeri düşer. Doğru cevap D.

Diğer şıklar: **A** glukagon kan şekeri düşükken salgılanır / **B** glukagonu salgılayan hücreler $\alpha$ hücreleridir / **C** insülini $\beta$ hücreleri üretir / **E** adrenalin kan şekerini yükseltir.
:::

:::soru{cevap="B"}
Aşağıdaki hormon-etki eşleştirmelerinden hangisi doğrudur?

- A) Kalsitonin: Kan kalsiyum düzeyini yükseltir.
- B) ADH: Böbrekte su geri emilimini artırır.
- C) Aldosteron: Böbrekte Na⁺ atılımını artırır.
- D) Glukagon: Karaciğerde glikojen depolanmasını sağlar.
- E) Tiroksin: Bazal metabolizma hızını düşürür.

---

1. ADH böbrekte toplama kanallarının suya geçirgenliğini artırır, su geri emilir, idrar yoğunlaşır. Doğru cevap B.

Diğer şıklar: **A** kalsitonin kan kalsiyumunu düşürür / **C** aldosteron Na⁺ geri emilimini artırır / **D** glukagon glikojeni yıkar / **E** tiroksin metabolizma hızını artırır.
:::

:::soru{cevap="D"}
Kanda tiroksin düzeyi yükseldiğinde negatif geri bildirimle aşağıdakilerden hangisi gerçekleşir?

- A) Hipotalamustan TRH salgısı artar.
- B) Hipofizden TSH salgısı artar.
- C) Tiroit bezinin tiroksin üretimi hızlanır.
- D) Hipofizden TSH salgısı azalır.
- E) Tiroit bezinin boyutu büyür.

---

1. Tiroksin hipotalamusu ve hipofizi baskılar.
2. TSH salgısı azalınca tiroit uyarılmaz ve tiroksin düzeyi düşer. Böylece denge sağlanır. Doğru cevap D.

Diğer şıklar: **A** ve **B** salgıların artması pozitif geri bildirim olur / **C** tiroksin üretimi TSH azalınca yavaşlar / **E** boyut büyümesi (guatr) iyot eksikliğinin sonucu.
:::

:::soru{cevap="C"}
Erişkin bir kişide büyüme hormonu (GH) fazla salgılanırsa aşağıdakilerden hangisi görülür?

- A) Cücelik
- B) Devlik
- C) Akromegali
- D) Miksödem
- E) Guatr

---

1. Kemiklerin uzama plakları erişkinde kapanmıştır. Boy uzaması olmaz.
2. GH fazlalığı el, ayak ve çene gibi uç kemikleri büyütür. Bu duruma akromegali denir. Doğru cevap C.

Diğer şıklar: **Cücelik** çocukta GH eksikliği / **Devlik** çocukta GH fazlalığı / **Miksödem** erişkinde tiroksin eksikliği / **Guatr** tiroit bezinin büyümesi.
:::

## Kendini dene

:::dene
1. Kan şekerini düşüren hormon hangisidir? => İnsülin.
2. Hipofiz arka lobunda hangi hormonlar depolanır? => ADH ve oksitosin.
3. Kalsitonin kan kalsiyumunu nasıl etkiler? => Düşürür.
4. Erişkinde GH fazlalığına ne denir? => Akromegali.
5. Negatif geri bildirimde hormonun etkisi ne yapar? => Hormonun salgısını azaltır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Endokrin Sistem'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Gözlük neden miyop birinin uzağı görmesini sağlar? Uçakta kulağın neden tıkanır, yutkununca açılır? Soğuk algınlığında yemeğin tadı neden azalır? Duyu organları dış dünyadaki uyarıları **reseptörlerle** algılar, sinir impulsuna çevirir ve beyne iletir. Bu konuda **reseptör türlerini**, **gözün yapısını ve görme olayını**, **göz kusurlarını**, **kulağın yapısını, işitmeyi ve dengeyi**, **koku, tat ve deri duyularını** öğreneceksin. AYT'de göz kusurları, retina hücreleri ve kulağın bölümleri sık sorulur.

:::hedefler
1. Reseptör türlerini uyaran cinsine göre sınıflandırmak.
2. Gözün bölümlerini ve görevlerini açıklamak, ışığın izlediği yolu sıralamak.
3. Miyopi, hipermetropi, astigmat ve presbiyopiyi nedenleri ve düzeltmeleriyle eşleştirmek.
4. Çomak ve koni hücrelerini karşılaştırmak.
5. Kulağın bölümlerini, ses iletiminin yolunu ve denge organlarını anlatmak.
6. Koku, tat ve deri duyularının reseptörlerini söylemek.
:::

:::ipucu
Göz kusurunda iki soruyu birlikte yanıtla: **Görüntü retinanın neresinde oluşuyor?** Önündeyse **ıraksak (çukur)** mercek, arkasındaysa **yakınsak (tümsek)** mercek gerekir. Miyop = önünde, hipermetrop = arkasında.
:::

::video{id="vfinbdM92mc" etiket="Konu anlatımı videosu" baslik="Göz ve Duyu Organları" kanal="Biosem Biyoloji"}

## 1. Reseptörler

Reseptör, uyarıyı **sinir impulsuna** çeviren özel hücre ya da hücre uçlarıdır.

| Reseptör | Uyaran | Örnek |
| --- | --- | --- |
| Fotoreseptör | Işık | Çomak, koni |
| Kemoreseptör | Kimyasal | Tat tomurcuğu, koku hücresi |
| Mekanoreseptör | Basınç, titreşim, dokunma | Corti organı, Pacini cisimciği |
| Termoreseptör | Sıcaklık | Deride sıcak ve soğuk uçlar |
| Nosiseptör | Doku hasarı (ağrı) | Serbest sinir uçları |

Aynı uyaran uzun sürerse reseptör yanıtı azalır. Buna **adaptasyon** denir. Evde yeni sürülen parfümün kokusunu bir süre sonra almamak buna örnektir.

## 2. Göz

**Işığın izlediği yol:** kornea $\rightarrow$ sulu sıvı $\rightarrow$ göz bebeği $\rightarrow$ mercek $\rightarrow$ camsı cisim $\rightarrow$ **retina**.

![Gözün yapısı: kornea, iris, göz bebeği, mercek, silyer kas, camsı cisim, retina, sarı nokta ve kör nokta](/lessons/ayt-bio/goz.svg "Görüntü retinada ters ve küçük oluşur, beyin görüntüyü düzeltir")

- **Kornea:** Saydam ön yüz, ışığın büyük bölümünü kırar.
- **İris ve göz bebeği:** Göze giren ışık miktarını ayarlar. Parlak ışıkta göz bebeği küçülür.
- **Mercek:** Işığı retinaya odaklar. **Silyer kaslar** merceğin kalınlığını değiştirir.
- **Retina:** Fotoreseptörlerin bulunduğu ağ tabaka.
- **Sarı nokta:** Konilerin yoğun olduğu, en keskin görme bölgesidir.
- **Kör nokta:** Optik sinirin gözden çıktığı yerdir, fotoreseptör yoktur.

**Akomodasyon:** Yakına bakarken silyer kaslar **kasılır**, mercek **kalınlaşır** (daha çok kırar). Uzağa bakarken kaslar gevşer, mercek incelir.

**Retinadaki hücreler:**

| | Çomak | Koni |
| --- | --- | --- |
| Işık | Az ışıkta (gece görme) | Parlak ışıkta (gündüz görme) |
| Renk | Ayırt etmez | Kırmızı, yeşil, mavi koni, renk görme |
| Yoğunluk | Retinanın çevresinde | Sarı noktada yoğun |
| Pigment | Rodopsin (A vitamini) | İyodopsin |

**Göz kusurları:**

| Kusur | Neden | Düzeltme |
| --- | --- | --- |
| Miyopi | Göz küresi uzun ya da mercek çok kırıcı, görüntü retinanın **önünde** | Iraksak (çukur) mercek |
| Hipermetropi | Göz küresi kısa, görüntü retinanın **arkasında** | Yakınsak (tümsek) mercek |
| Astigmat | Kornea düzgün kavisli değil | Silindirik mercek |
| Presbiyopi | Yaşla mercek esnekliğini kaybeder, yakını görmek zor | Yakınsak mercek |
| Renk körlüğü | Koni eksikliği, X'e bağlı çekinik kalıtım | Düzeltilemez |

::sim{tur="mercek"}

## 3. Kulak

Kulak hem **işitme** hem **denge** organıdır.

- **Dış kulak:** Kulak kepçesi ses dalgalarını toplar, kulak yolu kulak zarına iletir.
- **Orta kulak:** Çekiç, örs, üzengi kemikçikleri sesi **yükselterek** iç kulağa aktarır. **Östaki borusu** orta kulağı yutakla bağlar ve zarın iki yanındaki basıncı eşitler.
- **İç kulak:** **Koklea** (salyangoz) işitmeden, **yarım daire kanalları** ve **vestibül** dengeden sorumludur.

**Ses iletiminin yolu:** kulak kepçesi $\rightarrow$ kulak yolu $\rightarrow$ kulak zarı $\rightarrow$ kemikçikler $\rightarrow$ oval pencere $\rightarrow$ koklea sıvısı $\rightarrow$ **Corti organı** (işitme reseptörleri) $\rightarrow$ işitme siniri $\rightarrow$ beyin (temporal lob).

**Denge:** Yarım daire kanalları **dönme hareketini**, vestibül (utrikulus, sakkulus) **duruş ve doğrusal ivmeyi** algılar. Beyincik bu bilgileri kullanarak dengeyi sağlar.

## 4. Koku, tat ve deri

- **Koku:** Burun boşluğunun tavanındaki koku epitelinde kemoreseptörler gazları algılar. İmpuls koku soğanından beyne gider. Hızlı adaptasyon gösterir.
- **Tat:** Dildeki **tat tomurcukları**, suda çözünmüş maddeleri algılar. Beş temel tat vardır: tatlı, tuzlu, ekşi, acı ve umami. Dilin her bölgesi tüm tatları algılayabilir. Koku, tat algısını güçlendirir.
- **Deri:** Dokunma, basınç, sıcaklık ve ağrı reseptörlerini taşır. Parmak uçlarında reseptör yoğunluğu fazladır, sırtta azdır.

## 5. Sık yapılan hatalar

- Miyopide görüntünün retinanın arkasında olduğunu düşünmek.
- Çomakların renk ayırt ettiğini sanmak.
- Kör noktada çomak ve koni bulunduğunu sanmak. Orada hiç fotoreseptör yoktur.
- Dengeyi yalnızca kulak sanmak. Beyincik de gereklidir.
- Dilin bölgelere göre tek tat algıladığını düşünmek.

:::baglanti
Duyu organları, **sinir sistemi** için bilgi toplar. Reseptörlerde oluşan impuls duyu nöronlarıyla beyne gider. **Fizikte** ışığın kırılması, mercekler ve ses dalgaları gözün ve kulağın çalışmasını açıklar. **Genetikte** renk körlüğü X'e bağlı çekinik kalıtımın en bilinen örneğidir. **Dolaşım sisteminde** A vitamini eksikliği çomakları etkiler (gece körlüğü).
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çomak | Az ışık, renk yok |
| Koni | Parlak ışık, renk, sarı nokta |
| Miyopi | Görüntü önde, ıraksak mercek |
| Hipermetropi | Görüntü arkada, yakınsak mercek |
| Akomodasyon (yakın) | Silyer kas kasılır, mercek kalınlaşır |
| Östaki borusu | Orta kulak basıncını eşitler |
| Corti organı | Koklea içinde işitme reseptörü |

## Mini test

:::soru{cevap="A"}
Miyopi (uzağı görememe) ile ilgili aşağıdakilerden hangisi doğrudur?

- A) Görüntü retinanın önünde oluşur, ıraksak mercekle düzeltilir.
- B) Görüntü retinanın arkasında oluşur, ıraksak mercekle düzeltilir.
- C) Görüntü retinanın önünde oluşur, yakınsak mercekle düzeltilir.
- D) Görüntü retinanın arkasında oluşur, yakınsak mercekle düzeltilir.
- E) Görüntü sarı noktada oluşur, silindirik mercekle düzeltilir.

---

1. Miyopide göz küresi uzundur ya da mercek fazla kırar. Uzaktaki cismin görüntüsü retinanın önünde oluşur.
2. Işınları retinaya daha geç odaklamak için ıraksak (çukur) mercek kullanılır. Doğru cevap A.

Diğer şıklar: **B** hipermetropide görüntü arkada ama düzeltme yakınsak mercekle / **C** konum doğru ama mercek türü yanlış / **D** hipermetropi için doğru bilgi / **E** astigmat için doğru ve görüntü sarı noktada bulanıklaşmaz.
:::

:::soru{cevap="A"}
Gözdeki çomak hücreleri için aşağıdakilerden hangisi doğrudur?

- A) Az ışıkta görmeyi sağlar ve renkleri ayırt edemez.
- B) Parlak ışıkta görmeyi sağlar ve renkleri ayırt eder.
- C) Sarı noktada yoğun bulunur ve ayrıntılı görmeyi sağlar.
- D) Kör noktada yoğun bulunur ve ışığı algılar.
- E) Yalnızca kırmızı rengi algılar.

---

1. Çomaklar rodopsin pigmenti içerir ve çok az ışığa bile duyarlıdır. Gece görmeyi sağlar.
2. Renkleri ayırt edemezler. Doğru cevap A.

Diğer şıklar: **B** konilerin özelliği / **C** koniler sarı noktada yoğundur / **D** kör noktada fotoreseptör yoktur / **E** kırmızıya duyarlı olanlar belirli koni tipidir.
:::

:::soru{cevap="D"}
Ses titreşimlerinin kulağa girdikten sonra işitme reseptörlerine ulaşana kadar izlediği yol aşağıdakilerden hangisidir?

- A) Kulak zarı, koklea, kemikçikler, oval pencere, Corti organı
- B) Kemikçikler, kulak zarı, oval pencere, koklea, Corti organı
- C) Kulak zarı, oval pencere, kemikçikler, Corti organı, koklea
- D) Kulak zarı, kemikçikler, oval pencere, koklea, Corti organı
- E) Oval pencere, kulak zarı, kemikçikler, koklea, Corti organı

---

1. Ses dalgası kulak zarını titreştirir.
2. Titreşim kemikçiklere (çekiç, örs, üzengi) aktarılır, üzengi oval pencereyi titreştirir.
3. Koklea sıvısında dalga oluşur ve Corti organındaki tüylü hücreler uyarılır. Doğru cevap D.

Diğer şıklar: **A**, **B**, **C** ve **E** yapıların sırası yanlış, kemikçikler ve oval pencere zardan sonra, koklea ise oval pencereden sonra gelir.
:::

:::soru{cevap="A"}
Koku ve tat duyularıyla ilgili aşağıdakilerden hangisi doğrudur?

- A) Her ikisinde de reseptörler kimyasal uyarıcıları algılar.
- B) Tat tomurcukları burun boşluğunun tavanında bulunur.
- C) Koku alma, mekanoreseptörlerle gerçekleşir.
- D) Dilin her bölgesi yalnızca tek bir temel tadı algılar.
- E) Koku reseptörleri dilin yüzeyinde sıralanmıştır.

---

1. Koku hücreleri havadaki gaz moleküllerini, tat tomurcukları suda çözünmüş maddeleri algılar.
2. Her ikisi de kimyasal uyarıcılara duyarlı kemoreseptörlerdir. Doğru cevap A.

Diğer şıklar: **B** tat tomurcukları dilde bulunur / **C** koku alma kemoreseptörle olur / **D** dilin her bölgesi tüm temel tatları algılayabilir / **E** koku reseptörleri burun boşluğundadır.
:::

## Kendini dene

:::dene
1. Retinada renk görmeyi sağlayan hücreler hangileridir? => Koniler.
2. Miyopi hangi mercekle düzeltilir? => Iraksak (çukur) mercek.
3. Orta kulaktaki basıncı eşitleyen yapı nedir? => Östaki borusu.
4. Kör noktada hangi hücreler bulunur? => Hiçbiri, fotoreseptör yoktur.
5. İşitme reseptörleri hangi yapıdadır? => Koklea içindeki Corti organı.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-bio' and name = 'Duyu Organları'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir kemik kırılınca neden birkaç haftada kaynar? Spor yapınca kaslar neden ağrır ve güçlenir? Kolunu bükerken hangi kaslar çalışır? **İskelet sistemi** vücuda şekil verir, organları korur, kalsiyum depolar ve kan hücresi üretir. **Kas sistemi** ise iskeletle birlikte hareketi sağlar. Bu konuda **kemik dokusunu**, **kemik hücrelerini**, **eklemleri**, **kas türlerini**, **kasılma mekanizmasını** (kayan iplikler), **kas enerjisini** ve **yorgunluğu** öğreneceksin. AYT'de kayan iplikler ve kas enerjisi mutlaka sorulur.

:::hedefler
1. Kemik dokusunun yapısını ve kemik hücrelerinin görevlerini açıklamak.
2. Kemik oluşumunu ve uzamayı anlatmak.
3. Eklem türlerini örnekleriyle eşleştirmek.
4. Düz, çizgili ve kalp kasını karşılaştırmak.
5. Sarkomerin yapısını ve kayan iplikler modelini anlatmak.
6. Kas kasılmasının enerji kaynaklarını ve yorgunluğu açıklamak.
:::

:::ipucu
Kas kasılmasında **filamentler kısalmaz**, birbiri üzerinde **kayar**. Sarkomer kısalır, ama aktin ve miyozinin uzunluğu aynı kalır. Z çizgileri birbirine yaklaşır. Bu cümleyi aklında tut, soruların çoğu bununla çözülür.
:::

::video{id="C7eY_sc4Lxo" etiket="Konu anlatımı videosu" baslik="Destek ve Hareket Sistemi" kanal="Selin Hoca Biyoloji"}

## 1. Kemik dokusu

Kemik, **hücreler** ve mineralle (kalsiyum fosfat) sertleşmiş **matriksten** oluşur.

- **Osteoblast:** Kemik matriksini **oluşturan** hücre.
- **Osteosit:** Matriksin içine gömülmüş olgun kemik hücresi, kemiği korur.
- **Osteoklast:** Kemiği **yıkan** hücre. Yapım ve yıkımın dengesi kemiği sürekli yeniler.

**Yapı:** Dışta **periost** (kemik zarı) bulunur. Sıkı kemik dokusu dışta, süngerimsi kemik dokusu uçlarda yer alır. **Kırmızı kemik iliği** kan hücrelerini üretir (yassı kemikler ve uzun kemiklerin uçları). **Sarı kemik iliği** yağ depolar.

**Oluşum:** Embriyoda iskelet önce **kıkırdaktan** oluşur. Doğumdan sonra kıkırdak yerini kemik dokusuna bırakır (kemikleşme). Uzun kemiklerin uçlarındaki **uzama plakları** (kıkırdak) çocuklukta kemiği uzatır. Ergenlik sonunda plakalar kemikleşir ve boy uzaması durur. Kemik oluşumu için **kalsiyum, fosfor, D vitamini** ve büyüme hormonu gerekir.

**Kemik türleri:** uzun (kol, bacak), kısa (el bileği), yassı (kafatası, kaburga), düzensiz (omur).

**Bozukluklar:** Raşitizm (çocukta D vitamini eksikliği), osteoporoz (kemik yoğunluğunun azalması), kırık.

## 2. Eklemler

| Eklem | Hareket | Örnek |
| --- | --- | --- |
| Oynamaz | Hareket yok | Kafatası kemikleri |
| Yarı oynar | Sınırlı hareket | Omurlar arası |
| Oynar | Geniş hareket | Omuz, kalça, diz, dirsek |

Oynar eklem türleri: **top-yuva** (omuz, kalça, her yöne), **menteşe** (diz, dirsek, tek yön), **kayar** (el bileği kemikleri), **eyer** (başparmak). Oynar eklemde kemik uçlarını kıkırdak kaplar, eklem kapsülü ve sinoviyal sıvı sürtünmeyi azaltır. **Bağlar** kemiği kemiğe, **kirişler (tendon)** kası kemiğe bağlar.

## 3. Kas dokusu

| | Çizgili (iskelet) | Düz | Kalp |
| --- | --- | --- | --- |
| Kontrol | İstemli | İstemsiz | İstemsiz |
| Hücre | Çok çekirdekli, silindirik | Tek çekirdekli, iğ şekilli | Tek çekirdekli, dallı |
| Yerleşim | İskelet | İç organ duvarı, damar | Kalp |
| Kasılma | Hızlı, çabuk yorulur | Yavaş, yorulmaz | Ritmik, yorulmaz |

İskelet kasları **çift halinde** çalışır. Biri kasılırken öteki gevşer. Kolun bükülmesinde pazı kası (biseps) kasılır, arka kas (triseps) gevşer. Bu kaslara **antagonist** denir.

## 4. Kasılma mekanizması

Kas lifi, **miyofibril** denen iplik demetlerinden oluşur. Miyofibrilin birimi **sarkomerdir** ve iki **Z çizgisi** arasında kalır. Sarkomerde iki iplik bulunur:

- **Aktin** (ince) filamentler Z çizgisine bağlıdır.
- **Miyozin** (kalın) filamentler ortadadır ve başlıkları vardır.

**Kayan iplikler modeli:**

1. Motor nöronun ucundan **asetilkolin** salgılanır. Kas zarında impuls oluşur.
2. Sarkoplazmik retikulumdan **$\text{Ca}^{2+}$** salınır.
3. $\text{Ca}^{2+}$ troponine bağlanır, aktin üzerindeki bağlanma yeri açılır.
4. **Miyozin başları** aktine bağlanır ve **ATP** kullanarak aktini sarkomerin ortasına doğru çeker.
5. Aktin filamentleri miyozin üzerinde kayar, **Z çizgileri birbirine yaklaşır**, sarkomer kısalır.

**Gevşeme:** $\text{Ca}^{2+}$ sarkoplazmik retikuluma geri pompalanır (ATP harcanır), bağlanma yerleri kapanır. ATP olmazsa miyozin başı aktinden ayrılamaz ve kas sert kalır (ölüm katılığı).

Kasılma sırasında **I bandı** ve **H bölgesi** daralır, **A bandı** (miyozin uzunluğu) değişmez.

## 5. Kasın enerjisi ve yorgunluk

Kas **doğrudan ATP** kullanır. ATP depoları az olduğundan sürekli yenilenir:

1. **Kreatin fosfat:** Hızlı ama kısa süreli ATP kaynağı (ilk saniyeler).
2. **Oksijenli solunum:** Uzun süreli ve verimli (mitokondri). Kasta **miyoglobin** oksijen depolar.
3. **Fermantasyon (laktik asit):** Oksijen yetersizse glikoz yarım yıkılır, **laktik asit** birikir ve kas yorulur.

Dinlenmeyle laktik asit karaciğerde glikoza çevrilir ve oksijen borcu ödenir. Düzenli egzersiz kas liflerini kalınlaştırır ve mitokondri sayısını artırır.

## 6. Sık yapılan hatalar

- Kasılmada aktin ve miyozin boylarının kısaldığını sanmak.
- Osteoblast ile osteoklastı karıştırmak.
- Kasın enerji için doğrudan glikoz kullandığını sanmak. Doğrudan kaynak ATP'dir.
- Kası kemiğe bağlayan yapıya bağ demek. Kasları kirişler bağlar.
- Çizgili kası istemsiz sanmak.

:::baglanti
Hareket sistemi **sinir sistemiyle** başlar. Motor nöron asetilkolinle kası uyarır. **Endokrin sistemde** GH, kalsitonin ve PTH kemik gelişimini yönetir. **Solunum ve dolaşım sistemleri** kasa oksijen, **boşaltım** ise atık madde taşıma görevini yapar. **Hücresel solunumda** kasın enerji metabolizması ayrıntılı işlenir. **Fizikte** kaldıraç sistemleri, kemik-eklem-kas ilişkisini açıklar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Osteoblast / osteoklast | Yapar / yıkar |
| Uzama plakları | Çocuklukta uzar, ergenlikte kapanır |
| Bağ / kiriş | Kemik-kemik / kas-kemik |
| Sarkomer | İki Z çizgisi arası |
| Kayan iplikler | Aktin kayar, Z çizgileri yaklaşır |
| Gevşeme | $\text{Ca}^{2+}$ geri alınır, ATP gerekir |
| Yorgunluk | Laktik asit birikimi |

## Mini test

:::soru{cevap="C"}
Bir iskelet kası kasılırken sarkomerde aşağıdakilerden hangisi gerçekleşir?

- A) Aktin ve miyozin filamentlerinin boyu kısalır.
- B) Z çizgileri birbirinden uzaklaşır ve sarkomer uzar.
- C) Aktin filamentleri miyozine doğru kayar, Z çizgileri yaklaşır.
- D) Miyozin filamentleri aktinden ayrılır ve sarkomer uzar.
- E) Kalsiyum iyonları sarkoplazmik retikuluma geri pompalanır.

---

1. Kayan iplikler modeline göre miyozin başları aktine bağlanıp onu çeker.
2. Aktin filamentleri miyozin üzerinde kayar. İplikler kısalmaz, Z çizgileri yaklaşır ve sarkomer kısalır. Doğru cevap C.

Diğer şıklar: **A** filamentler kısalmaz, kayar / **B** ve **D** gevşeme ya da uzama durumu / **E** kalsiyumun geri pompalanması gevşemedir.
:::

:::soru{cevap="D"}
Aşağıdaki kemik hücresi-görev eşleştirmelerinden hangisi doğrudur?

- A) Osteoklast: Kemik matriksini oluşturur.
- B) Osteoblast: Kemik dokusunu yıkar.
- C) Osteosit: Kemik iliğinde kan hücresi üretir.
- D) Osteoblast: Kemik matriksini oluşturur.
- E) Osteoklast: Kıkırdak matriksini salgılar.

---

1. Osteoblastlar kemik matriksini yapar ve kemikleşmeyi başlatır.
2. Osteoklastlar kemiği yıkar. Osteositler ise matriksin içindeki olgun hücrelerdir. Doğru cevap D.

Diğer şıklar: **A** ve **B** görevler yer değiştirmiş / **C** kan hücresini kemik iliği üretir / **E** osteoklast yıkımla ilgilidir, kıkırdak salgılamaz.
:::

:::soru{cevap="B"}
Aşağıdaki eklem türü-örnek eşleştirmelerinden hangisi doğrudur?

- A) Oynamaz eklem: Dirsek
- B) Menteşe eklem: Diz
- C) Top-yuva eklem: Parmak boğumu
- D) Yarı oynar eklem: Omuz
- E) Kayar eklem: Kafatası kemikleri

---

1. Diz ve dirsek, kemiğin yalnızca bir düzlemde hareket etmesini sağlayan menteşe eklemlerdir.
2. Doğru cevap B.

Diğer şıklar: **A** dirsek oynar eklemdir / **C** parmak boğumu menteşe eklemdir, top-yuva omuz ve kalçadadır / **D** omuz oynar top-yuva eklemdir / **E** kafatası kemikleri oynamaz eklemle bağlıdır.
:::

:::soru{cevap="E"}
Şiddetli egzersiz sırasında kas hücresinde oksijen yetersiz kalırsa aşağıdakilerden hangisi gerçekleşir?

- A) Pirüvat tamamen $\text{CO}_2$ ve suya yıkılır ve ATP üretimi artar.
- B) Glikoz alkol ve $\text{CO}_2$'ye dönüşür.
- C) ATP üretimi durur ve kas hemen gevşer.
- D) Kreatin fosfat laktik asite dönüşür.
- E) Pirüvat laktik aside dönüşür ve yorgunluk oluşur.

---

1. Oksijen yetersizse pirüvat mitokondride yıkılamaz.
2. Kas hücresi laktik asit fermantasyonu yapar. Laktik asit birikimi yorgunluğa neden olur. Doğru cevap E.

Diğer şıklar: **A** oksijenli solunum olurdu / **B** alkol fermantasyonu mayalarda olur / **C** ATP fermantasyonla az da olsa üretilir / **D** kreatin fosfat ATP yenilemek için kullanılır.
:::

## Kendini dene

:::dene
1. Kemik matriksini oluşturan hücre hangisidir? => Osteoblast.
2. Kası kemiğe bağlayan yapı nedir? => Kiriş (tendon).
3. Kasılmada Z çizgileri nasıl değişir? => Birbirine yaklaşır.
4. Kas gevşerken $\text{Ca}^{2+}$ nereye alınır? => Sarkoplazmik retikuluma.
5. Kasta yorgunluğa hangi madde neden olur? => Laktik asit.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Destek ve Hareket Sistemi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Ekmeği ağzında uzun çiğnersen neden tatlanır? Mide asidi mideyi neden sindirmez? Yağlı yemekten sonra safra neden önemlidir? **Sindirim sistemi** besinleri hücrelerin kullanabileceği küçük moleküllere parçalar, emer ve atıkları uzaklaştırır. Bu konuda **fiziksel ve kimyasal sindirimi**, **sindirim kanalındaki işlemleri**, **enzimleri**, **yardımcı organları** (karaciğer, safra, pankreas), **emilimi** ve **hormonal kontrolü** öğreneceksin. AYT'de enzim-bölge-ürün eşleştirmesi ve emilim soruları çıkar.

:::hedefler
1. Fiziksel ve kimyasal sindirimi ayırt etmek.
2. Sindirim kanalının bölümlerinde gerçekleşen olayları sıralamak.
3. Enzim, çalıştığı yer, substrat ve ürün eşleştirmesi yapmak.
4. Karaciğer, safra ve pankreasın görevlerini açıklamak.
5. İnce bağırsakta emilimi ve villusların işlevini anlatmak.
6. Sindirimi düzenleyen hormonları ve kalın bağırsağın görevini söylemek.
:::

:::ipucu
Enzim sorularında üçlü eşleştir: **nerede + hangi besin + ürün**. Karbonhidrat: ağız ve ince bağırsak, ürün glikoz. Protein: mide ve ince bağırsak, ürün amino asit. Yağ: yalnızca ince bağırsak, ürün gliserol ve yağ asidi. Nişasta ağızda başlar, protein midede, yağ ince bağırsakta.
:::

::video{id="tJXJgVWSGok" etiket="Konu anlatımı videosu" baslik="Sindirim Sistemi" kanal="Selin Hoca Biyoloji"}

## 1. Sindirimin türleri

- **Fiziksel (mekanik) sindirim:** Besini parçalar, yüzey artar. Çiğneme, mide hareketleri, safranın yağı damlacıklara ayırması. Besinin kimyası değişmez.
- **Kimyasal sindirim:** Enzimler besinlerin **kimyasal bağlarını hidrolizle** keser. Makromoleküller yapı taşlarına ayrılır.

Sindirim **hücre dışında** (kanalın içinde) gerçekleşir. Besin, kan dolaşımına geçince "vücuda alınmış" sayılır.

## 2. Sindirim kanalı

1. **Ağız:** Çiğneme (fiziksel). **Tükürük amilazı** nişastayı maltoza yıkar. Tükürük ortamı hafif bazik-nötrdür. Besin yutaktan geçip **yemek borusuna** gider (peristaltik hareket).
2. **Mide:** Güçlü kaslı. **Pepsin** (pepsinojen HCl ile aktifleşir) proteinleri kısa peptitlere yıkar. $\text{HCl}$ mikropları öldürür ve ortamı asit yapar (pH yaklaşık 2). **Mukus** mide duvarını korur. Besin **kimus** hâline gelir. Mide hormonu **gastrin** salgıyı uyarır.
3. **İnce bağırsak** (oniki parmak bağırsağı, boş, kıvrım bağırsak): Sindirimin ve emilimin **büyük bölümü** burada olur. Ortam bazik. Pankreas ve safra buraya dökülür.
4. **Kalın bağırsak:** **Su ve mineral** emilir, dışkı oluşur. Bakteriler **K vitamini** ve bazı B vitaminleri üretir. **Anüs** dışkıyı atar.

## 3. Sindirim enzimleri

| Enzim | Salgılandığı yer | Etki yeri | Substrat | Ürün |
| --- | --- | --- | --- | --- |
| Tükürük amilazı | Tükürük bezi | Ağız | Nişasta | Maltoz |
| Pepsin | Mide | Mide | Protein | Peptit |
| Pankreas amilazı | Pankreas | İnce bağırsak | Nişasta | Maltoz |
| Tripsin | Pankreas | İnce bağırsak | Protein, peptit | Peptit, amino asit |
| Lipaz | Pankreas | İnce bağırsak | Yağ | Yağ asidi, gliserol |
| Maltaz, sükraz, laktaz | Bağırsak | İnce bağırsak | Disakkarit | Glikoz, früktoz, galaktoz |
| Peptidaz | Bağırsak | İnce bağırsak | Peptit | Amino asit |

Enzimler **özgüldür** ve **pH, sıcaklık** gibi koşullara duyarlıdır. Pepsin asit ortamda, pankreas enzimleri bazik ortamda çalışır.

## 4. Yardımcı organlar

- **Karaciğer:** Safra üretir, glikoz-glikojen dengesini kurar, zehirleri temizler, üre yapar, kan proteinlerini ve pıhtılaşma faktörlerini üretir, A, D, B₁₂ ve demir depolar.
- **Safra kesesi:** Safrayı depolar ve yoğunlaştırır. **Safra enzim içermez**, yağların fiziksel sindirimini yapar (emülsiyon) ve yağda çözünen vitaminlerin emilimini kolaylaştırır.
- **Pankreas:** Hem **enzim** (amilaz, tripsin, lipaz) hem **hormon** (insülin, glukagon) üretir. Pankreas özsuyu bikarbonat içerir ve kimusun asitliğini nötrler.

## 5. Emilim

İnce bağırsak iç yüzeyinde **kıvrımlar, villuslar ve mikrovilluslar** bulunur. Bu yapılar yüzey alanını $200\ \text{m}^2$ civarına çıkarır. Her villusta bir **kan kılcalı** ve bir **lenf kılcalı (lakteal)** vardır.

- **Glikoz, amino asit, vitamin ve mineraller:** Kan kılcalına geçer, **karaciğere** gider.
- **Yağ asidi ve gliserol:** Epitelde yeniden yağa çevrilir, **lenf kılcalına** geçer, lenfle kana ulaşır.
- **Su:** Hem ince hem kalın bağırsakta emilir.

Emilim difüzyon, kolaylaştırılmış difüzyon ve **aktif taşımayla** gerçekleşir.

## 6. Sindirimin düzenlenmesi

- **Gastrin** (mide): HCl salgısını artırır.
- **Sekretin** (oniki parmak bağırsağı): Pankreas ve safradan bikarbonat salgısını uyarır.
- **Kolesistokinin** (oniki parmak bağırsağı): Safra kesesini kasar, pankreas enzimlerini salgılatır.

Sinir sistemi de salgıları uyarır. Yemeğin görüntüsü ya da kokusu bile tükürük ve mide salgısını artırır.

## 7. Sık yapılan hatalar

- Safranın enzim içerdiğini sanmak. Safra yalnızca fiziksel sindirim yapar.
- Pepsinin ince bağırsakta çalıştığını sanmak.
- Yağ asidi ve gliserolün kan kılcalına geçtiğini sanmak. Lenf kılcalına geçerler.
- Karbonhidrat sindirimini yalnızca ağızda sanmak. İnce bağırsakta tamamlanır.
- Kalın bağırsakta sindirim olduğunu sanmak. Orada su emilir.

:::baglanti
Sindirimle gelen besinler **dolaşım sistemi** aracılığıyla hücrelere taşınır. **Endokrin sistemde** pankreas hormonları kan şekerini düzenler. **Hücresel solunumda** emilen glikoz yıkılarak ATP elde edilir. **Kimyada** enzim, pH ve hidroliz bu konunun temelidir. **Boşaltım sistemiyle** karaciğerde üretilen üre, böbrekten atılır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ağız | Nişasta $\rightarrow$ maltoz |
| Mide | Protein başlar, pH 2 |
| İnce bağırsak | Sindirim ve emilimin çoğu |
| Safra | Enzim içermez, yağı damlacıklara böler |
| Pankreas | Enzim ve hormon |
| Villus | Kan kılcalı ve lakteal |
| Kalın bağırsak | Su emilimi, K vitamini |

## Mini test

:::soru{cevap="B"}
Aşağıdaki enzim-etki yeri-substrat-ürün eşleştirmelerinden hangisi doğrudur?

- A) Pepsin: İnce bağırsak, protein, amino asit
- B) Tükürük amilazı: Ağız, nişasta, maltoz
- C) Tripsin: Mide, peptit, amino asit
- D) Maltaz: Ağız, maltoz, glikoz
- E) Lipaz: Mide, yağ, gliserol ve yağ asidi

---

1. Tükürük amilazı ağızda nişastayı maltoza yıkar.
2. Doğru cevap B.

Diğer şıklar: **A** pepsin midede proteini peptitlere yıkar / **C** tripsin pankreasta üretilir, ince bağırsakta çalışır / **D** maltaz ince bağırsakta etki eder / **E** lipaz ince bağırsakta çalışır.
:::

:::soru{cevap="C"}
Safra sıvısıyla ilgili aşağıdakilerden hangisi doğrudur?

- A) Safra kesesinde üretilir ve yağları yağ asidine ayırır.
- B) Pankreasta üretilir ve proteinleri peptitlere böler.
- C) Karaciğerde üretilir ve yağları küçük damlacıklara ayırır.
- D) Mideye salgılanır ve proteini sindirir.
- E) Enzim içerir ve nişastayı maltoza çevirir.

---

1. Safra karaciğerde üretilir, safra kesesinde depolanır ve oniki parmak bağırsağına dökülür.
2. Enzim içermez. Yağları küçük damlacıklara ayırarak (emülsiyon) lipazın etki yüzeyini artırır. Doğru cevap C.

Diğer şıklar: **A** safra kesesi üretmez yalnızca depolar ve safra yağı kimyasal olarak parçalamaz / **B** pankreas safra üretmez / **D** safra mideye değil ince bağırsağa dökülür / **E** safra enzim içermez.
:::

:::soru{cevap="A"}
İnce bağırsakta emilim yüzeyinin çok geniş olmasını sağlayan yapılar aşağıdakilerden hangisidir?

- A) Villus ve mikrovilluslar
- B) Mide kıvrımları
- C) Pilor kası
- D) Safra kesesi
- E) Apandis

---

1. İnce bağırsak iç yüzeyinde kıvrımlar, bunların üzerinde parmak biçimli villuslar, villus hücrelerinde ise mikrovilluslar bulunur.
2. Yüzey alanı yaklaşık $200\ \text{m}^2$'ye çıkar. Doğru cevap A.

Diğer şıklar: **Mide kıvrımları** midenin genişlemesini sağlar / **Pilor kası** midenin çıkışını kontrol eder / **Safra kesesi** safra depolar / **Apandis** emilimde görev almaz.
:::

:::soru{cevap="E"}
Yağların sindirimi sonucu oluşan yağ asitleri ve gliserolün emilimiyle ilgili aşağıdakilerden hangisi doğrudur?

- A) Kan kılcallarına geçer ve karaciğere gider.
- B) Doğrudan mideye geri taşınır.
- C) Safra kesesinde depolanır.
- D) Kalın bağırsakta emilir ve dışkıyla atılır.
- E) Lenf kılcallarına geçer ve lenfle kana taşınır.

---

1. Yağ asidi ve gliserol, epitel hücrelerinde yeniden yağa çevrilir.
2. Villusun içindeki lenf kılcalına (lakteal) geçer. Oradan lenf damarlarıyla kana ulaşır. Doğru cevap E.

Diğer şıklar: **A** glikoz ve amino asitlerin yolu / **B** emilim mideye doğru olmaz / **C** safra yağ taşımaz, depolama yapmaz / **D** yağın emilimi ince bağırsakta olur.
:::

## Kendini dene

:::dene
1. Nişasta sindirimi nerede başlar? => Ağızda.
2. Protein sindirimi nerede başlar? => Midede.
3. Safra enzim içerir mi? => Hayır.
4. Yağ asidi ve gliserol hangi kılcala geçer? => Lenf kılcalına (lakteal).
5. Kalın bağırsağın temel görevi nedir? => Su ve mineral emilimi.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Sindirim Sistemi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Kalp bir yıl içinde yaklaşık $40$ milyon kez atar. Bir kanama durunca yara neden pıhtılaşır? Bir hastalığı geçiren kişi neden çoğunlukla aynı hastalığa tekrar yakalanmaz? **Dolaşım sistemi** besin, oksijen, hormon ve atıkları taşır. **Bağışıklık sistemi** vücudu mikroplara karşı korur. Bu konuda **kalbin yapısını ve çalışmasını**, **damar türlerini**, **kanın bileşenlerini**, **kan gruplarını**, **pıhtılaşmayı**, **lenf sistemini** ve **bağışıklığı** (doğal, edinsel, aşı, serum) öğreneceksin. Kan grupları ve bağışıklık, AYT'de genetik sorularıyla birlikte de karşına çıkar.

:::hedefler
1. Kalbin odalarını, kapaklarını ve kanın kalpteki yolunu sıralamak.
2. Atardamar, toplardamar ve kılcal damarı karşılaştırmak.
3. Kan hücrelerinin ve plazmanın görevlerini açıklamak.
4. ABO ve Rh kan grubu uyumunu belirlemek.
5. Pıhtılaşma basamaklarını ve lenf sisteminin görevini söylemek.
6. Doğal ve edinsel bağışıklığı, aşı ile serum farkını yorumlamak.
:::

:::ipucu
Temiz kan (oksijence zengin) **akciğer toplardamarı, sol kulakçık, sol karıncık ve aort**'ta bulunur. Kirli kan (oksijence fakir) ise **alt-üst ana toplardamar, sağ kulakçık, sağ karıncık ve akciğer atardamarı**'ndadır. Atar ve toplardamarlar oksijene göre değil **kalbe göre** adlandırılır: Kalpten çıkan atardamar, kalbe giren toplardamardır.
:::

::video{id="rr6Dpz2ATfE" etiket="Konu anlatımı videosu" baslik="Dolaşım Sistemi" kanal="Selin Hoca Biyoloji"}

## 1. Kalp ve kan dolaşımı

Kalp dört odalıdır: **sağ ve sol kulakçık**, **sağ ve sol karıncık**. Kulakçıklar kanı alır, karıncıklar pompalar. Sol karıncığın duvarı en kalındır, çünkü kanı tüm vücuda gönderir.

![Kalbin odaları, büyük ve küçük dolaşımın yönü](/lessons/ayt-bio/kalp.svg "Mavi damarlar oksijence fakir, kırmızı damarlar oksijence zengin kan taşır")

**Kapaklar** kanın geri akmasını engeller: **Üç yapraklı** (sağ taraf), **iki yapraklı** (mitral, sol taraf), aort ve akciğer atardamarı çıkışındaki yarım ay kapakları. Kalbin "lup-dup" sesi kapakların kapanmasıdır.

**Büyük dolaşım:** sol karıncık $\rightarrow$ aort $\rightarrow$ vücut $\rightarrow$ alt ve üst ana toplardamar $\rightarrow$ sağ kulakçık.

**Küçük dolaşım:** sağ karıncık $\rightarrow$ akciğer atardamarı $\rightarrow$ akciğer $\rightarrow$ akciğer toplardamarı $\rightarrow$ sol kulakçık.

**Kalp döngüsü:** Kulakçıklar kasılır (sistol), kan karıncıklara geçer. Sonra karıncıklar kasılır, kan atardamarlara pompalanır. Sonra kalp gevşer (diyastol). Kalp, sinir sisteminden bağımsız **kendi ritmini** üretir (sinüs düğümü). Sempatik sistem hızlandırır, parasempatik yavaşlatır.

**Kan basıncı:** Büyük tansiyon (sistolik) karıncık kasılırken, küçük tansiyon (diyastolik) gevşerken ölçülür. Normal yaklaşık $120/80\ \text{mmHg}$.

## 2. Damarlar

| | Atardamar | Toplardamar | Kılcal damar |
| --- | --- | --- | --- |
| Yön | Kalpten uzaklaşır | Kalbe gelir | Atar ile toplar arası |
| Duvar | Kalın, esnek | İnce | Tek katlı epitel |
| Kapak | Yok | Var | Yok |
| Basınç | Yüksek | Düşük | Çok düşük |

Madde alışverişi **yalnızca kılcal damarlarda** olur. Toplardamar kapakları kanın geri akışını önler, çevre kasların kasılması kanı kalbe iter.

## 3. Kan

Kan doku olarak **plazma** (%55) ve **hücrelerden** (%45) oluşur.

- **Plazma:** Su (%90), proteinler (albümin, fibrinojen, antikor), glikoz, iyonlar, hormonlar, atıklar.
- **Alyuvar (eritrosit):** Hemoglobin içerir ve oksijen taşır. Çekirdeksiz, çift çukur disk. Ömrü yaklaşık $120$ gün. Kırmızı kemik iliğinde yapılır, karaciğer ve dalakta yıkılır.
- **Akyuvar (lökosit):** Çekirdekli, mikroplara karşı savunma yapar.
- **Kan pulcukları (trombosit):** Pıhtılaşmada görevlidir.

**Kan grupları:**

| Grup | Alyuvarda antijen | Plazmada antikor |
| --- | --- | --- |
| A | A | Anti-B |
| B | B | Anti-A |
| AB | A ve B | Yok |
| O | Yok | Anti-A ve anti-B |

**Rh faktörü:** Alyuvarda Rh antijeni varsa Rh⁺, yoksa Rh⁻. Rh⁻ kişide anti-Rh antikoru, Rh⁺ kana maruz kalınca oluşur.

**Kan nakli:** Verici alyuvarındaki antijene alıcıda antikor varsa **aglütinasyon** (kümeleşme) olur. O Rh⁻ **evrensel verici**, AB Rh⁺ **evrensel alıcıdır**.

**Pıhtılaşma:** Damar zedelenince trombositler yarayı kapatır ve madde salgılar. Bu maddeler **protrombini trombine**, trombin de **fibrinojeni fibrine** çevirir. Fibrin ağı kan hücrelerini tutar ve pıhtı oluşur. **Ca²⁺** ve **K vitamini** gerekir. Hemofili, pıhtılaşma faktörü eksikliğidir.

## 4. Lenf sistemi

Kılcal damardan doku aralığına sızan sıvının bir kısmı **lenf damarlarına** girer. Lenf, protein ve mikropları taşır, lenf düğümlerinde süzülür ve **köprücük kemiği yakınındaki toplardamara** boşalır. Lenf dolaşımının görevleri: Doku sıvısı dengesi, yağların taşınması, bağışıklık. Lenf düğümleri, lenfosit üretir ve mikropları tutar.

## 5. Bağışıklık

**Doğuştan (doğal) bağışıklık** (hızlı, özgül olmayan): Deri, mukus, tükürükteki lizozim, mide asidi, **fagositoz** (makrofaj, nötrofil), iltihap, ateş.

**Kazanılmış (edinsel) bağışıklık** (yavaş, **özgül**, bellekli): Antijene yanıt verir.

- **Antijen:** Bağışıklığı uyaran yabancı molekül.
- **B lenfosit:** Antijenle karşılaşınca **plazma hücrelerine** dönüşür, **antikor** üretir (hümoral bağışıklık). Bir kısmı **bellek hücresi** olur.
- **T lenfosit:** Timusta olgunlaşır. **Yardımcı T** hücreleri bağışıklığı yönetir, **sitotoksik T** hücreleri virüslü ya da kanserli hücreleri öldürür (hücresel bağışıklık).
- **Bellek hücreleri:** Aynı antijenle ikinci karşılaşmada **hızlı ve güçlü** yanıt (ikincil yanıt) verir.

**Aşı ve serum:**

| | Aşı | Serum |
| --- | --- | --- |
| İçerik | Zayıflatılmış ya da ölü mikrop, antijen | Hazır antikor |
| Bağışıklık | **Aktif**, bellek oluşur | **Pasif**, bellek oluşmaz |
| Etki | Geç başlar, uzun sürer | Hemen başlar, kısa sürer |
| Amaç | Korunma | Tedavi |

**Bağışıklık bozuklukları:** **Alerji** (zararsız maddeye aşırı yanıt, histamin), **otoimmün hastalık** (kendi dokusuna saldırı: tip 1 diyabet, romatoid artrit), **AIDS** (HIV yardımcı T hücrelerini yıkar, bağışıklık çöker).

## 6. Sık yapılan hatalar

- Atardamarın her zaman temiz kan taşıdığını sanmak. Akciğer atardamarı kirli kan taşır.
- Serumun bellek oluşturduğunu sanmak. Bellek aşıyla oluşur.
- AB grubunda her iki antikorun da bulunduğunu sanmak. AB'de antikor yoktur.
- Pıhtılaşmada trombinin fibrinojenden önce oluştuğunu karıştırmak.
- Antikoru T lenfositin üretmesi. Antikoru plazma hücresi üretir.

:::baglanti
Dolaşım, **solunum** ile gaz taşımayı, **sindirimle** besin dağılımını, **boşaltımla** atık taşımayı bağlar. **Endokrin sistemde** hormonlar kanla hedefe ulaşır. **Genetikte** ABO kan grupları çoklu alel örneğidir ve Rh kalıtımı klasik bir sorudur. **Kimyada** hemoglobinin demir iyonu, oksijen bağlama kimyasıdır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Temiz kan | Sol kalp, akciğer toplardamarı, aort |
| Kılcal damar | Madde alışverişi |
| Alyuvar | Hemoglobin, çekirdeksiz |
| Evrensel verici | O Rh⁻ |
| Pıhtılaşma | Fibrinojen $\rightarrow$ fibrin |
| Plazma hücresi | Antikor üretir |
| Aşı / serum | Aktif, bellekli / pasif, hızlı |

## Mini test

:::soru{cevap="A"}
Aşağıdaki kan gruplarından hangisi A Rh⁻ kan grubuna sahip bir kişiye verilebilir?

- A) O Rh⁻
- B) O Rh⁺
- C) B Rh⁻
- D) A Rh⁺
- E) AB Rh⁻

---

1. A grubu kişinin plazmasında anti-B antikoru bulunur. Bu yüzden B antijeni taşıyan kan verilemez (C ve E elenir).
2. Rh⁻ kişiye Rh⁺ kan verilirse anti-Rh antikoru oluşur, nakil sorun çıkarır (B ve D elenir).
3. O Rh⁻ kanında A, B ve Rh antijeni yoktur. Doğru cevap A.

Diğer şıklar: **O Rh⁺** Rh antijeni taşır / **B Rh⁻** B antijeni anti-B ile kümeleşir / **A Rh⁺** Rh antijeni taşır / **AB Rh⁻** B antijeni taşır.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisinde oksijence zengin (temiz) kan bulunur?

- A) Sağ karıncık
- B) Akciğer atardamarı
- C) Alt ana toplardamar
- D) Akciğer toplardamarı
- E) Sağ kulakçık

---

1. Akciğerde oksijen alan kan, akciğer toplardamarıyla sol kulakçığa gelir. Bu damar temiz kan taşır.
2. Doğru cevap D.

Diğer şıklar: Sağ karıncık, akciğer atardamarı, alt ana toplardamar ve sağ kulakçık vücuttan dönen oksijence fakir kanı taşır.
:::

:::soru{cevap="A"}
Aşıyla ilgili aşağıdakilerden hangisi doğrudur?

- A) Antijen verilir ve bellek hücreleri oluşur.
- B) Hazır antikor verilir, etkisi hemen başlar.
- C) Etkisi kısa sürelidir, bellek hücresi oluşmaz.
- D) Pasif bağışıklık sağlayarak hızlı koruma verir.
- E) Yalnızca bakteri kaynaklı hastalıklarda kullanılır.

---

1. Aşıda zayıflatılmış ya da ölü mikrop, ya da onun antijeni vardır.
2. Vücut antikor ve bellek hücreleri oluşturur (aktif bağışıklık). İkinci karşılaşmada hızlı yanıt verilir. Doğru cevap A.

Diğer şıklar: **B**, **C** ve **D** serumun özellikleri / **E** aşılar virüslere karşı da kullanılır.
:::

:::soru{cevap="C"}
Aşağıdaki hücre-görev eşleştirmelerinden hangisi doğrudur?

- A) Makrofaj: Antikor üretir.
- B) Trombosit: Oksijen taşır.
- C) Plazma hücresi: Antikor üretir.
- D) Yardımcı T lenfosit: Virüslü hücreyi doğrudan öldürür.
- E) Alyuvar: Mikropları fagositozla yok eder.

---

1. B lenfositler antijenle karşılaşınca plazma hücrelerine dönüşür.
2. Antikor üretimi plazma hücrelerinin görevidir. Doğru cevap C.

Diğer şıklar: **A** makrofaj fagositoz yapar / **B** trombosit pıhtılaşmada görevlidir, oksijeni hemoglobin taşır / **D** virüslü hücreyi sitotoksik T hücresi öldürür / **E** fagositozu akyuvarlar yapar.
:::

## Kendini dene

:::dene
1. Büyük dolaşım hangi odacıkta başlar? => Sol karıncıkta.
2. Madde alışverişi hangi damarlarda olur? => Kılcal damarlarda.
3. Pıhtılaşmada fibrinojen neye dönüşür? => Fibrine.
4. Evrensel alıcı kan grubu nedir? => AB Rh⁺.
5. Aktif bağışıklığı hangisi sağlar? => Aşı.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-bio' and name = 'Dolaşım ve Bağışıklık Sistemi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Derin nefes alınca göğsün neden kabarır? Dağa çıkınca neden daha hızlı nefes alırsın? Sobadan çıkan gaz neden öldürür? **Solunum sistemi** vücuda oksijen alır, karbondioksiti dışarı atar. Bu konuda **solunum yollarını**, **soluk alıp vermenin mekanizmasını**, **akciğerde ve dokuda gaz değişimini**, **oksijen ve karbondioksitin taşınmasını**, **solunumun kontrolünü** ve **solunum hastalıklarını** öğreneceksin. AYT'de gaz taşınması ve soluk alıp verme sırasında basınç-hacim ilişkisi sorulur.

:::hedefler
1. Solunum yollarının bölümlerini sıralamak.
2. Soluk alma ve verme sırasında diyafram, kaburga kasları, hacim ve basınç değişimini açıklamak.
3. Alveolde ve dokuda gaz değişimini kısmi basınç farkıyla anlatmak.
4. Oksijenin ve karbondioksitin kanda taşınma şekillerini söylemek.
5. Solunum merkezinin kontrolünü yorumlamak.
6. Solunum hastalıklarını ve karbonmonoksit zehirlenmesini açıklamak.
:::

:::ipucu
Soluk almada hem **hacim artar hem basınç düşer**. Bu, Boyle yasasının ($P\cdot V=$ sabit) canlıdaki uygulamasıdır. **Aldığın soluk aktif** (kas kasılır), **verdiğin soluk dinlenmede pasiftir** (kas gevşer). Kuvvetli soluk vermede ise karın ve iç kaburga kasları kasılır.
:::

::video{id="M1N1mPEyBBM" etiket="Konu anlatımı videosu" baslik="Solunum Sistemi" kanal="Selin Hoca Biyoloji"}

## 1. Solunum yolları

Hava şu yolu izler: **burun boşluğu** (süzme, ısıtma, nemlendirme) $\rightarrow$ **yutak** $\rightarrow$ **gırtlak** (ses telleri, epiglot yutarken solunum yolunu kapatır) $\rightarrow$ **soluk borusu** (kıkırdak halkalı) $\rightarrow$ **bronşlar** $\rightarrow$ **bronşcuklar** $\rightarrow$ **alveoller**.

Soluk yollarının yüzeyi **mukus** ve **kirpikli epitel** ile örtülüdür. Toz ve mikroplar mukusta tutulur, kirpikler dışarı iter. Sigara kirpikleri tahrip eder.

**Akciğer:** Sağda üç, solda iki lob vardır (sol kalbe yer açar). Akciğeri saran çift katlı **plevra** arasındaki sıvı sürtünmeyi azaltır. Alveoller tek katlı epitelle örtülü, kılcal damarlarla çevrili ince keselerdir. Yüzey alanı yaklaşık $70\text{-}100\ \text{m}^2$. Alveol yüzeyi **sürfaktan** salgılar, bu madde alveolün sönmesini önler.

## 2. Soluk alıp verme

| | Soluk alma | Soluk verme (dinlenmede) |
| --- | --- | --- |
| Diyafram | Kasılır, düzleşir | Gevşer, kubbeleşir |
| Dış kaburga kasları | Kasılır, kaburgalar yukarı ve dışa | Gevşer |
| Göğüs boşluğu hacmi | Artar | Azalır |
| Akciğer içi basınç | Dış basınçtan **düşük** | Dış basınçtan **yüksek** |
| Hava | İçeri girer | Dışarı çıkar |

Akciğerde kas yoktur, akciğer **pasif** olarak göğüs boşluğunun hareketini izler.

**Hacimler:** Dinlenmede alınan hava **tidal hacim** (yaklaşık $500\ \text{mL}$). Derin soluma ile alınabilecek en fazla hava **vital kapasitedir**. Soluk verildikten sonra akciğerde kalan hava **artık hava**dır.

## 3. Gaz değişimi

Gazlar **difüzyonla** kısmi basıncın yüksek olduğu yerden düşük olduğu yere geçer.

- **Alveol → kan:** Alveolde $\text{O}_2$ kısmi basıncı yüksek, kılcalda düşüktür. $\text{O}_2$ kana geçer. $\text{CO}_2$ ise kılcaldan alveole geçer.
- **Kan → doku:** Dokuda $\text{O}_2$ kısmi basıncı düşük, $\text{CO}_2$ kısmi basıncı yüksektir. $\text{O}_2$ dokuya, $\text{CO}_2$ kana geçer.

Gaz değişimini kolaylaştıran özellikler: Geniş yüzey, ince ($1$ hücre kalınlığında) zar, nemli yüzey, bol kılcal.

## 4. Gazların taşınması

**Oksijen:** Yaklaşık **%97-98'i hemoglobine** bağlanarak **oksihemoglobin** olarak, %2-3'ü plazmada çözünmüş olarak taşınır. $\text{CO}_2$ artışı ve asit ortam hemoglobinin $\text{O}_2$ bırakmasını kolaylaştırır (çalışan kasta oksijen daha çok bırakılır).

**Karbondioksit:**

- **%70** kadarı **bikarbonat** ($\text{HCO}_3^-$) olarak plazmada. Alyuvarda karbonik anhidraz enzimi $\text{CO}_2+\text{H}_2\text{O}\rightleftharpoons\text{H}_2\text{CO}_3\rightleftharpoons\text{H}^++\text{HCO}_3^-$ tepkimesini hızlandırır.
- **%20-25'i** hemoglobine bağlı (**karbaminohemoglobin**).
- **%7'si** plazmada çözünmüş.

**Karbonmonoksit (CO):** Hemoglobine $\text{O}_2$'den yaklaşık $200$ kat daha güçlü bağlanır, oksijen taşınmasını engeller. Kişi oksijen olmadığı hâlde boğulur. Renksiz, kokusuz olduğundan **sessiz öldürücüdür**.

## 5. Solunumun kontrolü

**Omurilik soğanındaki solunum merkezi** soluk alıp vermeyi ritmik olarak yönetir. En güçlü uyarıcı kandaki **$\text{CO}_2$ artışıdır** ($\text{H}^+$ artışı, **pH düşüşü**). Karotis ve aort kemoreseptörleri de $\text{O}_2$ düşüşünü algılar. $\text{CO}_2$ arttıkça solunum hızı ve derinliği artar. Soluğu bir süre tutabilirsin, ama $\text{CO}_2$ yükselince refleks olarak solunum başlar. Köprü (pons) ritmi düzenler.

## 6. Solunum hastalıkları

- **Astım:** Bronşların aşırı duyarlılığı, daralma.
- **Bronşit:** Bronşların iltihabı, öksürük, balgam.
- **Zatürre (pnömoni):** Alveollerin mikrobik iltihabı.
- **Amfizem, KOAH:** Alveol duvarlarının yıkımı, sigaranın başlıca sonucu.
- **Akciğer kanseri:** Sigara en büyük risk faktörüdür.
- **Tüberküloz:** Bakteriyel, bulaşıcı.

## 7. Sık yapılan hatalar

- Soluk almada diyaframın gevşediğini sanmak. Soluk alırken kasılır.
- Akciğerin kasları olduğunu düşünmek. Akciğer pasiftir.
- $\text{CO}_2$'nin yalnızca plazmada çözünmüş taşındığını sanmak. Esas yol bikarbonattır.
- Solunumu en çok $\text{O}_2$ azlığının uyardığını sanmak. En güçlü uyarıcı $\text{CO}_2$ artışıdır.
- CO zehirlenmesinin alveolde gaz değişimini durdurduğunu sanmak. Hemoglobine bağlanır.

:::baglanti
Solunum, **dolaşım sistemiyle** birlikte çalışır, kan gazları taşır. **Hücresel solunumda** kullanılan oksijen buradan sağlanır, üretilen $\text{CO}_2$ buradan atılır. **Fizikte** gazların basınç-hacim ilişkisi (Boyle) soluk almanın temelidir. **Kimyada** $\text{CO}_2$'nin su ile asit oluşturması kan pH tamponunun temelidir. **Sinir sisteminde** omurilik soğanı otomatik soluk almayı yönetir.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Soluk alma | Diyafram kasılır, hacim artar, basınç düşer |
| Gaz değişimi | Difüzyon, kısmi basınç farkı |
| $\text{O}_2$ taşıma | Çoğu hemoglobinle |
| $\text{CO}_2$ taşıma | En çok bikarbonat |
| CO | Hemoglobine güçlü bağlanır |
| Solunum merkezi | Omurilik soğanı, $\text{CO}_2$ ile uyarılır |
| Sürfaktan | Alveol sönmesini önler |

## Mini test

:::soru{cevap="D"}
Dinlenme hâlindeki bir kişi soluk alırken aşağıdakilerden hangisi gerçekleşir?

- A) Diyafram gevşer ve göğüs boşluğu hacmi artar.
- B) Dış kaburga kasları gevşer ve akciğer basıncı artar.
- C) Diyafram kasılır ve akciğer içi basınç dış basınçtan yüksek olur.
- D) Diyafram kasılır ve akciğer içi basınç dış basınçtan düşük olur.
- E) Diyafram gevşer ve akciğer içi basınç düşer.

---

1. Soluk alırken diyafram kasılıp düzleşir, dış kaburga kasları kasılır. Göğüs boşluğu hacmi artar.
2. Hacim artınca akciğer içi basınç dış basıncın altına düşer ve hava içeri girer. Doğru cevap D.

Diğer şıklar: **A**, **B** ve **E** gevşeme (soluk verme) durumu ya da çelişkili / **C** hacim artarken basınç düşer, yükselmez.
:::

:::soru{cevap="B"}
Karbonmonoksit (CO) zehirlenmesinin temel nedeni aşağıdakilerden hangisidir?

- A) CO'nun alveolleri tahriş ederek gaz geçişini durdurması
- B) CO'nun hemoglobine oksijenden daha sıkı bağlanması
- C) CO'nun plazmada asit oluşturarak pH'ı yükseltmesi
- D) CO'nun omurilik soğanını doğrudan felç etmesi
- E) CO'nun alyuvarları parçalayarak kanı sulandırması

---

1. CO, hemoglobine oksijenden yaklaşık $200$ kat daha güçlü bağlanır.
2. Hemoglobin oksijen taşıyamaz, dokular oksijensiz kalır. Doğru cevap B.

Diğer şıklar: **A** alveol hasarı CO'nun etkisi değil / **C** CO asit oluşturmaz / **D** doğrudan felç etmez, oksijensizlik yapar / **E** alyuvarları parçalamaz.
:::

:::soru{cevap="D"}
Karbondioksitin kanda en büyük bölümü hangi şekilde taşınır?

- A) Plazmada çözünmüş $\text{CO}_2$ olarak
- B) Karbaminohemoglobin olarak
- C) Karbonmonoksit olarak
- D) Bikarbonat iyonu ($\text{HCO}_3^-$) olarak
- E) Oksihemoglobin olarak

---

1. Alyuvardaki karbonik anhidraz enzimi $\text{CO}_2$ ile suyun birleşmesini hızlandırır, karbonik asit oluşur.
2. Karbonik asit $\text{H}^+$ ve $\text{HCO}_3^-$ iyonlarına ayrışır. Bikarbonat plazmaya geçer ve CO₂'nin yaklaşık %70'i bu şekilde taşınır. Doğru cevap D.

Diğer şıklar: **A** yaklaşık %7 / **B** yaklaşık %20-25 / **C** CO ayrı bir gazdır / **E** oksihemoglobin oksijen taşır.
:::

:::soru{cevap="C"}
Egzersiz sırasında kandaki $\text{CO}_2$ miktarı arttığında aşağıdakilerden hangisi gerçekleşir?

- A) Kan pH'ı yükselir ve solunum hızı azalır.
- B) Kandaki $\text{O}_2$ artışı solunum hızını artırır.
- C) Kan pH'ı düşer ve solunum hızı artar.
- D) Diyafram kasılması durur.
- E) Omurilik soğanı baskılanır.

---

1. $\text{CO}_2$ suyla birleşip karbonik asit oluşturur, $\text{H}^+$ artar, pH düşer.
2. Omurilik soğanındaki solunum merkezi uyarılır, solunum hızı ve derinliği artar. Fazla $\text{CO}_2$ atılır. Doğru cevap C.

Diğer şıklar: **A** pH düşer, yükselmez / **B** O₂ artışı değil CO₂ artışı uyarıcıdır / **D** diyafram daha sık kasılır / **E** solunum merkezi baskılanmaz, uyarılır.
:::

## Kendini dene

:::dene
1. Soluk alırken diyaframın durumu nedir? => Kasılır ve düzleşir.
2. Alveolün sönmesini hangi madde önler? => Sürfaktan.
3. CO₂ en çok hangi şekilde taşınır? => Bikarbonat olarak.
4. Solunum merkezi vücutta nerededir? => Omurilik soğanında.
5. CO hemoglobine oksijene göre nasıl bağlanır? => Çok daha güçlü.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Solunum Sistemi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Çok su içince neden sık tuvalete gidersin? Yaz sıcağında idrar neden koyulaşır? Böbrek yetmezliğinde hastalar neden diyalize girer? **Boşaltım sistemi**, metabolizma artıklarını uzaklaştırır ve vücudun **su, tuz ve pH dengesini** korur. Bu konuda **atık maddeleri**, **böbreğin ve nefronun yapısını**, **idrar oluşumunu** (süzülme, geri emilim, salgılama), **hormonal kontrolü**, **diğer boşaltım organlarını** ve **böbrek hastalıklarını** öğreneceksin. AYT'de nefron bölümleri ve ADH sorusu neredeyse her yıl vardır.

:::hedefler
1. Metabolik atıkları ve oluştukları yerleri sıralamak.
2. Böbreğin ve nefronun bölümlerini adlandırmak.
3. İdrar oluşumunun üç basamağını (süzülme, geri emilim, salgılama) açıklamak.
4. ADH ve aldosteronun idrar yoğunluğuna etkisini yorumlamak.
5. Karaciğer, akciğer ve derinin boşaltımdaki yerini söylemek.
6. Böbrek taşı ve diyaliz gibi durumları açıklamak.
:::

:::ipucu
İdrar oluşumunu üç basamakla düşün: **süzülme** (glomerulus, her şey geçer, hücre ve büyük protein hariç), **geri emilim** (yararlı maddeler kana döner: glikoz, amino asit, su, tuz) ve **salgılama** (kandan tübüle atık eklenir: H⁺, K⁺, ilaç). Hormonlar yalnızca **geri emilimi** ayarlar.
:::

::video{id="b9uC5YHq9JE" etiket="Konu anlatımı videosu" baslik="Boşaltım Sistemi" kanal="Selin Hoca Biyoloji"}

## 1. Atık maddeler

- **Karbondioksit ve su:** Hücresel solunumdan. Akciğer ve deriden atılır.
- **Azotlu atıklar:** Proteinlerin ve nükleik asitlerin yıkımından.
  - **Amonyak:** Çok zehirli, çok su ister. Sucul canlılar (balık).
  - **Üre:** Az zehirli. Karaciğerde amonyaktan yapılır. İnsan, memeli.
  - **Ürik asit:** En az zehirli, suda az çözünür, en az su harcanır. Kuş, sürüngen, böcek.
- **Fazla tuz, ilaç, hormon yıkım ürünleri.**

Atıklar **kanla** taşınır. Böbrek kanı süzer.

## 2. Böbrek ve nefron

İnsanda **iki böbrek** karın boşluğunun arka tarafındadır. Dışta **korteks** (kabuk), içte **medulla** (öz), merkezde **pelvis** (havuzcuk) bulunur. Her böbrekte yaklaşık **bir milyon nefron** vardır.

![Nefronun bölümleri ve idrar oluşumunun basamakları](/lessons/ayt-bio/nefron.svg "Süzülme glomerulusta, geri emilim tüplerde, salgılama distal bölgede gerçekleşir")

**Nefronun bölümleri:**

1. **Bowman kapsülü ve glomerulus:** Süzülme burada olur. Glomerulus, kılcal damar yumağıdır. Basınç yüksek, çünkü giren damar (afferent) çıkan damardan (efferent) geniştir.
2. **Proksimal tüp:** Geri emilimin büyük kısmı. Glikoz, amino asit, vitaminlerin tamamı, suyun ve Na⁺'nın %65-70'i.
3. **Henle kulpu:** İnen kolda su çıkar, çıkan kolda tuz çıkar. Bu **karşıt akım** ile medulla derişik olur, idrar yoğunlaştırılabilir.
4. **Distal tüp:** Hormonlara bağlı su ve Na⁺ geri emilimi, H⁺, K⁺ salgılama.
5. **Toplama kanalı:** ADH etkisiyle suyun geri emildiği yer. Birçok nefronun toplama kanalı **pelvise** açılır.

İdrar **pelvis $\rightarrow$ üreter $\rightarrow$ idrar kesesi $\rightarrow$ üretra** yoluyla atılır.

## 3. İdrar oluşumu

| Basamak | Yer | Ne olur |
| --- | --- | --- |
| Süzülme | Glomerulus $\rightarrow$ Bowman | Su, glikoz, amino asit, üre, tuz kandan geçer. Kan hücreleri ve büyük proteinler geçemez |
| Geri emilim | Tüpler | Yararlı maddeler kana döner (glikoz, amino asit, su, tuz) |
| Salgılama | Tüpler | Kandaki bazı madde (H⁺, K⁺, ilaç) tübüle geçer |

Süzülen sıvının günde yaklaşık 180 litresinden yalnızca yaklaşık 1,5 litre idrar oluşur. Glikoz tamamen geri emilir. İdrarda glikoz varsa (şeker hastalığında geri emilim kapasitesi aşıldığı için) ya da protein varsa (glomerulus hasarı) ve kan varsa durum anormaldir.

**Sağlıklı idrarda bulunur:** su, üre, ürik asit, tuzlar. **Bulunmaz:** glikoz, protein, kan hücreleri.

## 4. Hormonal kontrol

- **ADH (antidiüretik hormon):** Hipotalamus yapar, hipofiz arka lobdan salgılanır. Toplama kanalının **suya geçirgenliğini artırır**. Su kaybı artarsa ADH artar, su geri emilir, idrar **az ve yoğun** olur. Çok su içilince ADH azalır, idrar bol ve seyrek olur. ADH eksikliği şekersiz diyabete (çok idrar, aşırı susama) yol açar. Alkol ADH'yı baskılar, idrar artar.
- **Aldosteron:** Adrenal korteksten salgılanır. Distal tüpte **Na⁺ geri emilimini** artırır (su da onu izler), kan basıncını yükseltir.

## 5. Diğer boşaltım organları

- **Akciğer:** $\text{CO}_2$ ve su buharı.
- **Deri:** Terle su, tuz ve az üre. Başlıca görevi **ısı düzenlemesidir**.
- **Karaciğer:** Amonyağı üreye çevirir, hormonları ve ilaçları yıkar, safra pigmenti (bilirubin) atar.
- **Sindirim kanalı:** Safra pigmentleri, dışkı.

## 6. Böbrek hastalıkları

- **Böbrek taşı:** Kalsiyum tuzları ya da ürik asit çökmesi.
- **Nefrit:** Nefron iltihabı. İdrarda protein ve kan olabilir.
- **Böbrek yetmezliği:** Böbrek süzme yeteneğini kaybeder. **Diyaliz** (kanı makine ile süzme) ya da böbrek nakli gerekir.
- **İdrar yolu enfeksiyonu:** Genellikle bakteriyel.

## 7. Sık yapılan hatalar

- Süzülme ile geri emilimi karıştırmak. Glikoz süzülür ama geri emilir.
- Hormonların süzülmeyi ayarladığını sanmak. ADH ve aldosteron geri emilimi ayarlar.
- Üreyi böbreğin ürettiğini sanmak. Üre karaciğerde yapılır.
- Henle kulpunda sadece su emildiğini sanmak. İnen kolda su, çıkan kolda tuz hareket eder.
- Terin başlıca görevinin boşaltım olduğunu sanmak. Başlıca görevi ısı kaybıdır.

:::baglanti
Boşaltım **dolaşım sistemiyle** doğrudan çalışır, çünkü böbrek kanı süzer. **Endokrin sistemde** ADH ve aldosteron suyu ve tuzu yönetir. **Sindirim sisteminde** karaciğer üre ve safra yapar. **Kimyada** osmoz, difüzyon ve aktif taşıma geri emilimi açıklar. **Hücre zarı** konusundaki taşıma çeşitleri nefronda uygulanır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Üre | Karaciğerde yapılır, böbrekten atılır |
| Süzülme | Glomerulus, Bowman kapsülü |
| Geri emilim | Proksimal tüpte çoğu |
| Salgılama | H⁺, K⁺, ilaç |
| ADH | Su geri emilimini artırır |
| Aldosteron | Na⁺ geri emilimini artırır |
| İdrarda bulunmaz | Glikoz, protein, kan hücresi |

## Mini test

:::soru{cevap="D"}
Aşağıdaki maddelerden hangisi sağlıklı bir kişinin idrarında normalde **bulunmaz**?

- A) Üre
- B) Su
- C) Tuz
- D) Glikoz
- E) Ürik asit

---

1. Glikoz glomerulusta süzülür ama proksimal tüpte tamamen geri emilir.
2. Sağlıklı bir kişinin idrarında glikoz bulunmaz. İdrarda glikoz varsa geri emilim kapasitesi aşılmıştır (örneğin şeker hastalığı). Doğru cevap D.

Diğer şıklar: **Üre**, **su**, **tuz** ve **ürik asit** normal idrarın bileşenleridir.
:::

:::soru{cevap="B"}
Nefronda süzülme olayı aşağıdaki bölgelerin hangisinde gerçekleşir?

- A) Proksimal tüp
- B) Glomerulus ile Bowman kapsülü arasında
- C) Henle kulpu
- D) Distal tüp
- E) Toplama kanalı

---

1. Glomerulusun yüksek basınçlı kılcal damarlarından su ve küçük moleküller Bowman kapsülüne süzülür.
2. Doğru cevap B.

Diğer şıklar: **A**, **C**, **D** ve **E** geri emilim ve salgılama yerleridir.
:::

:::soru{cevap="A"}
Sıcak bir havada çok terleyen ve su içmeyen bir kişide aşağıdakilerden hangisi gerçekleşir?

- A) ADH artar, su geri emilimi artar ve idrar yoğunlaşır.
- B) ADH azalır, idrar seyrelir ve hacmi artar.
- C) Aldosteron durur ve Na⁺ atılımı artar.
- D) Süzme hızı artar ve idrar miktarı yükselir.
- E) Toplama kanalının suya geçirgenliği azalır.

---

1. Terleme kan hacmini azaltır, kan ozmotik basıncı yükselir. Hipotalamus uyarılır ve ADH salgısı artar.
2. ADH toplama kanalının suya geçirgenliğini artırır, su geri emilir ve az miktarda yoğun idrar çıkar. Doğru cevap A.

Diğer şıklar: **B** su fazlalığında olacak durum / **C** aldosteron Na⁺ geri emilimini artırır / **D** su kaybında süzme artmaz / **E** geçirgenlik artar.
:::

:::soru{cevap="C"}
Üre ile ilgili aşağıdakilerden hangisi doğrudur?

- A) Böbrekte üretilir ve idrarla atılır.
- B) Akciğerde üretilir ve solunumla atılır.
- C) Karaciğerde üretilir ve idrarla atılır.
- D) Karaciğerde üretilir ve safrayla atılır.
- E) Böbrekte üretilir ve terle atılır.

---

1. Proteinlerin yıkımıyla oluşan amonyak zehirlidir. Karaciğer onu üreye çevirir.
2. Üre kanla böbreğe taşınır, süzülür ve idrarla atılır. Doğru cevap C.

Diğer şıklar: **A** ve **E** böbrek üreyi üretmez / **B** akciğer üre atmaz / **D** safra yalnızca bilirubin atar.
:::

## Kendini dene

:::dene
1. İnsanda azotlu atık olarak hangi madde atılır? => Üre.
2. Süzülme nefronun hangi bölgesinde olur? => Glomerulus ve Bowman kapsülü.
3. ADH nerede etki eder? => Toplama kanalı (ve distal tüp).
4. Glikoz idrarda bulunur mu? => Normalde hayır, tamamen geri emilir.
5. Aldosteron hangi iyonun geri emilimini artırır? => Na⁺.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Boşaltım Sistemi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Tek bir hücre olan zigot, dokuz ayda nasıl bir bebeğe dönüşür? Adet döngüsünü hangi hormonlar yönetir? Neden bir yumurta döllenirken milyonlarca sperm yarışır? **Üreme**, türün devamını sağlar. Bu konuda **erkek ve dişi üreme sistemlerini**, **gametogenezi** (sperm ve yumurta oluşumu), **adet döngüsünün hormonal kontrolünü**, **döllenmeyi**, **embriyonik gelişimi** (zigottan organlara), **embriyo zarlarını**, **plasentayı** ve **doğumu** öğreneceksin. AYT'de gametogenez, adet döngüsü ve embriyonik katmanlar sık sorulur.

:::hedefler
1. Üreme organlarını ve görevlerini eşleştirmek.
2. Spermatogenez ile oogenezi karşılaştırmak.
3. Adet döngüsünün evrelerini ve hormon değişimlerini yorumlamak.
4. Döllenmeden gastrulaya embriyonik gelişimi sıralamak.
5. Embriyo zarlarının ve plasentanın görevlerini açıklamak.
6. Üç embriyonik katmandan gelişen doku ve organları eşleştirmek.
:::

:::ipucu
Spermatogenezde **bir hücreden dört sperm**, oogenezde ise **bir hücreden bir yumurta** ve üç kutup hücresi (küçük, atılır) oluşur. Mayoz II, **yumurtada yalnızca döllenmeyle tamamlanır**. Ovülasyonu **LH** (ani yükselme) başlatır.
:::

::video{id="gZ8qU35qkYw" etiket="Konu anlatımı videosu" baslik="Embriyonik Gelişim Evreleri" kanal="Betül Biyoloji"}

## 1. Erkek üreme sistemi

- **Testis:** Sperm ve testosteron üretir. Kese (skrotum) içindedir, sıcaklık vücut sıcaklığından $2\text{-}3^\circ\text{C}$ düşük tutulur. **Seminifer tüpçüklerde** sperm oluşur, **Leydig hücreleri** testosteron salgılar.
- **Epididim:** Spermin olgunlaşıp depolandığı yer.
- **Sperm kanalı:** Epididimden üretraya.
- **Seminal vezikül, prostat, Cowper bezi:** Semen sıvısı (fruktoz, bazik sıvı) salgılar. Sperm ve bu sıvıdan **semen** oluşur.
- **Penis ve üretra:** İdrarı ve semeni dışarı taşır.

**Sperm hücresi:** Baş (çekirdek, **akrozom**: enzim kesesi), orta kısım (mitokondri, enerji), kuyruk (hareket).

## 2. Dişi üreme sistemi

- **Yumurtalık (ovaryum):** Yumurta, östrojen ve progesteron üretir.
- **Fallop tüpü (yumurta kanalı):** Döllenme burada olur.
- **Uterus (rahim):** Embriyonun yerleştiği ve geliştiği yer.
- **Vajina:** Doğum kanalı.

## 3. Gametogenez

| | Spermatogenez | Oogenez |
| --- | --- | --- |
| Başlangıç | Ergenlikten | Embriyoda başlar, ergenlikte sürer |
| Hücre | Spermatogonyum (2n) | Oogonyum (2n) |
| Bir hücreden | 4 sperm | 1 yumurta + kutup hücreleri |
| Süre | Sürekli | Yaklaşık 28 günde bir yumurta |
| Mayoz II | Tamamlanır | Döllenmede tamamlanır |

Her ikisinde de **mitoz** ile çoğalma, **mayoz** ile haploid hücre elde etme vardır. İnsanda $n=23$ kromozom.

## 4. Adet döngüsü

Ortalama 28 gün sürer ve hormonlarla düzenlenir.

1. **Foliküler evre (1-13. gün):** Hipofizden **FSH** yumurtalıkta bir folikülü olgunlaştırır. Folikül **östrojen** salgılar. Östrojen rahim iç zarını kalınlaştırır.
2. **Ovülasyon (yaklaşık 14. gün):** Östrojen yüksekliği hipofizi uyarır, **LH ani yükselir**, yumurta folikülden çıkar.
3. **Luteal evre (15-28. gün):** Boş folikül **sarı cisme** dönüşür, **progesteron** (ve östrojen) salgılar. Rahim zarı beslenir, embriyoya hazırlanır. Progesteron hipofizi baskılar (FSH ve LH azalır).
4. **Adet (menstruasyon):** Döllenme olmazsa sarı cisim küçülür, progesteron ve östrojen düşer, rahim iç zarı dökülür.

**Hamilelikte:** Embriyo **HCG** hormonu salgılar, sarı cismi korur, progesteron sürer ve adet olmaz. Hamilelik testleri HCG'yi arar.

## 5. Döllenme ve embriyonik gelişim

**Döllenme** fallop tüpünde olur. Spermin akrozom enzimleri yumurta zarını eritir, çekirdekler birleşir ve **zigot** (2n) oluşur. Yumurta zarı değişerek başka spermi engeller.

1. **Segmentasyon (bölünme):** Zigot **mitozla** hızlıca bölünür. Hücreler küçülür, toplam hacim değişmez. **Morula** (içi dolu hücre yumağı) oluşur.
2. **Blastula:** İçi sıvı dolu boşluklu top. Rahim duvarına **tutunur** (yerleşme).
3. **Gastrula:** Hücreler yer değiştirerek **üç embriyonik katman** oluşturur.
4. **Organogenez:** Katmanlardan doku ve organlar gelişir.

| Katman | Gelişen yapılar |
| --- | --- |
| **Ektoderm** | Sinir sistemi, deri, saç, tırnak, duyu organları |
| **Mezoderm** | Kas, kemik, kalp, damar, böbrek, üreme organları |
| **Endoderm** | Sindirim ve solunum kanalı iç yüzeyi, karaciğer, pankreas, tiroit |

## 6. Embriyo zarları ve plasenta

- **Amniyon:** Embriyoyu saran, amniyon sıvısı dolu keseyi oluşturur. Darbelere ve ısı değişimine karşı korur.
- **Koryon:** Dıştaki zar, rahim duvarıyla temas eder, plasentanın embriyo kısmını oluşturur.
- **Allantois:** Atık maddeleri biriktirir (insanda küçüktür), göbek kordonu damarlarını oluşturur.
- **Sarı kese:** İnsanda ilk kan hücrelerini yapar.
- **Plasenta (eş):** Anne ile embriyonun kanı **birbirine karışmaz**. Madde alışverişi difüzyon ve aktif taşımayla olur. Besin, oksijen, vitamin ve antikor anneden embriyoya geçer. $\text{CO}_2$ ve atıklar embriyodan geçer. Plasenta ayrıca hormon (HCG, progesteron, östrojen) salgılar. Bazı maddeler (alkol, nikotin, virüs, bazı ilaçlar) plasentadan geçerek embriyoya zarar verir.

**Doğum:** Hipofizden **oksitosin** salgılanır, rahim kasılır. Doğumdan sonra **prolaktin** süt üretimini sağlar, oksitosin sütün salınımını sağlar.

## 7. İkizlik

- **Tek yumurta ikizi:** Bir zigot erken evrede ikiye ayrılır. Genetik olarak **aynı**, aynı cinsiyet.
- **Çift yumurta ikizi:** İki ayrı yumurta iki ayrı sperm tarafından döllenir. Genetik olarak **kardeş benzerliğinde**, cinsiyetler farklı olabilir.

## 8. Sık yapılan hatalar

- Oogenezde dört yumurta oluştuğunu sanmak.
- Segmentasyonda hücrelerin büyüdüğünü sanmak. Hücre sayısı artar, toplam hacim değişmez.
- Anne ve bebek kanının plasentada karıştığını sanmak.
- Progesteronun yalnızca hamilelikte salgılandığını sanmak. Luteal evrede de salgılanır.
- Sinir sisteminin mezodermden geliştiğini sanmak. Ektodermdendir.

:::baglanti
Üreme, **endokrin sistemle** (FSH, LH, östrojen, progesteron, testosteron) yönetilir. **Genetikte** mayoz bölünme ve gametogenez, kalıtımın hücresel temelidir. **Hücre bölünmesi** konusundaki mitoz, embriyonik gelişimin temelidir. **Dolaşım sisteminde** plasenta, anne ve embriyo arasında madde alışverişini sağlar. **Sinir sistemi** ektodermden gelişir.
:::

## 9. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Spermatogenez | 1 hücre, 4 sperm |
| Oogenez | 1 hücre, 1 yumurta |
| Ovülasyon | LH yükselmesi |
| Sarı cisim | Progesteron, luteal evre |
| Gelişim sırası | Zigot, morula, blastula, gastrula |
| Ektoderm | Sinir sistemi ve deri |
| Plasenta | Kan karışmaz, hormon üretir |

## Mini test

:::soru{cevap="A"}
Bir primer spermatositin ve bir primer oositin mayoz bölünmeyi tamamlamasıyla sırasıyla kaç tane fonksiyonel eşey hücresi (sperm ve yumurta) oluşur?

- A) 4 sperm, 1 yumurta
- B) 1 sperm, 4 yumurta
- C) 2 sperm, 2 yumurta
- D) 4 sperm, 4 yumurta
- E) 2 sperm, 1 yumurta

---

1. Spermatogenezde mayoz sonunda dört eşit sperm oluşur.
2. Oogenezde sitoplazma eşit olmayan bölünür, bir büyük yumurta ve üç küçük kutup hücresi oluşur. Doğru cevap A.

Diğer şıklar: **B** sayılar yer değiştirmiş / **C** ve **E** mayoz sayısı ya da mayoz II atlanmış / **D** oogenezde dört yumurta oluşmaz.
:::

:::soru{cevap="C"}
Adet döngüsünde ovülasyonu (yumurtanın folikülden çıkışını) doğrudan başlatan hormon aşağıdakilerden hangisidir?

- A) FSH
- B) Östrojen
- C) LH
- D) Progesteron
- E) Prolaktin

---

1. Foliküler evrenin sonunda östrojen yükselir ve hipofizi uyarır.
2. Hipofizden LH ani yükselir (LH piki) ve ovülasyon başlar. Doğru cevap C.

Diğer şıklar: **FSH** folikülün olgunlaşmasını sağlar / **Östrojen** LH salgısını uyarır ama ovülasyonu doğrudan başlatan LH / **Progesteron** luteal evrede rahim zarını hazırlar / **Prolaktin** süt üretimini sağlar.
:::

:::soru{cevap="E"}
Aşağıdaki embriyo zarı-görev eşleştirmelerinden hangisi doğrudur?

- A) Koryon: Embriyoyu saran sıvı dolu keseyi oluşturur.
- B) Allantois: Embriyoyu saran dış zardır.
- C) Plasenta: Anne ile embriyonun kanını birbirine karıştırır.
- D) Sarı kese: Embriyoyu darbelerden korur.
- E) Amniyon: Embriyoyu sıvı içinde darbelerden korur.

---

1. Amniyon, embriyoyu çevreleyen amniyon sıvısı dolu keseyi oluşturur.
2. Bu sıvı darbeleri sönümler ve ısıyı dengeler. Doğru cevap E.

Diğer şıklar: **A** sıvı dolu kese amniyondur / **B** dış zar koryondur / **C** plasentada anne ve embriyonun kanı karışmaz / **D** sarı kese ilk kan hücrelerini yapar.
:::

:::soru{cevap="B"}
Aşağıdaki organ-embriyonik katman eşleştirmelerinden hangisi doğrudur?

- A) Kalp: Ektoderm
- B) Beyin: Ektoderm
- C) Akciğer iç yüzeyi: Mezoderm
- D) Kemik: Endoderm
- E) Karaciğer: Ektoderm

---

1. Sinir sistemi (beyin, omurilik), deri ve duyu organları ektodermden gelişir.
2. Doğru cevap B.

Diğer şıklar: **A** kalp mezodermden / **C** akciğer iç yüzeyi endodermden / **D** kemik mezodermden / **E** karaciğer endodermden gelişir.
:::

## Kendini dene

:::dene
1. Ovülasyonu hangi hormon başlatır? => LH.
2. Döllenme nerede gerçekleşir? => Fallop tüpünde.
3. Sarı cisim hangi hormonu salgılar? => Progesteron.
4. Sinir sistemi hangi embriyonik katmandan gelişir? => Ektodermden.
5. Hamilelik testi hangi hormonu arar? => HCG.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Üreme Sistemi ve Embriyonik Gelişim'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir gölde balık sayısı neden sonsuza kadar artmaz? Büyük avcılar neden az, otlar neden çoktur? Yangından sonra orman nasıl yeniden oluşur? **Ekoloji**, canlıların birbirleriyle ve çevreleriyle ilişkisini inceler. Bu konuda **ekosistem bileşenlerini**, **enerji akışını** ve **madde döngülerini**, **popülasyon büyümesini** (üstel ve lojistik), **komünite içi ilişkileri** (rekabet, avcı-av, simbiyoz) ve **ardıllığı** öğreneceksin. AYT'de enerji piramidi, popülasyon grafiği ve canlılar arası ilişkiler neredeyse her yıl vardır.

:::hedefler
1. Ekosistemin canlı ve cansız bileşenlerini sınıflandırmak.
2. Besin zinciri, ağı ve enerji piramidini yorumlamak, %10 kuralını uygulamak.
3. Karbon, azot ve fosfor döngülerini özetlemek.
4. Üstel ve lojistik popülasyon büyümesini grafikle açıklamak.
5. Türler arası ilişkileri (rekabet, avcı-av, parazitlik, mutualizm, kommensalizm) ayırt etmek.
6. Primer ve sekonder ardıllığı karşılaştırmak.
:::

:::ipucu
Enerji **tek yönlü akar** ve her basamakta yaklaşık **%90'ı kaybolur**. Madde ise **döngüsel** dolaşır. Bu fark çoğu ekoloji sorusunun cevabıdır. Basamak sayısı arttıkça enerji ve canlı kütlesi azalır, bu yüzden besin zincirleri en çok 4-5 halkalıdır.
:::

::video{id="0wEkIHO7IE8" etiket="Konu anlatımı videosu" baslik="Komünite ve Popülasyon Ekolojisi" kanal="Selin Hoca Biyoloji"}

## 1. Ekosistem

**Ekosistem**, bir bölgedeki canlıların (**biyotik**) ve cansız çevrenin (**abiyotik**: ışık, sıcaklık, su, toprak, pH) bir bütünüdür.

- **Birey** $\rightarrow$ **popülasyon** (aynı türün aynı yerdeki bireyleri) $\rightarrow$ **komünite** (aynı yerdeki tüm popülasyonlar) $\rightarrow$ **ekosistem** $\rightarrow$ **biyosfer**.
- **Yaşama alanı (habitat):** Canlının yaşadığı yer. **Niş:** Canlının ekosistemdeki rolü, yani beslenme şekli, yaşam alanı, üreme koşulları. İki tür aynı nişi uzun süre paylaşamaz.

**Besin ilişkileri:**

- **Üretici:** Fotosentez ya da kemosentezle organik madde yapar (bitki, alg, siyanobakteri).
- **Tüketici:** Otçul (1. derece), etçil (2. ve üstü), hepçil.
- **Ayrıştırıcı:** Ölü kalıntıları ayrıştırır, mineral döngüye geri verir (bakteri, mantar).

## 2. Enerji akışı ve %10 kuralı

Güneş enerjisi, üreticilerin kimyasal enerjisine dönüşür. Her basamakta enerjinin yaklaşık **%10'u** bir üst basamağa geçer, kalanı solunumla ısı olarak kaybolur ya da kullanılmaz.

**Örnek:** Üreticilerde $20\,000\ \text{kJ}$ varsa 1. derece tüketicide $2000$, 2. derecede $200$, 3. derecede $20$, 4. derecede $2\ \text{kJ}$ olur.

**Enerji piramidi** her zaman dardır (üstü küçük). **Biyokütle piramidi** ve **birey sayısı piramidi** bazı ekosistemlerde ters olabilir (bir ağaç üzerinde çok böcek).

::sim{tur="piramit"}

**Madde döngüleri:**

- **Karbon:** Fotosentez atmosferdeki $\text{CO}_2$'yi organik maddeye çevirir. Solunum, ayrışma ve yanma geri verir. Fosil yakıt yanması $\text{CO}_2$'yi artırır.
- **Azot:** Atmosferin %78'i $\text{N}_2$'dir ama canlılar doğrudan kullanamaz. **Azot bağlayıcı bakteriler** (baklagil köklerinde Rhizobium) $\text{N}_2$'yi amonyağa çevirir. **Nitrifikasyon** amonyağı nitrata çevirir, bitkiler nitratı alır. **Denitrifikasyon** nitratı yeniden $\text{N}_2$'ye çevirir.
- **Fosfor:** Atmosferde gazı yoktur. Kayalardan toprağa, bitkilere, hayvanlara, ayrışmayla toprağa döner. Gübre fazlalığı sulara geçerse **ötrofikasyon** (aşırı alg çoğalması, oksijen azalması) olur.
- **Su:** Buharlaşma, terleme, yağış, yüzey akışı.

## 3. Popülasyon ekolojisi

**Popülasyon özellikleri:** Yoğunluk (birim alandaki birey), dağılım (düzenli, rastgele, kümeli), yaş yapısı, doğum ve ölüm oranı.

**Büyüklük değişimi:** $\Delta N=(\text{doğum}+\text{göç ile giriş})-(\text{ölüm}+\text{göç ile çıkış})$

**Büyüme modelleri:**

- **Üstel (J eğrisi):** Kaynaklar sınırsızsa popülasyon hızla artar. Gerçekte kısa sürelidir.
- **Lojistik (S eğrisi):** Çevre direnci (besin, alan, hastalık, avcı) büyümeyi sınırlar. Popülasyon **taşıma kapasitesine** ($K$) yaklaştıkça büyüme yavaşlar ve **doğum hızı ile ölüm hızı eşitlenir**, büyüklük yaklaşık sabit kalır.

::sim{tur="populasyon"}

**Sınırlayıcı etkenler:** Yoğunluğa **bağlı** olanlar (rekabet, parazit, hastalık, avcı) popülasyon büyüdükçe etkisi artar. Yoğunluğa **bağlı olmayanlar** (deprem, yangın, don, kuraklık) yoğunluktan bağımsız etki eder.

## 4. Komünitede türler arası ilişkiler

| İlişki | A | B | Örnek |
| --- | --- | --- | --- |
| Rekabet | $-$ | $-$ | Aynı kaynağı kullanan iki otçul |
| Avcı-av | $+$ | $-$ | Aslan ve ceylan |
| Parazitlik | $+$ | $-$ | Kene ve köpek |
| Mutualizm | $+$ | $+$ | Baklagil ve azot bağlayıcı bakteri, liken |
| Kommensalizm | $+$ | $0$ | Remora balığı ve köpekbalığı |
| Amensalizm | $-$ | $0$ | Penisilyum küfü ve bakteriler |

**Avcı-av popülasyonları** birbirini döngüsel olarak kontrol eder: Av artınca avcı artar, avcı artınca av azalır, sonra avcı azalır.

## 5. Ardıllık

Bir bölgede komünitenin zamanla yönlü olarak değişmesidir.

- **Primer (birincil) ardıllık:** Toprağın hiç olmadığı yerde başlar (çıplak kaya, volkanik lav). **Öncü türler** (likenler, karayosunları) kayayı çözerek toprak oluşturur. Sonra ot, çalı, ağaç gelir. Çok uzun sürer.
- **Sekonder (ikincil) ardıllık:** Toprak varken komünitenin yok olmasıyla (yangın, tarla terki) başlar. Toprakta tohum ve besin olduğundan hızlıdır.
- **Klimaks komünite:** Sonunda ulaşılan dengeli, kararlı, tür çeşitliliği yüksek komünitedir.

## 6. Sık yapılan hatalar

- Enerjinin döngü yaptığını sanmak. Enerji akar, madde döner.
- %10 kuralında basamak sayısını yanlış saymak. Üretici ilk basamaktır, 1. derece tüketici ikincisidir.
- Lojistik eğrinin sonunda popülasyonun yok olduğunu sanmak. Dengeye gelir.
- Kommensalizm ile mutualizmi karıştırmak. Birinde ikinci tür etkilenmez.
- Yangın sonrası ardıllığı primer sanmak. Toprak kalmıştır, sekonderdir.

:::baglanti
Ekoloji **fotosentez ve hücresel solunumla** doğrudan ilişkilidir. Üreticiler ve ayrıştırıcılar döngülerin taşıyıcılarıdır. **Genetikte** popülasyon genetiği ve türleşme bu konuyla beraber ele alınır. **Canlılar ve Çevre** konusunda biyomlar, insan etkisi ve çevre kirliliği devam eder. **Coğrafyada** ekosistemler ve nüfus artışı aynı grafiklerle okunur. **Kimyada** azot ve karbon döngülerindeki tepkimeler geçer.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Enerji | Tek yönlü, her basamakta %10 geçer |
| Madde | Döngüsel |
| Üstel büyüme | J eğrisi, sınırsız kaynak |
| Lojistik büyüme | S eğrisi, taşıma kapasitesinde dengelenir |
| Mutualizm | $+/+$ |
| Parazitlik | $+/-$ |
| Primer ardıllık | Toprak yok, öncü türler likenler |

## Mini test

:::soru{cevap="E"}
Üreticilerin $20\,000\ \text{kJ}$ enerji içerdiği bir besin zincirinde %10 kuralına göre 4. dereceden tüketiciye kaç kJ enerji aktarılır?

- A) $20\,000$
- B) $2000$
- C) $200$
- D) $20$
- E) $2$

---

1. Üreticiden 1. derece tüketiciye, oradan 2., 3. ve 4. dereceye toplam dört aktarım olur.
2. Her aktarımda enerji $10$ kat azalır: $20\,000\rightarrow2000\rightarrow200\rightarrow20\rightarrow2$.
3. 4. derece tüketiciye $2\ \text{kJ}$ ulaşır. Doğru cevap E.

Diğer şıklar: **$20$** üç aktarım hesaplanmış / **$200$** iki aktarım / **$2000$** bir aktarım / **$20\,000$** hiç aktarım yok, üreticideki enerji.
:::

:::soru{cevap="D"}
Lojistik (S eğrili) büyüme gösteren bir popülasyon taşıma kapasitesine ulaştığında aşağıdakilerden hangisi gerçekleşir?

- A) Doğum hızı artar, ölüm hızı azalır.
- B) Büyüme hızı üstel olarak artmaya devam eder.
- C) Popülasyon büyüklüğü aniden sıfıra iner.
- D) Doğum ve ölüm hızı dengelenir, büyüklük sabitlenir.
- E) Çevre direnci ortadan kalkar.

---

1. Taşıma kapasitesinde besin, alan gibi etkenler büyümeyi sınırlar (çevre direnci).
2. Doğum hızı ile ölüm hızı eşitlenir ve büyüklük yaklaşık sabit kalır. Doğru cevap D.

Diğer şıklar: **A** ve **B** büyümenin hızlandığı durumlar, kapasiteye ulaşınca olmaz / **C** popülasyon yok olmaz / **E** çevre direnci artar.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi mutualizm (karşılıklı yarar) örneğidir?

- A) Baklagil kökü ve azot bağlayan bakteri
- B) Kene ve köpek
- C) Aslan ve ceylan
- D) Köpekbalığı ve ona yapışan remora balığı
- E) Penisilyum küfü ve bakteriler

---

1. Mutualizmde iki tür de yarar sağlar.
2. Bakteri baklagilden besin ve yaşam yeri alır, baklagil de bakterinin bağladığı azotu kullanır. Doğru cevap A.

Diğer şıklar: **B** parazitlik / **C** avcı-av ilişkisi / **D** kommensalizm, yalnızca remora yarar sağlar / **E** amensalizm, küf bakterileri öldürür.
:::

:::soru{cevap="D"}
Birincil (primer) ardıllıkla ilgili aşağıdakilerden hangisi doğrudur?

- A) Toprak vardır ve hızla bitkilenir.
- B) İlk yerleşen türler büyük ağaçlardır.
- C) Klimaks komünitede tür çeşitliliği en azdır.
- D) Çıplak kayada likenler ve karayosunları öncü türlerdir.
- E) Yangından sonra kendiliğinden başlar.

---

1. Primer ardıllık toprağın bulunmadığı yerlerde başlar (volkanik lav, çıplak kaya).
2. İlk yerleşenler likenler ve karayosunlarıdır, kayayı çözerek toprak oluşturur. Doğru cevap D.

Diğer şıklar: **A** ve **E** toprak bulunan yerde başlayan sekonder ardıllık / **B** büyük ağaçlar son aşamada gelir / **C** klimaks komünite en kararlı ve çeşitli aşamadır.
:::

## Kendini dene

:::dene
1. %10 kuralında her basamakta enerji ne kadar aktarılır? => Yaklaşık %10'u.
2. Enerji mi madde mi döngüseldir? => Madde.
3. Lojistik büyümede popülasyon nerede dengelenir? => Taşıma kapasitesinde.
4. Remora balığı ve köpekbalığı hangi ilişkidir? => Kommensalizm.
5. Yangından sonra başlayan ardıllık hangisidir? => Sekonder ardıllık.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, true from public.topics where subject_id = 'ayt-bio' and name = 'Komünite ve Popülasyon Ekolojisi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Aynı ailede olan iki kişi neden birbirine benzer? Bir hücre bölünürken $2$ metre uzunluğundaki DNA nasıl hatasız kopyalanır? Genetik bilgi, neden dört harfle yazılır ve proteine nasıl çevrilir? **Nükleik asitler** (DNA ve RNA) hücrenin yönetim bilgisini taşır. Bu konuda **DNA'nın yapısını**, **RNA türlerini**, **DNA'nın eşlenmesini** (replikasyon), **genetik şifreyi** ve **mutasyonları** öğreneceksin. AYT'de Chargaff kuralı, replikasyon enzimleri ve kodon çözme soruları her yıl çıkar.

:::hedefler
1. Nükleotitin bileşenlerini ve DNA ile RNA farklarını sıralamak.
2. Chargaff kuralını kullanarak baz yüzdelerini hesaplamak.
3. DNA replikasyonunu yarı korunumlu modelle ve enzimleriyle anlatmak.
4. mRNA, tRNA ve rRNA'nın görevlerini ayırt etmek.
5. Genetik şifrenin özelliklerini sıralamak ve kodon tablosunu kullanmak.
6. Mutasyon türlerini sonuçlarıyla eşleştirmek.
:::

:::ipucu
DNA baz eşleşmesi **sabittir**: A=T (**2** hidrojen bağı), G≡C (**3** hidrojen bağı). RNA'da timin yerine **urasil** vardır, yani A=U. Çift zincirli DNA'da **A=T ve G=C**, bu yüzden $A+G=T+C=\%50$. Bir baz yüzdesi verilirse hepsini bulursun.
:::

::video{id="6VuqedeRoOg" etiket="Konu anlatımı videosu" baslik="Nükleik Asitler ve Replikasyon" kanal="Biosem Biyoloji"}

## 1. Nükleotit ve DNA

**Nükleotit**, nükleik asitlerin yapı taşıdır ve üç parçadan oluşur: **fosfat**, **pentoz şeker** (DNA'da deoksiriboz, RNA'da riboz) ve **azotlu organik baz**. Bazlar: **A** (adenin), **G** (guanin) **purin**, **C** (sitozin), **T** (timin) ve **U** (urasil) **pirimidindir**.

**DNA'nın yapısı (Watson-Crick modeli):**

- İki zincir **sağa dönüşlü çift sarmal** oluşturur.
- Zincirler **antiparaleldir**: Biri $5'\rightarrow3'$, öteki $3'\rightarrow5'$ yönündedir.
- Bazlar **hidrojen bağlarıyla** eşleşir: $\text{A}=\text{T}$ ve $\text{G}\equiv\text{C}$.
- Nükleotitler **fosfodiester bağıyla** bağlanır (bir nükleotidin şekeri ile diğerinin fosfatı arasında).
- Şeker-fosfat omurgası dışta, bazlar içtedir.

**Chargaff kuralı:** Çift zincirli DNA'da $A=T$, $G=C$. Bir DNA'da $\%20$ guanin varsa sitozin de $\%20$'dir. Kalan $\%60$ adenin ve timin arasında eşit bölünür: A $=\%30$, T $=\%30$.

**Örnek:** $\text{G}\equiv\text{C}$ oranı fazla olan DNA daha kararlıdır (üç bağ), erimesi için daha yüksek sıcaklık gerekir.

**Hücrede bulunuşu:** Ökaryotta DNA çekirdekte (histonlarla sarılı kromozom), mitokondri ve kloroplastta ayrıca dairesel DNA vardır. Prokaryotta halkasal tek kromozom sitoplazmada bulunur.

## 2. RNA türleri

RNA **tek zincirlidir**, **riboz** ve **urasil** içerir.

| RNA | Görev |
| --- | --- |
| **mRNA** (haberci) | DNA'daki bilgiyi ribozoma taşır, protein sentezinin şablonudur |
| **tRNA** (taşıyıcı) | Antikodonu ile mRNA kodonunu tanır, amino asit getirir |
| **rRNA** (ribozomal) | Ribozomun yapısını kurar ve peptit bağının oluşumunu katalizler |

## 3. DNA replikasyonu (eşlenme)

Hücre bölünmesinden önce S evresinde DNA kendini eşler. Model **yarı korunumludur**: Her yeni DNA'da bir eski, bir yeni zincir bulunur.

**Basamaklar ve enzimler:**

1. **Helikaz** çift sarmalı açar (hidrojen bağlarını kırar) ve **replikasyon çatalı** oluşur.
2. **Primaz** kısa bir **RNA primer** yapar.
3. **DNA polimeraz** primerin $3'$ ucuna **yeni nükleotitler ekler**, yalnızca $5'\rightarrow3'$ yönünde sentezler.
4. **Lider (öncü) zincir** kesintisiz, **geciken zincir** kesikli parçalarla (**Okazaki parçaları**) sentezlenir.
5. **DNA ligaz** parçaları birleştirir.

Replikasyon **birden çok noktadan** başlar (ökaryotta), iki yönlüdür. DNA polimeraz hatayı kendisi **düzeltir** (okuma-düzeltme). Eşlenme sonucu aynı bilgiyi taşıyan iki DNA oluşur.

## 4. Genetik şifre

DNA'daki baz dizisi proteinin amino asit dizisini belirler. **Gen**, bir proteini ya da RNA'yı kodlayan DNA parçasıdır. mRNA'da **üç baz bir amino asidi** belirler, buna **kodon** denir.

**Genetik şifrenin özellikleri:**

- **Üçlüdür:** $4^3=64$ kodon vardır. $61$ kodon amino asit, $3$ kodon (UAA, UAG, UGA) **dur (stop)** anlamındadır.
- **Başlangıç kodonu AUG** (metiyonin).
- **Dejeneredir (yedekli):** Bir amino asit birden çok kodonla şifrelenebilir (20 amino asit, 61 kodon).
- **Özgüldür:** Bir kodon yalnızca bir amino asidi belirler.
- **Üst üste binmez, virgülsüzdür:** Okuma kesintisiz üçlüler hâlindedir.
- **Evrenseldir:** Neredeyse tüm canlılarda aynıdır.

**Örnek:** DNA kalıp zinciri $3'$-TAC GCT AAT-$5'$ ise mRNA $5'$-AUG CGA UUA-$3'$ olur ve amino asit sayısı $3$'tür.

## 5. Mutasyon

DNA dizisinde kalıcı değişikliktir. Nedenleri: UV, radyasyon, kimyasallar, replikasyon hatası.

| Tür | Etki | Sonuç |
| --- | --- | --- |
| **Sessiz** | Yeni kodon aynı amino asidi verir | Protein değişmez |
| **Yanlış anlamlı** | Başka amino asit gelir | Protein değişir ya da işlev kaybı |
| **Anlamsız (nonsense)** | Kodon stop kodona dönüşür | Protein erken kesilir |
| **Çerçeve kayması** | Baz eklenmesi ya da silinmesi (3'ün katı değil) | Sonraki tüm kodonlar değişir |

Mutasyon, **eşey hücrelerinde** olursa kalıtılır, **vücut hücrelerinde** olursa bireyle sınırlıdır. Mutasyonlar evrimin ham maddesidir (çeşitlilik kaynağı), ama çoğu zararlıdır.

## 6. Sık yapılan hatalar

- RNA'da timin olduğunu sanmak. RNA'da urasil bulunur.
- mRNA'yı DNA'nın kalıp zinciriyle aynı yazmak. mRNA kalıba tamamlayıcıdır.
- Stop kodonlara amino asit saymak.
- Eşleşmede $\text{A}\equiv\text{T}$ ve $\text{G}=\text{C}$ yazmak. A=T iki, G≡C üç bağdır.
- Polimeraz yönünü $3'\rightarrow5'$ sanmak. Yeni zincir $5'\rightarrow3'$ uzar.

:::baglanti
Nükleik asitler, **protein sentezinin** ilk basamağıdır, DNA'daki bilgi mRNA'ya, sonra proteine çevrilir. **Hücre bölünmesinde** replikasyon S evresinde gerçekleşir. **Genetikte** gen ve alel, mutasyonun kalıtıma etkisiyle bağlanır. **Kimyada** hidrojen bağı ve fosfat bağları bu moleküllerin yapısal temelidir. **Evrim** konusunda mutasyon çeşitliliğin kaynağıdır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| DNA | Çift zincir, A=T, G≡C, antiparalel |
| RNA | Tek zincir, riboz, urasil |
| Chargaff | A=T, G=C, A+G=%50 |
| Replikasyon | Yarı korunumlu, $5'\rightarrow3'$ |
| Helikaz / polimeraz / ligaz | Açar / ekler / birleştirir |
| Kodon | 3 baz, 64 çeşit, AUG başlar |
| Anlamsız mutasyon | Stop kodon oluşur |

## Mini test

:::soru{cevap="E"}
Çift zincirli bir DNA molekülünde guanin oranı %20'dir. Bu DNA'da adenin ve timin bazlarının toplam oranı yüzde kaçtır?

- A) $20$
- B) $30$
- C) $40$
- D) $50$
- E) $60$

---

1. Chargaff kuralına göre $\text{G}=\text{C}$ olduğundan $\text{C}=\%20$ ve $\text{G}+\text{C}=\%40$.
2. Geriye $100-40=60$ kalır. Bu miktar $\text{A}=\text{T}=\%30$ olarak paylaşılır.
3. A ve T toplamı $\%60$. Doğru cevap E.

Diğer şıklar: **20** yalnızca guanin oranı alınmış / **30** tek bir bazın (adenin) oranı alınmış / **40** G ve C toplamı alınmış / **50** toplamın yarısı alınmış.
:::

:::soru{cevap="B"}
DNA replikasyonunda görev alan enzimlerle ilgili aşağıdaki eşleştirmelerden hangisi doğrudur?

- A) Helikaz: Okazaki parçalarını birleştirir.
- B) DNA ligaz: Okazaki parçalarını birleştirir.
- C) DNA polimeraz: Çift sarmalı açar.
- D) Primaz: Nükleotitleri $3'$ ucuna ekler.
- E) Helikaz: RNA primer oluşturur.

---

1. Geciken zincir kesikli sentezlenir. Okazaki parçalarını **DNA ligaz** birleştirir.
2. Doğru cevap B.

Diğer şıklar: **A** ve **E** helikaz sarmalı açar / **C** çift sarmalı helikaz açar, polimeraz nükleotit ekler / **D** nükleotit ekleyen polimerazdır, primaz RNA primeri yapar.
:::

:::soru{cevap="B"}
Kalıp zinciri $3'$-TAC CGA ATT-$5'$ olan bir genden sentezlenen mRNA translasyona uğradığında oluşan polipeptit kaç amino asit içerir?

- A) $1$
- B) $2$
- C) $3$
- D) $6$
- E) $9$

---

1. mRNA kalıba tamamlayıcıdır: $5'$-AUG GCU UAA-$3'$.
2. AUG metiyonini, GCU alanini verir. UAA bir dur kodonudur ve amino asit belirlemez.
3. Polipeptit $2$ amino asitten oluşur. Doğru cevap B.

Diğer şıklar: **1** yalnızca başlangıç kodonu sayılmış / **3** dur kodonu da amino asit sayılmış / **6** ilk iki kodonun baz sayısı alınmış / **9** mRNA'daki toplam baz sayısı alınmış.
:::

:::soru{cevap="E"}
Bir nokta mutasyonu sonucunda bir amino asit kodonu dur (stop) kodonuna dönüşüyorsa bu mutasyon türü aşağıdakilerden hangisidir?

- A) Sessiz mutasyon
- B) Yanlış anlamlı mutasyon
- C) Çerçeve kayması
- D) Delesyon
- E) Anlamsız (nonsense) mutasyon

---

1. Bir baz değişimi bir kodonu UAA, UAG veya UGA'ya çevirirse translasyon o noktada durur.
2. Protein erken kesilir. Bu mutasyon anlamsız (nonsense) mutasyondur. Doğru cevap E.

Diğer şıklar: **A** aynı amino asit gelir / **B** başka bir amino asit gelir / **C** baz ekleme ya da silme olur / **D** delesyon DNA parçasının kaybıdır.
:::

## Kendini dene

:::dene
1. RNA'da timin yerine hangi baz bulunur? => Urasil.
2. A=T arasında kaç hidrojen bağı vardır? => İki.
3. Okazaki parçalarını hangi enzim birleştirir? => DNA ligaz.
4. Başlangıç kodonu hangisidir? => AUG.
5. Dur kodonuna dönüşen mutasyon hangisidir? => Anlamsız (nonsense) mutasyon.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Nükleik Asitler ve Genetik Şifre'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Vücudundaki yaklaşık $20\,000$ gen, hücrelerinin hepsinde aynıdır. Ama kas hücresi ile sinir hücresi neden bu kadar farklıdır? Çünkü her hücre, hangi geni **protein olarak ifade edeceğine** karar verir. Bu konuda **transkripsiyonu** (DNA'dan mRNA'ya), **ökaryotta mRNA işlenmesini**, **translasyonu** (mRNA'dan proteine), **ribozomun çalışmasını**, **protein yapılarını** ve **gen ifadesinin düzenlenmesini** öğreneceksin. AYT'de mRNA ve tRNA eşleştirme, nükleotit ve amino asit sayısı hesapları çıkar.

:::hedefler
1. Transkripsiyon basamaklarını anlatmak ve verilen DNA'dan mRNA yazmak.
2. Ökaryotta intron çıkarma ve olgun mRNA'yı açıklamak.
3. Translasyonun başlama, uzama ve sonlanma evrelerini sıralamak.
4. tRNA'nın yapısını ve antikodon-kodon eşleşmesini yorumlamak.
5. Gen, mRNA nükleotit sayısı ve amino asit sayısı arasındaki ilişkiyi hesaplamak.
6. Gen ifadesinin düzenlenmesini ve proteinlerin yapı düzeylerini açıklamak.
:::

:::ipucu
Merkezi dogma: **DNA $\rightarrow$ RNA $\rightarrow$ protein**. mRNA her zaman **kalıp zincirin tamamlayıcısıdır** ve U kullanır. Bir polipeptit için gereken en az mRNA nükleotit sayısı: **(amino asit sayısı + 1) $\times$ 3**, çünkü dur kodonu da vardır.
:::

::video{id="5ICVhdO0Ne8" etiket="Konu anlatımı videosu" baslik="Protein Sentezi" kanal="Selin Hoca Biyoloji"}

## 1. Transkripsiyon

DNA'daki gen bilgisinin **mRNA'ya kopyalanmasıdır**.

1. **RNA polimeraz**, genin başındaki **promotor** bölgeye bağlanır.
2. DNA çift sarmalı kısmen açılır.
3. Polimeraz **kalıp (şablon) zincirini** $3'\rightarrow5'$ okur ve tamamlayıcı RNA nükleotitlerini $5'\rightarrow3'$ yönünde ekler.
4. **Terminatör** (bitiş) dizisine ulaşınca durur, mRNA ayrılır, DNA yeniden sarılır.

**Örnek:** Kalıp zinciri $3'$-TAC GGA-$5'$ ise mRNA $5'$-AUG CCU-$3'$ olur.

**Ökaryotta mRNA işlenmesi:** İlk RNA (pre-mRNA) çekirdekte işlenir:

- **İntronlar** (protein şifrelemeyen bölgeler) kesilip atılır, **eksonlar** birleştirilir (**splicing**).
- $5'$ ucuna başlık, $3'$ ucuna **poli-A kuyruğu** eklenir (kararlılık için).
- Olgun mRNA çekirdek zarındaki gözeneklerden sitoplazmaya çıkar.

**Prokaryotta** intron yoktur, transkripsiyon ve translasyon aynı yerde (sitoplazmada) **eş zamanlı** gerçekleşebilir.

## 2. Translasyon

mRNA'daki kodonların **amino asit dizisine** çevrilmesidir. Yer **ribozomdur** (sitoplazmada serbest ya da granüllü ER üzerinde).

![Ribozomda translasyon: A, P ve E bölgeleri, tRNA ve büyüyen polipeptit](/lessons/ayt-bio/translasyon.svg "tRNA antikodonu mRNA kodonuyla eşleşir ve amino asit zincire eklenir")

**tRNA:** Yonca yaprağı biçiminde, bir ucunda **amino asit** bağlanma yeri, diğer ucunda **antikodon** (kodona tamamlayıcı üçlü) bulunur. **Amino asit-tRNA sentetaz** enzimi doğru amino asidi doğru tRNA'ya bağlar.

**Ribozom:** Büyük ve küçük alt birimden oluşur (rRNA ve protein). Üç bölgesi vardır: **A** (aminoasil, yeni tRNA girer), **P** (peptidil, büyüyen zincir), **E** (çıkış).

1. **Başlama:** Küçük alt birim mRNA'ya bağlanır, **AUG** kodonunu bulur, metiyonin taşıyan tRNA bağlanır, büyük alt birim birleşir.
2. **Uzama:** A bölgesine kodona uygun tRNA girer. **Peptit bağı** oluşur, ribozom mRNA üzerinde bir kodon kayar (**translokasyon**), tRNA E'den çıkar.
3. **Sonlanma:** Ribozom **dur kodonuna** (UAA, UAG, UGA) gelir. Hiçbir tRNA bağlanmaz, polipeptit serbest kalır, ribozom alt birimlerine ayrılır.

::sim{tur="translasyon"}

**Polizom:** Bir mRNA üzerinde birçok ribozom aynı anda çalışabilir. Bu şekilde bir mRNA'dan kısa sürede çok sayıda protein sentezlenir.

**Sayım:** $n$ amino asitli polipeptit için mRNA'da en az $(n+1)\times3$ nükleotit bulunur. Bu mRNA'yı kodlayan gende (kodlayıcı bölgede) iki zincir için $2(n+1)\times3$ nükleotit vardır. Peptit bağı sayısı $n-1$'dir, her peptit bağında bir su molekülü çıkar.

## 3. Protein yapısı

Amino asitler peptit bağıyla bağlanır.

- **Birincil yapı:** Amino asit dizisi (gen belirler).
- **İkincil yapı:** Hidrojen bağlarıyla $\alpha$ sarmal ve $\beta$ tabaka.
- **Üçüncül yapı:** R gruplarının etkileşimiyle üç boyutlu kıvrım (hidrojen, iyonik, hidrofobik, disülfit bağı).
- **Dördüncül yapı:** Birden çok polipeptidin birleşmesi (hemoglobin $4$ zincir).

Isı, aşırı pH gibi etkenler proteinin üç boyutlu yapısını bozar (**denatürasyon**), birincil yapı aynı kalır ama işlevi kaybolur. Yapı bozulunca enzim çalışmaz.

## 4. Gen ifadesinin düzenlenmesi

Her hücrede tüm genler aynıdır ama yalnızca gerekli olanlar çalışır. Bu sayede hücreler farklılaşır.

**Prokaryotta operon modeli (lac operon):** Laktoz yokken **baskılayıcı protein** operatöre bağlanır, RNA polimeraz geçemez, genler kapalıdır. Laktoz varsa baskılayıcıya bağlanır, onu operatörden uzaklaştırır ve genler **açılır**, laktozu yıkan enzimler yapılır. Böylece hücre enerjiyi boşa harcamaz.

**Ökaryotta:** Transkripsiyon faktörleri, hormonlar, çevre sinyalleri gen ifadesini ayarlar.

**Antibiyotikler:** Bazı antibiyotikler bakteri ribozomuna bağlanarak translasyonu durdurur. İnsan ribozomu farklı yapıda olduğundan insan hücresi etkilenmez.

## 5. Sık yapılan hatalar

- mRNA'yı DNA'nın aynı zinciri gibi, T ile yazmak.
- Dur kodonunu amino asit saymak. Sayıma yalnızca nükleotit hesabında katılır.
- tRNA'nın kodona bağlandığını sanmak. tRNA antikodonu, kodona tamamlayıcıdır.
- Prokaryotta intron çıkarılması beklemek.
- Denatürasyonda birincil yapının bozulduğunu sanmak. Aminoasit dizisi bozulmaz.

:::baglanti
Protein sentezi, **nükleik asitler ve genetik şifre** konusunun devamıdır. **Hücre organelleri** konusundaki ribozom, granüllü ER ve Golgi, proteinin üretim ve taşıma yolunu oluşturur. **Genetikte** gen-protein-özellik ilişkisi kalıtımı açıklar. **Kimyada** enzimin üç boyutlu yapısı, pH ve sıcaklık etkisi, denatürasyonun temelidir. **Sindirim ve hormon konularında** enzim ve hormon proteinleri burada yapılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Transkripsiyon | DNA $\rightarrow$ mRNA, RNA polimeraz |
| İntron | Atılır, ekson birleşir |
| Translasyon | mRNA $\rightarrow$ protein, ribozom |
| Antikodon | tRNA'da, kodona tamamlayıcı |
| Dur kodonu | UAA, UAG, UGA, amino asit yok |
| mRNA nükleotit | $(n+1)\times3$ |
| Polizom | Bir mRNA, çok ribozom |

## Mini test

:::soru{cevap="D"}
DNA'nın kalıp (şablon) zinciri $3'$-TAC GGA-$5'$ ise bu zincirden sentezlenen mRNA'nın kodonları aşağıdakilerden hangisidir?

- A) UAC CCU
- B) TAC GGA
- C) AUG GGA
- D) AUG CCU
- E) ATG CCT

---

1. mRNA kalıp zincirin tamamlayıcısıdır. $\text{T}\rightarrow\text{A}$, $\text{A}\rightarrow\text{U}$, $\text{C}\rightarrow\text{G}$, $\text{G}\rightarrow\text{C}$.
2. TAC $\rightarrow$ AUG, GGA $\rightarrow$ CCU. Doğru cevap D.

Diğer şıklar: **UAC CCU** ilk kodon kalıbın kendisi yazılıp T yerine U konmuş / **TAC GGA** kalıbın kendisi / **AUG GGA** ikinci kodon tamamlanmamış / **ATG CCT** RNA'da T kullanılmış.
:::

:::soru{cevap="C"}
Translasyon sırasında tRNA'nın antikodonu aşağıdakilerden hangisine tamamlayıcıdır?

- A) DNA kalıp zincirindeki üçlüye
- B) rRNA'daki bazlara
- C) mRNA'daki kodona
- D) Amino asidin R grubuna
- E) Promotor bölgeye

---

1. tRNA'nın bir ucunda antikodon bulunur.
2. Antikodon, ribozomda mRNA'nın kodonuyla baz eşleşmesi yapar ve doğru amino asidin sıraya girmesini sağlar. Doğru cevap C.

Diğer şıklar: **A** transkripsiyondaki eşleşme / **B** rRNA ribozomun yapısını kurar / **D** R grubu amino asidin yapısıyla ilgili / **E** promotor RNA polimerazın bağlandığı yerdir.
:::

:::soru{cevap="B"}
Ökaryotik bir hücrede olgun mRNA ile ilgili aşağıdakilerden hangisi doğrudur?

- A) İntronlar çıkarılmadan ribozoma gider.
- B) İntronlar çıkarılır, eksonlar birleştirilir.
- C) Translasyon çekirdek içinde başlar.
- D) mRNA'ya antikodon dizisi eklenir.
- E) Poli-A kuyruğu çıkarılarak kararlı hâle gelir.

---

1. Transkripsiyonla oluşan ilk RNA'da intronlar ve eksonlar bulunur.
2. Çekirdekte intronlar kesilip atılır, eksonlar birleştirilir. Başlık ve poli-A kuyruğu eklenir. Doğru cevap B.

Diğer şıklar: **A** prokaryotta böyle olabilir ama ökaryotta olmaz / **C** translasyon sitoplazmada ribozomlarda olur / **D** antikodon tRNA'dadır / **E** poli-A kuyruğu eklenir, çıkarılmaz.
:::

:::soru{cevap="E"}
Bir mRNA'da başlangıç kodonundan dur kodonuna kadar toplam $50$ amino asit şifrelenmiştir. Dur kodonu da dahil olmak üzere bu bölgede en az kaç nükleotit vardır?

- A) $50$
- B) $100$
- C) $150$
- D) $151$
- E) $153$

---

1. $50$ amino asit için $50$ kodon gerekir.
2. Dur kodonu da bir kodondur. Toplam kodon sayısı $51$.
3. Her kodon $3$ nükleotittir: $51\times3=153$. Doğru cevap E.

Diğer şıklar: **50** amino asit sayısı alınmış / **100** kodon başına iki nükleotit sanılmış / **150** dur kodonu hesaba katılmamış / **151** dur kodonu bir nükleotit sayılmış.
:::

## Kendini dene

:::dene
1. mRNA'da kodonlar hangi zincire tamamlayıcıdır? => DNA kalıp zincirine.
2. Dur kodonları hangileridir? => UAA, UAG, UGA.
3. Prokaryotta intron var mıdır? => Hayır.
4. $n$ amino asitli polipeptit için mRNA'da en az kaç nükleotit gerekir? => $(n+1)\times3$.
5. Ribozomun üç bölgesi hangileridir? => A, P ve E.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-bio' and name = 'Protein Sentezi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yeryüzündeki hemen hemen bütün besin ve soluduğun oksijen fotosentezin ürünüdür. Peki derin deniz tabanında, ışığın hiç ulaşmadığı yerlerde canlılar neyle beslenir? Cevap: **kemosentez**. Bu konuda **fotosentezin genel denklemini**, **klorofil ve ışık spektrumunu**, **ışığa bağımlı tepkimeleri** (tilakoit), **Calvin döngüsünü** (stroma), **fotosentez hızını etkileyen etkenleri** ve **kemosentezi** öğreneceksin. AYT'de oksijenin kaynağı, tepkime yerleri ve sınırlayıcı faktör grafikleri sorulur.

:::hedefler
1. Fotosentezin denklemini yazmak ve oksijenin kaynağını söylemek.
2. Kloroplastın yapısını ve tepkimelerin yerlerini eşleştirmek.
3. Işığa bağımlı tepkimelerin girdilerini ve ürünlerini sıralamak.
4. Calvin döngüsünü (karbon bağlama) özetlemek.
5. Fotosentez hızı grafiklerini ve sınırlayıcı faktörü yorumlamak.
6. Kemosentezi fotosentezle karşılaştırmak.
:::

:::ipucu
Fotosentezde **iki ayrı iş** vardır. **Işığa bağımlı tepkime** ışık enerjisini $\text{ATP}$ ve $\text{NADPH}$'a çevirir, suyu ayırır ve $\text{O}_2$ çıkarır. **Calvin döngüsü** bu $\text{ATP}$ ve $\text{NADPH}$ ile $\text{CO}_2$'yi şekere çevirir. Oksijen **sudan** gelir, karbon **$\text{CO}_2$'den** gelir.
:::

::video{id="HyMEolfQjds" etiket="Konu anlatımı videosu" baslik="Fotosentez ve Kemosentez" kanal="Selin Hoca Biyoloji"}

## 1. Genel bakış

$$6\text{CO}_2+12\text{H}_2\text{O}\xrightarrow{\text{ışık, klorofil}}\text{C}_6\text{H}_{12}\text{O}_6+6\text{O}_2+6\text{H}_2\text{O}$$

Fotosentez **ışık enerjisini kimyasal enerjiye** çevirir. Ürettiği glikoz bitkinin kendi solunumunda ve sentezlerinde kullanılır. Açığa çıkan $\text{O}_2$ **sudan** gelir. Bu bilgi $^{18}\text{O}$ işaretli su ile yapılan deneylerle kanıtlandı.

**Yer:** Ökaryotlarda **kloroplast** (bitki, alg). Prokaryotlarda siyanobakterilerde zar sistemleri.

**Kloroplast:** Çift zarlıdır. İç zardan sonra **stroma** (sıvı kısım, Calvin döngüsü) ve **tilakoit** zarları (yığınlar: grana) bulunur. Işığa bağımlı tepkimeler tilakoit zarında olur, klorofil bu zarlardadır. Kloroplastın kendi DNA'sı ve ribozomları vardır.

![Kloroplastın yapısı: stroma ve granum, ışığa bağımlı tepkimeler ve Calvin döngüsü](/lessons/ayt-bio/kloroplast.svg "Işığa bağımlı tepkimeler tilakoitte, Calvin döngüsü stromada gerçekleşir")

**Pigmentler:** **Klorofil a** (ana pigment), **klorofil b**, **karotenoidler** (sarı-turuncu). Klorofil **mavi-mor ve kırmızı** ışığı iyi soğurur, **yeşili yansıtır**. Bu yüzden yapraklar yeşil görünür. Fotosentez hızı mavi ve kırmızı ışıkta en yüksek, yeşilde en düşüktür.

## 2. Işığa bağımlı tepkimeler (tilakoit)

1. Işık **fotosistem II**'deki klorofili uyarır, elektronlar yüksek enerjiye çıkar.
2. **Su ayrışır** (fotoliz): $2\text{H}_2\text{O}\rightarrow4\text{H}^++4e^-+\text{O}_2$. Elektronlar klorofile geri gelir, $\text{O}_2$ dışarı verilir.
3. Elektronlar **elektron taşıma zincirinden** geçerken enerji kaybeder. Bu enerji tilakoit içine $\text{H}^+$ pompalar.
4. $\text{H}^+$ gradyanı **ATP sentaz** üzerinden akarken **ATP** yapılır (**fotofosforilasyon**, kemiozmoz).
5. **Fotosistem I** elektronları tekrar enerjilendirir, sonunda $\text{NADP}^+$ elektronları alarak **NADPH** olur.

**Girdiler:** $\text{H}_2\text{O}$, ışık, $\text{ADP}$, $\text{NADP}^+$. **Ürünler:** $\text{O}_2$, $\text{ATP}$, $\text{NADPH}$.

## 3. Calvin döngüsü (stroma)

Işık gerektirmez ama **ışığa bağımlı tepkimelerin ürünlerine** (ATP, NADPH) ihtiyaç duyar. Bu yüzden gece çalışmaz.

1. **Karbon bağlama:** $\text{CO}_2$, 5 karbonlu **RuBP**'ye **rubisko** enzimiyle bağlanır, 3 karbonlu **3-PGA** oluşur.
2. **İndirgenme:** ATP ve NADPH kullanılarak 3-PGA $\rightarrow$ **G3P** (gliseraldehit-3-fosfat) olur.
3. **Yenilenme:** G3P'nin bir kısmı ATP harcanarak RuBP'ye döner.

**Sayım:** Bir G3P için $3\ \text{CO}_2$, $9\ \text{ATP}$, $6\ \text{NADPH}$ gerekir. İki G3P birleşir glikozu oluşturur, yani bir glikoz için $6\ \text{CO}_2$, $18\ \text{ATP}$, $12\ \text{NADPH}$ harcanır.

## 4. Fotosentez hızını etkileyen etkenler

- **Işık şiddeti:** Önce hız artar, sonra doyar.
- **$\text{CO}_2$ derişimi:** Hız artar, sonra doyar.
- **Sıcaklık:** Enzimler yüzünden belirli bir optimumda en yüksektir. Çok yüksek sıcaklıkta enzimler **denatüre** olur, hız düşer.
- **Su:** Kuraklıkta stomalar kapanır, $\text{CO}_2$ girişi azalır.
- **Klorofil miktarı, ışığın dalga boyu.**

**Sınırlayıcı faktör ilkesi:** Hız, en az bulunan etkene bağlıdır. O etken artırılmadıkça diğerlerini artırmak hızı artırmaz.

::sim{tur="fotosentez"}

**Örnek:** Işık şiddeti artırılırken hız bir noktada sabit kalıyorsa ışık artık sınırlayıcı değildir. Sıcaklık ya da $\text{CO}_2$ sınırlıyordur. Bu iki etkenden birini artırınca hız yeniden yükselir.

## 5. Kemosentez

**Kemosentez**, enerjiyi **ışıktan değil**, inorganik maddelerin **yükseltgenmesinden** alarak organik madde yapmaktır. Yapan canlılara **kemosentetik** (kemoototrof) denir. Hepsi bakteridir.

| Bakteri | Yükseltgediği madde | Önem |
| --- | --- | --- |
| Nitrifikasyon bakterileri | $\text{NH}_3\rightarrow\text{NO}_2^-\rightarrow\text{NO}_3^-$ | Azot döngüsü, bitkiye nitrat |
| Kükürt bakterileri | $\text{H}_2\text{S}$ | Derin deniz bacalarında yaşam |
| Demir bakterileri | $\text{Fe}^{2+}\rightarrow\text{Fe}^{3+}$ | Demir döngüsü |

Kemosentezde **klorofil ve ışık yoktur**, $\text{O}_2$ çıkmaz (genelde). Karbon kaynağı yine $\text{CO}_2$'dir.

**Karşılaştırma:**

| | Fotosentez | Kemosentez |
| --- | --- | --- |
| Enerji kaynağı | Işık | İnorganik madde yükseltgenmesi |
| Klorofil | Var | Yok |
| Yapan | Bitki, alg, siyanobakteri | Yalnızca bakteri |
| Karbon kaynağı | $\text{CO}_2$ | $\text{CO}_2$ |
| Ürün | Glikoz, $\text{O}_2$ | Organik madde |

## 6. Sık yapılan hatalar

- Fotosentezde $\text{O}_2$'nin $\text{CO}_2$'den geldiğini sanmak. Sudan gelir.
- Calvin döngüsünün karanlıkta çalıştığını sanmak. Işıktan gelen ATP ve NADPH'a bağlıdır.
- Işık şiddeti arttıkça hızın sınırsız arttığını sanmak.
- Kemosentezde ışığın kullanıldığını sanmak.
- Fotosentezin yalnızca yeşil ışıkta en hızlı olduğunu sanmak. Yeşil yansıtılır.

:::baglanti
Fotosentez ve **hücresel solunum** birbirinin tamamlayıcısıdır. Fotosentezin ürünleri solunumun girdileridir. **Ekolojide** üreticilerin fotosentezi enerji akışını başlatır, kemosentez azot döngüsünde rol oynar. **Bitki biyolojisinde** stoma ve su taşınması fotosentezi yönetir. **Kimyada** redoks, pH gradyanı ve enzim kinetiği bu konunun temelidir. **Fizikte** ışık dalga boyu ve enerjisi soğurmayı açıklar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| $\text{O}_2$ kaynağı | Su |
| Işığa bağımlı | Tilakoit, ATP ve NADPH, $\text{O}_2$ |
| Calvin | Stroma, $\text{CO}_2$ $\rightarrow$ G3P |
| Pigment | Mavi ve kırmızıyı soğurur, yeşili yansıtır |
| Sınırlayıcı faktör | En az olan etken |
| Kemosentez | İnorganik yükseltgenme, ışık yok |
| Nitrifikasyon | $\text{NH}_3\rightarrow\text{NO}_3^-$ |

## Mini test

:::soru{cevap="C"}
Fotosentezde açığa çıkan oksijen gazı hangi maddeden gelir?

- A) $\text{CO}_2$
- B) Glikoz
- C) $\text{H}_2\text{O}$
- D) ATP
- E) NADPH

---

1. Işığa bağımlı tepkimelerde su fotolizle ayrışır: $2\text{H}_2\text{O}\rightarrow4\text{H}^++4e^-+\text{O}_2$.
2. Oksijen sudan gelir. Karbon ise $\text{CO}_2$'den glikoza geçer. Doğru cevap C.

Diğer şıklar: **$\text{CO}_2$** karbonun kaynağı / **Glikoz** fotosentezin ürünü / **ATP** ve **NADPH** ışık enerjisinin kimyasal depoları, oksijen içermez ya da oksijen vermez.
:::

:::soru{cevap="E"}
Kloroplastta ışıktan bağımsız (Calvin) tepkimeler için aşağıdakilerden hangisi doğrudur?

- A) Tilakoit zarında gerçekleşir ve $\text{O}_2$ açığa çıkar.
- B) ATP üretir ve doğrudan ışık enerjisi kullanır.
- C) Su ayrışır ve NADPH oluşur.
- D) Stromada gerçekleşir ve klorofil pigmenti gerektirir.
- E) Stromada gerçekleşir, ATP ve NADPH harcayarak $\text{CO}_2$ bağlar.

---

1. Calvin döngüsü stromada gerçekleşir.
2. Işıktan doğrudan yararlanmaz ama ışığa bağımlı tepkimelerin ürünü ATP ve NADPH'ı kullanarak $\text{CO}_2$'yi G3P'ye çevirir. Doğru cevap E.

Diğer şıklar: **A** ve **C** ışığa bağımlı tepkimelerin özelliği / **B** Calvin ATP harcar, üretmez / **D** klorofil tilakoitte işlev görür.
:::

:::soru{cevap="E"}
Bir bitkide ışık şiddeti arttırıldığında fotosentez hızı belirli bir noktadan sonra sabit kalıyor. Bu durumun nedeni aşağıdakilerden hangisi olabilir?

- A) Işık artık fotosentez için gerekli olmaz.
- B) Klorofil molekülleri tamamen yok olur.
- C) Su fotolizle tamamen bitmiş olur.
- D) Sıcaklığın fotosentez enzimlerine etkisi kalkar.
- E) CO₂ ya da sıcaklığın sınırlayıcı olması.

---

1. Hız, bulunan en kısıtlı etkene bağlıdır (sınırlayıcı faktör ilkesi).
2. Işık yeterli düzeye ulaşınca $\text{CO}_2$ derişimi ya da sıcaklık sınırlayıcı olur. Işığı artırmak hızı yükseltmez. Doğru cevap E.

Diğer şıklar: **A** ışık hâlâ gerekli, yalnızca sınırlayıcı değil / **B** klorofil yok olmaz / **C** su ayrışıp tükenmez / **D** sıcaklık her zaman enzimleri etkiler.
:::

:::soru{cevap="D"}
Kemosentez yapan bir bakteri için aşağıdakilerden hangisi doğrudur?

- A) Enerjiyi güneş ışığından alır ve klorofil kullanır.
- B) Karbondioksiti organik maddeye çeviremez.
- C) Yalnızca ışık varlığında organik madde üretir.
- D) Enerjiyi inorganik maddelerin yükseltgenmesinden alır.
- E) Fotosistem II'yi kullanarak su ayrıştırır.

---

1. Kemosentetik bakteriler $\text{NH}_3$, $\text{H}_2\text{S}$, $\text{Fe}^{2+}$ gibi inorganik maddeleri yükseltger.
2. Bu tepkimelerden açığa çıkan enerjiyi kullanarak $\text{CO}_2$'den organik madde sentezler. Doğru cevap D.

Diğer şıklar: **A** ve **C** fotosentezin özelliği / **B** $\text{CO}_2$'yi organik maddeye çevirirler / **E** fotosistem II fotosentetik canlıda bulunur.
:::

## Kendini dene

:::dene
1. Fotosentezdeki oksijen hangi maddeden gelir? => Sudan.
2. Calvin döngüsü kloroplastın neresinde gerçekleşir? => Stromada.
3. Klorofil hangi renkleri yansıtır? => Yeşil.
4. Kemosentezde enerji nereden gelir? => İnorganik maddelerin yükseltgenmesinden.
5. Sınırlayıcı faktör nedir? => Hızı kısıtlayan en az bulunan etken.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, true from public.topics where subject_id = 'ayt-bio' and name = 'Fotosentez ve Kemosentez'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yediğin ekmek ve yağ, hücrelerinde nasıl enerjiye dönüşür? Koşarken neden daha hızlı soluk alırsın? Maya neden hamuru kabartır? Hücre, besinlerdeki enerjiyi **ATP** adlı kullanılabilir enerji paraları biçimine çevirir. Bu konuda **ATP'yi**, **glikolizi**, **pirüvat oksidasyonunu**, **Krebs döngüsünü**, **elektron taşıma sistemini**, **fermantasyonu** ve **diğer besinlerin yıkımını** öğreneceksin. AYT'de her basamağın yeri ve ürünleri neredeyse her yıl sorulur.

:::hedefler
1. ATP'nin yapısını ve rolünü açıklamak.
2. Glikoliz, pirüvat oksidasyonu, Krebs ve ETS'nin yerlerini ve ürünlerini eşleştirmek.
3. Oksijenli solunumun toplam ATP verimini yorumlamak.
4. Laktik asit ve alkol fermantasyonunu karşılaştırmak.
5. Yağ ve proteinlerin solunuma nasıl katıldığını anlatmak.
6. Solunum ile fotosentezi karşılaştırmak.
:::

:::ipucu
Her basamak için üç şeyi bil: **Nerede? Ne harcar? Ne üretir?** Glikoliz sitoplazmada, geri kalanı mitokondride. CO₂ **pirüvat oksidasyonu ve Krebs'te**, su **ETS'de** çıkar. En çok ATP **elektron taşıma sisteminde** yapılır. $\text{O}_2$ yalnızca ETS'de **son elektron alıcısıdır**.
:::

::video{id="2E3XrtnO0r8" etiket="Konu anlatımı videosu" baslik="Hücresel Solunum ve Fermantasyon" kanal="Selin Hoca Biyoloji"}

## 1. ATP

**ATP (adenozin trifosfat):** Adenin, riboz ve üç fosfattan oluşur. Fosfat bağları yıkılınca enerji açığa çıkar: $\text{ATP}\rightarrow\text{ADP}+\text{P}_i+\text{enerji}$. Hücre ATP depolamaz, sürekli yeniden yapar. Kas hareketi, aktif taşıma, sentezler ATP ile çalışır.

## 2. Oksijenli hücresel solunum

$$\text{C}_6\text{H}_{12}\text{O}_6+6\text{O}_2\rightarrow6\text{CO}_2+6\text{H}_2\text{O}+\text{ATP}$$

Dört basamakta gerçekleşir:

| Basamak | Yer | Girdi | Ürün |
| --- | --- | --- | --- |
| **Glikoliz** | Sitoplazma | 1 glikoz | 2 pirüvat, net 2 ATP, 2 NADH |
| **Pirüvat oksidasyonu** | Mitokondri matriksi | 2 pirüvat | 2 asetil-KoA, 2 $\text{CO}_2$, 2 NADH |
| **Krebs döngüsü** | Matriks | 2 asetil-KoA | 4 $\text{CO}_2$, 2 ATP, 6 NADH, 2 $\text{FADH}_2$ |
| **Elektron taşıma sistemi (ETS)** | İç zar (kristalar) | NADH, $\text{FADH}_2$, $\text{O}_2$ | $\text{H}_2\text{O}$, yaklaşık 26-28 ATP |

**Glikoliz:** Glikoz önce 2 ATP harcanarak aktifleştirilir, sonra 4 ATP üretilir. Net 2 ATP. **Oksijen gerektirmez** ve tüm canlılarda ortaktır (en eski yol).

**Krebs döngüsü:** Asetil-KoA, oksaloasetatla birleşir, döngü boyunca $\text{CO}_2$ çıkar, enerji yüklü $\text{NADH}$ ve $\text{FADH}_2$ oluşur. Bir glikozdan **iki tur** döner.

**ETS ve kemiozmoz:** $\text{NADH}$ ve $\text{FADH}_2$ elektronlarını iç zardaki taşıyıcılara verir. Elektronlar zincirde ilerlerken enerji kaybeder, bu enerji matriksten zarlar arası boşluğa $\text{H}^+$ pompalar. $\text{H}^+$'lar **ATP sentaz** üzerinden matrikse geri akarken ATP yapılır. Elektronlar sonunda $\text{O}_2$'ye aktarılır, $\text{O}_2$ $\text{H}^+$ ile birleşip **su** oluşturur. $\text{O}_2$ olmazsa ETS durur.

**Toplam verim:** 1 glikozdan oksijenli solunumla yaklaşık **30-32 ATP** (eski kitaplarda 36-38). Fermantasyonla yalnızca **2 ATP**.

**Mitokondri:** Çift zarlı, dış zar düz, iç zar kıvrımlı (**kristalar**), içte **matriks**. Kendi DNA'sı ve ribozomu vardır. Çalışan hücrelerde (kas, karaciğer) çok bulunur.

## 3. Fermantasyon (oksijensiz solunum)

Oksijen yoksa pirüvat mitokondriye girmez. Glikoliz sürsün diye $\text{NADH}$, $\text{NAD}^+$'a geri yükseltgenmelidir. Bunu fermantasyon yapar. Yalnızca glikoliz ATP verir (2 ATP).

- **Laktik asit fermantasyonu:** Pirüvat $\rightarrow$ **laktik asit**. $\text{CO}_2$ çıkmaz. **Kas hücreleri**, laktik asit bakterileri (yoğurt, turşu).
- **Alkol fermantasyonu:** Pirüvat $\rightarrow$ **etanol + $\text{CO}_2$**. **Maya** (ekmek, bira, şarap). Hamurun kabarması $\text{CO}_2$ yüzündendir.

## 4. Diğer besinlerin yıkımı

- **Yağlar:** Gliserol glikolize, yağ asitleri **asetil-KoA**'ya yıkılarak Krebs'e girer. Gram başına **en çok enerji** yağdan elde edilir.
- **Proteinler:** Amino asitler **deamine** edilir (amino grubu üre olarak atılır). Kalan karbon iskeleti uygun basamakta solunuma girer. Proteinler son tercih edilen enerji kaynağıdır.
- **Önce karbonhidrat, sonra yağ, en son protein** kullanılır.

## 5. Solunum ile fotosentez

| | Fotosentez | Hücresel solunum |
| --- | --- | --- |
| Organel | Kloroplast | Mitokondri (ve sitoplazma) |
| Enerji | Işıktan kimyasala, depolar | Kimyasaldan ATP'ye, harcar |
| Girdi | $\text{CO}_2$, $\text{H}_2\text{O}$ | Glikoz, $\text{O}_2$ |
| Ürün | Glikoz, $\text{O}_2$ | $\text{CO}_2$, $\text{H}_2\text{O}$, ATP |
| Yapan | Fotosentetik canlılar | Hemen hemen tüm canlılar |

Bitkiler hem fotosentez hem solunum yapar. Gündüz fotosentez hızı solunumdan fazladır, gece yalnızca solunum olur.

## 6. Sık yapılan hatalar

- ETS'nin $\text{CO}_2$ ürettiğini sanmak. $\text{CO}_2$ pirüvat oksidasyonunda ve Krebs'te çıkar.
- Glikolizin mitokondride gerçekleştiğini sanmak. Sitoplazmada olur.
- Laktik asit fermantasyonunda $\text{CO}_2$ çıktığını sanmak.
- Oksijenin Krebs'te kullanıldığını sanmak. Yalnızca ETS'de son elektron alıcısıdır.
- Fermantasyonda ATP yapılmadığını sanmak. Glikolizden 2 ATP elde edilir.

:::baglanti
Hücresel solunum, **fotosentezle** tamamlayıcıdır. **Solunum sistemi** $\text{O}_2$ alır, $\text{CO}_2$'yi atar. **Sindirim sistemi** glikozu sağlar. **Destek ve hareket sisteminde** kas enerjisi solunum ve fermantasyonla karşılanır. **Kimyada** redoks, elektron taşıma ve pH gradyanı bu konunun temelidir. **Ekolojide** ayrıştırıcıların solunumu madde döngüsünü sürdürür.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Glikoliz | Sitoplazma, net 2 ATP |
| Pirüvat oksidasyonu | Matriks, $\text{CO}_2$ çıkar |
| Krebs | Matriks, $\text{CO}_2$, NADH, $\text{FADH}_2$ |
| ETS | İç zar, en çok ATP, $\text{O}_2$ son alıcı |
| Fermantasyon | Yalnızca 2 ATP |
| Laktik asit | $\text{CO}_2$ çıkmaz |
| Alkol | Etanol ve $\text{CO}_2$ |

## Mini test

:::soru{cevap="C"}
Bir glikoz molekülünün glikoliz sonucunda ürettiği net madde miktarları aşağıdakilerden hangisinde doğru verilmiştir?

- A) 4 ATP, 2 NADH, 2 pirüvat
- B) 2 ATP, 4 NADH, 2 pirüvat
- C) 2 ATP, 2 NADH, 2 pirüvat
- D) 2 ATP, 2 NADH, 1 pirüvat
- E) 36 ATP, 2 NADH, 2 pirüvat

---

1. Glikolizde glikoz 2 ATP harcanarak aktifleşir, sonra 4 ATP üretilir. Net kazanç 2 ATP.
2. Altı karbonlu glikoz, üç karbonlu iki pirüvata yıkılır ve iki NADH oluşur. Doğru cevap C.

Diğer şıklar: **A** brüt ATP verilmiş / **B** NADH sayısı yanlış / **D** pirüvat sayısı yanlış / **E** 36 ATP, oksijenli solunumun toplamı, glikolizin değil.
:::

:::soru{cevap="D"}
Bir glikozun oksijenli solunumla tam yıkımında Krebs döngüsünde (pirüvat oksidasyonu hariç) kaç $\text{CO}_2$ molekülü açığa çıkar?

- A) $1$
- B) $2$
- C) $3$
- D) $4$
- E) $6$

---

1. Bir glikozdan iki asetil-KoA oluşur, Krebs döngüsü iki tur döner.
2. Her turda 2 $\text{CO}_2$ çıkar. Toplam $2\times2=4$. Doğru cevap D.

Diğer şıklar: **2** tek tur hesaplanmış / **6** pirüvat oksidasyonundaki 2 $\text{CO}_2$ da eklenmiş / **1** ve **3** döngü sayısı yanlış.
:::

:::soru{cevap="A"}
Oksijenli hücresel solunumda en çok ATP aşağıdaki hangi basamak ve yerde sentezlenir?

- A) Elektron taşıma sistemi, iç zar
- B) Glikoliz, sitoplazma ortamında
- C) Krebs döngüsü, mitokondri matriksi
- D) Pirüvat oksidasyonu, dış zar
- E) Laktik asit fermantasyonu, sitoplazma

---

1. NADH ve $\text{FADH}_2$ elektronlarını iç zardaki elektron taşıma sistemine verir.
2. Oluşan $\text{H}^+$ gradyanı ATP sentaz ile yaklaşık 26-28 ATP'ye dönüşür. Bu, toplam ATP'nin büyük kısmıdır. Doğru cevap A.

Diğer şıklar: **B** net 2 ATP / **C** 2 ATP / **D** pirüvat oksidasyonunda ATP yok / **E** fermantasyon ATP sentezlemez, glikolizin devamını sağlar.
:::

:::soru{cevap="B"}
Alkol fermantasyonu sonucunda aşağıdakilerden hangileri oluşur?

- A) Laktik asit ve ATP
- B) Etanol, $\text{CO}_2$ ve ATP
- C) Etanol ve $\text{O}_2$
- D) $\text{CO}_2$ ve su
- E) Laktik asit ve $\text{CO}_2$

---

1. Maya gibi canlılarda pirüvat önce $\text{CO}_2$ çıkararak asetaldehite, sonra etanole dönüşür.
2. Glikolizden gelen az miktarda ATP de oluşur. Doğru cevap B.

Diğer şıklar: **A** ve **E** laktik asit fermantasyonu ürünleri, orada $\text{CO}_2$ çıkmaz / **C** oksijen çıkmaz / **D** oksijenli solunumun ürünleri.
:::

## Kendini dene

:::dene
1. Glikoliz hücrenin neresinde gerçekleşir? => Sitoplazmada.
2. Oksijen hangi basamakta kullanılır? => Elektron taşıma sisteminde, son elektron alıcısı olarak.
3. Laktik asit fermantasyonunda $\text{CO}_2$ çıkar mı? => Hayır.
4. Gram başına en çok enerji hangi besinden elde edilir? => Yağdan.
5. Fermantasyonda net kaç ATP elde edilir? => İki.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Hücresel Solunum'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Onlarca metre yüksekliğindeki bir ağacın tepesine su nasıl çıkar? Bir bitki neden ışığa doğru eğilir? Meyveler neden aynı anda olgunlaşır? Bitkiler hareket etmeden büyür, beslenir ve çoğalır. Bu konuda **bitki dokularını**, **kök, gövde ve yaprağın yapısını**, **su ve besin taşınmasını**, **stoma ve terlemeyi**, **bitki hormonlarını**, **hareketleri** (tropizma, nasti) ve **çiçekli bitkilerin üremesini** öğreneceksin. AYT'de ksilem-floem, stoma ve hormon eşleştirmeleri sık sorulur.

:::hedefler
1. Bitki dokularını sınıflandırmak ve görevlerini söylemek.
2. Kök, gövde ve yaprak yapılarını işlevleriyle eşleştirmek.
3. Ksilem ve floemde taşınmayı karşılaştırmak.
4. Stomanın açılıp kapanma mekanizmasını anlatmak.
5. Bitki hormonlarını etkileriyle eşleştirmek.
6. Çiçekli bitkilerde çift döllenmeyi ve tohum, meyve oluşumunu açıklamak.
:::

:::ipucu
Taşıma sorularında iki damarı karşılaştır: **Ksilem (odun borusu)** **ölü** hücrelerden oluşur, **su ve mineral** taşır, **yalnızca yukarı** doğru, **terleme çekimiyle**. **Floem (soymuk borusu)** **canlı** hücrelerden oluşur, **organik madde (şeker)** taşır, **iki yönlü**, **kaynak-havuz** basıncıyla.
:::

::video{id="7gOmT5GEQeU" etiket="Konu anlatımı videosu" baslik="Bitki Biyolojisi" kanal="Selin Hoca Biyoloji"}

## 1. Bitki dokuları

**Meristem (bölünebilen) dokular:**

- **Apikal (uç) meristem:** Kök ve gövde ucunda, boyca uzamayı sağlar.
- **Yanal meristem (kambiyum):** Gövde ve kökte kalınlaşmayı sağlar, ksilem ve floem üretir. Çift çenekli ve açık tohumlu bitkilerde bulunur. Tek çeneklilerde yoktur.

**Kalıcı dokular:**

| Doku | Görev |
| --- | --- |
| Epidermis | Koruma, kütikül ile su kaybını azaltır, stoma ve kök tüyü içerir |
| Parankima | Fotosentez (palizat, sünger), depolama |
| Kollenkima | Esnek destek (genç gövde, yaprak sapı) |
| Sklerankima | Sert destek, ölü hücrelerden oluşur (lifler, taş hücreleri) |
| Ksilem (odun borusu) | Su ve mineral taşır |
| Floem (soymuk borusu) | Organik madde taşır |

## 2. Kök, gövde, yaprak

**Kök:** Bitkiyi toprağa tutturur, su ve mineral emer, besin depolar. **Kök tüyleri** epidermisin uzantılarıdır ve emilim yüzeyini artırır. Su, **kortekste** ilerler, **endodermisteki kaspari şeridi** (mum benzeri bariyer) suyu hücre içinden geçmeye zorlar ve mineral alımını denetler. Sonra **ksileme** girer.

**Gövde:** Destek, taşıma, depolama. Çift çeneklilerde damar demetleri **halka**, tek çeneklilerde **dağınık** dizilir. Çift çenekli gövdede kambiyum yıllık halkalar oluşturur. **Yıllık halka sayısı** ağacın yaşını verir. Bahar odunu geniş ve açık renkli, yaz odunu dar ve koyudur.

**Yaprak:** Fotosentez organıdır. Üst epidermiste kütikül, altında **palizat parankiması** (sık, kloroplastça zengin), altında **sünger parankiması** (aralıklı, gaz dolaşımı), alt epidermiste çok sayıda **stoma** vardır. Damarlar (ksilem + floem) yaprağın yapısını ve taşımasını sağlar.

![Yaprağın enine kesiti: epidermis, palizat, sünger parankiması, damar ve stoma](/lessons/ayt-bio/yaprak.svg "Stomalar çoğunlukla alt epidermiste bulunur")

## 3. Madde taşınması

**Suyun taşınması (ksilem):** Kök basıncı yalnızca kısa mesafe iter. Asıl güç **terleme çekimidir**.

1. Yapraktan su buharlaşır (**terleme**), yaprak hücrelerinde su potansiyeli düşer.
2. Su molekülleri birbirine (**kohezyon**) ve ksilem çeperine (**adezyon**) tutunur.
3. Su, ksilem boyunca sürekli bir sütun hâlinde **yukarı çekilir** (kohezyon-gerilim teorisi).

Bu süreç ATP harcamaz, enerjisi güneşten gelir.

**Organik maddenin taşınması (floem):** Yaprak (**kaynak**, fotosentezle şeker üretir) ile kök, meyve, tomurcuk (**havuz**, şekeri kullanır ya da depolar) arasında **basınç akışı** ile gerçekleşir. Floem hücrelerine şeker aktif taşıma ile yüklenir, su ozmozla girer, basınç artar ve içerik havuza doğru akar. Yönü, şekere ihtiyaca göre değişebilir.

## 4. Stoma ve terleme

**Stoma**, iki **bekçi hücresi** arasındaki gözeneklerdir. Gaz alışverişi ($\text{CO}_2$ giriş, $\text{O}_2$ çıkış) ve terleme buradan olur.

- **Açılma:** Işıkta bekçi hücrelerine **K⁺** aktif olarak girer, ozmotik basınç artar, **su girer**, turgor basıncı yükselir, hücreler eğrilir ve stoma açılır.
- **Kapanma:** K⁺ ve su çıkar, turgor düşer. Su azalınca **absisik asit (ABA)** salgılanır ve stomalar kapanır.

Stoma sayısı genellikle yaprağın alt yüzeyinde fazladır, su kaybını azaltır. Terleme ısı kaybı ve su çekimi sağlar. Kuraklık bitkinin $\text{CO}_2$ alımını da kısıtlar.

## 5. Bitki hormonları

| Hormon | Etki |
| --- | --- |
| **Oksin** | Hücre uzaması, fototropizm, apikal baskınlık (tepe tomurcuğu yan tomurcukları baskılar), kök oluşumu |
| **Giberellin** | Gövde uzaması, tohum çimlenmesi, çekirdeksiz meyve |
| **Sitokinin** | Hücre bölünmesi, yan tomurcuk gelişimi, yaşlanmayı geciktirme |
| **Absisik asit** | Stoma kapatma, tohum uyku hâli, stres tepkisi |
| **Etilen** | Meyve olgunlaşması (gaz), yaprak dökülmesi |

**Hareketler:**

- **Tropizma:** Uyaranın yönüne bağlı büyüme hareketidir (fototropizm: ışığa, geotropizm: yer çekimine, hidrotropizm: suya). Gövde ışığa pozitif, kök yerçekimine pozitif tepki verir.
- **Nasti:** Uyaranın yönünden bağımsız hareket (küstüm otu yapraklarının kapanması, çiçeklerin açılıp kapanması).

## 6. Üreme

**Çiçekli bitkilerde:** Çiçek, üreme organıdır. **Erkek organ (stamen)**: anter içinde polen. **Dişi organ (pistil)**: ovaryum, vücudunda **ovül** ve tohum taslağı.

**Tozlaşma:** Polenin tepecikle buluşması (rüzgâr, böcek, su).

**Çift döllenme (yalnızca kapalı tohumlularda):**

1. Polen tüpü ovüle ulaşır, iki sperm çekirdeği boşalır.
2. **Birinci sperm** yumurta ile birleşir: **zigot ($2n$)**, embriyoyu oluşturur.
3. **İkinci sperm** iki kutup çekirdeği ile birleşir: **endosperm ($3n$)**, besin dokusu.

**Sonuç:** Ovül $\rightarrow$ **tohum**, ovaryum $\rightarrow$ **meyve**. **Çimlenme** için su, uygun sıcaklık ve oksijen gerekir.

**Çiçeksiz bitkiler:** Yosun, eğrelti sporla çoğalır. Açık tohumlular (çam) tohum yapar, ama çiçeği ve meyvesi yoktur.

## 7. Sık yapılan hatalar

- Ksilemi canlı, floemi ölü sanmak. Tersidir.
- Suyun ksilemde ATP ile pompalandığını sanmak.
- Floemde taşıma yönünün yalnızca aşağı olduğunu sanmak.
- Tek çeneklilerde kambiyum olduğunu sanmak. Yoktur.
- Endospermin $2n$ olduğunu sanmak. $3n$'dir.
- Stomanın açılmasında $\text{K}^+$'ın dışarı çıktığını sanmak.

:::baglanti
Bitki biyolojisi, **fotosentez** ve **hücresel solunum** ile iç içedir. **Ekolojide** bitkiler üretici ve madde döngüsünün parçasıdır. **Kimyada** osmoz ve su potansiyeli taşınmanın temelidir. **Genetikte** çift döllenme, $2n$ ve $3n$ hesaplarıyla sorulur. **Hormon** konusunda bitki ve hayvan hormonlarının karşılaştırması çıkar.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ksilem | Ölü, su ve mineral, yukarı, terleme çekimi |
| Floem | Canlı, şeker, iki yönlü, basınç akışı |
| Kambiyum | Kalınlaşma, tek çeneklide yok |
| Stoma açılması | K⁺ girer, su girer, turgor artar |
| Oksin | Fototropizm, apikal baskınlık |
| Etilen | Meyve olgunlaşması |
| Çift döllenme | Zigot ($2n$), endosperm ($3n$) |

## Mini test

:::soru{cevap="E"}
Bitkilerde odun borusu (ksilem) ile ilgili aşağıdakilerden hangisi doğrudur?

- A) Canlı hücrelerden oluşur ve organik madde taşır.
- B) Eşlik hücreleriyle birlikte çalışır ve şeker taşır.
- C) Yalnızca yapraktan köke doğru taşıma yapar.
- D) Kaynak-havuz arasında basınç akışıyla çalışır.
- E) Ölü hücrelerden oluşur, su ve mineral taşır.

---

1. Ksilem olgunlaşınca hücreleri ölür, içi boş borulara dönüşür.
2. Su ve mineralleri kökten yapraklara doğru taşır. Doğru cevap E.

Diğer şıklar: **A**, **B** ve **D** floemin özellikleri / **C** ksilem aşağıdan yukarıya taşır.
:::

:::soru{cevap="A"}
Tepe tomurcuğunun yan tomurcukların gelişimini baskılamasından (apikal baskınlık) sorumlu bitki hormonu hangisidir?

- A) Oksin
- B) Sitokinin
- C) Giberellin
- D) Absisik asit
- E) Etilen

---

1. Tepe tomurcuğu oksin üretir. Oksin yan tomurcukların gelişimini baskılar.
2. Tepe kesilirse oksin azalır, yan tomurcuklar gelişir. Doğru cevap A.

Diğer şıklar: **Sitokinin** yan tomurcuk gelişimini uyarır / **Giberellin** gövde uzamasını sağlar / **Absisik asit** stomaları kapatır / **Etilen** meyve olgunlaştırır.
:::

:::soru{cevap="B"}
Bir bitkide ışıkta stomaların açılması sırasında aşağıdakilerden hangisi gerçekleşir?

- A) Bekçi hücrelerinden K⁺ çıkar, su çıkar ve hücreler büzülür.
- B) Bekçi hücrelerine K⁺ girer, su girer ve turgor basıncı artar.
- C) Bekçi hücrelerinde ABA artar ve turgor basıncı düşer.
- D) Epidermis hücreleri turgorunu kaybeder ve bekçi hücreleri uzar.
- E) Bekçi hücreleri ölür ve açıklık kalıcı olur.

---

1. Işıkta bekçi hücrelerine $\text{K}^+$ aktif olarak girer ve hücrenin ozmotik basıncı artar.
2. Su ozmozla girer, turgor artar, bekçi hücreleri eğrilir ve stoma açılır. Doğru cevap B.

Diğer şıklar: **A** stomanın kapanması / **C** ABA stomayı kapatır / **D** bekçi hücrelerinin turgoru artar, epidermisinki değil / **E** bekçi hücreleri canlıdır.
:::

:::soru{cevap="B"}
Uzun boylu bir ağaçta suyun köklerden yapraklara taşınmasını sağlayan temel mekanizma aşağıdakilerden hangisidir?

- A) Yalnızca kök basıncının oluşturduğu itme kuvveti
- B) Terleme çekimi ile su moleküllerinin kohezyon ve adezyonu
- C) Floemdeki kaynak-havuz basınç akışı
- D) Ksilem hücrelerinin ATP harcayarak su pompalaması
- E) Kök tüylerinin suyu yaprağa doğru aktif taşıması

---

1. Yapraktan terleme su kaybettirir, bu bir çekim oluşturur.
2. Su molekülleri kohezyonla birbirine, adezyonla ksilem çeperine tutunur ve kesintisiz bir sütun olarak yukarı çekilir. Doğru cevap B.

Diğer şıklar: **A** kök basıncı yalnızca kısa mesafe iter / **C** floem şeker taşır / **D** ksilem ölü hücrelerden oluşur, ATP harcamaz / **E** kök tüyleri yalnızca suyu içeri alır.
:::

## Kendini dene

:::dene
1. Su ve mineralleri hangi doku taşır? => Ksilem.
2. Floemde taşıma hangi basınçla olur? => Kaynak-havuz basınç akışı.
3. Endosperm kaç $n$'dir? => $3n$.
4. Meyve olgunlaşmasını hangi hormon sağlar? => Etilen.
5. Tek çeneklilerde kalınlaşmayı sağlayan kambiyum var mıdır? => Hayır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, true from public.topics where subject_id = 'ayt-bio' and name = 'Bitki Biyolojisi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Neden çölde kaktüs, kutuplarda yosun yetişir? Bir göl neden bir anda yeşile dönüp balıkları ölür? Bazı kuşların yumurta kabukları neden kırılgan hâle gelmişti? Canlılar yaşadıkları **çevreyle** sürekli etkileşir. İnsan etkinlikleri bu dengeyi hızla bozuyor. Bu konuda **biyomları**, **sucul ekosistemleri**, **biyolojik çeşitliliği**, **insanın çevreye etkilerini** (kirlilik, ötrofikasyon, biyolojik büyütme, ormansızlaşma, küresel ısınma) ve **koruma yollarını** öğreneceksin. AYT'de biyom eşleştirmesi, ötrofikasyon ve biyolojik büyütme soruları çıkar.

:::hedefler
1. Başlıca biyomları iklim ve canlı özelliklerine göre eşleştirmek.
2. Biyolojik çeşitliliğin düzeylerini ve önemini açıklamak.
3. Hava, su ve toprak kirliliğinin canlılara etkisini yorumlamak.
4. Ötrofikasyonun basamaklarını sıralamak.
5. Biyolojik büyütmeyi (biyoakümülasyon) besin zinciriyle açıklamak.
6. Koruma ve sürdürülebilirlik yaklaşımlarını söylemek.
:::

:::ipucu
Biyom sorularında iki ipucu ara: **sıcaklık ve yağış**. Sıcaklık düşüp yağış azsa tundra, sıcaklık yüksek yağış çoksa yağmur ormanı, sıcaklık yüksek yağış çok azsa çöl. Biyolojik büyütmede ise kural: **Zehir besin zincirinde yukarı çıktıkça derişimi artar.**
:::

::video{id="woq2dsLC-Bk" etiket="Konu anlatımı videosu" baslik="Canlılar ve Çevre" kanal="Benim Hocam"}

## 1. Biyomlar

**Biyom**, iklimi ve baskın bitki örtüsüyle tanımlanan büyük kara ekosistemidir.

| Biyom | İklim | Canlılar |
| --- | --- | --- |
| **Tundra** | Çok soğuk, kısa yaz, **donmuş toprak** (permafrost) | Yosun, liken, ren geyiği, kutup tilkisi |
| **Tayga (iğne yapraklı orman)** | Uzun soğuk kış | Çam, ladin, kurt, ayı |
| **Ilıman yaprak döken orman** | Dört mevsim | Meşe, kayın, geyik |
| **Bozkır (step)** | Yağış az, kurak | Otlar, kemirgenler |
| **Savan** | Sıcak, yağış mevsimlik | Uzun otlar, zürafa, aslan |
| **Çöl** | Çok az yağış | Kaktüs, deve, kertenkele |
| **Tropikal yağmur ormanı** | Sıcak, çok yağışlı | En yüksek tür çeşitliliği |

**Sucul ekosistemler:** **Tatlı su** (göl, nehir, gölet) ve **tuzlu su** (okyanus, deniz, haliç). Okyanuslar yüzeyin büyük bölümünü kaplar ve oksijenin önemli kısmını üretir (plankton).

## 2. Biyolojik çeşitlilik

- **Genetik çeşitlilik:** Bir tür içindeki gen farklılıkları.
- **Tür çeşitliliği:** Bir bölgedeki tür sayısı.
- **Ekosistem çeşitliliği:** Farklı yaşam ortamlarının çokluğu.

Çeşitlilik ekosistemi **kararlı** ve hastalık, iklim değişimine **dirençli** yapar. Besin, ilaç, hammadde ve oksijen kaynağıdır. Ülkemiz üç biyocoğrafi bölgeden ve birçok **endemik** türden (yalnızca belirli bir bölgede yaşayan) oluşan zengin bir çeşitliliğe sahiptir.

**Çeşitliliği azaltan etkenler:** Yaşam alanlarının yok edilmesi ve parçalanması, **yabancı (istilacı) türler**, aşırı avlanma, kirlilik, iklim değişikliği.

## 3. İnsanın çevreye etkileri

**Hava kirliliği:** $\text{SO}_2$, $\text{NO}_x$, $\text{CO}$, partikül madde. **Asit yağmuru**, solunum hastalıkları, **ozon incelmesi** (CFC) ve **küresel ısınma** ($\text{CO}_2$, $\text{CH}_4$ artışı).

**Su kirliliği:** Evsel atıklar, tarım ilaçları, sanayi atıkları, petrol sızıntıları.

**Ötrofikasyon:**

1. Göle gübre, deterjan ya da kanalizasyondan fazla **azot ve fosfor** girer.
2. **Algler** aşırı çoğalır (su yüzeyi yeşile döner).
3. Algler ışığı engeller, alttakiler ölür.
4. Ölü algları **ayrıştırıcılar** çözerken sudaki **oksijeni tüketir**.
5. Oksijensizlikten balıklar ve diğer canlılar **ölür**.

**Toprak kirliliği:** Pestisit, ağır metaller, plastik. Tuzlanma ve erozyon verimi azaltır.

**Çölleşme ve ormansızlaşma:** Ormanların yok edilmesi $\text{CO}_2$ emilimini azaltır, toprak kaybına ve biyoçeşitlilik kaybına yol açar.

**Biyolojik büyütme (biyoakümülasyon):** Yavaş parçalanan zehirli maddeler (**DDT**, cıva, ağır metaller) canlı vücudunda birikir. **Besin zincirinde yukarı çıktıkça derişimi artar**. Çünkü her avcı çok sayıda avı yer.

**Örnek:** Plankton $\rightarrow$ küçük balık $\rightarrow$ büyük balık $\rightarrow$ balıkçıl kuşu zincirinde DDT en çok balıkçıl kuşunda bulunur. DDT, kuşlarda yumurta kabuğunu inceltmiş, popülasyonları azaltmıştır.

**Küresel iklim değişikliği:** Sera gazlarının artışı ortalama sıcaklığı yükseltir. Buzullar erir, deniz seviyesi yükselir, ekosistemler ve mevsim ritimleri bozulur, türler yer değiştirir ya da yok olur.

## 4. Koruma ve sürdürülebilirlik

- **Koruma alanları:** Milli parklar, doğal sit alanları, ramsar alanları (sulak alanlar).
- **Gen bankaları, tohum bankaları** ve botanik bahçeleri.
- **Yenilenebilir enerji**, enerji verimliliği.
- **Geri dönüşüm, atık azaltma, kompost.**
- **Entegre zararlı yönetimi, organik tarım.**
- **Bilinçli tüketim, çevre eğitimi.**
- **Sürdürülebilir kalkınma:** Bugünün ihtiyaçlarını, gelecek nesillerin ihtiyaçlarını tehlikeye atmadan karşılamak.

**Nesli tükenmekte olan türler** (örneğin Akdeniz foku, Anadolu parsı) özel koruma programlarıyla izlenir.

## 5. Sık yapılan hatalar

- Tundrada ağaç yetiştiğini sanmak. Orada permafrost vardır, bitki örtüsü liken ve yosundur.
- Ötrofikasyonda göldeki oksijenin arttığını sanmak. Ayrışma oksijeni tüketir.
- Biyolojik büyütmeyi besin zincirinde aşağı doğru sanmak. Zehir yukarıda artar.
- Küresel ısınma ile ozon incelmesini aynı sanmak. Sera gazları ısınmaya, CFC'ler ozon incelmesine yol açar.
- Biyolojik çeşitliliğin yalnızca tür sayısı olduğunu sanmak. Gen ve ekosistem çeşitliliği de vardır.

:::baglanti
Canlılar ve çevre konusu, **ekolojinin** bütünüdür. **Fotosentez ve hücresel solunum** karbon döngüsünü ve atmosfer bileşimini belirler. **Kimya** dersindeki sera etkisi, asit yağmuru ve ozon incelmesi aynı konunun kimyasını anlatır. **Coğrafyada** iklim, biyom dağılımı ve çevre sorunları ele alınır. **Genetikte** gen çeşitliliği türün çevreye uyumunu belirler.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Tundra | Permafrost, liken ve yosun |
| Yağmur ormanı | En yüksek çeşitlilik |
| Ötrofikasyon | Alg artar, oksijen azalır, canlı ölür |
| Biyolojik büyütme | Zehir zincirde yukarı artar |
| Biyoçeşitlilik | Gen, tür, ekosistem |
| Sera gazları | $\text{CO}_2$, $\text{CH}_4$ |
| Sürdürülebilirlik | Kaynakları gelecek için korumak |

## Mini test

:::soru{cevap="A"}
Plankton, küçük balık, büyük balık ve balıkçıl kuşundan oluşan bir besin zincirinde bir sudaki DDT kirliliği izleniyor. DDT'nin vücuttaki derişimi hangi canlıda en yüksek olur?

- A) Balıkçıl kuşu
- B) Plankton
- C) Küçük balık
- D) Büyük balık
- E) Suyun kendisi

---

1. DDT yavaş parçalanır ve canlıların vücudunda birikir.
2. Besin zincirinde yukarı çıkıldıkça her avcı çok sayıda av tükettiğinden derişim artar (biyolojik büyütme).
3. En üst basamaktaki balıkçıl kuşunda derişim en yüksektir. Doğru cevap A.

Diğer şıklar: **Plankton**, **Küçük balık** ve **Büyük balık** alt ve orta basamaktadır, derişim daha düşüktür / **Suyun kendisi** çok seyreltik.
:::

:::soru{cevap="C"}
Bir göle tarım alanlarından fazla gübre karışması sonucunda aşağıdaki olaylar hangi sırayla gerçekleşir?

- A) Algler çoğalır, oksijen miktarı artar, balıklar çoğalır.
- B) Oksijen azalır, algler çoğalır, balıklar ölür.
- C) Algler çoğalır, ayrışma oksijeni tüketir, balıklar ölür.
- D) Balıklar ölür, oksijen azalır, algler çoğalır.
- E) Algler azalır, oksijen miktarı artar, balıklar çoğalır.

---

1. Azot ve fosfor fazlalığı alglerin aşırı çoğalmasına yol açar.
2. Ölen algları ayrıştırıcılar çözerken sudaki oksijeni tüketir.
3. Oksijensizlikten balıklar ölür. Bu süreç ötrofikasyondur. Doğru cevap C.

Diğer şıklar: **A** ve **E** oksijenin artması yanlış / **B** ve **D** sıra yanlış, alg çoğalması başlangıçtır.
:::

:::soru{cevap="C"}
Yıl boyunca çok soğuk, yaz mevsimi çok kısa olan ve toprağı sürekli donmuş (permafrost) olan bir bölgenin bitki örtüsünü yosun ve likenler oluşturuyorsa bu bölge aşağıdaki biyomlardan hangisidir?

- A) Tayga
- B) Savan
- C) Tundra
- D) Çöl
- E) Tropikal yağmur ormanı

---

1. Sürekli donmuş toprak (permafrost), çok kısa yaz ve yosun-liken örtüsü tundranın özelliğidir.
2. Doğru cevap C.

Diğer şıklar: **Tayga** iğne yapraklı ormanlarla kaplıdır / **Savan** sıcaktır / **Çöl** kurak ve genellikle sıcaktır / **Tropikal yağmur ormanı** sıcak ve çok yağışlıdır.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi biyolojik çeşitliliği azaltan etkenlerden biri **değildir**?

- A) Koruma alanlarının oluşturulması
- B) Yaşam alanlarının parçalanması
- C) Yabancı türlerin ekosisteme girmesi
- D) Aşırı avlanma ve toplama
- E) Kirliliğin artması

---

1. Koruma alanları (milli park, ramsar alanı) türlerin ve yaşam alanlarının korunmasını sağlar, çeşitliliği artırır ya da korur.
2. Diğer seçeneklerin hepsi tür kaybına yol açar. Doğru cevap A.

Diğer şıklar: **B** yaşam alanı kaybı en büyük tehdit / **C** istilacı türler yerli türleri bastırır / **D** aşırı avlanma popülasyonları azaltır / **E** kirlilik canlıları öldürür ya da üremesini engeller.
:::

## Kendini dene

:::dene
1. Permafrost hangi biyomda bulunur? => Tundrada.
2. Ötrofikasyonda göldeki oksijene ne olur? => Azalır.
3. Zehirli madde besin zincirinde nerede en yüksek derişimdedir? => En üst basamakta.
4. Biyolojik çeşitliliğin düzeyleri nelerdir? => Gen, tür ve ekosistem çeşitliliği.
5. Sürdürülebilir kalkınma ne demektir? => Kaynakları gelecek nesilleri düşünerek kullanmak.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, true from public.topics where subject_id = 'ayt-bio' and name = 'Canlılar ve Çevre'
on conflict (topic_id) do nothing;

