-- TYT Kimya konu anlatımları (a). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sabah içtiğin süt, giydiğin kumaş, kullandığın sabun, yediğin ekmeğin pişmesi: Hepsi kimyadır. **Kimya**, maddenin yapısını, özelliklerini, birbirine dönüşmesini ve bu dönüşümlerdeki enerji değişimlerini inceleyen bilimdir. Bu konu, kimya dersinin dilini ve laboratuvar kurallarını öğretir. Bu konuda kimyanın alt dallarını, madde sınıflandırmasını, fiziksel ve kimyasal değişimi, element sembollerini ve laboratuvar güvenliğini öğreneceksin.

:::hedefler
1. Kimyanın tanımını ve alt dallarını bilmek.
2. Maddeyi element, bileşik ve karışım olarak sınıflandırmak.
3. Fiziksel ve kimyasal değişimi ayırt etmek.
4. Sık kullanılan element sembollerini bilmek.
5. Laboratuvar güvenliği ve tehlike işaretlerini tanımak.
:::

:::ipucu
Fiziksel ve kimyasal değişimi ayırmak için **“Yeni bir madde oluştu mu?”** diye sor. Oluştuysa kimyasal, oluşmadıysa fiziksel değişimdir. Madde yalnızca hâl, biçim ya da boyut değiştiriyorsa kimliği aynı kalır, değişim fizikseldir.
:::

## 1. Kimya ve alt dalları

| Alt dal | İncelediği konu |
| --- | --- |
| Organik kimya | Karbon bileşikleri (plastik, ilaç, yakıt) |
| Anorganik kimya | Karbon dışındaki bileşikler (tuz, metal, mineral) |
| Analitik kimya | Maddenin neyden ve ne kadar oluştuğu |
| Fizikokimya | Kimyasal olayların fiziksel yasalarla incelenmesi |
| Biyokimya | Canlılardaki kimyasal olaylar |
| Endüstriyel kimya | Kimyasal maddelerin sanayide üretimi |

Kimya, **tıp, tarım, enerji, gıda, tekstil, çevre** gibi hemen her alanda kullanılır.

## 2. Maddenin sınıflandırılması

![Madde saf madde ve karışım olarak ikiye ayrılır. Saf madde element ve bileşik, karışım homojen ve heterojen olur](/lessons/tyt-kim/madde-siniflandirma.svg "Maddenin sınıflandırılması | Yolumnet")

**Element:** Tek tür atomdan oluşan saf maddedir. Kimyasal yollarla daha basit maddelere ayrılamaz. Demir (Fe), oksijen ($\text{O}_2$), altın (Au).

**Bileşik:** İki ya da daha fazla elementin **sabit oranda** kimyasal olarak birleşmesiyle oluşan saf maddedir. Su ($\text{H}_2\text{O}$), sofra tuzu (NaCl), karbon dioksit ($\text{CO}_2$). Bileşikler kimyasal yollarla elementlerine ayrılır.

**Karışım:** Birden fazla saf maddenin **kimyasal olarak birleşmeden** karışmasıdır. Karışımı oluşturan maddeler özelliklerini korur. Oranı değişebilir, fiziksel yollarla ayrılabilir.

- **Homojen karışım (çözelti):** Her yerinde aynı görünüm ve özellik. Tuzlu su, hava, çay (şekerli).
- **Heterojen karışım:** Bileşenleri ayrı ayrı görülebilir. Salata, çamurlu su, kum-su.

| Özellik | Saf madde | Karışım |
| --- | --- | --- |
| Erime-kaynama noktası | Sabit | Değişken |
| Bileşimi | Sabit | Değişken |
| Ayrılması | Kimyasal yolla (bileşik) | Fiziksel yolla |

## 3. Fiziksel ve kimyasal değişim

**Fiziksel değişim:** Maddenin **kimliği değişmeden** hâlinin, biçiminin, boyutunun değiştiği olaylardır. Yeni madde oluşmaz. Erime, donma, buharlaşma, yoğuşma, çözünme, kırılma, bükülme, ezme, tel haline getirme.

**Kimyasal değişim:** Maddenin kimliğinin değiştiği, **yeni maddelerin oluştuğu** olaylardır. Yanma, paslanma, çürüme, mayalanma, süt ekşimesi, fotosentez, ekmek pişmesi, yumurta pişmesi.

**Kimyasal değişimin belirtileri:** Renk değişimi, gaz çıkışı, çökelek oluşumu, ısı ya da ışık yayılması, koku değişimi. Bu belirtiler her zaman kimyasal değişim kanıtı olmayabilir, esas ölçüt **yeni madde oluşumudur**.

**Örnek.** Buzun erimesi (fiziksel, hâl değişimi). Şekerin suda çözünmesi (fiziksel, şeker hâlâ şekerdir). Odunun yanması (kimyasal, kül ve gazlar oluşur). Demirin paslanması (kimyasal, yeni madde olan pas oluşur).

## 4. Element sembolleri

Elementler **bir ya da iki harfle** gösterilir: İlk harf büyük, ikinci harf küçüktür.

| Element | Sembol | Element | Sembol |
| --- | --- | --- | --- |
| Hidrojen | H | Demir | Fe |
| Karbon | C | Bakır | Cu |
| Azot | N | Sodyum | Na |
| Oksijen | O | Potasyum | K |
| Kükürt | S | Altın | Au |
| Klor | Cl | Gümüş | Ag |
| Kalsiyum | Ca | Kurşun | Pb |
| Magnezyum | Mg | Cıva | Hg |

**Formül:** Bir bileşiğin hangi elementten kaç atom içerdiğini gösterir. $\text{H}_2\text{O}$: 2 hidrojen, 1 oksijen. $\text{CO}_2$: 1 karbon, 2 oksijen.

## 5. Laboratuvar güvenliği

- Laboratuvarda **önlük, gözlük, eldiven** kullan.
- **Yemek yeme ve içme**. Kimyasalları tatma, koklama.
- Maddeleri **etiketine bakmadan** kullanma.
- Asit seyreltirken **asidi suya yavaşça ve karıştırarak** ekle, suyu asidin üzerine dökme.
- Isıtılan tüpün ağzını kendine ya da başkasına **doğrultma**.
- Kimyasal atıkları **lavaboya dökme**, ayrı kaplara topla.
- Yangın ve kaza durumunda hemen **öğretmenine haber ver**.

**Tehlike sembolleri:** Yanıcı, patlayıcı, aşındırıcı (korozif), zehirli, oksitleyici, çevreye zararlı maddeler için ayrı uyarı işaretleri vardır.

:::neden-sonuc
- Yeni madde oluşuyor => Kimyasal değişim.
- Yalnızca hâl ya da biçim değişiyor => Fiziksel değişim.
- Tek tür atom içeriyor => Element.
- Farklı atomlar sabit oranda birleşmiş => Bileşik.
- Maddeler özelliklerini koruyarak karışmış => Karışım.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Çözünmeyi kimyasal değişim sanmak** sık yapılan bir hatadır. Şeker suda çözününce yeni bir madde oluşmaz, şeker hâlâ şekerdir, bu bir fiziksel değişimdir. Bir de **karışım ile bileşiği karıştırırsın**: Tuzlu su bir karışımdır, bileşenlerinin oranı değişebilir. Sofra tuzu (NaCl) ise bir bileşiktir. Bileşikte oranlar sabittir.
:::

:::baglanti
Bu konudaki element, bileşik ve karışım ayrımı, “Atom ve Periyodik Sistem”, “Karışımlar” ve “Kimyasal Tepkimeler” konularında sürekli kullanılır. Fiziksel değişim, fizikteki “Isı ve Sıcaklık” konusunda hâl değişimleriyle bağlantılıdır. Kimyasal değişim ise biyolojide “Hücre ve Organelleri” konusunda hücrenin kimyasal tepkimeleriyle birleşir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Kimya | Maddenin yapı, özellik, dönüşüm bilimi |
| Element | Tek tür atom |
| Bileşik | Sabit oranda birleşmiş |
| Karışım | Fiziksel yolla ayrılır |
| Fiziksel değişim | Yeni madde yok |
| Kimyasal değişim | Yeni madde var |
| Güvenlik | Önlük, gözlük, asidi suya ekle |

## Mini test

:::soru{cevap="B"}
Aşağıdaki olaylardan hangisi **kimyasal değişimdir**?

- A) Buzun erimesi
- B) Odunun yanması
- C) Suyun buharlaşması
- D) Şekerin suda çözünmesi
- E) Bakır telin bükülmesi

---

1. Kimyasal değişimde yeni maddeler oluşur.
2. Odun yanınca kül, karbon dioksit ve su buharı gibi yeni maddeler oluşur.
3. Diğer olaylarda madde kimliğini korur, fiziksel değişimdir. Doğru cevap B.

Diğer şıklar: **Buzun erimesi** yalnızca hâl değişir, yeni madde oluşmaz / **Suyun buharlaşması** yalnızca hâl değişir, yeni madde oluşmaz / **Şekerin suda çözünmesi** şeker kimliğini korur, fiziksel değişim / **Bakır telin bükülmesi** yalnızca biçim değişir, fiziksel değişim.
:::

:::soru{cevap="A"}
Aşağıdaki element-sembol eşleştirmelerinden hangisi **doğrudur**?

- A) Sodyum - Na
- B) Potasyum - P
- C) Demir - D
- D) Altın - A
- E) Gümüş - G

---

1. Sodyumun sembolü Na'dır.
2. Potasyum K, demir Fe, altın Au ve gümüş Ag ile gösterilir.
3. Doğru cevap A.

Diğer şıklar: **Potasyum - P** potasyumun sembolü K, P fosforun sembolüdür / **Demir - D** demirin sembolü Fe / **Altın - A** altının sembolü Au / **Gümüş - G** gümüşün sembolü Ag.
:::

:::soru{cevap="D"}
Laboratuvarda derişik bir asit çözeltisini seyreltirken aşağıdakilerden hangisi doğru uygulamadır?

- A) Suyu bir anda asidin üzerine dökmek
- B) Asidi suya hızlıca dökmek ve çalkalamak
- C) Asit ile suyu kapalı kapta birlikte ısıtmak
- D) Asidi suya yavaşça ve karıştırarak eklemek
- E) Asidi lavaboya dökmeden önce koklamak

---

1. Asit sulandırılırken ısı açığa çıkar.
2. Asidi suya yavaşça ve karıştırarak eklemek sıçramayı önler.
3. Diğer uygulamalar tehlikelidir. Doğru cevap D.

Diğer şıklar: **Suyu bir anda asidin üzerine dökmek** ısı çıkışıyla sıçrama ve yanık tehlikesi doğurur / **Asidi suya hızlıca dökmek ve çalkalamak** ani ısı çıkışı sıçramaya yol açar / **Asit ile suyu kapalı kapta birlikte ısıtmak** kapalı kapta ısıtma tehlikelidir / **Asidi lavaboya dökmeden önce koklamak** kimyasallar koklanmaz.
:::

:::soru{cevap="A"}
Aşağıdakilerden hangisi **saf madde değildir**?

- A) Hava
- B) Su
- C) Sofra tuzu
- D) Demir
- E) Altın

---

1. Saf maddeler element ve bileşiklerdir.
2. Hava, azot, oksijen ve başka gazların karışımıdır.
3. Diğer seçenekler element ya da bileşiktir. Doğru cevap A.

Diğer şıklar: **Su** iki elementin sabit oranda birleşmesiyle oluşan bileşik / **Sofra tuzu** sabit oranlı bileşik olan sodyum klorür / **Demir** tek tür atomdan oluşan element / **Altın** tek tür atomdan oluşan element.
:::

## Kendini dene

:::dene
1. Buzun erimesi fiziksel mi kimyasal değişim midir? => Fiziksel, yeni madde oluşmaz.
2. Demirin paslanması hangi tür değişimdir? => Kimyasal.
3. Altının sembolü nedir? => Au.
4. Hava karışım mı, saf madde midir? => Karışım, homojen.
5. $\text{H}_2\text{O}$ bileşiğinde kaç atom vardır? => 3 atom: 2 hidrojen ve 1 oksijen.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-kim' and name = 'Kimya Bilimi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Kimyanın tanımı ve alt dalları, maddenin sınıflandırılması, fiziksel ve kimyasal değişim, element sembolleri, laboratuvar güvenliği ve tehlike işaretleri. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür.
Kontrol edilecekler: Tehlike sembolleri yalnızca adıyla anıldı, görsel eklenmedi. Dördüncü soruda negatif kök koyu yazıldı.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Kimya Bilimi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Evrendeki her şey, birkaç düzine farklı atomun değişik şekillerde birleşmesinden oluşur. Bir atomun hangi elementi oluşturduğunu, kaç parçacık içerdiğini ve diğer elementlerle nasıl davrandığını **atomun yapısı** belirler. Periyodik sistem de elementleri bu yapıya göre sıralayan bir haritadır. Bu konuda atom modellerini, atomu oluşturan parçacıkları, elektron dizilimini, izotop ve iyonu, periyodik sistemin yapısını ve periyodik özellikleri öğreneceksin.

:::hedefler
1. Atom modellerinin gelişimini sıralamak.
2. Proton, nötron ve elektron sayılarını atom numarası ve kütle numarasından bulmak.
3. İzotop ve iyonu tanımlamak.
4. İlk 20 elementin elektron dizilimini yazmak ve periyot ile grubunu belirlemek.
5. Periyodik özellikleri (atom yarıçapı, iyonlaşma enerjisi, elektronegatiflik) karşılaştırmak.
:::

:::ipucu
Elektron dizilimini yazarken **katmanları sırayla doldur**: 1. katman 2, 2. katman 8, 3. katman ilk 20 element için en çok 8. Son katmandaki elektron sayısı **değerlik (valans) elektronudur** ve elementin **grubunu** belirler. Katman sayısı **periyodu** belirler.
:::

## 1. Atom modelleri

| Bilim insanı | Katkısı |
| --- | --- |
| Dalton | Atom bölünemeyen, içi dolu küredir |
| Thomson | Elektronu buldu. Atom, içine elektronlar gömülü pozitif küredir (“üzümlü kek”) |
| Rutherford | Atomun merkezinde küçük ve pozitif bir **çekirdek** vardır, elektronlar çevresinde döner |
| Bohr | Elektronlar çekirdek çevresinde belirli **enerji düzeylerinde** (katmanlarda) bulunur |
| Modern atom teorisi | Elektronun yeri kesin belirlenemez, bulunma olasılığı yüksek bölgeler (orbitaller) vardır |

## 2. Atomun yapısı

| Parçacık | Yük | Bulunduğu yer |
| --- | --- | --- |
| Proton ($p^+$) | Pozitif | Çekirdek |
| Nötron ($n^0$) | Yüksüz | Çekirdek |
| Elektron ($e^-$) | Negatif | Katmanlarda |

- **Atom numarası ($Z$):** Çekirdekteki **proton sayısıdır**. Elementi belirler. Nötr atomda elektron sayısı da $Z$’ye eşittir.
- **Kütle numarası ($A$):** Proton ve nötron sayılarının toplamıdır: $A = Z + N$.

**Örnek.** Sodyum atomunda $Z = 11$ ve $A = 23$. Proton sayısı 11, elektron sayısı 11, nötron sayısı $23 - 11 = 12$’dir.

**İzotop:** Atom numarası aynı, kütle numarası (nötron sayısı) farklı atomlardır. Kimyasal özellikleri aynıdır. $^{12}\text{C}$ ve $^{14}\text{C}$ karbonun izotoplarıdır.

**İyon:** Elektron alıp vererek yüklenmiş atomdur.

- **Katyon (+):** Elektron vermiş atom. $\text{Mg}^{2+}$: 12 proton, 10 elektron.
- **Anyon ($-$):** Elektron almış atom. $\text{Cl}^{-}$: 17 proton, 18 elektron.

İyon oluşurken **proton sayısı değişmez**, yalnızca elektron sayısı değişir.

## 3. Elektron dizilimi

Elektronlar katmanlara çekirdeğe yakından uzağa doğru yerleşir. İlk katmanda en çok 2, ikinci katmanda en çok 8 elektron bulunur. İlk 20 element için üçüncü katmanda en çok 8 elektron olur, sonrasında dördüncü katmana geçilir.

| Element | $Z$ | Dizilim | Periyot | Grup |
| --- | --- | --- | --- | --- |
| Li | 3 | 2, 1 | 2 | 1A |
| C | 6 | 2, 4 | 2 | 4A |
| N | 7 | 2, 5 | 2 | 5A |
| O | 8 | 2, 6 | 2 | 6A |
| Ne | 10 | 2, 8 | 2 | 8A |
| Na | 11 | 2, 8, 1 | 3 | 1A |
| Cl | 17 | 2, 8, 7 | 3 | 7A |
| Ar | 18 | 2, 8, 8 | 3 | 8A |
| K | 19 | 2, 8, 8, 1 | 4 | 1A |
| Ca | 20 | 2, 8, 8, 2 | 4 | 2A |

**Kural:** Periyot numarası = katman sayısı. A grubu numarası = son katmandaki elektron sayısı. 8 elektronlu son katman **kararlıdır** (oktet), 2 elektronlu ilk katman da kararlıdır (dublet). Soygazlar kararlıdır, bileşik oluşturmaya isteksizdir.

## 4. Periyodik sistem

![İlk 20 elementin periyodik cetveldeki yeri: metaller, ametaller ve soygazlar ayrı renklerde](/lessons/tyt-kim/periyodik-ilk20.svg "İlk 20 element | Yolumnet")

Elementler **artan atom numarasına** göre sıralanır. **Periyot** yatay sıralar (7 tane), **grup** düşey sütunlardır (18 tane). Aynı gruptaki elementlerin kimyasal özellikleri benzerdir, çünkü **değerlik elektron sayıları aynıdır**.

**Grup adları:**

| Grup | Adı | Örnek |
| --- | --- | --- |
| 1A | Alkali metaller (H hariç) | Li, Na, K |
| 2A | Toprak alkali metaller | Be, Mg, Ca |
| 7A | Halojenler | F, Cl, Br |
| 8A | Soygazlar | He, Ne, Ar |

**Metal, ametal, yarı metal:** Metaller (soldaki elementler) parlak, elektriği ve ısıyı iyi iletir, elektron verme eğilimindedir. Ametaller (sağdaki elementler) elektriği genellikle iletmez, elektron alma eğilimindedir. Bor (B) ve silisyum (Si) yarı metaldir. **Hidrojen**, 1A grubunda yer alsa da ametaldir.

## 5. Periyodik özellikler

| Özellik | Periyotta soldan sağa | Grupta yukarıdan aşağı |
| --- | --- | --- |
| Atom yarıçapı | Azalır | Artar |
| İyonlaşma enerjisi | Genelde artar | Azalır |
| Elektronegatiflik | Artar | Azalır |
| Metalik karakter | Azalır | Artar |

**Gerekçe:** Periyotta soldan sağa gidildikçe katman sayısı aynı kalır ama çekirdek yükü artar, elektronlar çekirdeğe daha çok çekilir, atom küçülür. Grupta aşağı inildikçe katman sayısı artar, atom büyür.

**İyonlaşma enerjisi:** Gaz hâlindeki bir atomdan **bir elektron koparmak için gereken enerjidir**. Atom küçüldükçe ve çekirdek yükü arttıkça elektronu koparmak zorlaşır.

**Elektronegatiflik:** Bir atomun bağ elektronlarını **çekme gücüdür**. En elektronegatif element flordür (F).

**Örnek.** 3. periyot elementleri Na, Mg, Al için atom yarıçapı $\text{Na} > \text{Mg} > \text{Al}$’dir.

:::neden-sonuc
- Atom numarası aynı, nötron sayısı farklı => İzotop.
- Elektron sayısı proton sayısından az => Katyon (pozitif iyon).
- Elektron sayısı proton sayısından fazla => Anyon (negatif iyon).
- Aynı periyotta sağa gidiliyor => Atom yarıçapı azalır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**İyon oluşurken proton sayısının değiştiğini sanmak** sık yapılan bir hatadır. Proton sayısı elementi belirler, iyonlaşmada yalnızca elektron sayısı değişir. Bir de **periyodik özelliklerin yönünü ezberlemek**: Nedenini bil. Periyotta çekirdek yükü arttığı için atom küçülür ve iyonlaşma enerjisi artar. Gruptaysa katman sayısı arttığı için atom büyür, elektron koparmak kolaylaşır.
:::

:::baglanti
Elektron dizilimi, “Kimyasal Türler Arası Etkileşimler” konusunda iyonik ve kovalent bağın nasıl oluştuğunu açıklar: Atomlar kararlı bir dizilime ulaşmak için elektron alır, verir ya da paylaşır. Periyodik özellikler, fizikte “Elektrostatik” konusundaki çekim ve itme kuvvetleriyle ilişkilidir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Atom numarası | Proton sayısı |
| Kütle numarası | Proton + nötron |
| İzotop | Aynı proton, farklı nötron |
| Katyon | Elektron vermiş |
| Periyot | Katman sayısı |
| A grubu | Değerlik elektron sayısı |
| Atom yarıçapı | Periyotta azalır, grupta artar |

## Mini test

:::soru{cevap="C"}
Atom numarası 17 ve kütle numarası 35 olan klor atomunda kaç nötron vardır?

- A) 1
- B) 17
- C) 18
- D) 35
- E) 52

---

1. Kütle numarası proton ve nötron sayılarının toplamıdır: $A = Z + N$.
2. $N = A - Z = 35 - 17 = 18$. Doğru cevap C.

Diğer şıklar: **1** proton ve nötron sayıları arasındaki fark alınmış / **17** proton sayısı alınmış / **35** kütle numarası alınmış / **52** atom ve kütle numaraları toplanmış.
:::

:::soru{cevap="C"}
Elektron dizilimi 2, 8, 6 olan bir elementin periyodik cetveldeki yeri aşağıdakilerden hangisidir?

- A) 2. periyot, 6A grubu
- B) 3. periyot, 2A grubu
- C) 3. periyot, 6A grubu
- D) 6. periyot, 3A grubu
- E) 4. periyot, 6A grubu

---

1. Üç katman olduğundan 3. periyottadır.
2. Son katmanda 6 elektron bulunduğundan 6A grubundadır.
3. Doğru cevap C.

Diğer şıklar: **2. periyot, 6A grubu** üç katman olduğundan periyot 3 olmalı / **3. periyot, 2A grubu** son katmandaki 6 elektron 6A grubunu gösterir / **6. periyot, 3A grubu** periyot ile grup yer değiştirmiş / **4. periyot, 6A grubu** katman sayısı 4 değil 3.
:::

:::soru{cevap="A"}
Atom numarası 12 olan magnezyum atomu 2 elektron vererek iyon oluşturuyor. Oluşan iyonla ilgili aşağıdakilerden hangisi doğrudur?

- A) 10 elektron içerir ve +2 yüklüdür.
- B) 14 elektron içerir ve $-2$ yüklüdür.
- C) 12 elektron içerir ve +2 yüklüdür.
- D) 10 elektron içerir ve $-2$ yüklüdür.
- E) 12 elektron içerir ve yüksüzdür.

---

1. Magnezyum atomunda 12 proton ve 12 elektron vardır.
2. 2 elektron verince 10 elektron kalır. Proton sayısı 12 olduğundan yük $+12 - 10 = +2$ olur.
3. Doğru cevap A.

Diğer şıklar: **14 elektron içerir ve $-2$ yüklüdür.** elektron verince elektron sayısı artmaz, azalır / **12 elektron içerir ve +2 yüklüdür.** elektron sayısı 12 değil 10 olur / **10 elektron içerir ve $-2$ yüklüdür.** elektron veren atom pozitif yüklenir / **12 elektron içerir ve yüksüzdür.** bu nötr magnezyum atomudur.
:::

:::soru{cevap="C"}
Na, Mg ve Al elementlerinin atom yarıçaplarının büyükten küçüğe sıralanışı aşağıdakilerden hangisidir? (Na: 11, Mg: 12, Al: 13)

- A) Al > Mg > Na
- B) Mg > Na > Al
- C) Na > Mg > Al
- D) Na > Al > Mg
- E) Mg > Al > Na

---

1. Üç element de 3. periyottadır. Periyotta soldan sağa çekirdek yükü artar, elektronlar daha çok çekilir.
2. Atom yarıçapı azalır: $\text{Na} > \text{Mg} > \text{Al}$.
3. Doğru cevap C.

Diğer şıklar: **Al > Mg > Na** periyotta soldan sağa yarıçap azalır, artmaz / **Mg > Na > Al** sıralama atom numarasıyla uyuşmuyor / **Na > Al > Mg** Mg ile Al’nin sıralaması ters / **Mg > Al > Na** Na en büyük yarıçaplı olmalı.
:::

## Kendini dene

:::dene
1. Atom numarası 8 olan oksijen atomunda kaç proton vardır? => 8.
2. $Z = 6$ ve $A = 14$ olan karbon atomunda kaç nötron vardır? => $14 - 6 = 8$.
3. Na atomunun elektron dizilimi nedir? => 2, 8, 1.
4. 17 proton ve 18 elektrona sahip tanecik hangi yüklüdür? => $-1$ (anyon).
5. Aynı grupta yukarıdan aşağı inildikçe atom yarıçapı nasıl değişir? => Artar.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-kim' and name = 'Atom ve Periyodik Sistem'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Atom modelleri, atomun yapısı, atom ve kütle numarası, izotop, iyon, elektron dizilimi (ilk 20 element), periyodik sistem, grup ve periyot, atom yarıçapı, iyonlaşma enerjisi, elektronegatiflik. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar betikle doğrulandı.
Kontrol edilecekler: İyonlaşma enerjisinde Be-B ve N-O gibi istisnalar metne alınmadı. Orbital kavramı yalnızca adı geçerek verildi.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Atom ve Periyodik Sistem'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sofra tuzu katıdır, su sıvıdır, oksijen gazdır. Tuz suda kolayca çözünür ama yağda çözünmez. Su 100 °C’de kaynar, metan gazı ise −160 °C’de bile gazdır. Bu farkların hepsi, atomların ve moleküllerin **birbirini nasıl tuttuğuna**, yani kimyasal etkileşimlere bağlıdır. Bu konuda atomları birbirine bağlayan güçlü etkileşimleri (iyonik, kovalent, metalik bağ) ve moleküller arasındaki zayıf etkileşimleri (London, dipol-dipol, hidrojen bağı) öğreneceksin.

:::hedefler
1. İyonik, kovalent ve metalik bağı ayırt etmek.
2. İyonik ve kovalent bileşiklerin formüllerini ve adlarını yazmak.
3. Polar ve apolar molekülleri ayırt etmek.
4. Zayıf etkileşimleri (London, dipol-dipol, hidrojen bağı) tanımak.
5. Etkileşim türüne göre kaynama noktası ve çözünürlüğü karşılaştırmak.
:::

:::ipucu
Bağ türünü bulmak için **elementlerin türüne bak**: Metal ile ametal arasında **iyonik bağ**, ametal ile ametal arasında **kovalent bağ** kurulur. Aynı türden metal atomları arasında **metalik bağ** vardır. Bu üç kural, soruların çoğunda yeterlidir.
:::

## 1. Güçlü etkileşimler (kimyasal bağlar)

![İyonik bağda sodyum klora elektron verir. Kovalent bağda oksijen ve hidrojen elektronları ortaklaşa kullanır](/lessons/tyt-kim/baglar.svg "İyonik ve kovalent bağ | Yolumnet")

**İyonik bağ.** Metal atomunun ametal atomuna **elektron vermesiyle** oluşan zıt yüklü iyonlar arasındaki çekim kuvvetidir. Sodyum (2, 8, 1) bir elektron verir ve $\text{Na}^+$ olur. Klor (2, 8, 7) bir elektron alır ve $\text{Cl}^-$ olur. İki iyon birbirini çeker: NaCl.

**Kovalent bağ.** İki **ametal atomunun elektronlarını ortaklaşa kullanmasıyla** oluşur. Her atom, ortak elektron çiftiyle kararlı (oktet ya da dublet) duruma ulaşır. $\text{H}_2\text{O}$, $\text{CO}_2$, $\text{CH}_4$, $\text{NH}_3$ kovalent bileşiklerdir.

**Metalik bağ.** Metal atomları değerlik elektronlarını ortak bir “elektron denizi”ne verir. Pozitif iyonlar ile elektron denizi arasındaki çekim metalik bağdır. Metallerin **parlaklığını, işlenebilirliğini, ısı ve elektrik iletkenliğini** açıklar.

| Bağ | Taneciklerin ilişkisi | Örnek |
| --- | --- | --- |
| İyonik | Metal + ametal, elektron aktarımı | NaCl, $\text{MgO}$, $\text{CaF}_2$ |
| Kovalent | Ametal + ametal, elektron ortaklaşması | $\text{H}_2\text{O}$, $\text{CO}_2$, $\text{O}_2$ |
| Metalik | Metal + metal, elektron denizi | Fe, Cu, Al |

**İyonik bileşiklerin özellikleri:** Oda koşullarında **katıdır**, erime ve kaynama noktaları **yüksektir**, **katı hâlde iletken değildir**, sulu çözeltisi ve erimiş hâli **elektriği iletir**, sert ama kırılgandır.

## 2. Formül ve adlandırma

**İyonik bileşik formülü:** Toplam yük sıfır olacak şekilde iyonlar birleştirilir. “Çapraz kural”: Bir iyonun yük sayısı diğerinin sayısı olur.

- $\text{Na}^+$ ve $\text{Cl}^-$: NaCl.
- $\text{Mg}^{2+}$ ve $\text{Cl}^-$: $\text{MgCl}_2$ (Mg yükü 2, Cl sayısı 2).
- $\text{Al}^{3+}$ ve $\text{O}^{2-}$: $\text{Al}_2\text{O}_3$ (Al sayısı 2, O sayısı 3). Toplam yük $2 \cdot 3 - 3 \cdot 2 = 0$.

**Adlandırma:** Önce metal, sonra ametalin “-ür / -ür” ya da “oksit” gibi adı yazılır: NaCl sodyum klorür, MgO magnezyum oksit.

**Kovalent bileşiklerde** atom sayıları Yunanca sayı önekleriyle (mono, di, tri, tetra, penta) belirtilir: $\text{CO}_2$ karbon dioksit, $\text{CO}$ karbon monoksit, $\text{N}_2\text{O}_5$ diazot pentaoksit.

**Kovalent bağ sayısı:** Atomların yaptığı bağ sayısı kararlı dizilime göre belirlenir. H 1, O 2, N 3, C 4 bağ yapar. Su H-O-H, karbon dioksit O=C=O, azot $\text{N}\equiv\text{N}$ biçimindedir.

## 3. Polar ve apolar moleküller

**Polar kovalent bağ:** Elektronegatiflikleri farklı atomlar arasında elektron çifti **bir tarafa kayar**. Bir uç kısmen negatif, diğeri kısmen pozitif olur. **Apolar kovalent bağ:** Aynı atomlar arasındaki bağdır ($\text{H}_2$, $\text{O}_2$, $\text{N}_2$).

**Molekülün polarlığı:** Bağlar polar olsa bile **molekül simetrikse** polarlıklar birbirini götürür ve molekül **apolar** olur.

| Molekül | Şekil | Polarlık |
| --- | --- | --- |
| $\text{H}_2\text{O}$ | Kırık (bükülmüş) | Polar |
| $\text{NH}_3$ | Üçgen piramit | Polar |
| $\text{HCl}$ | Doğrusal, farklı atomlar | Polar |
| $\text{CO}_2$ | Doğrusal, simetrik | Apolar |
| $\text{CH}_4$ | Düzgün dörtyüzlü | Apolar |
| $\text{O}_2$, $\text{N}_2$ | Aynı atomlar | Apolar |

## 4. Zayıf etkileşimler (moleküller arası)

Moleküller arasında **fiziksel** özellikleri (kaynama noktası, çözünürlük) belirleyen zayıf çekimler vardır. Bunlar **kimyasal bağlardan çok daha zayıftır**.

| Etkileşim | Hangi moleküllerde? | Güç |
| --- | --- | --- |
| London (dispersiyon) | Bütün moleküllerde, tek etkileşim apolarlarda | En zayıf |
| Dipol-dipol | Polar moleküller arasında | Orta |
| Hidrojen bağı | H atomu F, O ya da N’ye bağlıysa | Güçlü |
| İyon-dipol | İyon ile polar molekül (tuzun suda çözünmesi) | Güçlü |

**Hidrojen bağı:** H atomu F, O ya da N atomlarından birine bağlıysa, bu H ile başka molekülün F, O ya da N’si arasında kurulur. $\text{H}_2\text{O}$, $\text{NH}_3$, HF’de vardır. $\text{H}_2\text{S}$, HCl, $\text{CH}_4$’te yoktur.

**Kaynama noktası:** Etkileşimler ne kadar güçlüyse kaynama noktası o kadar yüksektir. Sıralama genelde: **İyonik bağlı > hidrojen bağlı > dipol-dipol > London**. Molekül büyüklüğü arttıkça London kuvvetleri güçlenir. Su ($\text{H}_2\text{O}$), hidrojen bağı sayesinde, kütlesi daha büyük olan $\text{H}_2\text{S}$’ten çok daha yüksek sıcaklıkta kaynar.

**Çözünürlük:** “Benzer benzeri çözer.” Polar maddeler polar çözücülerde (su), apolar maddeler apolar çözücülerde (benzin, yağ) çözünür. Tuz suda çözünür çünkü iyon-dipol etkileşimi güçlüdür. Yağ suda çözünmez.

:::neden-sonuc
- Metal + ametal => İyonik bağ.
- Ametal + ametal => Kovalent bağ.
- H atomu F, O ya da N’ye bağlı => Hidrojen bağı kurabilir.
- Etkileşim güçlü => Kaynama noktası yüksek.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Kimyasal bağ ile moleküller arası etkileşimi karıştırmak** en sık yapılan hatadır. Suyun içindeki H-O bağı kovalent bağdır, moleküller arasındaki hidrojen bağı ise zayıf etkileşimdir. Su kaynarken kovalent bağlar değil, hidrojen bağları koparılır. Bir de **polar bağlı molekülün her zaman polar** olduğunu sanma: $\text{CO}_2$ polar bağlar içerir ama simetrik olduğu için apolardır.
:::

:::baglanti
Bu konu, “Atom ve Periyodik Sistem” konusundaki elektron dizilimi ve elektronegatiflik bilgisine dayanır. “Maddenin Halleri” konusunda etkileşimlerin hâl değişimine, “Karışımlar” konusunda çözünürlüğe etkisi görülür. Fizikte “Elektrostatik” konusundaki zıt yüklerin çekimi, iyonik bağın temelidir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İyonik bağ | Metal + ametal, elektron aktarımı |
| Kovalent bağ | Ametal + ametal, ortaklaşma |
| Metalik bağ | Elektron denizi |
| Polar molekül | Simetrik olmayan, bağlar polar |
| Hidrojen bağı | H-F, H-O, H-N |
| Sıralama | İyonik > H bağı > dipol-dipol > London |
| Çözünürlük | Benzer benzeri çözer |

## Mini test

:::soru{cevap="A"}
Aşağıdaki bileşiklerden hangisinde atomlar arasında **kovalent bağ** bulunur?

- A) $\text{CO}_2$
- B) NaCl
- C) MgO
- D) KBr
- E) $\text{CaF}_2$

---

1. Kovalent bağ, ametal atomları arasında oluşur.
2. $\text{CO}_2$ karbon ve oksijen gibi iki ametalden oluşur.
3. Diğer bileşikler bir metal ve bir ametalden oluşur, iyonik bağlıdır. Doğru cevap A.

Diğer şıklar: **NaCl** metal ile ametal arasında iyonik bağ / **MgO** metal ile ametal arasında iyonik bağ / **KBr** metal ile ametal arasında iyonik bağ / **$\text{CaF}_2$** metal ile ametal arasında iyonik bağ.
:::

:::soru{cevap="C"}
$\text{Al}^{3+}$ ve $\text{O}^{2-}$ iyonlarından oluşan bileşiğin formülü aşağıdakilerden hangisidir?

- A) $\text{AlO}$
- B) $\text{Al}_3\text{O}_2$
- C) $\text{Al}_2\text{O}_3$
- D) $\text{Al}_2\text{O}$
- E) $\text{AlO}_3$

---

1. Toplam yük sıfır olmalıdır. Çapraz kuralla Al'in yükü 3 oksijen sayısı, O'nun yükü 2 alüminyum sayısı olur.
2. Formül $\text{Al}_2\text{O}_3$: $2 \cdot (+3) + 3 \cdot (-2) = 0$. Doğru cevap C.

Diğer şıklar: **$\text{AlO}$** toplam yük sıfır olmaz / **$\text{Al}_3\text{O}_2$** yükler ve sayılar ters kurulmuş / **$\text{Al}_2\text{O}$** toplam yük $+6 - 2$ olur, sıfır değil / **$\text{AlO}_3$** toplam yük $+3 - 6$ olur, sıfır değil.
:::

:::soru{cevap="A"}
Aşağıdaki maddelerden hangisinin molekülleri arasında **hidrojen bağı** bulunur?

- A) $\text{H}_2\text{O}$
- B) $\text{CH}_4$
- C) $\text{CO}_2$
- D) HCl
- E) $\text{H}_2\text{S}$

---

1. Hidrojen bağı için H atomu F, O ya da N’ye bağlı olmalıdır.
2. $\text{H}_2\text{O}$'da H atomları oksijene bağlıdır.
3. Diğer moleküllerde bu koşul sağlanmaz. Doğru cevap A.

Diğer şıklar: **$\text{CH}_4$** H atomu C’ye bağlı, hidrojen bağı yok / **$\text{CO}_2$** hidrojen atomu içermez / **HCl** H atomu Cl’ye bağlı, hidrojen bağı yok / **$\text{H}_2\text{S}$** H atomu S’ye bağlı, hidrojen bağı yok.
:::

:::soru{cevap="B"}
Aşağıdaki maddelerden hangisinin kaynama noktası en yüksektir?

- A) $\text{H}_2\text{O}$
- B) NaCl
- C) $\text{CO}_2$
- D) $\text{CH}_4$
- E) $\text{N}_2$

---

1. NaCl iyonik bağlı bir katıdır ve iyonlar arasındaki çekim çok güçlüdür.
2. Hidrojen bağlı su, dipol-dipol ve London kuvvetli maddelerden daha yüksek, ama iyonik bileşikten daha düşük sıcaklıkta kaynar.
3. Doğru cevap B.

Diğer şıklar: **$\text{H}_2\text{O}$** hidrojen bağlı, ama iyonik bağdan zayıf / **$\text{CO}_2$** apolar molekül, London kuvvetleri / **$\text{CH}_4$** apolar molekül, London kuvvetleri / **$\text{N}_2$** apolar molekül, London kuvvetleri.
:::

## Kendini dene

:::dene
1. NaCl’de hangi bağ vardır? => İyonik bağ.
2. $\text{O}_2$ molekülü polar mı apolar mıdır? => Apolar, aynı atomlardan oluşur.
3. $\text{Mg}^{2+}$ ve $\text{Cl}^-$ iyonlarının bileşiğinin formülü nedir? => $\text{MgCl}_2$.
4. Suda hangi moleküller arası etkileşim bulunur? => Hidrojen bağı.
5. Yağ suda çözünür mü? => Hayır, yağ apolardır ve su polardır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-kim' and name = 'Kimyasal Türler Arası Etkileşimler'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: İyonik, kovalent ve metalik bağ, iyonik ve kovalent bileşiklerin formül ve adlandırması, polar ve apolar moleküller, zayıf etkileşimler (London, dipol-dipol, hidrojen bağı, iyon-dipol), kaynama noktası ve çözünürlük. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür.
Kontrol edilecekler: Lewis nokta yapıları ayrı şekille verilmedi. Çok atomlu iyonlar (SO4, NO3) metne alınmadı. Kaynama noktası sorusunda NaCl katı, diğerleri moleküler maddedir.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Kimyasal Türler Arası Etkileşimler'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Buz erir, su buharlaşır, bulut yağmura dönüşür. Balonu şişirince gaz her yöne eşit basınç yapar, güneşte kalan balon patlayabilir. Madde **katı, sıvı, gaz ve plazma** olmak üzere dört hâlde bulunur. Hâl, maddeyi oluşturan taneciklerin **düzenine, aralarındaki uzaklığa ve hareketine** bağlıdır. Bu konuda maddenin hâllerini, hâl değişimlerini, gazların özelliklerini ve gaz yasalarını öğreneceksin.

:::hedefler
1. Katı, sıvı ve gazların tanecikli yapısını karşılaştırmak.
2. Hâl değişimlerini adlandırmak ve ısı alışverişini belirtmek.
3. Gaz basıncını ve gazların genel özelliklerini açıklamak.
4. Boyle, Charles ve Gay-Lussac yasalarını uygulamak.
5. İdeal gaz denklemini ve mutlak sıcaklığı kullanmak.
:::

:::ipucu
Gaz sorularında **sıcaklığı her zaman kelvine çevir**: $T(\text{K}) = t(°\text{C}) + 273$. Hangi büyüklüğün sabit olduğuna bak: Sıcaklık sabitse Boyle, basınç sabitse Charles, hacim sabitse Gay-Lussac yasası kullanılır.
:::

## 1. Maddenin hâlleri

![Katı, sıvı ve gaz hâlinde tanecik düzeni](/lessons/tyt-kim/maddenin-halleri.svg "Maddenin hâlleri | Yolumnet")

| Özellik | Katı | Sıvı | Gaz |
| --- | --- | --- | --- |
| Tanecik düzeni | Düzenli, sıkı | Daha az düzenli, yakın | Düzensiz, uzak |
| Tanecik hareketi | Titreşim | Kayma, titreşim | Hızlı, öteleme |
| Şekil | Sabit | Kabın şekli | Kabın şekli |
| Hacim | Sabit | Sabit | Kabın hacmi |
| Sıkışabilme | Yok | Çok az | Kolay |
| Akışkanlık | Yok | Var | Var |

**Plazma:** Gaz taneciklerinin çok yüksek sıcaklıkta iyonlaşmasıyla oluşan dördüncü hâldir. Güneş, yıldızlar, şimşek, neon lambaları plazmadır.

## 2. Hâl değişimleri

| Hâl değişimi | Nereden nereye? | Isı |
| --- | --- | --- |
| Erime | Katı → sıvı | Alınır |
| Donma | Sıvı → katı | Verilir |
| Buharlaşma | Sıvı → gaz | Alınır |
| Yoğuşma (yoğunlaşma) | Gaz → sıvı | Verilir |
| Süblimleşme | Katı → gaz | Alınır |
| Kırağılaşma (depozisyon) | Gaz → katı | Verilir |

**Örnekler:** Naftalinin zamanla yok olması, buzdolabındaki buzun küçülmesi, kuru buzun gaz çıkarması süblimleşmedir. Soğuk bardağın dışında su damlaları oluşması yoğuşmadır. Kışın camda buz çiçeği oluşması kırağılaşmadır.

**Buharlaşma türleri:** Sıvının yüzeyinden her sıcaklıkta olan **buharlaşma** ve sıvının her yerinden gaz kabarcıkları çıkarak **belirli sıcaklıkta** olan **kaynama** vardır. Kaynama, sıvının buhar basıncının dış basınca eşitlendiği anda gerçekleşir. **Dış basınç düştükçe kaynama noktası düşer**. Yüksek yerlerde su 100 °C’den daha düşük sıcaklıkta kaynar. Düdüklü tencerede basınç yüksek olduğundan su 100 °C’nin üstünde kaynar ve yemek daha çabuk pişer.

## 3. Gazların özellikleri ve basıncı

Gaz tanecikleri kabın çeperlerine sürekli çarpar. **Gaz basıncı**, bu çarpmaların birim alana düşen kuvvetidir. Basıncı belirleyen etkenler: **Gazın miktarı (mol sayısı), hacim ve sıcaklık**.

- **Basınç birimleri:** atmosfer (atm), mmHg, Pa. $1\ \text{atm} = 760\ \text{mmHg} = 76\ \text{cmHg} \approx 10^5\ \text{Pa}$.
- **Açık hava basıncı** deniz seviyesinde 1 atm ya da 76 cmHg’dir.
- Gaz kapta **her yöne eşit basınç** yapar.
- Gazlar kolay sıkışır, her oranda karışır, bulundukları kabın tamamını doldurur.

**Mutlak sıcaklık:** $T = t + 273$. 27 °C = 300 K. Gazların hacmi ve basıncı mutlak sıcaklıkla orantılıdır. Mutlak sıfır noktası $0\ \text{K}$ ($-273\ °\text{C}$) olup taneciklerin kinetik enerjisinin sıfır olduğu varsayılan sıcaklıktır.

## 4. Gaz yasaları

Sabit miktardaki bir gaz için:

| Yasa | Sabit olan | Bağıntı | Ne söyler? |
| --- | --- | --- | --- |
| Boyle | Sıcaklık ($T$) | $P_1 V_1 = P_2 V_2$ | Basınç artarsa hacim azalır |
| Charles | Basınç ($P$) | $\dfrac{V_1}{T_1} = \dfrac{V_2}{T_2}$ | Sıcaklık artarsa hacim artar |
| Gay-Lussac | Hacim ($V$) | $\dfrac{P_1}{T_1} = \dfrac{P_2}{T_2}$ | Sıcaklık artarsa basınç artar |
| Birleşik | Mol sayısı | $\dfrac{P_1 V_1}{T_1} = \dfrac{P_2 V_2}{T_2}$ | Üçü birlikte |

**Örnek (Boyle).** 2 atm basınçta 6 L olan gaz, sabit sıcaklıkta 4 atm’e sıkıştırılırsa $2 \cdot 6 = 4 \cdot V_2$ ve $V_2 = 3\ \text{L}$ olur.

**Örnek (Charles).** 300 K’de 6 L olan gaz, sabit basınçta 450 K’e ısıtılırsa $V_2 = 6 \cdot \dfrac{450}{300} = 9\ \text{L}$.

**Örnek (Gay-Lussac).** Hacmi sabit kapta 2 atm basınçlı gaz 300 K’den 600 K’e ısıtılırsa basınç $2 \cdot \dfrac{600}{300} = 4\ \text{atm}$ olur.

## 5. İdeal gaz denklemi

$$P \cdot V = n \cdot R \cdot T$$

$P$ atm, $V$ litre, $n$ mol, $T$ kelvin, $R = 0{,}082\ \text{L·atm/(mol·K)}$ alınır.

**Örnek.** 1 mol gaz 0 °C’de ve 1 atm basınçta ($273\ \text{K}$) $V = \dfrac{nRT}{P} = \dfrac{1 \cdot 0{,}082 \cdot 273}{1} \approx 22{,}4\ \text{L}$ hacim kaplar. Bu değer **normal koşullar (NK)** için molar hacimdir.

**Örnek.** 2 mol gaz 27 °C’de (300 K) ve 2 atm’de $V = \dfrac{2 \cdot 0{,}082 \cdot 300}{2} = 24{,}6\ \text{L}$ kaplar.

**Avogadro yasası:** Aynı sıcaklık ve basınçta gazların eşit hacimleri **eşit sayıda molekül** içerir.

:::neden-sonuc
- Sıcaklık sabit, basınç artıyor => Hacim azalır (Boyle).
- Basınç sabit, sıcaklık artıyor => Hacim artar (Charles).
- Hacim sabit, sıcaklık artıyor => Basınç artar (Gay-Lussac).
- Dış basınç azalıyor => Kaynama noktası düşer.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Sıcaklığı santigrat olarak kullanmak** gaz sorularındaki en büyük hatadır. Charles ve Gay-Lussac’ta oranlar **kelvinle** yazılır. 27 °C’yi 27 olarak yazarsan sonuç yanlış çıkar. Bir de **hâl değişiminde ısının alınıp verildiğini** karıştırırsın: Erime, buharlaşma ve süblimleşme **ısı alan**, donma, yoğuşma ve kırağılaşma **ısı veren** olaylardır.
:::

:::baglanti
Hâl değişimi ve ısı, fizikteki “Isı ve Sıcaklık” konusundaki erime ve buharlaşma ısılarıyla birleşir. Gaz basıncı ise “Basınç ve Kaldırma Kuvveti” konusundaki basınç kavramına dayanır. Maddenin hâli, “Kimyasal Türler Arası Etkileşimler” konusundaki zayıf etkileşimlerin gücüne göre belirlenir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Katı | Düzenli, sabit hacim ve şekil |
| Sıvı | Sabit hacim, kabın şekli |
| Gaz | Kabın hacmi ve şekli |
| Süblimleşme | Katı → gaz |
| Boyle | $P V$ sabit |
| Charles | $V / T$ sabit |
| İdeal gaz | $P V = n R T$ |

## Mini test

:::soru{cevap="B"}
Sabit sıcaklıkta, 2 atm basınç altında 6 L hacim kaplayan bir ideal gaz, basıncı 4 atm olacak şekilde sıkıştırılıyor. Gazın son hacmi kaç litre olur?

- A) 2
- B) 3
- C) 4
- D) 6
- E) 12

---

1. Sıcaklık sabit olduğundan Boyle yasası uygulanır: $P_1 V_1 = P_2 V_2$.
2. $2 \cdot 6 = 4 \cdot V_2$ ve $V_2 = 3\ \text{L}$. Doğru cevap B.

Diğer şıklar: **2** ilk basınç değeri hacim sanılmış / **4** son basınç değeri hacim sanılmış / **6** hacmin değişmediği sanılmış / **12** basınç oranı ters kurulmuş, doğru orantı sanılmış.
:::

:::soru{cevap="D"}
Sabit basınçta 300 K sıcaklığında 6 L hacim kaplayan bir ideal gaz, 450 K’e kadar ısıtılıyor. Gazın son hacmi kaç litre olur?

- A) 4
- B) 6
- C) 8
- D) 9
- E) 300

---

1. Basınç sabit olduğundan Charles yasası: $\dfrac{V_1}{T_1} = \dfrac{V_2}{T_2}$.
2. $\dfrac{6}{300} = \dfrac{V_2}{450}$ ve $V_2 = 9\ \text{L}$. Doğru cevap D.

Diğer şıklar: **4** sıcaklık oranı ters kurulmuş / **6** hacmin değişmediği sanılmış / **8** işlem hatasıyla bir eksik bulunmuş / **300** ilk sıcaklık değeri hacim sanılmış.
:::

:::soru{cevap="B"}
Naftalin tabletlerinin zamanla küçülüp yok olması hangi hâl değişimiyle açıklanır?

- A) Erime
- B) Süblimleşme
- C) Buharlaşma
- D) Yoğuşma
- E) Kırağılaşma

---

1. Naftalin katı hâlden sıvı hâle geçmeden doğrudan gaz hâline geçer.
2. Bu olaya süblimleşme denir.
3. Doğru cevap B.

Diğer şıklar: **Erime** önce sıvı olmadan doğrudan gaza geçiyor / **Buharlaşma** katı maddenin sıvı hâlden geçmeden gaza dönüşümü buharlaşma değildir / **Yoğuşma** gazın sıvıya dönüşmesidir / **Kırağılaşma** gazın doğrudan katıya dönüşmesidir.
:::

:::soru{cevap="B"}
Deniz seviyesinden çok yüksekte bulunan bir dağ evinde su kaynatılıyor. Suyun kaynama noktası için aşağıdakilerden hangisi doğrudur?

- A) 100 °C’den yüksektir, çünkü dış basınç daha azdır.
- B) 100 °C’den düşüktür, çünkü dış basınç daha azdır.
- C) 100 °C’dir, çünkü suyun kaynama noktası değişmez.
- D) 100 °C’den düşüktür, çünkü suyun özkütlesi artar.
- E) 100 °C’den yüksektir, çünkü hava daha soğuktur.

---

1. Sıvı, buhar basıncı dış basınca eşit olunca kaynar.
2. Yüksekte dış basınç azdır, bu yüzden daha düşük sıcaklıkta buhar basıncı dış basınca eşitlenir.
3. Doğru cevap B.

Diğer şıklar: **100 °C’den yüksektir, çünkü dış basınç daha azdır.** dış basınç azalınca kaynama noktası düşer / **100 °C’dir, çünkü suyun kaynama noktası değişmez.** kaynama noktası dış basınca bağlıdır / **100 °C’den düşüktür, çünkü suyun özkütlesi artar.** neden dış basınç, özkütle değil / **100 °C’den yüksektir, çünkü hava daha soğuktur.** havanın soğuk olması kaynama noktasını yükseltmez.
:::

## Kendini dene

:::dene
1. Suyun donması hangi hâl değişimidir? => Donma, sıvı → katı, ısı verilir.
2. 27 °C kaç kelvindir? => 300 K.
3. Sabit sıcaklıkta basınç 2 katına çıkarsa gazın hacmi nasıl değişir? => Yarıya iner.
4. 1 mol ideal gazın normal koşullardaki hacmi kaç litredir? => Yaklaşık 22,4 L.
5. Kuru buzun doğrudan gaza dönüşmesi hangi olaydır? => Süblimleşme.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-kim' and name = 'Maddenin Halleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Katı, sıvı, gaz ve plazma, hâl değişimleri, kaynama ve dış basınç, gaz basıncı, mutlak sıcaklık, Boyle, Charles, Gay-Lussac yasaları, ideal gaz denklemi, Avogadro yasası. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar betikle doğrulandı.
Kontrol edilecekler: Gerçek gazlar ve gaz karışımlarında kısmi basınç metne alınmadı.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Maddenin Halleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Nefes aldığın hava, içtiğin su, bastığın toprak da kimyasal maddelerden oluşur. Doğadaki kimyasal denge bozulduğunda hava kirlenir, su zehirlenir, iklim değişir. Bu konu, **doğal kaynakların kimyasını ve insan etkisini** inceler. Bu konuda havanın bileşimini, hava, su ve toprak kirliliğini, asit yağmurlarını, sera etkisini, ozon tabakasını ve çevreyi korumanın yollarını öğreneceksin.

:::hedefler
1. Temiz havanın bileşimini ve atmosferin katmanlarını tanımak.
2. Hava, su ve toprak kirleticilerini ve etkilerini açıklamak.
3. Asit yağmuru, sera etkisi ve ozon tabakasının incelmesini açıklamak.
4. Geri dönüşüm, yeşil kimya ve arıtma yöntemlerini tanımak.
5. Çevre sorunlarına çözüm yollarını değerlendirmek.
:::

:::ipucu
Çevre kimyası sorularında **sorun, neden ve sonuç** zincirini kur. Hangi gaz hangi sorunla ilgili? Asit yağmuru ile kükürt ve azot oksitleri, sera etkisi ile karbon dioksit ve metan, ozon incelmesi ile kloroflorokarbonlar (CFC) eşleşir. Bu üç eşleşme çoğu sorunun anahtarıdır.
:::

## 1. Hava ve atmosfer

**Temiz havanın bileşimi (hacimce):**

| Gaz | Yaklaşık yüzde |
| --- | --- |
| Azot ($\text{N}_2$) | 78 |
| Oksijen ($\text{O}_2$) | 21 |
| Argon ve diğer gazlar | 1 |
| Karbon dioksit ($\text{CO}_2$) | 0,04 |
| Su buharı | Değişken |

Hava bir **karışımdır** (homojen). Bileşenleri kimyasal olarak birleşmemiştir.

**Atmosfer katmanları** yerden yukarıya: Troposfer (hava olayları), stratosfer (**ozon tabakası** burada), mezosfer, termosfer, ekzosfer.

**Ozon ($\text{O}_3$):** Stratosferdeki ozon tabakası Güneş’ten gelen **zararlı morötesi (UV) ışınların** büyük kısmını tutar. Canlıları cilt kanseri ve diğer zararlardan korur.

## 2. Hava kirliliği

| Kirletici | Kaynağı | Etkisi |
| --- | --- | --- |
| Karbon monoksit (CO) | Eksik yanma (araç, soba) | Zehirli, kana karışıp oksijen taşımasını engeller |
| Kükürt dioksit ($\text{SO}_2$) | Kömür ve petrol yanması | Asit yağmuru, solunum hastalıkları |
| Azot oksitler ($\text{NO}_x$) | Araç motorları, sanayi | Asit yağmuru, duman |
| Karbon dioksit ($\text{CO}_2$) | Fosil yakıt yanması | Sera etkisi |
| Metan ($\text{CH}_4$) | Çöplükler, hayvancılık | Sera etkisi |
| Partikül madde (PM) | Yanma, toz | Solunum yolları hastalıkları |
| CFC’ler | Eski soğutucular, spreyler | Ozon tabakasını inceltir |

**Asit yağmuru.** $\text{SO}_2$ ve $\text{NO}_x$ gazları atmosferde su ile tepkimeye girerek sülfürik asit ve nitrik asit oluşturur. Bu asitler yağmurla yere iner. **pH değeri 5,6’nın altındaki** yağışlar asit yağmurudur. Etkileri: Mermer ve metal yapıların aşınması, göl ve ormanların zarar görmesi, toprağın asitleşmesi.

**Sera etkisi.** Güneş ışınları yeryüzünü ısıtır, yeryüzü ısıyı kızılötesi ışın olarak geri yayar. **Sera gazları** ($\text{CO}_2$, $\text{CH}_4$, $\text{N}_2\text{O}$, su buharı) bu ısının bir kısmını tutar ve Dünya’yı yaşanabilir sıcaklıkta tutar. Sera gazlarının insan etkisiyle artması **küresel ısınmaya** neden olur.

![Güneş ışınları yeryüzüne ulaşır, yeryüzünden yayılan ısı sera gazlarınca tutularak geri yansıtılır](/lessons/tyt-kim/sera-etkisi.svg "Sera etkisi | Yolumnet")

**Ozon tabakasının incelmesi.** Soğutucularda ve spreylerde kullanılan **kloroflorokarbonlar (CFC)** stratosfere ulaşınca ozonu parçalar. Ozon incelince daha fazla UV ışın yeryüzüne ulaşır. CFC kullanımı bu nedenle uluslararası anlaşmalarla yasaklanmıştır.

## 3. Su ve toprak kirliliği

**Su kirliliği:** Evsel atıklar, sanayi atıkları, gübre ve ilaç kalıntıları, petrol sızıntıları suyu kirletir.

- **Ötrofikasyon:** Gübre ve deterjan gibi **besin maddelerinin** suya karışmasıyla su bitkilerinin ve alglerin aşırı çoğalmasıdır. Ölen bitkiler çürürken suyun çözünmüş oksijenini tüketir, balıklar ölür.
- **Ağır metaller:** Cıva, kurşun, kadmiyum canlıların vücudunda birikir ve zehirleyici etki yapar.
- **Isıl kirlilik:** Sanayi tesislerinin sıcak su bırakması, suda çözünmüş oksijeni azaltır.

**Toprak kirliliği:** Aşırı gübre ve ilaç kullanımı, ağır metaller, plastik atıklar toprağı bozar. Bitki gelişimi zayıflar, zehirli maddeler besin zincirine girer.

## 4. Çevreyi koruma yolları

- **Geri dönüşüm:** Kâğıt, cam, metal, plastik atıkların yeniden hammadde olarak kullanılması. Hammadde ve enerji tasarrufu sağlar, çöp miktarını azaltır.
- **Temiz enerji:** Güneş, rüzgâr, hidroelektrik gibi yenilenebilir enerji kaynakları sera gazı salmaz.
- **Arıtma tesisleri:** Atık suların fiziksel (süzme, çöktürme), kimyasal ve biyolojik yöntemlerle temizlenmesi.
- **Katalitik konvertör:** Araç egzozundaki CO ve $\text{NO}_x$ gibi zehirli gazları daha az zararlı gazlara dönüştürür.
- **Yeşil kimya:** Zararlı atık oluşturmayan, enerjiyi verimli kullanan, çevreye duyarlı kimyasal üretim.
- **Bilinçli tüketim:** Gereksiz ambalajdan kaçınma, israfı önleme.

:::neden-sonuc
- Kükürt ve azot oksitleri atmosfere salınıyor => Asit yağmuru oluşur.
- Karbon dioksit ve metan artıyor => Sera etkisi güçlenir, küresel ısınma olur.
- CFC stratosfere ulaşıyor => Ozon tabakası incelir.
- Suya aşırı besin karışıyor => Ötrofikasyon oluşur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Sera etkisi ile küresel ısınmayı aynı sanmak** sık yapılan bir hatadır. Sera etkisi doğal ve gereklidir: Yoksa Dünya dondurucu soğuk olurdu. Sorun, sera gazlarının insan etkisiyle fazla artmasıdır. Bir de **ozon incelmesi ile sera etkisini karıştırırsın**: İkisi farklı sorunlardır. Ozon incelmesi UV ışınlarıyla, sera etkisi ısı tutmakla ilgilidir. CFC ozonu inceltir, $\text{CO}_2$ sera etkisini artırır.
:::

:::baglanti
Hava ve su, “Karışımlar” konusunda çözelti örnekleri olarak geri döner. Asit yağmuru “Asitler, Bazlar ve Tuzlar” konusundaki pH kavramıyla birleşir. Biyolojide “Güncel Çevre Sorunları” ve “Ekosistem Ekolojisi” konuları bu konuyla bire bir ilişkilidir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Temiz hava | %78 azot, %21 oksijen |
| Ozon tabakası | UV ışınları tutar |
| Asit yağmuru | $\text{SO}_2$ ve $\text{NO}_x$ |
| Sera etkisi | $\text{CO}_2$, $\text{CH}_4$ |
| Ozon incelmesi | CFC |
| Ötrofikasyon | Aşırı besin, oksijen azalması |
| Çözüm | Geri dönüşüm, temiz enerji, arıtma |

## Mini test

:::soru{cevap="E"}
Asit yağmurlarının oluşumunda en çok etkili olan gazlar aşağıdakilerin hangisinde verilmiştir?

- A) $\text{N}_2$ ve $\text{O}_2$
- B) $\text{CH}_4$ ve $\text{H}_2$
- C) $\text{He}$ ve $\text{Ar}$
- D) $\text{O}_3$ ve $\text{O}_2$
- E) $\text{SO}_2$ ve $\text{NO}_2$

---

1. Kükürt dioksit ve azot dioksit atmosferde su ile tepkimeye girerek sülfürik ve nitrik asit oluşturur.
2. Bu asitler yağmurla yere iner ve asit yağmuru oluşur.
3. Diğer gazlar asit yağmuruna neden olmaz. Doğru cevap E.

Diğer şıklar: **$\text{N}_2$ ve $\text{O}_2$** havanın ana bileşenleri, asit yağmuruna neden olmaz / **$\text{CH}_4$ ve $\text{H}_2$** sera etkisi ve yakıtla ilgili gazlar / **$\text{He}$ ve $\text{Ar}$** tepkimeye girmeyen soygazlar / **$\text{O}_3$ ve $\text{O}_2$** ozon ve oksijen, asit yağmuru oluşturmaz.
:::

:::soru{cevap="E"}
Ozon tabakasının incelmesine en çok neden olan madde grubu aşağıdakilerden hangisidir?

- A) Karbon dioksit
- B) Azot
- C) Su buharı
- D) Oksijen
- E) Kloroflorokarbonlar (CFC)

---

1. CFC'ler stratosfere ulaşınca ozonu parçalar.
2. Ozon incelince yeryüzüne ulaşan zararlı UV ışınları artar.
3. Doğru cevap E.

Diğer şıklar: **Karbon dioksit** sera etkisini artıran gazdır / **Azot** havanın ana gazı, ozonu parçalamaz / **Su buharı** doğal sera gazıdır, ozonu parçalamaz / **Oksijen** ozonun oluşumunda yer alır.
:::

:::soru{cevap="D"}
Aşağıdakilerden hangisi **sera gazı değildir**?

- A) Karbon dioksit ($\text{CO}_2$)
- B) Metan ($\text{CH}_4$)
- C) Diazot monoksit ($\text{N}_2\text{O}$)
- D) Azot ($\text{N}_2$)
- E) Su buharı

---

1. Sera gazları yeryüzünden yayılan ısıyı tutar: karbon dioksit, metan, diazot monoksit, su buharı.
2. Azot gazı bu ısıyı belirgin biçimde tutmaz, sera gazı değildir.
3. Doğru cevap D.

Diğer şıklar: **Karbon dioksit ($\text{CO}_2$)** fosil yakıt yanmasıyla artan temel sera gazı / **Metan ($\text{CH}_4$)** çöplük ve hayvancılıktan gelen sera gazı / **Diazot monoksit ($\text{N}_2\text{O}$)** tarımdan gelen sera gazı / **Su buharı** doğal sera gazı.
:::

:::soru{cevap="C"}
Bir gölde tarım gübrelerinin suya karışması sonucu su bitkileri ve algler aşırı çoğalıyor. Bu durumun sonucunda gölde aşağıdakilerden hangisi görülür?

- A) Çözünmüş oksijen artar ve balık sayısı artar.
- B) Suyun pH değeri değişmez ve yaşam etkilenmez.
- C) Çözünmüş oksijen azalır ve balıklar ölebilir.
- D) Ozon tabakası incelir.
- E) Gölde asit yağmuru oluşur.

---

1. Gübre gibi besin maddeleri suya karışınca algler ve su bitkileri aşırı çoğalır (ötrofikasyon).
2. Ölen bitkiler çürürken çözünmüş oksijeni tüketir, balıklar ölebilir.
3. Doğru cevap C.

Diğer şıklar: **Çözünmüş oksijen artar ve balık sayısı artar.** bitkiler ölüp çürüyünce oksijen azalır / **Suyun pH değeri değişmez ve yaşam etkilenmez.** aşırı çoğalma dengeyi bozar / **Ozon tabakası incelir.** bu atmosfer sorunudur / **Gölde asit yağmuru oluşur.** asit yağmuru hava kirliliğinin sonucudur.
:::

## Kendini dene

:::dene
1. Havanın yaklaşık yüzde kaçı azottur? => Yaklaşık %78.
2. Ozon tabakası hangi ışınları tutar? => Zararlı morötesi (UV) ışınları.
3. Asit yağmurlarına hangi gazlar neden olur? => $\text{SO}_2$ ve $\text{NO}_x$.
4. Ozon tabakasını hangi maddeler inceltir? => CFC’ler.
5. Geri dönüşümün bir faydası nedir? => Hammadde ve enerji tasarrufu sağlar, çöp miktarını azaltır.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-kim' and name = 'Doğa ve Kimya'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Havanın bileşimi, atmosfer katmanları, ozon tabakası, hava kirliliği, asit yağmuru, sera etkisi, ozon incelmesi, su ve toprak kirliliği, ötrofikasyon, geri dönüşüm, katalitik konvertör, yeşil kimya. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür.
Kontrol edilecekler: Havanın bileşim yüzdeleri yuvarlaktır. Üçüncü soruda negatif kök koyu yazıldı. Küresel ısınma tartışmalı bir konu değildir ama sayısal projeksiyonlar metne alınmadı.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Doğa ve Kimya'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir odun yandığında kül neden odundan çok daha hafiftir? Su neden her zaman aynı oranda hidrojen ve oksijen içerir? Kimyacılar tepkimelerin nasıl olduğunu anlamak için **tartmaya** başladılar ve kimyasal olayların birkaç temel kurala uyduğunu buldular. Bu konuda kütlenin korunumu, sabit oranlar ve katlı oranlar kanunlarını, bu kanunların hesaplarda nasıl kullanıldığını öğreneceksin.

:::hedefler
1. Kütlenin korunumu kanununu açıklamak ve uygulamak.
2. Sabit oranlar kanununu kullanarak tepkimeye giren ve oluşan madde miktarlarını hesaplamak.
3. Sınırlayıcı bileşeni ve artan maddeyi belirlemek.
4. Katlı oranlar kanununu açıklamak ve uygulamak.
5. Kanunlar arasındaki farkı yorumlamak.
:::

:::ipucu
Kanun sorularında **önce oranı bul**. Bileşikteki elementlerin kütle oranı sabittir (Proust). Verilen kütleleri bu orana göre karşılaştır. Hangi madde yetmiyorsa o **sınırlayıcıdır** ve ürün miktarını o belirler. Fazla olan madde tepkimeden sonra artar.
:::

## 1. Kütlenin korunumu (Lavoisier)

**Kimyasal tepkimelerde, tepkimeye giren maddelerin toplam kütlesi, oluşan maddelerin toplam kütlesine eşittir.** Kütle yoktan var olmaz, vardan yok olmaz. Atomlar yok olmaz ya da yeni atom oluşmaz, yalnızca **yeniden düzenlenir**.

**Örnek.** 12 g karbon ile 32 g oksijen tepkimeye girerse $12 + 32 = 44$ g karbon dioksit oluşur.

**Dikkat:** Kütle korunumu **kapalı kapta** gözlenir. Açık kapta yanan odunun külü daha hafif görünür çünkü oluşan gazlar (karbon dioksit, su buharı) atmosfere karışmıştır. Gazlar da tartılırsa toplam kütle korunur.

## 2. Sabit oranlar (Proust)

**Bir bileşiği oluşturan elementlerin kütleleri arasındaki oran, bileşiğin nereden ya da nasıl elde edildiğine bakılmaksızın sabittir.**

**Su ($\text{H}_2\text{O}$):** Hidrojenin oksijene kütlece oranı $\dfrac{m_H}{m_O} = \dfrac{1}{8}$ (kütlece 1 birim hidrojen ile 8 birim oksijen).

| Oluşan su | Hidrojen | Oksijen |
| --- | --- | --- |
| 9 g | 1 g | 8 g |
| 18 g | 2 g | 16 g |
| 36 g | 4 g | 32 g |

Bir bileşikte elementlerin kütlelerinin oranı sabit olduğu için **madde miktarını oranla büyütebilir ya da küçültebilirsin**.

**Sınırlayıcı bileşen:** Elementler tam oranda karışmazsa, bir tanesi yetmeyip **diğeri artar**. Yetmeyen madde (sınırlayıcı) ürün miktarını belirler.

**Örnek.** 4 g hidrojen ile 40 g oksijen tepkimeye giriyor. 4 g hidrojen $4 \cdot 8 = 32$ g oksijenle tepkimeye girer. Oksijenden $40 - 32 = 8$ g artar. Oluşan su $4 + 32 = 36$ g.

**Kütlece yüzde bileşim:** Suda hidrojen $\dfrac{1}{9} \cdot 100 \approx \%11{,}1$, oksijen $\dfrac{8}{9} \cdot 100 \approx \%88{,}9$’dur. Bu yüzde her su örneğinde aynıdır.

## 3. Katlı oranlar (Dalton)

**İki element birden fazla bileşik oluşturuyorsa, birinin sabit miktarına karşılık diğerinin farklı bileşiklerdeki kütleleri arasında basit ve tam sayılı bir oran vardır.**

**Örnek (karbon ve oksijen).**

| Bileşik | Karbon | Oksijen |
| --- | --- | --- |
| CO | 12 g | 16 g |
| $\text{CO}_2$ | 12 g | 32 g |

Karbonun kütlesi sabit (12 g) tutulunca oksijen kütleleri oranı $\dfrac{16}{32} = \dfrac{1}{2}$’dir. Bu basit ve tam sayılı bir orandır.

**Örnek (azot ve oksijen).** $\text{N}_2\text{O}$, NO, $\text{N}_2\text{O}_3$ bileşiklerinde 28 g azota karşılık oksijen kütleleri sırasıyla 16 g, 32 g, 48 g’dır. Oran $1 : 2 : 3$.

**Nasıl uygulanır:** Birinci elementin kütlesini her bileşikte **aynı yap**, sonra ikinci elementin kütlelerini oranla.

## 4. Üç kanunun karşılaştırması

| Kanun | Ne söyler? | Kullanımı |
| --- | --- | --- |
| Kütlenin korunumu | Tepkimede toplam kütle sabit | Ürün ya da girenin kütlesi hesabı |
| Sabit oranlar | Bir bileşikte kütle oranı sabit | Tepkime miktarları ve sınırlayıcı |
| Katlı oranlar | Aynı iki elementten oluşan bileşiklerde basit tam sayı oranı | Farklı bileşikleri karşılaştırma |

:::neden-sonuc
- Kapalı kapta tepkime oluyor => Toplam kütle değişmez.
- Elementler tam oranda karışmamış => Birisi artar.
- Aynı iki elementten farklı bileşikler => Kütleler basit tam sayı oranındadır.
- Bir bileşiğin farklı örnekleri => Element kütle oranı aynıdır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Tepkimeye giren maddelerin her zaman tamamen harcandığını sanmak** en sık yapılan hatadır. Oranlar tutmazsa biri artar. Ürün kütlesini bulurken verilen kütlelerin **toplamını** değil, **tepkimeye giren kütlelerin** toplamını al. Bir de **sabit oranlar ile katlı oranları karıştırma**: Sabit oranlar tek bir bileşiği, katlı oranlar aynı iki elementin farklı bileşiklerini kapsar.
:::

:::baglanti
Bu kanunlar, “Mol Kavramı” ve “Kimyasal Tepkimeler ve Hesaplamalar” konularındaki sayısal sorulara temel olur: Denkleştirilmiş tepkimede kütleler yine oranlıdır. “Atom ve Periyodik Sistem” konusundaki atomun yapısı, bu kanunların atomun varlığına dayandığını gösterir.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Kütle korunumu | Girenlerin kütlesi = ürünlerin kütlesi |
| Sabit oranlar | Suda $m_H / m_O = 1/8$ |
| Sınırlayıcı | Önce biten madde |
| Katlı oranlar | Sabit element, basit tam sayı oranı |
| Kapalı kap | Kütle korunumunu gözlemlemek için |

## Mini test

:::soru{cevap="E"}
Magnezyum ile oksijenin kütlece birleşme oranı $\dfrac{m_{Mg}}{m_O} = \dfrac{3}{2}$’dir. 12 g magnezyum ile 10 g oksijen tam verimle tepkimeye sokulursa kaç gram magnezyum oksit oluşur?

- A) 8
- B) 10
- C) 12
- D) 19
- E) 20

---

1. 12 g Mg için gereken oksijen $12 \cdot \dfrac{2}{3} = 8\ \text{g}$.
2. Oksijenden $10 - 8 = 2\ \text{g}$ artar. Sınırlayıcı magnezyumdur.
3. Oluşan MgO: $12 + 8 = 20\ \text{g}$. Doğru cevap E.

Diğer şıklar: **8** harcanan oksijen kütlesi alınmış / **10** işlem hatasıyla yarısı bulunmuş / **12** yalnızca magnezyum kütlesi alınmış / **19** işlem hatasıyla bir eksik bulunmuş.
:::

:::soru{cevap="A"}
Hidrojen ile oksijenin su oluştururken kütlece birleşme oranı $\dfrac{m_H}{m_O} = \dfrac{1}{8}$’dir. 2 g hidrojen ile 20 g oksijen tepkimeye giriyor. Tepkime sonunda aşağıdakilerden hangisi gözlenir?

- A) 18 g su oluşur ve 4 g oksijen artar.
- B) 22 g su oluşur ve madde artmaz.
- C) 18 g su oluşur ve 2 g hidrojen artar.
- D) 20 g su oluşur ve 2 g hidrojen artar.
- E) 2 g su oluşur ve 18 g oksijen artar.

---

1. 2 g hidrojen için gereken oksijen $2 \cdot 8 = 16\ \text{g}$.
2. Oksijenden $20 - 16 = 4\ \text{g}$ artar.
3. Oluşan su $2 + 16 = 18\ \text{g}$. Doğru cevap A.

Diğer şıklar: **22 g su oluşur ve madde artmaz.** oranlar tutmuyor, madde artar / **18 g su oluşur ve 2 g hidrojen artar.** artan madde oksijendir / **20 g su oluşur ve 2 g hidrojen artar.** hem su kütlesi hem artan madde yanlış / **2 g su oluşur ve 18 g oksijen artar.** sınırlayıcı hidrojen tamamen harcanır.
:::

:::soru{cevap="E"}
X ve Y elementlerinden oluşan iki bileşikten birinde 14 g X ile 8 g Y, diğerinde 14 g X ile 24 g Y birleşmiştir. Bu bileşiklerde sabit miktardaki X ile birleşen Y kütlelerinin oranı kaçtır?

- A) 3/1
- B) 2/3
- C) 1/2
- D) 3/2
- E) 1/3

---

1. X'in kütlesi iki bileşikte de 14 g, yani sabit.
2. Y kütleleri oranı $\dfrac{8}{24} = \dfrac{1}{3}$. Bu basit ve tam sayılı bir orandır (katlı oranlar kanunu).
3. Doğru cevap E.

Diğer şıklar: **3/1** oran ters yazılmış / **2/3** kütleler arasında yanlış sadeleştirme yapılmış / **1/2** yanlış sadeleştirme yapılmış / **3/2** oran ters ve yanlış yazılmış.
:::

:::soru{cevap="B"}
Hidrojen ile oksijenin su oluştururken kütlece birleşme oranı $\dfrac{m_H}{m_O} = \dfrac{1}{8}$’dir. 36 g su elde etmek için en az kaç gram hidrojen gerekir?

- A) 2
- B) 4
- C) 8
- D) 32
- E) 36

---

1. Suyun $\dfrac{1}{9}$’u hidrojen, $\dfrac{8}{9}$’u oksijendir.
2. 36 g suda hidrojen $\dfrac{36}{9} = 4\ \text{g}$. Doğru cevap B.

Diğer şıklar: **2** su 18 g sanılmış / **8** oksijen oranı alınmış / **32** gereken oksijen kütlesi alınmış / **36** su kütlesi alınmış.
:::

## Kendini dene

:::dene
1. 8 g X ile 2 g Y tepkimeye giriyor. Kaç g ürün oluşur? => $8 + 2 = 10$ g.
2. Suda hidrojen ile oksijenin kütlece oranı kaçtır? => $1 / 8$.
3. 18 g su elde etmek için kaç g hidrojen gerekir? => 2 g.
4. CO ve $\text{CO}_2$ bileşiklerinde karbonun kütlesi sabit olduğunda oksijen kütleleri oranı kaçtır? => $1 : 2$.
5. Kütle korunumu hangi tür kapta gözlenir? => Kapalı kapta.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-kim' and name = 'Kimyanın Temel Kanunları'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Kütlenin korunumu, sabit oranlar, katlı oranlar kanunları, sınırlayıcı bileşen, kütlece yüzde bileşim. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Sayısal sonuçlar betikle doğrulandı.
Kontrol edilecekler: Hacim oranları (Gay-Lussac) metne alınmadı. Üçüncü sorudaki seçenekler kesir olarak yazıldı.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Kimyanın Temel Kanunları'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir deste kâğıtta 12 değil 52 kâğıt, bir düzine yumurtada 12 yumurta vardır. Kimyada atomlar ve moleküller o kadar küçüktür ki tek tek saymak imkânsızdır. Kimyacılar bunun yerine **mol** adı verilen büyük bir “deste”yi kullanır. Mol, tartılabilen miktar ile saymak istediğimiz atom sayısı arasında köprü kurar. Bu konuda mol kavramını, Avogadro sayısını, molar kütleyi, mol-kütle-tanecik-hacim dönüşümlerini ve kimyasal formüllerden mol hesabını öğreneceksin.

:::hedefler
1. Mol ve Avogadro sayısı kavramlarını açıklamak.
2. Atom ve molekül kütlelerinden molar kütleyi hesaplamak.
3. Kütle, mol ve tanecik sayısı arasında dönüşüm yapmak.
4. Gazların normal koşullardaki hacmini mol ile ilişkilendirmek.
5. Bileşik formülünden atom mol sayısını bulmak.
:::

:::ipucu
Mol sorularında **önce her şeyi mole çevir**. Kütle veriliyorsa molar kütleye böl, tanecik sayısı veriliyorsa Avogadro sayısına böl, gaz hacmi veriliyorsa 22,4’e böl. Mol sayısını bulduktan sonra istenen büyüklüğe geç. Bu dönüşüm zinciri hemen her sorunun çözümüdür.
:::

## 1. Mol ve Avogadro sayısı

**1 mol**, içinde **$6{,}02 \cdot 10^{23}$ tane** tanecik (atom, molekül, iyon) bulunan madde miktarıdır. Bu sayıya **Avogadro sayısı** ($N_A$) denir.

- 1 mol karbon atomunda $6{,}02 \cdot 10^{23}$ atom vardır.
- 1 mol su molekülünde $6{,}02 \cdot 10^{23}$ molekül vardır.
- Mol, **tanecik sayısını** gösteren bir birimdir.

**Neden bu sayı?** 1 mol maddenin gram cinsinden kütlesi, o maddenin **atom ya da molekül kütlesine** sayısal olarak eşit olacak şekilde seçilmiştir.

## 2. Molar kütle

1 mol maddenin gram cinsinden kütlesine **molar kütle ($M$)** denir. Birimi g/mol’dür.

**Bazı atom kütleleri (g/mol):** H = 1, C = 12, N = 14, O = 16, Na = 23, Mg = 24, Al = 27, S = 32, Cl = 35,5, K = 39, Ca = 40, Fe = 56, Cu = 64.

**Bileşiğin molar kütlesi**, atomların molar kütlelerinin toplamıdır:

| Madde | Hesap | Molar kütle |
| --- | --- | --- |
| $\text{H}_2\text{O}$ | $2 \cdot 1 + 16$ | 18 g/mol |
| $\text{CO}_2$ | $12 + 2 \cdot 16$ | 44 g/mol |
| $\text{NH}_3$ | $14 + 3 \cdot 1$ | 17 g/mol |
| NaCl | $23 + 35{,}5$ | 58,5 g/mol |
| $\text{CH}_4$ | $12 + 4 \cdot 1$ | 16 g/mol |

## 3. Mol dönüşümleri

![Mol sayısı merkezde. Kütle ile molar kütle, tanecik sayısı ile Avogadro sayısı, hacim ile 22,4 arasında dönüşüm yapılır](/lessons/tyt-kim/mol-koprusu.svg "Mol köprüsü | Yolumnet")

| Dönüşüm | Formül |
| --- | --- |
| Kütle ve mol | $n = \dfrac{m}{M}$ |
| Tanecik sayısı ve mol | $N = n \cdot N_A$ |
| Gaz hacmi ve mol (NK) | $V = n \cdot 22{,}4$ |

**Normal koşullar (NK):** 0 °C ve 1 atm. Burada **1 mol ideal gaz 22,4 L** hacim kaplar.

**Örnek 1.** 36 g suyun mol sayısı $\dfrac{36}{18} = 2\ \text{mol}$. Molekül sayısı $2 \cdot 6{,}02 \cdot 10^{23} = 1{,}204 \cdot 10^{24}$.

**Örnek 2.** 11 g $\text{CO}_2$ gazının mol sayısı $\dfrac{11}{44} = 0{,}25\ \text{mol}$. NK’da hacmi $0{,}25 \cdot 22{,}4 = 5{,}6\ \text{L}$.

**Örnek 3.** $3{,}01 \cdot 10^{23}$ tane demir atomu $\dfrac{3{,}01 \cdot 10^{23}}{6{,}02 \cdot 10^{23}} = 0{,}5\ \text{mol}$ eder. Kütlesi $0{,}5 \cdot 56 = 28\ \text{g}$.

## 4. Formülden atom sayısı

Bir bileşiğin formülü **atom sayılarını** (ve atom mol oranlarını) gösterir. 1 mol $\text{NH}_3$ molekülünde 1 mol N atomu ve 3 mol H atomu, toplam 4 mol atom vardır.

**Örnek.** 3,4 g $\text{NH}_3$ ($M = 17$) $\dfrac{3{,}4}{17} = 0{,}2\ \text{mol}$ eder. Toplam atom mol sayısı $0{,}2 \cdot 4 = 0{,}8\ \text{mol}$, atom sayısı $0{,}8 \cdot 6{,}02 \cdot 10^{23} = 4{,}816 \cdot 10^{23}$.

**Karşılaştırma:** Aynı mol sayısına sahip maddelerin tanecik sayısı eşittir. Kütleleri ise molar kütleleriyle orantılıdır. Aynı kütleli maddelerde molar kütlesi küçük olanın mol sayısı daha büyüktür.

## 5. Kütlece yüzde bileşim

Bir bileşikteki elementin kütlece yüzdesi: $\dfrac{\text{elementin toplam kütlesi}}{\text{bileşiğin molar kütlesi}} \cdot 100$. Örneğin suda ($M = 18$) hidrojenin kütlece yüzdesi $\dfrac{2}{18} \cdot 100 \approx \%11{,}1$’dir.

:::neden-sonuc
- Kütle veriliyor => Molar kütleye bölerek mol bulunur.
- Tanecik sayısı veriliyor => Avogadro sayısına bölerek mol bulunur.
- Gaz hacmi NK’da veriliyor => 22,4’e bölerek mol bulunur.
- Mol sayısı biliniyor => Hangi büyüklük istenirse ona çevrilir.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Molar kütle ile atom sayısını karıştırmak** sık yapılan bir hatadır. Molar kütle bir mol maddenin gram cinsinden kütlesidir. Tanecik sayısı için Avogadro sayısı gerekir. Ayrıca **22,4 L değerini her koşulda kullanmak** yanlıştır: Yalnızca normal koşullarda (0 °C, 1 atm) 1 mol gaz 22,4 L hacim kaplar. Bir de **molekül sayısı ile atom sayısını karıştırma**: 1 mol $\text{NH}_3$’te 1 mol molekül ama 4 mol atom vardır.
:::

:::baglanti
Mol, “Kimyanın Temel Kanunları” konusundaki kütle oranlarını sayısal hesaplara taşır. “Kimyasal Tepkimeler ve Hesaplamalar” ve “Karışımlar” konularında derişim hesaplarında sürekli kullanılır. “Maddenin Halleri” konusundaki ideal gaz denklemi, gazların mol sayısıyla hacim ilişkisini genelleştirir.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| 1 mol | $6{,}02 \cdot 10^{23}$ tanecik |
| Molar kütle | Atom kütlelerinin toplamı, g/mol |
| $n = m / M$ | Kütleden mol |
| $N = n N_A$ | Moleden tanecik |
| $V = n \cdot 22{,}4$ | NK’da gaz hacmi |
| Atom sayısı | Formüldeki atom sayısı çarpılır |

## Mini test

:::soru{cevap="A"}
9 gram su ($\text{H}_2\text{O}$) kaç mol su molekülü içerir? ($\text{H}$: 1, $\text{O}$: 16)

- A) $0,5$
- B) $2$
- C) $9$
- D) $18$
- E) $162$

---

1. Suyun molar kütlesi $M = 2 \cdot 1 + 16 = 18\ \text{g/mol}$.
2. $n = \dfrac{m}{M} = \dfrac{9}{18} = 0{,}5\ \text{mol}$. Doğru cevap A.

Diğer şıklar: **$2$** molar kütle kütleye bölünmüş / **$9$** kütle mol sanılmış / **$18$** molar kütle mol sanılmış / **$162$** kütle ile molar kütle çarpılmış.
:::

:::soru{cevap="B"}
0,5 mol $\text{NH}_3$ gazındaki toplam atom sayısı aşağıdakilerden hangisidir? ($N_A$: Avogadro sayısı)

- A) $0{,}5 N_A$
- B) $2 N_A$
- C) $4 N_A$
- D) $1{,}5 N_A$
- E) $17 N_A$

---

1. 1 molekül $\text{NH}_3$ içinde $1 + 3 = 4$ atom vardır.
2. 0,5 mol molekülde $0{,}5 \cdot 4 = 2$ mol atom, yani $2 N_A$ atom vardır.
3. Doğru cevap B.

Diğer şıklar: **$0{,}5 N_A$** yalnızca molekül sayısı alınmış / **$4 N_A$** mol sayısı hesaba katılmamış, bir molekülün atom sayısı alınmış / **$1{,}5 N_A$** yalnızca hidrojen atom sayısı alınmış / **$17 N_A$** molar kütle mol gibi kullanılmış.
:::

:::soru{cevap="C"}
Normal koşullarda 11 gram $\text{CO}_2$ gazının hacmi kaç litredir? ($\text{C}$: 12, $\text{O}$: 16)

- A) $0,49$
- B) $2,8$
- C) $5,6$
- D) $11,2$
- E) $22,4$

---

1. $M_{CO_2} = 12 + 2 \cdot 16 = 44\ \text{g/mol}$ ve $n = \dfrac{11}{44} = 0{,}25\ \text{mol}$.
2. NK'da $V = 0{,}25 \cdot 22{,}4 = 5{,}6\ \text{L}$. Doğru cevap C.

Diğer şıklar: **$0,49$** kütle doğrudan 22,4’e bölünmüş (yaklaşık değer) / **$2,8$** mol sayısı yarıya bölünmüş / **$11,2$** 0,5 mol sanılmış / **$22,4$** 1 mol gazın hacmi alınmış.
:::

:::soru{cevap="E"}
Aşağıdaki maddelerden hangisinin mol sayısı en büyüktür? ($\text{H}$: 1, $\text{C}$: 12, $\text{O}$: 16)

- A) 44 g $\text{CO}_2$
- B) 16 g $\text{CH}_4$
- C) 32 g $\text{O}_2$
- D) 12 g C
- E) 36 g $\text{H}_2\text{O}$

---

1. Mol sayısı $n = \dfrac{m}{M}$.
2. $\text{H}_2\text{O}$: $36 / 18 = 2$ mol. $\text{CO}_2$: $44 / 44 = 1$, $\text{CH}_4$: $16 / 16 = 1$, $\text{O}_2$: $32 / 32 = 1$, C: $12 / 12 = 1$ mol.
3. En büyük mol sayısı $\text{H}_2\text{O}$'dadır. Doğru cevap E.

Diğer şıklar: **44 g $\text{CO}_2$** 1 mol / **16 g $\text{CH}_4$** 1 mol / **32 g $\text{O}_2$** 1 mol / **12 g C** 1 mol.
:::

## Kendini dene

:::dene
1. 4 g $\text{CH}_4$ ($M = 16$) kaç moldür? => $4 / 16 = 0{,}25$ mol.
2. 2 mol su molekülünde kaç tane molekül vardır? => $2 \cdot 6{,}02 \cdot 10^{23} = 1{,}204 \cdot 10^{24}$.
3. NK’da 44,8 L gaz kaç moldür? => $44{,}8 / 22{,}4 = 2$ mol.
4. 1 mol $\text{CO}_2$ kaç gramdır? => 44 g.
5. 0,5 mol $\text{H}_2\text{O}$ kaç mol atom içerir? => $0{,}5 \cdot 3 = 1{,}5$ mol atom.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 15, false from public.topics where subject_id = 'tyt-kim' and name = 'Mol Kavramı'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Mol kavramı, Avogadro sayısı, molar kütle, mol-kütle-tanecik-hacim dönüşümleri, normal koşullarda gaz hacmi, formülden atom sayısı, kütlece yüzde bileşim. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar betikle doğrulandı.
Kontrol edilecekler: Basit ve molekül formülü bulma metne alınmadı. Bu konuyu "Kimyasal Tepkimeler ve Hesaplamalar" ile birlikte çalışmak gerekir.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Mol Kavramı'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Mum yanar, demir paslanır, arabanın motorunda benzin yanar, midendeki asit antiasitle nötrleşir. Hepsi **kimyasal tepkimedir**: Bazı maddeler yok olur, yeni maddeler oluşur. Kimyasal tepkimeyi bir denklemle yazmayı ve bu denklemden **kaç gram ürün oluşacağını, hangi maddenin biteceğini** hesaplamayı bilmek, kimyanın en önemli becerilerinden biridir. Bu konuda tepkime türlerini, denklem denkleştirmeyi, mol hesaplarını, sınırlayıcı bileşeni, verimi ve tepkime ısısını öğreneceksin.

:::hedefler
1. Kimyasal tepkime türlerini (yanma, sentez, ayrışma, yer değiştirme, nötrleşme) tanımak.
2. Tepkime denklemlerini denkleştirmek.
3. Denkleştirilmiş denklemden mol ve kütle hesabı yapmak.
4. Sınırlayıcı bileşeni bulmak ve artan madde miktarını hesaplamak.
5. Verimi ve tepkime ısısını (ekzotermik, endotermik) yorumlamak.
:::

:::ipucu
Stokiyometri sorularında **dört adım** izle: Denklemi denkleştir, verilen maddeyi mole çevir, denklemdeki katsayı oranıyla istenen maddenin molünü bul, son olarak istenen birime (gram, litre, tanecik) çevir. Her adımı yazarak yaparsan hata azalır.
:::

## 1. Tepkime türleri

| Tür | Genel gösterim | Örnek |
| --- | --- | --- |
| Yanma | Madde + $\text{O}_2$ → oksitler (ısı, ışık) | $\text{CH}_4 + 2\text{O}_2 \to \text{CO}_2 + 2\text{H}_2\text{O}$ |
| Sentez (birleşme) | $\text{A} + \text{B} \to \text{AB}$ | $\text{N}_2 + 3\text{H}_2 \to 2\text{NH}_3$ |
| Ayrışma (analiz) | $\text{AB} \to \text{A} + \text{B}$ | $2\text{H}_2\text{O} \to 2\text{H}_2 + \text{O}_2$ |
| Yer değiştirme | $\text{A} + \text{BC} \to \text{AC} + \text{B}$ | $\text{Zn} + 2\text{HCl} \to \text{ZnCl}_2 + \text{H}_2$ |
| Nötrleşme | Asit + baz → tuz + su | $\text{HCl} + \text{NaOH} \to \text{NaCl} + \text{H}_2\text{O}$ |

## 2. Denkleştirme

Kütle korunumu nedeniyle **her elementin atom sayısı denklemin iki tarafında eşit** olmalıdır. Bunun için **katsayılar** kullanılır, **alt indisler** (formülün içindeki sayılar) değiştirilmez.

**Yöntem:** Önce en karmaşık bileşikteki elementi, sonra diğerlerini eşitle. En son oksijen ve hidrojeni dengele.

**Örnek.** $\text{Al} + \text{O}_2 \to \text{Al}_2\text{O}_3$

- Sağda 2 Al, solda 1 Al: Başa 2 yaz. $2\text{Al} + \text{O}_2 \to \text{Al}_2\text{O}_3$.
- Sağda 3 O, solda 2 O: En küçük ortak kat 6. Solda $3\text{O}_2$, sağda $2\text{Al}_2\text{O}_3$.
- Şimdi sağda 4 Al, solda 2 Al: Başa 4 yaz.

Denkleşmiş denklem: $4\text{Al} + 3\text{O}_2 \to 2\text{Al}_2\text{O}_3$. Katsayılar toplamı $4 + 3 + 2 = 9$.

**Kontrol:** Sol tarafta 4 Al, 6 O. Sağ tarafta $2 \cdot 2 = 4$ Al, $2 \cdot 3 = 6$ O.

## 3. Mol hesapları (stokiyometri)

Denklemdeki katsayılar **mol oranını** gösterir.

$$2\text{H}_2 + \text{O}_2 \to 2\text{H}_2\text{O}$$

2 mol $\text{H}_2$ + 1 mol $\text{O}_2$ → 2 mol $\text{H}_2\text{O}$ demektir. Kütleler: 4 g + 32 g → 36 g. Kütle korunmuştur.

**Örnek.** $\text{CH}_4 + 2\text{O}_2 \to \text{CO}_2 + 2\text{H}_2\text{O}$ tepkimesinde 16 g $\text{CH}_4$ yakılırsa kaç g $\text{CO}_2$ oluşur? ($\text{CH}_4$: 16, $\text{CO}_2$: 44)

1. $n_{CH_4} = \dfrac{16}{16} = 1\ \text{mol}$.
2. Denklemde 1 mol $\text{CH}_4$’ten 1 mol $\text{CO}_2$ oluşur.
3. $m_{CO_2} = 1 \cdot 44 = 44\ \text{g}$.

**Örnek (gaz).** NK’da 1 mol ürün gazı 22,4 L kaplar. 1 mol $\text{CO}_2$ NK’da 22,4 L.

## 4. Sınırlayıcı bileşen

Girenler denklemdeki oranda karışmazsa biri **tükenir**, diğeri artar. Tükenen madde **sınırlayıcı bileşendir** ve ürün miktarını belirler.

**Örnek.** $2\text{H}_2 + \text{O}_2 \to 2\text{H}_2\text{O}$ tepkimesinde 2 mol $\text{H}_2$ ile 2 mol $\text{O}_2$ karıştırılıyor.

- 2 mol $\text{H}_2$, 1 mol $\text{O}_2$ ile tepkimeye girer.
- $\text{H}_2$ tükenir, **sınırlayıcıdır**. $\text{O}_2$’den $2 - 1 = 1\ \text{mol}$ artar.
- 2 mol $\text{H}_2\text{O}$ oluşur.

**Bulma yöntemi:** Her girenin mol sayısını katsayısına böl. En küçük değeri veren madde sınırlayıcıdır. Yukarıda $\text{H}_2$: $2/2 = 1$, $\text{O}_2$: $2/1 = 2$. En küçük $\text{H}_2$’de.

## 5. Verim

Tepkimeden **teorik olarak** elde edilmesi gereken ürün miktarının ne kadarının **gerçekte** elde edildiğini gösterir:

$$\text{Verim} = \frac{\text{gerçek ürün}}{\text{teorik ürün}} \cdot 100$$

**Örnek.** Hesaba göre 36 g su oluşması gerekirken deneyde 27 g su elde ediliyorsa verim $\dfrac{27}{36} \cdot 100 = \%75$’tir.

## 6. Tepkime ısısı

![Ekzotermik tepkimede ürünlerin enerjisi girenlerden düşüktür ve ısı verilir. Endotermik tepkimede ürünlerin enerjisi daha yüksektir ve ısı alınır](/lessons/tyt-kim/tepkime-enerjisi.svg "Tepkime enerjisi | Yolumnet")

- **Ekzotermik (ısı veren):** Yanma, nötrleşme, çürüme, solunum. $\Delta H < 0$. Ortam ısınır.
- **Endotermik (ısı alan):** Fotosentez, suyun elektrolizi, buzun erimesi, amonyum nitratın suda çözünmesi. $\Delta H > 0$. Ortam soğur.

$\Delta H$, ürünlerin entalpisinden girenlerin entalpisinin çıkarılmasıyla bulunur. Ekzotermik tepkimeler genellikle kendiliğinden başlayıp devam eder, **aktivasyon enerjisi** adı verilen ilk enerji engelini aşmak için başlangıçta bir kıvılcım ya da ısı gerekebilir.

:::neden-sonuc
- Madde oksijenle yanıyor => Yanma tepkimesi, ısı verir.
- İki madde birleşip tek madde oluşturuyor => Sentez tepkimesi.
- Girenlerin mol oranı katsayılara uymuyor => Biri sınırlayıcı, diğeri artar.
- Gerçek ürün teorik üründen az => Verim yüzde 100’den düşüktür.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Denkleştirirken alt indisleri değiştirmek** en sık yapılan hatadır. $\text{H}_2\text{O}$’yu $\text{H}_2\text{O}_2$ yaparsan başka bir madde (hidrojen peroksit) yazmış olursun. Yalnızca **katsayıları** değiştir. Bir de **sınırlayıcı bileşeni en az kütleye sahip madde** sanma: Mol sayısını katsayıya böl, en küçük değer sınırlayıcıdır. Ürün hesabını sınırlayıcıya göre yap.
:::

:::baglanti
Bu konu, “Mol Kavramı” konusundaki dönüşümlerin kimyasal tepkimeye uygulanmasıdır. “Kimyanın Temel Kanunları” konusundaki kütle korunumu ve sabit oranlar, denkleştirmenin ve stokiyometrinin temelidir. Biyolojide “Hücre ve Organelleri” ve “Canlıların Temel Bileşenleri” konularında fotosentez ve solunum tepkimeleriyle yeniden karşına çıkar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Denkleştirme | Her elementin atom sayısı eşit, yalnızca katsayı |
| Katsayı | Mol oranını verir |
| Sınırlayıcı | Önce biten, ürünü belirler |
| Verim | Gerçek / teorik $\cdot$ 100 |
| Ekzotermik | Isı verir, $\Delta H < 0$ |
| Endotermik | Isı alır, $\Delta H > 0$ |

## Mini test

:::soru{cevap="D"}
$x\ \text{Al} + y\ \text{O}_2 \to z\ \text{Al}_2\text{O}_3$ tepkimesi en küçük tam sayılarla denkleştirildiğinde $x + y + z$ toplamı kaç olur?

- A) 5
- B) 6
- C) 7
- D) 9
- E) 18

---

1. Denkleşmiş denklem $4\text{Al} + 3\text{O}_2 \to 2\text{Al}_2\text{O}_3$.
2. Katsayılar toplamı $4 + 3 + 2 = 9$. Doğru cevap D.

Diğer şıklar: **5** $y$ ile $z$ toplanıp $x$ unutulmuş / **6** $x$ ile $z$ toplanıp $y$ unutulmuş / **7** $x$ ile $y$ toplanıp $z$ unutulmuş / **18** katsayılar iki katına çıkarılmış.
:::

:::soru{cevap="D"}
$\text{CH}_4 + 2\text{O}_2 \to \text{CO}_2 + 2\text{H}_2\text{O}$ tepkimesine göre 32 g $\text{CH}_4$ tamamen yakıldığında kaç gram $\text{CO}_2$ oluşur? ($\text{C}$: 12, $\text{H}$: 1, $\text{O}$: 16)

- A) 32
- B) 44
- C) 64
- D) 88
- E) 176

---

1. $n_{CH_4} = \dfrac{32}{16} = 2\ \text{mol}$.
2. Tepkimede 1 mol $\text{CH}_4$ 1 mol $\text{CO}_2$ oluşturur. 2 mol $\text{CO}_2$ oluşur.
3. $m = 2 \cdot 44 = 88\ \text{g}$. Doğru cevap D.

Diğer şıklar: **32** girenin kütlesi alınmış / **44** 1 mol CO₂ kütlesi alınmış / **64** iki mol oksijenin kütlesi alınmış / **176** oksijenin katsayısı fazladan çarpılmış.
:::

:::soru{cevap="D"}
$2\text{H}_2 + \text{O}_2 \to 2\text{H}_2\text{O}$ tepkimesi için 2 mol $\text{H}_2$ ile 2 mol $\text{O}_2$ karıştırılıp tepkimeye giriyor. Tepkime sonunda aşağıdakilerden hangisi gözlenir?

- A) 2 mol su oluşur ve 1 mol $\text{H}_2$ artar.
- B) 4 mol su oluşur ve madde artmaz.
- C) 1 mol su oluşur ve 1 mol $\text{O}_2$ artar.
- D) 2 mol su oluşur ve 1 mol $\text{O}_2$ artar.
- E) 2 mol su oluşur ve 2 mol $\text{O}_2$ artar.

---

1. Denklem oranı $2\ \text{H}_2 : 1\ \text{O}_2$. 2 mol $\text{H}_2$ için 1 mol $\text{O}_2$ yeter.
2. $\text{H}_2$ tükenir (sınırlayıcı), $2 - 1 = 1\ \text{mol}$ $\text{O}_2$ artar.
3. Oluşan su 2 mol. Doğru cevap D.

Diğer şıklar: **2 mol su oluşur ve 1 mol $\text{H}_2$ artar.** hidrojen sınırlayıcıdır, tamamen tükenir / **4 mol su oluşur ve madde artmaz.** oranlar tutmuyor, su 2 mol oluşur / **1 mol su oluşur ve 1 mol $\text{O}_2$ artar.** oluşan su 2 mol olmalı / **2 mol su oluşur ve 2 mol $\text{O}_2$ artar.** oksijenden 1 mol tepkimeye girer.
:::

:::soru{cevap="C"}
Bir tepkimede teorik olarak 36 g ürün oluşması beklenirken deneyde 27 g ürün elde ediliyor. Tepkimenin verimi yüzde kaçtır?

- A) 27
- B) 36
- C) 75
- D) 76
- E) 133

---

1. Verim $= \dfrac{\text{gerçek ürün}}{\text{teorik ürün}} \cdot 100$.
2. $\dfrac{27}{36} \cdot 100 = 75$. Verim %75'tir. Doğru cevap C.

Diğer şıklar: **27** gerçek ürün kütlesi yüzde sanılmış / **36** teorik ürün kütlesi yüzde sanılmış / **76** işlem hatasıyla bir fazla bulunmuş / **133** teorik ürün gerçek ürüne bölünmüş.
:::

## Kendini dene

:::dene
1. $\text{H}_2 + \text{Cl}_2 \to 2\text{HCl}$ tepkimesi hangi türdedir? => Sentez (birleşme).
2. $\text{Fe} + \text{O}_2 \to \text{Fe}_2\text{O}_3$ denkleminin katsayıları nedir? => $4\text{Fe} + 3\text{O}_2 \to 2\text{Fe}_2\text{O}_3$.
3. 2 mol $\text{H}_2$ yanarsa kaç mol su oluşur? => 2 mol.
4. Yanma tepkimeleri ekzotermik mi endotermik midir? => Ekzotermik.
5. Teorik 40 g ürün yerine 30 g elde edilirse verim kaçtır? => %75.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 16, false from public.topics where subject_id = 'tyt-kim' and name = 'Kimyasal Tepkimeler ve Hesaplamalar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Tepkime türleri, tepkime denkleştirme, stokiyometri, sınırlayıcı bileşen, verim, ekzotermik ve endotermik tepkimeler, aktivasyon enerjisi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar betikle doğrulandı.
Kontrol edilecekler: Entalpi hesapları ve tepkime hızı metne alınmadı. Denkleştirme örneğinde ara adımlar sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Kimyasal Tepkimeler ve Hesaplamalar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sabah içtiğin çay, denizin suyu, havadaki toz, çalkalamadan içilmeyen ilaç şurubu, süt, çorba. Günlük hayatta gördüğün maddelerin neredeyse hepsi **karışımdır**. Saf madde bulmak aslında zordur. Bu konuda karışımların nasıl sınıflandırıldığını, bir çözeltinin ne kadar **derişik** olduğunun nasıl hesaplandığını ve karışımların bileşenlerini hangi yöntemle ayırabileceğini öğreneceksin.

:::hedefler
1. Homojen ve heterojen karışımı, çözeltiyi ve doygunluğu ayırt etmek.
2. Kütlece yüzde ve molar derişim hesaplamak, seyreltme ve karıştırma sorularını çözmek.
3. Çözünürlüğün sıcaklık ve basınçla nasıl değiştiğini yorumlamak.
4. Karışımı ayırma yöntemini, karışımın özelliğine bakarak seçmek.
5. Kolloid, süspansiyon ve emülsiyonu birbirinden ayırmak.
:::

## 1. Karışım çeşitleri

Karışımda her madde kendi özelliğini korur ve bileşenler **fiziksel yöntemlerle** ayrılabilir. Bileşenlerin oranı değişebilir.

| Tür | Görünüm | Örnek |
| --- | --- | --- |
| Homojen karışım (çözelti) | Her yerde aynı, tek faz | Şekerli su, tuzlu su, hava, pirinç (alaşım) |
| Heterojen karışım | Bileşenler ayırt edilir, birden çok faz | Kum ve su, zeytinyağı ve su, salata |

**Çözelti**, homojen karışımın en bilinen halidir. Miktarı fazla olan **çözücü**, az olan **çözünendir**. Şekerli suda su çözücü, şeker çözünendir. Çözeltiler sıvı olmak zorunda değildir: Hava gaz çözeltisi, pirinç ise katı çözeltidir.

:::ipucu{baslik="Homojen mi heterojen mi"}
Kendine şunu sor: “Karışımın her yerinden aldığım örnek aynı mı?” Evetse homojendir. Süzgeçten geçmeyen taneler ya da iki ayrı tabaka görüyorsan heterojendir.
:::

## 2. Doygunluk

Belirli bir sıcaklıkta belirli miktar çözücünün çözebileceği madde miktarının bir sınırı vardır.

- **Doymamış çözelti:** Daha fazla çözünen madde çözebilir.
- **Doygun çözelti:** Aynı sıcaklıkta daha fazla çözemez, ekleneni dibe çöker.
- **Aşırı doygun çözelti:** Normalde çözünebileceğinden fazlasını kararsız biçimde içerir, çok az bir etkiyle fazlası çöker.

Bir maddenin **çözünürlüğü**, belirli sıcaklıkta 100 g çözücüde çözünebilen en fazla madde miktarıdır. Çözünürlük **sıcaklığa** bağlıdır:

- Katıların çoğu için sıcaklık arttıkça çözünürlük artar. Sıcak çayda şeker daha kolay çözünür.
- **Gazlar** için sıcaklık arttıkça çözünürlük **azalır**. Ilınan gazozdan gaz çıkması, ısınan göllerde balıkların çözünmüş oksijen sıkıntısı çekmesi bu yüzdendir.
- Gazların çözünürlüğü **basınçla artar**. Gazozun kapağı kapalıyken karbondioksit çözünmüş durumdadır, kapak açılınca basınç düşer ve gaz kabarcık olarak çıkar.

## 3. Derişim hesapları

Çözeltinin ne kadar “güçlü” olduğunu derişim gösterir. Aynı çözeltiyi birkaç biçimde ifade edebilirsin.

### Kütlece yüzde

$$\%\text{ derişim} = \frac{\text{çözünen kütlesi}}{\text{çözelti kütlesi}} \cdot 100$$

Paydada **çözelti kütlesi** vardır, yani çözünen ile çözücünün toplamı. Çözücü kütlesini yazmak sık yapılan bir hatadır.

**Örnek.** 20 g tuz 80 g suda çözülürse çözelti 100 g olur. Derişim $\dfrac{20}{100} \cdot 100 = \%20$ olur.

### Molarite

$$M = \frac{n}{V\ (\text{litre})}$$

Birimi mol/L’dir. Hacim **litre** olarak yazılır.

**Örnek.** 20 g NaOH (mol kütlesi 40 g/mol) suda çözünüp 500 mL çözelti hazırlanıyor. Mol sayısı $\dfrac{20}{40} = 0{,}5$ mol, hacim $0{,}5$ L. Molarite $\dfrac{0{,}5}{0{,}5} = 1\ \text{M}$.

### Seyreltme

Çözeltiye su eklendiğinde **çözünen mol sayısı değişmez**, hacim artar, derişim düşer.

$$M_1 \cdot V_1 = M_2 \cdot V_2$$

**Örnek.** 3 M 50 mL çözeltiye su ekleyerek 1 M yapmak istiyoruz. $3 \cdot 50 = 1 \cdot V_2$, $V_2 = 150$ mL. Eklenecek su $150 - 50 = 100$ mL.

### Karıştırma

Aynı maddenin farklı derişimli iki çözeltisi karıştırılırsa **mol sayıları toplanır, hacimler toplanır**.

$$M_{son} = \frac{M_1 V_1 + M_2 V_2}{V_1 + V_2}$$

**Örnek.** 1 M 100 mL ile 2 M 300 mL çözelti karıştırılıyor. Mol sayısı $0{,}1 \cdot 1 + 0{,}3 \cdot 2 = 0{,}7$ mol, hacim $0{,}4$ L. Son derişim $\dfrac{0{,}7}{0{,}4} = 1{,}75\ \text{M}$.

:::neden-sonuc
- Çözeltiye su ekleniyor => Çözünen mol sayısı sabit kalır, derişim düşer.
- Gazlı içecek ısıtılıyor => Gazın çözünürlüğü azalır, gaz kabarcıkları çıkar.
- Kütlece yüzde bulunurken çözelti kütlesi kullanılıyor => Çözünen ve çözücünün toplamı paydaya yazılır.
- Dibinde çökelti olan çözeltiye aynı sıcaklıkta madde ekleniyor => Çözelti doygundur, ekleneni çözmez.
:::

## 4. Karışımları ayırma yöntemleri

Karışımın bileşenleri farklı **fiziksel özelliklere** sahiptir. Ayırma yöntemi bu farktan yararlanır.

| Karışım | Yöntem | Dayandığı fark |
| --- | --- | --- |
| Kum ve su | Süzme | Tanecik boyutu |
| Su ve benzin | Ayırma hunisi | Yoğunluk, karışmama |
| Tuzlu su | Buharlaştırma, kristallendirme | Kaynama noktası, çözünürlük |
| Su ve etil alkol | Ayrımsal damıtma | Kaynama noktası |
| Demir tozu ve kum | Mıknatısla ayırma | Manyetik özellik |
| Büyük ve küçük taneler | Eleme | Tanecik boyutu |
| Mürekkepteki renkler | Kromatografi | Çözücüde ilerleme hızı |
| İyot ve kum | Süblimleştirme | Süblimleşme yeteneği |

### Damıtma

Kaynama noktaları farklı, birbiri içinde çözünen sıvılar **damıtma** ile ayrılır. Düşük kaynama noktalı sıvı önce buharlaşır, **soğutucuda** yeniden yoğunlaşır ve toplama kabında birikir.

![Basit damıtma düzeneğinde karışım ısıtılır, buhar soğutucuda yoğunlaşır ve saf sıvı toplama kabında birikir](/lessons/tyt-kim/damitma.svg "Basit damıtma düzeneği | Yolumnet")

- Su ($100\ ^\circ\text{C}$) ve etil alkol ($78\ ^\circ\text{C}$) karışımı ısıtılınca alkol önce buharlaşır.
- Kaynama noktaları arasındaki fark azsa **ayrımsal damıtma** kullanılır. Düzenekteki ayırma kolonu buharı defalarca yoğunlaştırıp yeniden buharlaştırır.
- Ham petrolün benzin, mazot ve gazyağı gibi bileşenlere ayrılması ayrımsal damıtmayla yapılır.

Damıtma sırasında kaynayan karışımın sıcaklığı **sabit kalmaz**, çünkü bileşim değişir. Saf sıvı kaynarken sıcaklık sabittir. Bu fark, karışımla saf maddeyi ayırt etmek için kullanılır.

## 5. Kolloid, süspansiyon ve emülsiyon

Çözelti ile kaba heterojen karışım arasında kalan sistemler vardır.

| Tür | Parçacık | Özellik | Örnek |
| --- | --- | --- | --- |
| Çözelti | Çok küçük | Işığı saçmaz, çökmez | Şekerli su |
| Kolloid | Orta boyutlu | Işığı saçar (Tyndall etkisi), çökmez | Sis, jöle, boya |
| Süspansiyon | Büyük | Bekletilince çöker, süzülebilir | Çamurlu su, çalkalanan şurup |
| Emülsiyon | Birbiri içinde karışmayan sıvı damlacıkları | Zamanla ayrılabilir | Süt, mayonez, yağlı su |

**Tyndall etkisi:** Kolloid içinden geçen ışık huzmesi parçacıklara çarpıp saçıldığı için görülür. Sisli havada far ışığının yolunun görünmesi buna örnektir.

:::ipucu{baslik="Sık yapılan hata"}
**Saf madde ile homojen karışımı karıştırma.** Tuzlu su homojendir ama saf değildir, çünkü iki farklı maddeden oluşur ve fiziksel yöntemle ayrılır. Saf maddenin kaynama noktası sabittir, tuzlu suyun ise kaynarken yükselir. Bir de **kütlece yüzde hesabında paydaya çözücü kütlesini yazma**, çözelti kütlesini yaz.
:::

:::baglanti
Bu konu, “Maddenin Halleri” konusundaki hal değişimi, kaynama ve yoğunlaşma kavramlarını kullanır. “Mol Kavramı” konusundaki mol hesabı molarite için gereklidir. “Asitler, Bazlar ve Tuzlar” konusunda çözeltilerin derişimi pH ile birlikte karşına çıkar. Biyolojide “Hücre Zarından Madde Geçişi” konusunda derişim farkı ve seyreltik, derişik ortam kavramları yeniden kullanılır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Çözelti | Homojen karışım, çözücü ve çözünen |
| Kütlece yüzde | Çözünen / çözelti $\cdot$ 100 |
| Molarite | Mol / hacim (L) |
| Seyreltme | $M_1 V_1 = M_2 V_2$ |
| Gaz çözünürlüğü | Sıcaklıkla azalır, basınçla artar |
| Damıtma | Kaynama noktası farkı |
| Ayırma hunisi | Karışmayan sıvılar, yoğunluk farkı |
| Süspansiyon | Bekleyince çöker |

## Mini test

:::soru{cevap="A"}
30 g şeker 120 g suda çözülerek şerbet hazırlanıyor. Şerbetin kütlece yüzde derişimi kaçtır?

- A) 20
- B) 25
- C) 30
- D) 80
- E) 400

---

1. Çözelti kütlesi $30 + 120 = 150\ \text{g}$.
2. Derişim $\dfrac{30}{150} \cdot 100 = 20$. Doğru cevap A.

Diğer şıklar: **25** çözücü kütlesi paydaya yazılmış (30/120) / **30** şekerin kütlesi yüzde sanılmış / **80** suyun yüzdesi bulunmuş / **400** oran ters yazılmış (120/30).
:::

:::soru{cevap="D"}
2 M derişimli 100 mL sulu çözeltiye su eklenerek derişimi 0,5 M'a düşürülüyor. Çözeltiye kaç mL su eklenmiştir?

- A) 25
- B) 100
- C) 200
- D) 300
- E) 400

---

1. Seyreltmede çözünen mol sayısı sabittir: $M_1 V_1 = M_2 V_2$.
2. $2 \cdot 100 = 0{,}5 \cdot V_2$, $V_2 = 400\ \text{mL}$.
3. Eklenen su $400 - 100 = 300\ \text{mL}$. Doğru cevap D.

Diğer şıklar: **25** derişimlerin oranı ters kurulmuş / **100** başlangıç hacmi alınmış / **200** başlangıç hacmi 2 ile çarpılmış / **400** son hacim eklenen su sanılmış.
:::

:::soru{cevap="A"}
1 M 200 mL sulu çözelti ile 4 M 200 mL sulu çözelti karıştırılıyor. Karışımın molar derişimi kaç M olur?

- A) 2,5
- B) 5
- C) 1,25
- D) 4
- E) 0,4

---

1. Toplam mol sayısı $0{,}2 \cdot 1 + 0{,}2 \cdot 4 = 1{,}0\ \text{mol}$.
2. Toplam hacim $0{,}4\ \text{L}$.
3. $M = \dfrac{1{,}0}{0{,}4} = 2{,}5\ \text{M}$. Doğru cevap A.

Diğer şıklar: **5** derişimler toplanmış / **1,25** hacimler iki kez toplanmış (1 mol / 0,8 L) / **4** büyük derişim alınmış / **0,4** hacim litre cinsinden yazılmış.
:::

:::soru{cevap="C"}
Su ve zeytinyağı karışımı bir kapta bekletilince üst üste iki tabaka oluşuyor. Bu iki sıvıyı birbirinden ayırmak için hangi düzenek kullanılır?

- A) Süzgeç kâğıdı ve huni
- B) Mıknatıs
- C) Ayırma hunisi
- D) Elek
- E) Kristallendirme kabı

---

1. Su ve zeytinyağı birbiri içinde çözünmez, yoğunlukları farklıdır, ayrı tabakalar oluşur.
2. Alttaki sıvı ayırma hunisinin musluğundan akıtılır. Doğru cevap C.

Diğer şıklar: **Süzgeç kâğıdı ve huni** süzme sıvıyı sıvıdan ayırmaz / **Mıknatıs** ikisi de manyetik değildir / **Elek** elek katı taneleri ayırır / **Kristallendirme kabı** kristallendirme çözünmüş katı içindir.
:::

## Kendini dene

:::dene
1. Tuzlu su homojen midir heterojen midir? => Homojen, çünkü her yerde aynıdır.
2. Çözeltiye su eklenirse çözünenin mol sayısı değişir mi? => Hayır, değişmez. Hacim artar, derişim düşer.
3. Ilınan gazozdan neden gaz çıkar? => Sıcaklık artınca gazın çözünürlüğü azalır.
4. Bozuk paralar ile demir tozu karışımından demiri hangi yöntemle ayırırsın? => Mıknatısla.
5. 10 g şeker 40 g suda çözülürse kütlece yüzde kaçtır? => %20.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-kim' and name = 'Karışımlar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Homojen ve heterojen karışımlar, çözelti, doygunluk, çözünürlük, derişim (kütlece yüzde, molarite), seyreltme, ayırma yöntemleri, kolloid, süspansiyon, emülsiyon. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Sayısal sonuçlar betikle doğrulandı. Su ve etil alkolün kaynama noktaları (100 ve 78 derece) standart değerlerdir.
Kontrol edilecekler: Aşırı doygun çözelti ve emülsiyonun kolloidlerle ilişkisi sadeleştirildi. Kolligatif özellikler metne alınmadı.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Karışımlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Limonun ekşiliği, sirkenin keskin kokusu, sabunun kaygan hissi, mide yanması olunca içilen antiasit, kireç çözücü ya da lavabo açıcı. Bunların hepsi ya **asit** ya da **bazdır**. Sofra tuzu ise bir **tuzdur** ve asit ile bazın tepkimesinden oluşabilir. Bu konuda asit ve bazın ne olduğunu, **pH ölçeğini**, indikatörleri, nötrleşmeyi ve tuzları öğreneceksin.

:::hedefler
1. Asit, baz ve tuzu tanımlamak, günlük hayattan örnekler vermek.
2. İndikatörlerin asit ve bazda gösterdiği renkleri bilmek.
3. pH ölçeğini yorumlamak, pH ile H⁺ derişimi arasındaki ilişkiyi kullanmak.
4. Güçlü ve zayıf asit, baz ayrımını yapmak.
5. Nötrleşme tepkimesini yazmak ve basit nötrleşme hesabı yapmak.
:::

:::ipucu{baslik="Güvenlik"}
Asit ve bazları **asla tatma, koklama ya da çıplak elle tutma**. Derişik asit ve baz deriyi yakar. Aşağıdaki tablodaki ekşi ve kaygan ifadeleri, yalnızca günlük hayattaki seyreltik örnekleri (limon, sabun) anlatmak içindir.
:::

## 1. Asit ve baz nedir

**Arrhenius tanımına** göre:

- **Asit:** Suda çözündüğünde ortama $\text{H}^+$ iyonu veren maddedir. Örnek: $\text{HCl}$, $\text{HNO}_3$, $\text{H}_2\text{SO}_4$, $\text{CH}_3\text{COOH}$ (sirke asidi).
- **Baz:** Suda çözündüğünde ortama $\text{OH}^-$ iyonu veren maddedir. Örnek: $\text{NaOH}$, $\text{KOH}$, $\text{Ca(OH)}_2$. Amonyak ($\text{NH}_3$) formülünde OH yoktur ama suyla tepkimeye girerek $\text{OH}^-$ oluşturur.

| Özellik | Asit | Baz |
| --- | --- | --- |
| Tat (seyreltik, günlük örnek) | Ekşi | Acı |
| His | Yakıcı | Kaygan |
| Mavi turnusol kâğıdı | Kırmızıya döner | Değişmez |
| Kırmızı turnusol kâğıdı | Değişmez | Maviye döner |
| Fenolftalein | Renksiz | Pembe |
| Metaller | Bazıları ile $\text{H}_2$ gazı çıkar | Genelde tepkime yok |
| pH | 7’den küçük | 7’den büyük |

**Güçlü** asit ve bazlar suda tamamen iyonlaşır ($\text{HCl}$, $\text{HNO}_3$, $\text{H}_2\text{SO}_4$, $\text{NaOH}$, $\text{KOH}$). **Zayıf** olanlar ise kısmen iyonlaşır ($\text{CH}_3\text{COOH}$, $\text{H}_2\text{CO}_3$, $\text{NH}_3$). Güçlü ve derişik aynı şey değildir. Güçlülük iyonlaşma oranıyla, derişiklik çözeltideki madde miktarıyla ilgilidir.

## 2. İndikatörler

İndikatör, ortamın asidik ya da bazik olduğuna göre **renk değiştiren** maddedir.

- **Turnusol kâğıdı:** Asit mavi kâğıdı kırmızıya, baz kırmızı kâğıdı maviye çevirir.
- **Fenolftalein:** Bazda pembe, asitte ve nötr ortamda renksizdir.
- **Metil oranj:** Asitte kırmızı, bazda sarıdır.
- **Kırmızı lahana suyu:** Asitte kırmızı ya da pembe, bazda yeşil ya da sarıya yakın renk verir. Doğal bir indikatördür.

Evrensel indikatör ve pH kâğıdı birçok rengi içerir ve pH değerini yaklaşık olarak verir.

## 3. pH ölçeği

$$\text{pH} = -\log [\text{H}^+]$$

pH, çözeltideki $\text{H}^+$ derişimini küçük sayılarla ifade etmenin yoludur. 25 °C’de:

- $\text{pH} < 7$: Asidik
- $\text{pH} = 7$: Nötr (saf su)
- $\text{pH} > 7$: Bazik

$\text{pH} = 3$ ise $[\text{H}^+] = 10^{-3}\ \text{M}$ olur. **Ölçek logaritmiktir.** pH bir birim düştüğünde $\text{H}^+$ derişimi **10 kat artar**. pH 2 olan çözeltinin $\text{H}^+$ derişimi pH 3 olandan 10 kat, pH 4 olandan 100 kat fazladır.

Bir de $\text{pH} + \text{pOH} = 14$ ilişkisi vardır. $\text{pH} = 12$ olan bir çözeltide $\text{pOH} = 2$ ve $[\text{OH}^-] = 10^{-2}\ \text{M}$ olur.

::sim{tur="ph"}

| Madde | Yaklaşık pH |
| --- | --- |
| Mide özsuyu | 1 ile 3 |
| Limon suyu | 2 |
| Sirke | 3 |
| Yağmur suyu | 5,6 |
| Saf su | 7 |
| Kan | 7,4 |
| Deniz suyu | 8 |
| Sabunlu su | 9 ile 10 |
| Amonyaklı temizleyici | 11 |
| Çamaşır suyu | 12 ile 13 |

## 4. Nötrleşme ve tuzlar

Asit ile baz tepkimeye girdiğinde **tuz ve su** oluşur. Buna **nötrleşme** denir.

$$\text{HCl} + \text{NaOH} \to \text{NaCl} + \text{H}_2\text{O}$$

**Tuz**, asidin $\text{H}^+$ iyonunun yerine metal (ya da amonyum) iyonu geçmesiyle oluşan bileşiktir. Sofra tuzu $\text{NaCl}$, kireç taşı ve mermer $\text{CaCO}_3$, gübrelerde kullanılan $\text{KNO}_3$ birer tuzdur.

Diğer önemli asit tepkimeleri:

- **Asit + metal → tuz + hidrojen.** $\text{Zn} + 2\text{HCl} \to \text{ZnCl}_2 + \text{H}_2$
- **Asit + karbonat → tuz + su + karbondioksit.** $\text{CaCO}_3 + 2\text{HCl} \to \text{CaCl}_2 + \text{H}_2\text{O} + \text{CO}_2$. Mermere sirke ya da asit damlayınca köpürmesinin sebebi budur.

**Nötrleşme hesabı.** Tam nötrleşmede asidin verdiği $\text{H}^+$ mol sayısı, bazın verdiği $\text{OH}^-$ mol sayısına eşittir. Tek değerlikli asit ve bazda $M_a V_a = M_b V_b$ yazılır.

**Örnek.** 0,5 M 20 mL $\text{NaOH}$ çözeltisini nötrleştirmek için 0,25 M $\text{HCl}$ kaç mL gerekir? $0{,}25 \cdot V = 0{,}5 \cdot 20$, $V = 40\ \text{mL}$.

:::neden-sonuc
- Mavi turnusol kırmızıya dönüyor => Ortam asidiktir.
- Fenolftalein pembe oluyor => Ortam baziktir.
- pH 5’ten pH 3’e düşüyor => H⁺ derişimi 100 kat artar.
- Mide asidi fazla olan kişi antiasit alıyor => Baz karakterli madde asidi nötrleştirir.
:::

## 5. Günlük hayatta asit ve bazlar

- **Asit yağmuru:** Fabrika ve araç gazlarındaki kükürt ve azot oksitleri suyla birleşip sülfürik ve nitrik asit oluşturur. Yağmur suyunun pH’sı normalde yaklaşık 5,6’dır, asit yağmurunda bunun altına iner. Tarihî yapıların kireç taşını aşındırır, göl ve ormanlara zarar verir.
- **Mide:** Mide özsuyunda $\text{HCl}$ vardır ve besinlerin sindirimine yardım eder.
- **Temizlik:** Sabun ve çamaşır suyu baziktir. Kireç ($\text{CaCO}_3$) asidik temizleyicilerle çözülür.
- **Tarım:** Fazla asidik toprağın pH’sı kireçle yükseltilir.
- **Kabartma tozu:** İçindeki karbonatlı bileşik asitle tepkimeye girip karbondioksit çıkarır. Hamur kabarır.

:::ipucu{baslik="Sık yapılan hata"}
**pH ölçeğinin doğrusal olduğunu sanma.** pH 3 ile pH 5 arasındaki fark 2 değil, derişimde **100 katıdır**. Bir de **güçlü asit ile derişik asidi karıştırma**. Sirke asidi seyreltik olduğu kadar zayıf bir asittir, derişik de olsa güçlü asit olmaz.
:::

:::baglanti
Bu konu, “Karışımlar” konusundaki molarite ve seyreltme hesaplarını kullanır. “Kimyasal Tepkimeler ve Hesaplamalar” konusunda gördüğün tepkime türlerinden nötrleşme ve yer değiştirme burada yeniden karşına çıkar. “Kimyasal Türler Arası Etkileşimler” konusundaki iyonik bağ, tuzların neden iyon oluşturduğunu açıklar. Biyolojide “Canlıların Temel Bileşenleri” konusundaki enzimler pH’ya duyarlıdır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Asit | $\text{H}^+$ verir, pH < 7 |
| Baz | $\text{OH}^-$ verir, pH > 7 |
| Turnusol | Asit: mavi → kırmızı, baz: kırmızı → mavi |
| Fenolftalein | Bazda pembe |
| pH | $-\log[\text{H}^+]$, bir birim = 10 kat |
| Nötrleşme | Asit + baz → tuz + su |
| Tuz | Metal iyonu ve asit kökü |

## Mini test

:::soru{cevap="D"}
pH değeri 3 olan bir çözeltinin $\text{H}^+$ derişimi, pH değeri 5 olan çözeltinin $\text{H}^+$ derişiminin kaç katıdır?

- A) 2
- B) 10
- C) 99
- D) 100
- E) 1000

---

1. $[\text{H}^+] = 10^{-\text{pH}}$. pH 3 için $10^{-3}$, pH 5 için $10^{-5}$ M.
2. Oran $\dfrac{10^{-3}}{10^{-5}} = 10^2 = 100$. Doğru cevap D.

Diğer şıklar: **2** pH farkı kat sayısı sanılmış / **10** bir birimlik pH farkı alınmış / **99** işlem hatasıyla bir eksik bulunmuş / **1000** pH değeri üs olarak yanlış kullanılmış (10³).
:::

:::soru{cevap="D"}
0,2 M 50 mL $\text{HCl}$ çözeltisini tamamen nötrleştirmek için 0,1 M $\text{NaOH}$ çözeltisinden kaç mL gerekir?

- A) 10
- B) 25
- C) 50
- D) 100
- E) 200

---

1. Asidin mol sayısı $0{,}2 \cdot 50 = 10\ \text{mmol}$.
2. Tam nötrleşmede baz da 10 mmol olmalıdır. $0{,}1 \cdot V = 10$, $V = 100\ \text{mL}$. Doğru cevap D.

Diğer şıklar: **10** mmol cinsinden mol sayısı mL sanılmış / **25** derişim oranı ters kurulmuş / **50** hacimler eşit sanılmış / **200** oran iki kez uygulanmış.
:::

:::soru{cevap="C"}
Renksiz bir çözeltiye fenolftalein damlatıldığında çözelti pembe renk alıyor. Bu çözelti için aşağıdakilerden hangisi doğrudur?

- A) Asidiktir, pH değeri 7'den küçüktür.
- B) Nötrdür, pH değeri 7'dir.
- C) Baziktir, pH değeri 7'den büyüktür.
- D) Asidiktir, pH değeri 7'den büyüktür.
- E) Baziktir, pH değeri 7'den küçüktür.

---

1. Fenolftalein yalnızca bazik ortamda pembe olur. Asitte ve nötr ortamda renksizdir.
2. Bazik çözeltinin pH değeri 7'den büyüktür. Doğru cevap C.

Diğer şıklar: **Asidiktir, pH değeri 7'den küçüktür.** fenolftalein asitte renksiz kalır / **Nötrdür, pH değeri 7'dir.** fenolftalein nötr ortamda renksiz kalır / **Asidiktir, pH değeri 7'den büyüktür.** asidik ortamda pH 7 den küçüktür / **Baziktir, pH değeri 7'den küçüktür.** bazik ortamda pH 7 den büyüktür.
:::

:::soru{cevap="E"}
Aşağıdaki tepkimelerden hangisi bir nötrleşme tepkimesidir?

- A) $\text{Mg} + \text{H}_2\text{SO}_4 \to \text{MgSO}_4 + \text{H}_2$
- B) $\text{CaCO}_3 \to \text{CaO} + \text{CO}_2$
- C) $\text{N}_2 + 3\text{H}_2 \to 2\text{NH}_3$
- D) $\text{C} + \text{O}_2 \to \text{CO}_2$
- E) $\text{H}_2\text{SO}_4 + 2\text{KOH} \to \text{K}_2\text{SO}_4 + 2\text{H}_2\text{O}$

---

1. Nötrleşmede asit ile baz tepkimeye girer ve tuz ile su oluşur.
2. $\text{H}_2\text{SO}_4$ asit, $\text{KOH}$ bazdır. Ürünler tuz ($\textE_2\text{SO}_4$) ve sudur. Diğer seçenekler yer değiştirme, ayrışma, sentez ve yanmadır. Doğru cevap E.

Diğer şıklar: **$\text{Mg} + \text{H}_2\text{SO}_4 \to \text{MgSO}_4 + \text{H}_2$** asit ve metal tepkimesi, yer değiştirmedir / **$\text{CaCO}_3 \to \text{CaO} + \text{CO}_2$** tek maddenin ayrışması / **$\text{N}_2 + 3\text{H}_2 \to 2\text{NH}_3$** iki elementin birleşmesi, sentez / **$\text{C} + \text{O}_2 \to \text{CO}_2$** karbonun yanması.
:::

## Kendini dene

:::dene
1. pH 7’nin altındaki çözelti nasıl bir ortamdır? => Asidik.
2. Fenolftalein bazda hangi rengi verir? => Pembe.
3. pH 4’ten pH 2’ye düşünce $\text{H}^+$ derişimi kaç kat artar? => 100 kat.
4. Asit ile baz tepkimeye girince ne oluşur? => Tuz ve su.
5. Asit yağmurunun ana sebebi nedir? => Kükürt ve azot oksitlerin yağmur suyuyla asit oluşturması.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-kim' and name = 'Asitler, Bazlar ve Tuzlar'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Asit ve baz tanımı (Arrhenius), indikatörler, pH ve pOH, güçlü ve zayıf asit ve baz, nötrleşme, tuzlar, asit yağmuru. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Sayısal sonuçlar betikle doğrulandı. Tablodaki pH değerleri yaklaşık, ders kitabı aralıklarıyla karşılaştırılmalıdır.
Kontrol edilecekler: Tuzların asidik ve bazik hidrolizi metne alınmadı. Metil oranj geçiş aralığı sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Asitler, Bazlar ve Tuzlar'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Sabahları dişini fırçalarken, çamaşır makinesini çalıştırırken, ilaç içerken, plastik su şişesi açarken, arabanın deposunu doldururken kimya kullanıyorsun. Kimya yalnızca laboratuvarda yapılan bir iş değildir. Bu konuda **suyun sertliğini**, **temizlik maddelerini**, **plastikleri**, **yakıtları**, ilaç ve gıda katkılarını öğrenecek, bunların hem faydalarını hem de çevreye ve sağlığa verebileceği zararları tartışacaksın.

:::hedefler
1. Sert suyun ne olduğunu ve etkilerini açıklamak.
2. Sabun ve deterjanın temizleme yapısını yorumlamak, temizlik maddelerinin güvenli kullanımını bilmek.
3. Plastik ve polimer kavramını, geri dönüşümün önemini açıklamak.
4. Fosil ve yenilenebilir enerji kaynaklarını ayırt etmek.
5. İlaç ve gıda katkı maddelerinin bilinçli kullanımını değerlendirmek.
:::

## 1. Su ve sertlik

Doğadaki su saf değildir. Kayalardan ve topraktan geçerken **kalsiyum** ($\text{Ca}^{2+}$) ve **magnezyum** ($\text{Mg}^{2+}$) iyonlarını çözer. Bu iyonları fazla içeren suya **sert su** denir.

Sert suyun etkileri:

- Çaydanlık, su ısıtıcısı ve çamaşır makinesinde **kireç ($\text{CaCO}_3$) tabakası** oluşur. Cihazların verimi düşer.
- Sabun sert suda iyi köpürmez. Çözünmeyen bir tortu oluşturur.
- Banyoda musluk ve fayanslarda beyaz lekeler bırakır.

**Geçici sertlik**, suyun içindeki bikarbonatlı bileşiklerden gelir ve **kaynatılınca** giderilir. Isıtma sırasında çözünmüş bikarbonat kalsiyum karbonata dönüşür ve kireç olarak çöker.

$$\text{Ca(HCO}_3)_2 \to \text{CaCO}_3 + \text{H}_2\text{O} + \text{CO}_2$$

**Kireç temizleme.** Kireç bir karbonattır, asitlerle tepkimeye girer. Bu yüzden kireç çözücüler asit içerir. Ütü haznesi gibi yerlerde sirke ya da limon tuzu çözeltisi kullanılabilir. Karbondioksit çıkar, kireç suda çözünen bir tuza dönüşür.

## 2. Temizlik maddeleri

**Sabun**, yağ ya da yağ asidinin sodyum hidroksitle tepkimesinden elde edilen bir tuzdur. Sabun molekülünün iki ucu farklı çalışır:

- **Hidrofil (suyu seven) baş:** İyonik uçtur, suda çözünür.
- **Hidrofob (suyu sevmeyen) kuyruk:** Uzun hidrokarbon zinciridir, yağda çözünür.

Kuyruklar kire ve yağa tutunur, başlar suya doğru döner. Yağ küçük damlalara bölünür ve su ile birlikte akıp gider.

**Deterjan** ise sentetik temizleyicidir. Sert suda da iyi çalışır, çünkü kalsiyumla çözünmeyen tortu oluşturmaz. Fosfat içeren deterjanlar su kaynaklarında alg çoğalmasına sebep olabilir, bu yüzden fosfatsız ürünler tercih edilir.

**Çamaşır suyu**, sodyum hipoklorit ($\text{NaClO}$) çözeltisidir. Bazik karakterlidir ve ağartıcı ile mikrop öldürücü olarak kullanılır.

:::ipucu{baslik="Temizlik maddelerini karıştırma"}
**Çamaşır suyunu asitli temizleyiciyle ya da tuz ruhuyla karıştırma.** Zehirli **klor gazı** çıkar:

$$\text{NaClO} + 2\text{HCl} \to \text{NaCl} + \text{H}_2\text{O} + \text{Cl}_2$$

Amonyak içeren temizleyici ile karıştırılması da zehirli gaz oluşturur. Bu ürünleri her zaman ayrı kullan, kapalı ve havasız ortamda çalışma.
:::

| Madde | Yapısı | Dikkat |
| --- | --- | --- |
| Sabun | Yağ asidi tuzu, bazik | Sert suda tortu bırakır |
| Deterjan | Sentetik, sert suda etkili | Fosfat çevreyi kirletir |
| Çamaşır suyu | $\text{NaClO}$, bazik | Asitle karıştırılmaz |
| Kireç çözücü | Asit | Cilde ve yüzeye zarar verebilir |

## 3. Plastikler ve polimerler

Küçük yapı taşlarının (**monomer**) uzun zincirler halinde birleşmesiyle oluşan büyük moleküllere **polimer** denir. Plastikler sentetik polimerlerdir.

| Polimer | Monomer | Kullanım |
| --- | --- | --- |
| Polietilen | Etilen | Poşet, film |
| PVC | Vinil klorür | Boru, kablo kaplaması |
| Polistiren | Stiren | Strafor, tek kullanımlık tabak |
| PET | Etilen glikol ve tereftalik asit | İçecek şişesi |

Doğada nişasta, selüloz, protein ve DNA da polimerdir. Plastiğin hafif, ucuz, dayanıklı ve şekillendirilebilir olması faydalıdır. Aynı dayanıklılık doğada çözünmeyi çok yavaşlatır. Büyük plastik parçaları zamanla **mikroplastiklere** ayrılır ve deniz canlılarının besin zincirine girer.

**Geri dönüşüm** adımları: Atığı ayrı toplama, türüne göre ayırma, temizleme ve öğütme, eritip yeni ürün yapma. Plastik, cam, kâğıt ve metal ayrı toplandığında hammadde ve enerji tasarrufu sağlanır. **Pil** ise kurşun, cıva, kadmiyum gibi ağır metaller içerebilir. Çöpe değil, pil toplama kutularına atılmalıdır.

## 4. Yakıtlar ve enerji kaynakları

- **Fosil yakıtlar:** Kömür, petrol ve doğal gaz. Milyonlarca yılda oluşur, tükenebilir. Yanınca $\text{CO}_2$ çıkar, **sera etkisini** artırır. Kükürt içerenlerin yanması $\text{SO}_2$ üretir ve asit yağmuruna yol açar.
- **Yenilenebilir kaynaklar:** Güneş, rüzgâr, hidroelektrik (akarsu), jeotermal ve biyokütle. Kısa sürede yenilenir, tükenmez.
- **Hidrojen:** Yanınca yalnızca su oluşur, ama doğada serbest bulunmadığı için başka kaynaklardan üretilmesi gerekir.
- **Biyodizel ve biyoetanol:** Bitkisel yağ ve şeker ya da nişasta bitkilerinden elde edilir.

:::neden-sonuc
- Fosil yakıt yakılıyor => $\text{CO}_2$ salınır, sera etkisi artar.
- Kükürtlü kömür yakılıyor => $\text{SO}_2$ çıkar, asit yağmuru oluşur.
- Su kaynatılıyor => Geçici sertlik giderilir, kireç çöker.
- Çamaşır suyu ile tuz ruhu karışıyor => Zehirli klor gazı oluşur.
:::

## 5. İlaç ve gıda

**İlaç**, bir hastalığı tedavi eden ya da önleyen **etken maddeyi** ve onu taşıyan yardımcı maddeleri içerir. Doğru ilaç, doğru dozda ve doktorun önerdiği sürede kullanılmalıdır.

- **Antibiyotik** bakterilere karşı etkilidir. **Virüslerde** etkisizdir, yani grip ve nezlede işe yaramaz.
- Gereksiz ve yarım bırakılan antibiyotik kullanımı bakterilerin ilaca **direnç** kazanmasına yol açar.
- Son kullanma tarihi geçmiş ilaç kullanılmaz.

**Gıda katkı maddeleri:** Koruyucu (bozulmayı geciktirir), renklendirici, tatlandırıcı ve kıvam artırıcı gibi türleri vardır. Paketin etiketinde E kodlarıyla belirtilir. Kullanılabilecek katkılar ve miktarları yönetmeliklerle sınırlanmıştır, etiketi okumak bilinçli seçim için gereklidir.

## 6. Yeşil kimya

Yeşil kimya, kimyasal ürünlerin **daha az atık, daha az enerji ve daha az zararlı madde** ile üretilmesidir. Atığı kaynağında azaltmak, zararsız çözücü seçmek, geri dönüştürülebilir ve çevrede parçalanabilir malzeme kullanmak bunun ilkeleri arasındadır.

:::ipucu{baslik="Sık yapılan hata"}
**“Kimyasal” kelimesini “zararlı” ile eş tutma.** Su, tuz, şeker ve vitamin de kimyasal maddedir. Zararı ya da faydayı **madde ve miktar** belirler. Bir de **“doğal olan her zaman güvenlidir”** sanma, bazı bitki zehirleri doğaldır ama ölümcüldür.
:::

:::baglanti
Bu konu, “Asitler, Bazlar ve Tuzlar” konusundaki nötrleşme ve asit tepkimeleri ile “Karışımlar” konusundaki çözelti kavramını günlük hayata uygular. “Doğa ve Kimya” konusundaki sera etkisi, asit yağmuru ve ozon tabakası yakıt kullanımıyla doğrudan ilişkilidir. Biyolojide “Güncel Çevre Sorunları” konusunda geri dönüşüm ve enerji kaynakları yeniden karşına çıkar.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Sert su | $\text{Ca}^{2+}$ ve $\text{Mg}^{2+}$ içerir, kireç yapar |
| Kireç temizliği | Asit ile (sirke, limon tuzu) |
| Sabun | Hidrofil baş ve hidrofob kuyruk |
| Çamaşır suyu | Asitle karıştırılmaz, klor gazı çıkar |
| Polimer | Monomerlerin zincirleşmesi |
| Fosil yakıt | Tükenir, $\text{CO}_2$ verir |
| Yenilenebilir | Güneş, rüzgâr, jeotermal |
| Antibiyotik | Bakteriye etkili, virüse etkisiz |

## Mini test

:::soru{cevap="E"}
Bir kişi banyoyu temizlerken tuz ruhu (HCl çözeltisi) ile çamaşır suyunu aynı kovada karıştırıyor. Bu karışımda aşağıdakilerden hangisi gerçekleşir?

- A) Temizlik gücü artan zararsız bir çözelti olur.
- B) Yalnızca ısı açığa çıkar, yeni madde oluşmaz.
- C) Hidrojen gazı çıkar ve karışım kolayca yanar.
- D) Karışım soğur ve donar.
- E) Zehirli klor gazı çıkar.

---

1. Çamaşır suyu ($\text{NaClO}$) asitle tepkimeye girer: $\text{NaClO} + 2\text{HCl} \to \text{NaCl} + \text{H}_2\text{O} + \text{Cl}_2$.
2. Oluşan $\text{Cl}_2$ zehirli bir gazdır. Doğru cevap E.

Diğer şıklar: **Temizlik gücü artan zararsız bir çözelti olur.** karışım tehlikeli gaz çıkarır / **Yalnızca ısı açığa çıkar, yeni madde oluşmaz.** yeni bir gaz oluşur / **Hidrojen gazı çıkar ve karışım kolayca yanar.** çıkan gaz klordur / **Karışım soğur ve donar.** tepkime ısı değişimiyle donma sağlamaz.
:::

:::soru{cevap="B"}
Sabun molekülü uzun hidrokarbon zinciri ile iyonik bir uçtan oluşur. Sabunun yağlı lekeyi sudan ayırarak temizleyebilmesinin sebebi aşağıdakilerden hangisidir?

- A) İyonik ucu yağda, hidrokarbon kuyruğu suda çözünür.
- B) Hidrokarbon kuyruğu yağa, iyonik başı suya tutunur.
- C) Her iki ucu da yağı kimyasal olarak yakar.
- D) Sabun, yağı bozup suyu uzaklaştıran bir asittir.
- E) Sabun yağı kaynatarak buharlaştırır.

---

1. Hidrokarbon kuyruğu hidrofobtur, yağda çözünür ve kire tutunur.
2. İyonik baş hidrofildir, suya doğru döner. Yağ damlaları böylece suyla uzaklaşır. Doğru cevap B.

Diğer şıklar: **İyonik ucu yağda, hidrokarbon kuyruğu suda çözünür.** uçların çözündüğü ortamlar ters yazılmış / **Her iki ucu da yağı kimyasal olarak yakar.** sabun yağı yakmaz / **Sabun, yağı bozup suyu uzaklaştıran bir asittir.** sabun asit değil bazik karakterlidir / **Sabun yağı kaynatarak buharlaştırır.** temizlik buharlaştırmayla olmaz.
:::

:::soru{cevap="E"}
Aşağıdaki enerji kaynaklarından hangisi **yenilenebilir enerji kaynağı değildir**?

- A) Rüzgâr
- B) Güneş
- C) Jeotermal
- D) Hidroelektrik
- E) Kömür

---

1. Yenilenebilir kaynaklar kısa sürede yenilenir: güneş, rüzgâr, jeotermal, hidroelektrik, biyokütle.
2. Kömür fosil yakıttır, milyonlarca yılda oluşur ve tükenir. Doğru cevap E.

Diğer şıklar: **Rüzgâr** rüzgâr sürekli yenilenir / **Güneş** güneş enerjisi yenilenebilirdir / **Jeotermal** yerin ısısı yenilenebilir kaynaktır / **Hidroelektrik** akan su yenilenebilir kaynaktır.
:::

:::soru{cevap="E"}
Ütünün su haznesinde biriken beyaz kireç tabakasını gidermek için aşağıdakilerden hangisi kullanılır?

- A) Sabunlu su
- B) Çamaşır suyu
- C) Tuzlu su
- D) Kabartma tozu çözeltisi
- E) Seyreltik sirke

---

1. Kireç bir karbonattır ($\text{CaCO}_3$), asitle tepkimeye girip çözünür.
2. Sirke asit içerir, kireci çözer ve $\text{CO}_2$ çıkarır. Diğer seçenekler asit değildir. Doğru cevap E.

Diğer şıklar: **Sabunlu su** sabun kireci çözmez, sert suda tortu verir / **Çamaşır suyu** çamaşır suyu bazik karakterlidir / **Tuzlu su** tuz kireci çözen bir asit değildir / **Kabartma tozu çözeltisi** asit değil, bazik karakterlidir.
:::

## Kendini dene

:::dene
1. Suyu kaynatınca geçici sertlik neden azalır? => Bikarbonat, kireç olarak çöker.
2. Sabunun suyu seven kısmına ne denir? => Hidrofil baş.
3. Plastiği oluşturan küçük yapı birimine ne denir? => Monomer.
4. Antibiyotik grip virüsüne karşı etkili midir? => Hayır, yalnızca bakterilere etkilidir.
5. Çamaşır suyu ile tuz ruhu karışırsa hangi zehirli gaz çıkar? => Klor.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-kim' and name = 'Kimya Her Yerde'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Sert su ve kireç, sabun ve deterjan, çamaşır suyu ve güvenli kullanım, polimerler ve geri dönüşüm, fosil ve yenilenebilir enerji, ilaç ve gıda katkıları, yeşil kimya. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Hipoklorit ve asit tepkimesi ile bikarbonat ayrışması betikle denkleştirildi.
Kontrol edilecekler: Polimer tablosundaki monomerler genel bilgidir. Plastiğin doğada çözünme süresi kasıtlı olarak sayıyla yazılmadı. Gıda katkıları için yönetmelik ayrıntısı metne alınmadı.$lesson$ from public.topics where subject_id = 'tyt-kim' and name = 'Kimya Her Yerde'
on conflict (topic_id) do nothing;
