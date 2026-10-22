-- TYT Biyoloji konu anlatımları (a). Taslak olarak eklenir, yönetici kontrol edip yayına alır. Konu adı eşleşmezse satır eklenmez.

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir köpek, bir ağaç ve bir bakteri dışarıdan bakınca birbirine hiç benzemez. Yine de üçü de canlıdır. Çünkü hepsi aynı temel özellikleri taşır: Hücrelerden oluşur, enerji kullanır, çevresine tepki verir, kendine benzer yavrular bırakır. Biyoloji bu ortak özellikleri inceleyerek canlı ile cansızı ayırır. Bu konuda **canlıların ortak özelliklerini**, **metabolizmayı**, **homeostaziyi** ve **canlılığın organizasyon düzeylerini** öğreneceksin.

:::hedefler
1. Canlıların ortak özelliklerini sayıp örneklemek.
2. Anabolizma ile katabolizmayı ayırt etmek.
3. Homeostazi, uyarılara tepki ve adaptasyon kavramlarını birbirinden ayırmak.
4. Organizasyon düzeylerini küçükten büyüğe sıralamak.
5. Virüslerin neden canlı kabul edilmediğini açıklamak.
:::

## 1. Canlıların ortak özellikleri

| Özellik | Kısaca |
| --- | --- |
| Hücresel yapı | Canlılar bir ya da daha çok hücreden oluşur |
| Metabolizma | Hücrede olan tüm yapım ve yıkım tepkimeleri |
| Beslenme, solunum, boşaltım | Madde alır, enerji elde eder, atıkları atar |
| Uyarılara tepki | Dış ve iç değişikliklere cevap verir |
| Homeostazi | İç ortamı dengede tutar |
| Büyüme ve gelişme | Hücre sayısı ya da hücre boyutu artar, yapı olgunlaşır |
| Üreme | Kendine benzeyen yeni bireyler bırakır |
| Kalıtım ve uyum | Genetik bilgiyi aktarır, ortama uyum sağlar |
| Organizasyon | Atomdan ekosisteme kadar düzenli bir yapı |

Hepsinin her canlıda aynı biçimde görülmesi gerekmez. Örneğin bir mantar hareket etmez, bir ağaç ağzıyla beslenmez, ama ikisi de bu listedeki özelliklerin tümünü kendine özgü yollarla taşır.

:::ipucu{baslik="Ortak olanla bazılarında olanı ayır"}
**Hücresel yapı, metabolizma, üreme, kalıtım, uyarılara tepki ve homeostazi** her canlıda vardır. **Fotosentez, hareket etme, sindirim sistemi** ise yalnızca bazı canlılarda bulunur. Sınavda “ortak özellik” sorulursa bu ayrımı düşün.
:::

## 2. Metabolizma

Hücrede gerçekleşen bütün kimyasal tepkimelerin toplamıdır. İki yönü vardır:

- **Anabolizma (yapım):** Küçük moleküllerden büyük moleküller sentezlenir. **Enerji harcanır.** Örnek: Fotosentez, kemosentez, DNA eşlenmesi.
- **Katabolizma (yıkım):** Büyük moleküller parçalanır. **Enerji açığa çıkar.** Örnek: Hücresel solunum, sindirim, fermantasyon.

Canlı, katabolizmayla elde ettiği enerjiyi anabolizmada kullanır. Metabolizma hızı canlının türüne, yaşına, sıcaklığa ve enzim miktarına göre değişir.

## 3. Uyarılara tepki, homeostazi ve uyum

Bu üç kavram sık karıştırılır.

- **Uyarılara tepki (irritabilite):** Anlık bir değişikliğe verilen kısa süreli cevaptır. Sıcak ocağa dokunan elin geri çekilmesi, bitkinin ışığa doğru yönelmesi örnektir.
- **Homeostazi:** İç ortamın (vücut sıcaklığı, kan şekeri, su ve tuz dengesi, pH) **kabul edilebilir sınırlar içinde sabit tutulmasıdır**. Soğukta titremek vücut ısısını korur. Yemekten sonra yükselen kan şekeri insülinle düşürülür.
- **Adaptasyon (uyum):** Bir türün, çok sayıda kuşak boyunca **kalıtsal özelliklerinin** ortama uygun hale gelmesidir. Deve kamburundaki yağ depolama, kutup ayısının kalın kürkü örnektir. Tek bir bireyin kısa sürede kendini alıştırması adaptasyon sayılmaz.

:::neden-sonuc
- Canlı hücreden oluşuyor => Hücresel yapı canlıların ortak özelliğidir.
- Küçük moleküllerden büyük molekül sentezleniyor => Anabolizma, enerji harcanır.
- Büyük molekül parçalanıp enerji çıkıyor => Katabolizma.
- Kan şekeri sınırlar içinde tutuluyor => Homeostazi sağlanıyor.
:::

## 4. Üreme, büyüme ve kalıtım

**Üreme** bireyin yaşaması için değil, **türün devamı** için gereklidir. Kısır bir canlı da yaşayabilir. Üreme iki yoldur:

- **Eşeysiz üreme:** Tek ebeveyn, yavru ebeveynin genetik kopyasıdır. Bakteride ikiye bölünme, mantarda spor.
- **Eşeyli üreme:** Genellikle iki ebeveyn, gamet birleşmesi, yavruda genetik çeşitlilik.

**Büyüme** hücre sayısının (bölünme) ya da hücre hacminin artmasıdır. **Gelişme** ise yapının ve işlevin olgunlaşmasıdır. Tırtıldan kelebeğe dönüşüm gelişmeye örnektir.

**Kalıtım:** DNA’daki bilgi yavruya aktarılır. Kalıtsal çeşitlilik doğal seçilimin ham maddesidir.

## 5. Canlılığın organizasyon düzeyleri

Atomdan biyosfere uzanan düzen, küçükten büyüğe şöyledir:

1. Atom
2. Molekül
3. Organel
4. Hücre
5. Doku
6. Organ
7. Sistem
8. Organizma (birey)
9. Popülasyon (aynı türün aynı yerdeki bireyleri)
10. Komünite (aynı alandaki farklı türlerin popülasyonları)
11. Ekosistem (komünite ve cansız çevre)
12. Biyosfer (yeryüzündeki tüm canlıların bulunduğu alan)

Her düzeyde bir üst düzeyin yapı taşı vardır. Tek hücrelilerde hücre aynı zamanda organizmadır, doku ve organ düzeyleri yoktur.

## 6. Virüsler canlı mı

Virüs, **protein kılıf ve içinde nükleik asit** (DNA ya da RNA) taşır. Hücre yapısı yoktur, kendi başına metabolizma yapamaz, besin almaz ve büyümez. **Yalnızca bir konak hücrenin içinde** çoğalabilir. Bu yüzden çoğu kaynakta canlı ile cansız arasında bir yapı olarak ya da “hücresel olmayan canlı benzeri yapı” olarak anılır. Antibiyotik virüslere karşı etkisizdir, çünkü antibiyotikler bakteri hücre yapısını hedefler.

:::ipucu{baslik="Sık yapılan hata"}
**“Üreme olmazsa canlı ölür” sanma.** Üreme türün devamı içindir, bireyin ölmesi ya da yaşaması için gerekli değildir. Bir de **homeostaziyi adaptasyonla karıştırma**: Homeostazi bireyin anlık iç dengesidir, adaptasyon türün kalıtsal uyumudur.
:::

:::baglanti
Bu konudaki metabolizma, “Hücre ve Organelleri” konusunda mitokondri ve kloroplastla birlikte yeniden karşına çıkar. Homeostazi ve organizasyon düzeyleri “Ekosistem Ekolojisi” ile “Canlıların Sınıflandırılması” konularının temelidir. Kimyada “Mol Kavramı” ve “Kimyasal Tepkimeler ve Hesaplamalar” konularındaki kimyasal tepkimelerin canlıdaki karşılığı metabolizmadır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Ortak özellikler | Hücre, metabolizma, üreme, kalıtım, uyarılara tepki, homeostazi |
| Anabolizma | Yapım, enerji harcar |
| Katabolizma | Yıkım, enerji verir |
| Homeostazi | İç dengeyi korumak |
| Adaptasyon | Kalıtsal uyum, kuşaklar boyunca |
| Üreme | Türün devamı için |
| Virüs | Hücre yapısı yok, konakta çoğalır |

## Mini test

:::soru{cevap="B"}
Aşağıdakilerden hangisi canlıların tümünde ortak olan bir özellik **değildir**?

- A) Metabolizma
- B) Fotosentez yapma
- C) Uyarılara tepki verme
- D) Kalıtım
- E) Hücresel yapıda olma

---

1. Metabolizma, uyarılara tepki, kalıtım ve hücresel yapı her canlıda bulunur.
2. Fotosentez yalnızca klorofil gibi pigmentleri olan canlılarda görülür. Doğru cevap B.

Diğer şıklar: **Metabolizma** metabolizma her canlıda vardır / **Uyarılara tepki verme** tüm canlılar uyarılara cevap verir / **Kalıtım** tüm canlılar genetik bilgi taşır / **Hücresel yapıda olma** canlı hücresel yapıdadır.
:::

:::soru{cevap="D"}
Dokunulduğunda yapraklarını hızla kapatan küstüm otunun bu davranışı canlıların hangi ortak özelliğine örnektir?

- A) Üreme
- B) Boşaltım
- C) Kalıtım
- D) Uyarılara tepki verme
- E) Büyüme

---

1. Dokunma bir uyarıdır, yaprağın kapanması ona verilen anlık cevaptır.
2. Bu, uyarılara tepki verme özelliğidir. Doğru cevap D.

Diğer şıklar: **Üreme** yaprak kapanması yeni birey oluşturmaz / **Boşaltım** yaprak kapanması atık atımı değildir / **Kalıtım** tepki kalıtsal bilgi aktarımı değildir / **Büyüme** hücre sayısı artmıyor.
:::

:::soru{cevap="D"}
Aşağıdaki sıralamalardan hangisi canlılığın organizasyon düzeylerini küçükten büyüğe doğru **doğru** biçimde verir?

- A) Doku, hücre, organ, sistem, organizma, popülasyon
- B) Hücre, organ, doku, sistem, organizma, popülasyon
- C) Hücre, doku, organ, organizma, sistem, popülasyon
- D) Hücre, doku, organ, sistem, organizma, popülasyon
- E) Hücre, doku, organ, sistem, popülasyon, organizma

---

1. Hücreler dokuyu, dokular organı, organlar sistemi, sistemler organizmayı oluşturur.
2. Aynı türün bireyleri popülasyonu oluşturur. Doğru sıra D seçeneğindedir.

Diğer şıklar: **Doku, hücre, organ, sistem, organizma, popülasyon** doku hücreden küçük sanılmış / **Hücre, organ, doku, sistem, organizma, popülasyon** organ dokudan önce yazılmış / **Hücre, doku, organ, organizma, sistem, popülasyon** sistem organizmadan sonra yazılmış / **Hücre, doku, organ, sistem, popülasyon, organizma** popülasyon organizmadan büyük olduğu için sonda olmalı.
:::

:::soru{cevap="E"}
Aşağıdaki olaylardan hangisi **anabolik** (yapım) tepkimedir?

- A) Glikojenin glikoza parçalanması
- B) Nişastanın maltoza sindirilmesi
- C) Yağların yağ asidi ve gliserole yıkımı
- D) Glikozdan ATP üretimi
- E) Amino asitlerden protein sentezlenmesi

---

1. Anabolizmada küçük moleküllerden büyük molekül sentezlenir ve enerji harcanır.
2. Amino asitlerden protein yapılması bir sentezdir. Diğer seçenekler büyük molekülün parçalanmasıdır. Doğru cevap E.

Diğer şıklar: **Glikojenin glikoza parçalanması** büyük molekül parçalanıyor, katabolizma / **Nişastanın maltoza sindirilmesi** sindirim yıkım tepkimesidir / **Yağların yağ asidi ve gliserole yıkımı** büyük molekül parçalanıyor / **Glikozdan ATP üretimi** hücresel solunum katabolizmadır.
:::

## Kendini dene

:::dene
1. Fotosentez anabolik midir katabolik midir? => Anabolik, enerji harcanır.
2. Soğukta titreme hangi özelliğe örnektir? => Homeostazi.
3. Üreme neden zorunludur? => Türün devamı için, birey için değil.
4. Popülasyon ile komünite arasındaki fark nedir? => Popülasyon tek tür, komünite birçok tür.
5. Virüs neden bakteriyle aynı ilaçlarla tedavi edilemez? => Hücre yapısı yoktur, antibiyotik hedefi yoktur.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-bio' and name = 'Canlıların Ortak Özellikleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Canlıların ortak özellikleri, metabolizma, homeostazi, adaptasyon, organizasyon düzeyleri, virüsün konumu. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür.
Kontrol edilecekler: Virüsün canlı sayılıp sayılmadığı kaynağa göre değişir. Metinde "canlı kabul edilmez, canlı benzeri yapı" ifadesi ders kitabı yaklaşımına göre kontrol edilmeli.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Canlıların Ortak Özellikleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yediğin ekmekte nişasta, peynirde protein ve yağ, tuzda mineral, suyun kendisi var. Vücudun ise bu maddelerin yapı taşlarından yapılmış. Canlıyı oluşturan maddeler iki gruba ayrılır: **inorganik** ve **organik** bileşikler. Bu konuda su ve mineralleri, karbonhidrat, lipit, protein, nükleik asit gibi organik moleküllerin yapısını, enzimleri, vitaminleri ve ATP’yi öğreneceksin.

:::hedefler
1. İnorganik ve organik bileşikleri ayırt etmek.
2. Suyun canlı için önemini ve özelliklerini açıklamak.
3. Karbonhidrat, lipit, protein ve nükleik asidin yapı taşlarını ve görevlerini söylemek.
4. Dehidrasyon sentezi ve hidrolizi, açığa çıkan su sayısını hesaplayarak kavramak.
5. Enzimlerin çalışma özelliklerini yorumlamak.
:::

## 1. İnorganik bileşikler

**Su, mineraller, asit, baz ve tuzlar** inorganiktir. Canlı yapısının yaklaşık yüzde 60 ile 70’i sudur.

**Suyun özellikleri ve canlı için önemi:**

- **İyi bir çözücüdür.** Kan ve hücre içinde besin ve atıkların taşınması mümkün olur.
- **Isı kapasitesi yüksektir.** Isınması ve soğuması yavaştır, canlının vücut sıcaklığını dengelemesine yardım eder. Terleme sırasında su buharlaşırken vücuttan ısı alır.
- **Moleküller birbirine tutunur (kohezyon), yüzeylere de tutunur (adezyon).** Bitkilerde suyun odun borularında yükselmesini sağlar.
- **4 °C’de yoğunluğu en büyüktür.** Buz sudan hafif olduğu için göllerde yüzeyde donar, altta canlılar yaşamaya devam eder.
- Metabolik tepkimelerin çoğu su içinde gerçekleşir. Hidroliz ve fotosentez gibi olaylarda su girdi ya da ürün olur.

**Mineraller:** Kalsiyum ve fosfor kemik ve dişte, **demir** hemoglobinde, **magnezyum** klorofilde, **iyot** tiroksin hormonunda, sodyum ve potasyum sinir iletiminde görev alır.

## 2. Organik bileşikler: yapı taşları

Organik moleküller büyük **polimerlerdir**, küçük **monomerlerin** birleşmesiyle oluşur.

- Monomerler birleşirken **dehidrasyon sentezi** (su çıkışıyla yapım) gerçekleşir.
- Polimer parçalanırken **hidroliz** (su katılarak yıkım) gerçekleşir.
- $n$ monomer tek zincir halinde birleşirse $n - 1$ su çıkar ve $n - 1$ bağ oluşur.

### Karbonhidratlar

| Tür | Örnek | Not |
| --- | --- | --- |
| Monosakkarit | Glikoz, fruktoz, galaktoz | $\text{C}_6\text{H}_{12}\text{O}_6$, hücre yakıtı |
| Disakkarit | Sakkaroz, maltoz, laktoz | $\text{C}_{12}\text{H}_{22}\text{O}_{11}$ |
| Polisakkarit | Nişasta, glikojen, selüloz, kitin | Çok sayıda glikozdan |

- Sakkaroz glikoz ve fruktozdan, maltoz iki glikozdan, laktoz glikoz ve galaktozdan oluşur.
- **Nişasta** bitkide depo, **glikojen** hayvanda (karaciğer, kas) depo, **selüloz** bitki hücre duvarı, **kitin** mantar hücre duvarı ve böcek dış iskeletidir.
- Karbonhidratın görevi ağırlıklı olarak **enerji sağlamaktır**.

### Lipitler

Suda çözünmez, organik çözücülerde çözünür.

- **Yağlar:** 1 gliserol ve 3 yağ asidi ile yapılır. Dehidrasyon sentezinde 3 su çıkar. Enerji deposu, yalıtım ve organ koruma sağlar.
- **Fosfolipitler:** Hücre zarının temel yapı maddesidir.
- **Steroitler:** Kolesterol, eşey hormonları, D vitamini.
- **Mumlar:** Yaprak yüzeyinde su kaybını azaltır.

### Proteinler

Monomeri **amino asittir**. İki amino asit **peptit bağıyla** bağlanır. Amino asitlerin dizilişi proteinin yapısını belirler.

**Örnek.** 5 amino asitten oluşan tek zincirli bir peptit sentezlenirken $5 - 1 = 4$ su çıkar ve 4 peptit bağı oluşur. Proteinde $m$ zincir varsa ve toplam $n$ amino asit varsa çıkan su $n - m$’dir.

Proteinler enzim, yapı maddesi (kas, saç), taşıyıcı (hemoglobin), savunma (antikor) ve hormon (insülin) olarak görev yapar. Isı, aşırı asit ya da baz proteinin üç boyutlu yapısını bozar. Buna **denatürasyon** denir ve protein işlevini kaybeder.

### Nükleik asitler

Monomerleri **nükleotittir**. Bir nükleotit **fosfat, şeker ve organik bazdan** oluşur.

| | DNA | RNA |
| --- | --- | --- |
| Şeker | Deoksiriboz | Riboz |
| Bazlar | A, T, G, C | A, U, G, C |
| Zincir | Çift | Tek |

## 3. Enzimler

Enzimler **biyolojik katalizörlerdir**. Çoğu proteindir.

- Tepkimenin **aktivasyon enerjisini düşürür**, hızı artırır.
- Tepkimeden değişmeden çıkar, **tekrar kullanılır**.
- **Özgüldür.** Enzimin aktif bölgesi yalnızca kendi substratına uyar (anahtar kilit modeli).
- **Optimum sıcaklık ve pH** vardır. İnsan enzimleri için sıcaklık yaklaşık 37 °C’dir. Pepsin pH 2 civarında, tükürük amilazı pH 7 civarında çalışır.
- Çok yüksek sıcaklıkta denatüre olur. Düşük sıcaklıkta durur ama yapısı bozulmaz.
- Aynı tepkimede substrat miktarı artarsa hız bir noktaya kadar artar, enzimler tamamen dolunca sabitlenir.

:::neden-sonuc
- Enzim aktif bölgesi yalnızca belirli bir substrata uyuyor => Enzim özgündür.
- Isı çok yükseliyor => Enzimin yapısı bozulur, işlevini kaybeder.
- Enzim tepkimeye giriyor => Aktivasyon enerjisi düşer, tepkime hızlanır.
- Polimer parçalanırken su ekleniyor => Hidroliz.
:::

## 4. Vitaminler ve ATP

- **Vitaminler** enerji vermez, **düzenleyicidir**. Suda çözünenler B ve C vitaminleridir. Yağda çözünenler A, D, E ve K vitaminleridir. Vitamin eksikliği hastalık yapar (C vitamini eksikliğinde iskorbüt).
- **ATP** hücrenin enerji parasıdır. Adenozin ve üç fosfattan oluşur. Fosfat bağı koptukça enerji verir.

**Enerji değerleri:** 1 g karbonhidrat ve 1 g protein yaklaşık 4 kcal, 1 g yağ yaklaşık 9 kcal verir.

**Örnek.** 10 g protein ve 10 g yağ içeren besinin enerjisi $10 \cdot 4 + 10 \cdot 9 = 130\ \text{kcal}$’dir.

:::ipucu{baslik="Sık yapılan hata"}
**Su sayısı ile amino asit sayısını karıştırma.** Tek zincirde $n$ amino asit $n - 1$ su çıkarır. Bir de **vitaminlerin enerji verdiğini sanma**, enerji veren yalnızca karbonhidrat, yağ ve proteindir. Enzimin **soğukta ölmediğini** ama yavaşladığını unutma.
:::

:::baglanti
Bu konu, “Hücre ve Organelleri” konusundaki zar yapısını (fosfolipit, protein), ribozomu ve çekirdeği anlamak için gereklidir. “Kalıtım” konusunda DNA ve RNA’yı, “Canlıların Ortak Özellikleri” konusunda anabolizma ve katabolizmayı bu moleküller üzerinden göreceksin. Kimyada “Kimyasal Tepkimeler ve Hesaplamalar” ve “Asitler, Bazlar ve Tuzlar” konuları enzim pH’sını yorumlamana yardımcı olur.
:::

## 5. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Su | Çözücü, ısı kapasitesi yüksek |
| Karbonhidrat | Monomer: monosakkarit, enerji |
| Lipit | Gliserol + 3 yağ asidi, depo |
| Protein | Amino asit, peptit bağı |
| Nükleik asit | Nükleotit, DNA ve RNA |
| Enzim | Katalizör, özgül, optimum koşul |
| Vitamin | Düzenleyici, enerji vermez |
| Tek zincirde $n$ monomer | $n - 1$ su |

## Mini test

:::soru{cevap="C"}
Toplam 120 amino asitten oluşan ve iki ayrı polipeptit zinciri içeren bir protein, amino asitlerin dehidrasyon sentezi ile oluşturulurken kaç molekül su açığa çıkar?

- A) 60
- B) 117
- C) 118
- D) 119
- E) 120

---

1. Her zincirde su sayısı amino asit sayısından bir eksiktir.
2. Toplam su sayısı $120 - 2 = 118$. Doğru cevap C.

Diğer şıklar: **60** zincir başına amino asit sayısı alınmış / **117** zincir sayısı üç alınmış / **119** tek zincir sanılmış / **120** su sayısı amino asit sayısı sanılmış.
:::

:::soru{cevap="A"}
Bir enzimin etkinliği 90 °C’de tamamen kayboluyor. Sıcaklık tekrar 37 °C’ye düşürüldüğünde etkinlik geri gelmiyor. Bunun sebebi aşağıdakilerden hangisidir?

- A) Enzimin üç boyutlu yapısı kalıcı olarak bozulmuştur.
- B) Enzimin aktivasyon enerjisi yükselmiştir.
- C) Substrat miktarı azalmıştır.
- D) Enzim tepkimede harcanmıştır.
- E) Enzim 37 °C’de çalışamaz hale gelmiştir.

---

1. Yüksek sıcaklık proteinin yapısını bozar, buna denatürasyon denir.
2. Yapı bozulunca aktif bölge işlevini yitirir, sıcaklık düşse bile geri dönmez. Doğru cevap A.

Diğer şıklar: **Enzimin aktivasyon enerjisi yükselmiştir.** enzim aktivasyon enerjisini düşürür / **Substrat miktarı azalmıştır.** sorun substratta değil enzimdedir / **Enzim tepkimede harcanmıştır.** enzim tepkimede harcanmaz / **Enzim 37 °C’de çalışamaz hale gelmiştir.** enzim 37 derecede çalışabilir.
:::

:::soru{cevap="C"}
20 g yağ ve 30 g karbonhidrat içeren bir besinin toplam enerjisi kaç kcal’dir? (1 g yağ 9 kcal, 1 g karbonhidrat 4 kcal)

- A) 120
- B) 180
- C) 300
- D) 350
- E) 450

---

1. Yağdan $20 \cdot 9 = 180\ \text{kcal}$.
2. Karbonhidrattan $30 \cdot 4 = 120\ \text{kcal}$.
3. Toplam $180 + 120 = 300\ \text{kcal}$. Doğru cevap C.

Diğer şıklar: **120** yalnızca karbonhidratın enerjisi hesaplanmış / **180** yalnızca yağın enerjisi hesaplanmış / **350** yağ ve karbonhidratın kcal değerleri yer değiştirmiş / **450** tüm gramlar yağ gibi hesaplanmış.
:::

:::soru{cevap="B"}
Bir hücre özütünde uracil bazı içeren bir nükleik asit bulunmuştur. Bu nükleik asit için aşağıdakilerden hangisi doğrudur?

- A) Şekeri deoksiribozdur.
- B) Şekeri ribozdur.
- C) Timin bazı içerir.
- D) Genellikle çift zincirlidir.
- E) Nükleotitleri fosfat içermez.

---

1. Uracil yalnızca RNA'da bulunur.
2. RNA'nın şekeri ribozdur ve genellikle tek zincirlidir. Doğru cevap B.

Diğer şıklar: **Şekeri deoksiribozdur.** deoksiriboz DNA şekeridir / **Timin bazı içerir.** timin DNA bazıdır, RNA uracil içerir / **Genellikle çift zincirlidir.** çift zincirlilik DNA özelliğidir / **Nükleotitleri fosfat içermez.** tüm nükleotitler fosfat içerir.
:::

## Kendini dene

:::dene
1. Su neden iyi bir çözücü olarak önemlidir? => Besin ve atıkların taşınmasını sağlar.
2. Proteinin monomeri nedir? => Amino asit.
3. Nişasta ve glikojenin farkı nedir? => Nişasta bitkide, glikojen hayvanda depodur.
4. Yüksek sıcaklıkta enzime ne olur? => Yapısı bozulur, işlevini kaybeder.
5. 8 amino asitten oluşan tek zincirde kaç su çıkar? => 7.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 17, false from public.topics where subject_id = 'tyt-bio' and name = 'Canlıların Temel Bileşenleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Su ve mineraller, karbonhidrat, lipit, protein, nükleik asit, enzim, vitamin, ATP, dehidrasyon sentezi ve hidroliz. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Kalori katsayıları (4, 4, 9 kcal/g) standart değerlerdir. Su ve peptit hesapları betikle doğrulandı.
Kontrol edilecekler: Enzimlerin yalnızca proteinden oluştuğu ifadesi "çoğu" olarak yazıldı (ribozimler istisnadır). Proteinin yapı düzeyleri (primer, sekonder) metne alınmadı.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Canlıların Temel Bileşenleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Vücudundaki her doku milyarlarca hücreden yapılmıştır. Hücre, canlılığın **en küçük yapı ve işlev birimidir**. Bir hücrenin içine girebilseydin küçük bir fabrika görürdün: Yönetim merkezi, enerji santrali, paketleme birimi, depo ve atık sistemi. Bu konuda hücre kuramını, **prokaryot ve ökaryot hücre ayrımını**, organellerin görevlerini ve hayvan ile bitki hücresinin farklarını öğreneceksin.

:::hedefler
1. Hücre kuramının ilkelerini ve ışık mikroskobunda büyütme hesabını bilmek.
2. Prokaryot ve ökaryot hücreyi karşılaştırmak.
3. Organellerin yapı ve görevlerini eşleştirmek.
4. Hayvan ve bitki hücresinin farklarını söylemek.
5. Bir proteinin üretimden salgılanmaya kadar izlediği yolu sıralamak.
:::

## 1. Hücre kuramı

- Hücreyi ilk kez **Robert Hooke** 1665’te mantar kabuğunda gözlemledi ve “hücre” adını verdi.
- **Leeuwenhoek** tek mercekli mikroskopla canlı mikroorganizmaları gördü.
- **Schleiden** (bitkiler) ve **Schwann** (hayvanlar) tüm canlıların hücrelerden oluştuğunu söyledi.
- **Virchow** her hücrenin başka bir hücreden oluştuğunu ekledi.

Kuramın ilkeleri: Tüm canlılar bir ya da daha fazla hücreden oluşur, hücre canlının yapı ve işlev birimidir, hücreler **yalnızca var olan hücrelerden** bölünerek oluşur. Hücrede kalıtım materyali (DNA) bulunur.

**Işık mikroskobu.** Toplam büyütme, oküler ve objektif büyütmelerinin **çarpımıdır**. 10x oküler ve 40x objektifle büyütme $10 \cdot 40 = 400$ kattır. Çözünürlüğü yüksek elektron mikroskobu ise organellerin ince yapısını gösterir.

## 2. Prokaryot ve ökaryot hücre

| Özellik | Prokaryot | Ökaryot |
| --- | --- | --- |
| Çekirdek zarı | Yok, DNA sitoplazmada (halkasal) | Var |
| Zarlı organel | Yok | Var |
| Ribozom | Var, küçük | Var, büyük |
| Hücre duvarı | Çoğunlukla var (bakteride peptidoglikan) | Bitki, mantar ve bazı protistlerde var |
| Örnek | Bakteri, arke | Hayvan, bitki, mantar, protist |

Prokaryotlarda mitokondri, kloroplast, Golgi ve endoplazmik retikulum **yoktur**. Prokaryotlarda yine de hücre zarı, sitoplazma, DNA ve ribozom bulunur. Fotosentez yapan bazı bakterilerde (siyanobakteri) klorofil zarlara gömülüdür, kloroplast yoktur.

## 3. Hücre zarı, sitoplazma ve çekirdek

**Hücre zarı** fosfolipit çift katman ve içine gömülü proteinlerden oluşur. **Seçici geçirgendir**, içeri ve dışarı madde geçişini kontrol eder.

**Sitoplazma:** Organellerin içinde bulunduğu sıvı ve iskelet ağıdır. Tepkimelerin birçoğu burada gerçekleşir.

**Çekirdek** hücrenin yönetim merkezidir:

- **Çekirdek zarı** çift katmanlıdır, gözenekleri vardır (RNA ve proteinler geçer).
- İçinde kalıtım materyali, kromatin halinde **DNA** bulunur. Hücre bölünürken kromatin yoğunlaşıp kromozomlara dönüşür.
- **Çekirdekçik** ribozom yapımında rol alır.

## 4. Organeller ve görevleri

![Hayvan ve bitki hücresinin sadeleştirilmiş şeması. Ortak organeller yanında bitkide hücre duvarı, koful ve kloroplast bulunur](/lessons/tyt-bio/hayvan-bitki-hucresi.svg "Hayvan ve bitki hücresi | Yolumnet")

| Organel | Zar | Görevi |
| --- | --- | --- |
| Ribozom | Zarsız | Protein sentezi (serbest ya da ER üzerinde) |
| Granüllü ER | Tek zar | Ribozomlu, protein taşır ve işler |
| Granülsüz ER | Tek zar | Lipit sentezi, zehirsizleştirme |
| Golgi | Tek zar | Paketleme, salgı, lizozom oluşturma |
| Lizozom | Tek zar | Hücre içi sindirim (hayvanda belirgin) |
| Mitokondri | Çift zar | Hücresel solunumla ATP üretimi |
| Kloroplast | Çift zar | Fotosentez (bitki, bazı protistler) |
| Koful | Tek zar | Depo, bitkide büyük merkezi koful |
| Sentrozom | Zarsız | İğ ipliği oluşumu (hayvanda var, bitkide yok) |

**Mitokondri ve kloroplast** çift zarlıdır, kendi **DNA’sı ve ribozomu** vardır. Bu yüzden bir kısım proteinini kendileri üretir, **yarı otonom organeldir**. Mitokondri iç zarı kıvrımlıdır (krista), kloroplastta tilakoit yığınları (grana) ve sıvı kısım (stroma) bulunur.

**Hücrede organel sayısı işlevi yansıtır:** Kas hücresinde mitokondri çok, pankreasın enzim salgılayan hücrelerinde granüllü ER ve Golgi çok, karaciğer hücresinde granülsüz ER çoktur.

## 5. Protein üretimi ve salgı yolu

Hücrenin dışarıya salgıladığı bir proteinin (insülin, sindirim enzimi) yolu:

1. **Çekirdekte** DNA’dan mRNA üretilir.
2. **Granüllü ER**’deki ribozom proteini sentezler.
3. Protein ER içinden **vezikül** ile **Golgi**’ye taşınır.
4. Golgi proteini değiştirir ve paketler.
5. **Salgı kesecikleri** zara kaynaşır, protein hücre dışına atılır.

Bu yolda **mitokondri** ATP sağlar ama proteinin geçtiği duraklardan biri değildir.

:::neden-sonuc
- Hücrede çok miktarda ATP gerekiyor => Mitokondri sayısı fazladır.
- Hücre enzim salgılıyor => Granüllü ER ve Golgi gelişmiştir.
- Hücrede çekirdek zarı yok => Prokaryot hücredir.
- Hücre duvarı ve kloroplast var => Bitki hücresidir.
:::

## 6. Bitki ve hayvan hücresi

| Özellik | Hayvan | Bitki |
| --- | --- | --- |
| Hücre duvarı | Yok | Var (selüloz) |
| Kloroplast | Yok | Var |
| Koful | Küçük, çok sayıda | Büyük, merkezi |
| Sentrozom | Var | Yok |
| Lizozom | Belirgin | Az |
| Depo karbonhidrat | Glikojen | Nişasta |

Hücre duvarı hücreye şekil ve koruma sağlar, **tam geçirgendir**, seçici geçirgenliği hücre zarı sağlar.

:::ipucu{baslik="Sık yapılan hata"}
**Hücre duvarı ile hücre zarını karıştırma.** Duvar bitki, mantar ve bakterilerde dışta bulunur ve tam geçirgendir. Zar ise her hücrede vardır ve seçici geçirgendir. Bir de **prokaryotta organel yok sanma**: Zarlı organel yoktur ama ribozom vardır.
:::

:::baglanti
Bu konu, “Canlıların Temel Bileşenleri” konusundaki fosfolipit, protein ve nükleik asit bilgisini yapıya taşır. “Hücre Zarından Madde Geçişi” konusunda zarın işleyişini, “Hücre Bölünmeleri” konusunda çekirdeğin ve kromozomların davranışını göreceksin. “Canlıların Sınıflandırılması” konusunda prokaryot ve ökaryot ayrımı sınıflandırmanın temelidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Hücre kuramı | Hücre yapı ve işlev birimi, hücreden hücre oluşur |
| Prokaryot | Çekirdek zarı ve zarlı organel yok |
| Ökaryot | Çekirdek ve zarlı organeller var |
| Mitokondri | ATP, çift zar, kendi DNA’sı |
| Kloroplast | Fotosentez, çift zar, kendi DNA’sı |
| Granüllü ER | Ribozomlu, protein |
| Golgi | Paketleme ve salgı |
| Bitki hücresi | Duvar, kloroplast, büyük koful |

## Mini test

:::soru{cevap="D"}
Pankreasın salgı yapan hücrelerinden biri sindirim enzimlerini yoğun biçimde üretip hücre dışına salgılıyor. Bu hücrede aşağıdaki organel çiftlerinden hangisinin diğerlerine göre daha gelişmiş olması beklenir?

- A) Kloroplast ve koful
- B) Granülsüz ER ve sentrozom
- C) Lizozom ve hücre duvarı
- D) Granüllü endoplazmik retikulum ve Golgi
- E) Mitokondri ve kloroplast

---

1. Enzimler proteindir. Proteini ribozomlu (granüllü) ER sentezler, Golgi paketleyip salgılatır.
2. Bu yüzden salgı hücrelerinde bu iki organel gelişmiştir. Doğru cevap D.

Diğer şıklar: **Kloroplast ve koful** hayvan hücresinde kloroplast bulunmaz / **Granülsüz ER ve sentrozom** protein salgısında ribozomlu ER gerekir / **Lizozom ve hücre duvarı** hayvan hücresinde hücre duvarı yoktur / **Mitokondri ve kloroplast** kloroplast hayvan hücresinde bulunmaz.
:::

:::soru{cevap="A"}
Aşağıdaki organel çiftlerinden hangisi çift zarlıdır ve bir kısım proteinini kendi DNA’sı ile ribozomlarıyla üretebilir?

- A) Mitokondri ve kloroplast
- B) Golgi ve lizozom
- C) Ribozom ve sentrozom
- D) Koful ve granülsüz ER
- E) Lizozom ve koful

---

1. Çift zarlı ve kendi DNA'sı olan organeller yarı otonomdur.
2. Bu özellik mitokondri ve kloroplastta vardır. Diğer çiftler tek zarlı ya da zarsızdır. Doğru cevap A.

Diğer şıklar: **Golgi ve lizozom** ikisi de tek zarlıdır, kendi DNA’sı yoktur / **Ribozom ve sentrozom** ikisi de zarsızdır / **Koful ve granülsüz ER** ikisi de tek zarlıdır / **Lizozom ve koful** ikisi de tek zarlıdır.
:::

:::soru{cevap="C"}
Elektron mikroskobunda incelenen bir hücrede çekirdek zarı, mitokondri ve kloroplast görülmüyor. Ancak ribozom, DNA ve hücre zarı bulunuyor. Bu hücre için aşağıdakilerden hangisi söylenebilir?

- A) Bitki hücresidir.
- B) Hayvan hücresidir.
- C) Prokaryot hücredir.
- D) Mantar hücresidir.
- E) Ölü bir hücredir.

---

1. Çekirdek zarı ve zarlı organel (mitokondri, kloroplast) yoksa hücre prokaryottur.
2. Ribozom, DNA ve hücre zarı prokaryotta da bulunur. Doğru cevap C.

Diğer şıklar: **Bitki hücresidir.** bitki hücresinde çekirdek zarı ve kloroplast bulunur / **Hayvan hücresidir.** hayvan hücresinde çekirdek zarı ve mitokondri bulunur / **Mantar hücresidir.** mantar ökaryottur, çekirdek zarı vardır / **Ölü bir hücredir.** organel yokluğu hücrenin ölü olduğunu göstermez.
:::

:::soru{cevap="D"}
Oküler büyütmesi 15x, objektif büyütmesi 40x olan bir ışık mikroskobunda bir hücre kaç kat büyük görülür?

- A) 15
- B) 40
- C) 55
- D) 600
- E) 601

---

1. Toplam büyütme oküler ile objektifin çarpımıdır.
2. $15 \cdot 40 = 600$ kat. Doğru cevap D.

Diğer şıklar: **15** yalnızca oküler büyütmesi alınmış / **40** yalnızca objektif büyütmesi alınmış / **55** büyütmeler toplanmış / **601** işlem hatasıyla bir fazla bulunmuş.
:::

## Kendini dene

:::dene
1. Hücreyi ilk gözlemleyen bilim insanı kimdir? => Hooke.
2. Prokaryotta hangi organel bulunur? => Ribozom.
3. ATP üretiminin yapıldığı organel hangisidir? => Mitokondri.
4. Hayvan hücresinde bulunup bitkide bulunmayan organel nedir? => Sentrozom.
5. 10x oküler ve 10x objektifle toplam büyütme kaçtır? => 100.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-bio' and name = 'Hücre ve Organelleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Hücre kuramı, mikroskop büyütmesi, prokaryot ve ökaryot hücre, organeller, protein salgı yolu, hayvan ve bitki hücresi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Tarihî bilgiler (Hooke 1665) genel kabul görmüş bilgidir.
Kontrol edilecekler: Şekil sadeleştirilmiştir, organellerin boyut ve oranları gerçeği yansıtmaz. Sentrozomun bitkide bulunmadığı ifadesi ders kitabı düzeyindedir (bazı alt bitkilerde istisna vardır).$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Hücre ve Organelleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Akciğerden kana oksijen geçer, bağırsaktan kana glikoz geçer, böbrekte su geri emilir, bitkinin kökü topraktan su çeker. Bütün bu olaylarda madde bir hücre zarını aşar. Zar her maddeyi içeri almaz, her maddeyi dışarı da bırakmaz. Bu konuda **zarın yapısını**, madde geçiş yollarını, **osmozu**, **aktif taşımayı** ve hücrenin farklı ortamlarda nasıl davrandığını öğreneceksin.

:::hedefler
1. Hücre zarının yapısını ve seçici geçirgenliğini açıklamak.
2. Difüzyon, kolaylaştırılmış difüzyon, osmoz ve aktif taşımayı ayırt etmek.
3. Madde geçişlerinde enerji gerekip gerekmediğini belirlemek.
4. Hipotonik, izotonik ve hipertonik ortamda hücrenin tepkisini yorumlamak.
5. Endositoz ve ekzositozu örneklerle açıklamak.
:::

## 1. Zarın yapısı

Hücre zarı **akıcı mozaik modele** göre şöyle düşünülür:

- İki katlı **fosfolipit** tabaka: Her fosfolipitin suyu seven (hidrofil) başı dışa, suyu sevmeyen (hidrofob) kuyrukları içe bakar.
- Bu tabakaya yerleşmiş **proteinler**: Kanal, taşıyıcı, tanıma ve enzim görevi yapar.
- Kolesterol zarın akışkanlığını dengeler, dış yüzde karbonhidratlar tanıma işaretleri oluşturur.

Zarda moleküller hareket edebildiği için “akıcı”, çeşitli molekülleri içerdiği için “mozaik” denir. Zar **seçici geçirgendir**: Küçük, yüksüz ve yağda çözünen moleküller kolay geçer, iyonlar ve büyük moleküller geçemez ya da protein yardımı ister.

## 2. Pasif taşıma (enerji harcanmaz)

Madde **çok olduğu yerden az olduğu yere**, derişim farkı yönünde geçer. **ATP harcanmaz.**

**Basit difüzyon.** Maddenin zardan doğrudan geçmesidir. Oksijen, karbondioksit, yağda çözünen maddeler ve küçük yüksüz moleküller bu yolla geçer. Hız şunlara bağlıdır:

- Derişim farkı (fark artınca hız artar)
- Sıcaklık (artınca hız artar)
- Yüzey alanı (artınca hız artar), zar kalınlığı (artınca hız azalır)

Denge sağlanınca net geçiş durur, ama moleküller hareketine devam eder.

**Kolaylaştırılmış difüzyon.** Maddenin zardaki **taşıyıcı ya da kanal proteinle** geçmesidir. Glikozun hücreye girişi örnektir. Yine derişim farkı yönündedir ve ATP harcanmaz. Protein sayısı sınırlıdır, bu yüzden taşıyıcılar tamamen dolunca hız artık yükselmez.

**Osmoz.** **Suyun** yarı geçirgen zardan geçişidir. Su, çözünen madde derişiminin **az** olduğu ortamdan **çok** olduğu ortama doğru geçer. Çözünen madde zardan geçemiyorsa su harekete geçer.

**Örnek.** Bir U borusunun ortasına yalnızca suyu geçiren zar konuluyor. Sol koldaki çözelti %2, sağ koldaki %6 şeker içeriyor. Su sol koldan sağ kola geçer, sağ kolun seviyesi yükselir. Zar şekeri geçirmediği için şeker derişimi yer değiştirmez, dengeye su hareketiyle varılır.

## 3. Aktif taşıma (enerji harcanır)

Maddenin **az olduğu yerden çok olduğu yere**, yani **derişim farkına karşı** geçişidir. Taşıyıcı protein ve **ATP** gerekir.

- **Sodyum-potasyum pompası:** Hücreden 3 $\text{Na}^+$ dışarı, 2 $\text{K}^+$ içeri taşınır. Sinir ve kas hücrelerinin çalışması için gereklidir.
- Bağırsakta besinlerin kana alınması, bitki kökünün topraktan mineral alması çoğu zaman aktif taşımayla olur.

Aktif taşıma hücrenin enerjisini harcar. Hücre zehirlenir ya da ATP üretimi durursa aktif taşıma durur.

| Özellik | Basit difüzyon | Kolaylaştırılmış | Aktif taşıma |
| --- | --- | --- | --- |
| Derişim | Çoktan aza | Çoktan aza | Azdan çoğa |
| Taşıyıcı protein | Yok | Var | Var |
| ATP | Harcanmaz | Harcanmaz | Harcanır |

## 4. Büyük moleküllerin geçişi

Zardan geçemeyecek kadar büyük parçalar **vezikülle** taşınır. **ATP harcanır.**

- **Endositoz:** Maddenin hücreye alınması. Zar maddeyi çevreleyip içeri çeker. **Fagositoz** katı parçaların (bakteri), **pinositoz** sıvı damlacıkların alınmasıdır. Akyuvarın mikrobu yutması fagositozdur.
- **Ekzositoz:** Maddenin veziküllerle dışarı atılması. Hormon ve enzim salgılanması, sinir uçlarında nörotransmitter salgısı örnektir.

## 5. Hücre ve ortam

![Alyuvarın üç farklı ortamdaki durumu. Hipertonik ortamda su çıkıp hücre büzülür, izotonikte değişmez, hipotonikte su girip hücre şişer](/lessons/tyt-bio/osmoz-ortam.svg "Hücre ve ortam | Yolumnet")

Hücre dışı ortamın çözünen derişimi hücre içine göre:

- **Hipotonik (daha seyreltik):** Su hücreye girer, hücre şişer. Hayvan hücresi patlayabilir. Bitki hücresinde **hücre duvarı** hücrenin patlamasını önler, sert ve gergin bir hal alır (**turgor**).
- **İzotonik (eşit):** Net su geçişi olmaz, hücre değişmez.
- **Hipertonik (daha derişik):** Su hücreden çıkar. Hayvan hücresi büzülür. Bitki hücresinde zar duvardan ayrılır, buna **plazmoliz** denir. Hücre tekrar saf suya konursa **deplazmoliz** gerçekleşir.

Etle tuz, meyvede şekerle dolu kavanoz, turşu kurma gibi korumalar hipertonik ortamın mikrop hücrelerinden su çekmesine dayanır. Solunum için gereken gazlar ise basit difüzyonla geçer.

:::neden-sonuc
- Hücre dışı daha derişik => Su dışarı çıkar, hücre küçülür.
- Hücre dışı daha seyreltik => Su hücreye girer, hayvan hücresi şişer.
- Madde derişim farkına karşı geçiyor => Aktif taşıma, ATP gerekir.
- Büyük parçacık hücreye alınıyor => Endositoz, ATP harcanır.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Osmozda çözünenin değil suyun hareket ettiğini unutma.** Su azdan çoğa, yani çözünen bakımından **seyreltikten derişiğe** gider. Su bakımından bakınca yine çoktan aza geçer. Bir de **kolaylaştırılmış difüzyonu aktif taşıma sanma**: Protein vardır ama derişim yönündedir ve ATP harcanmaz.
:::

:::baglanti
Bu konu, “Hücre ve Organelleri” konusundaki zar ve hücre duvarı bilgisine dayanır. “Canlıların Temel Bileşenleri” konusundaki fosfolipit ve protein yapısı zarın temelidir. Kimyada “Karışımlar” konusundaki derişim ve çözünen kavramı osmozun yönünü belirlemekte kullanılır. İnsan fizyolojisinde akciğer ve böbrekteki madde geçişleri bu mekanizmalara dayanır.
:::

## 6. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Zar | Fosfolipit + protein, seçici geçirgen |
| Difüzyon | Çoktan aza, enerji yok |
| Osmoz | Suyun geçişi, seyreltikten derişiğe |
| Aktif taşıma | Azdan çoğa, ATP |
| Endositoz | Hücreye alma, ATP |
| Ekzositoz | Dışarı atma, ATP |
| Hipertonik | Hücre büzülür, plazmoliz |
| Hipotonik | Hücre şişer, turgor |

## Mini test

:::soru{cevap="B"}
Normal bir alyuvar, kendi hücre içi sıvısından çok daha derişik bir tuz çözeltisine konuluyor. Bir süre sonra alyuvar için aşağıdakilerden hangisi gözlenir?

- A) Hücreye su girer ve hücre patlar.
- B) Hücreden su çıkar ve hücre büzülür.
- C) Su geçişi eşit olur ve hücre değişmez.
- D) Hücre zarı duvardan ayrılır.
- E) Tuz hücreye aktif taşımayla girer ve hücre şişer.

---

1. Dış ortam derişiktir (hipertonik), su az derişikten çok derişiğe, yani hücreden dışarı geçer.
2. Alyuvar büzülür. Doğru cevap B.

Diğer şıklar: **Hücreye su girer ve hücre patlar.** hipotonik ortamdaki durum anlatılmış / **Su geçişi eşit olur ve hücre değişmez.** izotonik ortamdaki durum anlatılmış / **Hücre zarı duvardan ayrılır.** alyuvarda hücre duvarı yoktur / **Tuz hücreye aktif taşımayla girer ve hücre şişer.** tuz derişik ortamdan su çıkışını durdurmaz.
:::

:::soru{cevap="C"}
Aşağıdaki madde geçişlerinden hangisinde hücre **ATP harcar**?

- A) Oksijenin alyuvara girmesi
- B) Suyun kökün hücrelerine osmozla girmesi
- C) Sodyum iyonunun hücreden derişimi yüksek dış ortama pompalanması
- D) Glikozun taşıyıcı proteinle derişimi yüksek yerden düşük yere geçmesi
- E) Karbondioksitin hücreden kana geçmesi

---

1. Derişim farkına karşı yapılan taşıma aktif taşımadır ve ATP gerektirir.
2. Na⁺'ın derişimi yüksek ortama verilmesi derişim farkına karşıdır. Diğerleri pasif taşımadır. Doğru cevap C.

Diğer şıklar: **Oksijenin alyuvara girmesi** oksijen basit difüzyonla geçer / **Suyun kökün hücrelerine osmozla girmesi** osmoz enerji gerektirmez / **Glikozun taşıyıcı proteinle derişimi yüksek yerden düşük yere geçmesi** kolaylaştırılmış difüzyon enerji gerektirmez / **Karbondioksitin hücreden kana geçmesi** karbondioksit basit difüzyonla geçer.
:::

:::soru{cevap="E"}
Yalnızca suyu geçiren yarı geçirgen bir zarla iki bölmeye ayrılmış bir kapta sol bölmede %5, sağ bölmede %15 şekerli su vardır. Bir süre sonra aşağıdakilerden hangisi gözlenir?

- A) Sol bölmede su seviyesi yükselir.
- B) Şeker sağdan sola geçer ve seviye eşitlenir.
- C) İki tarafta da seviye değişmez.
- D) Şeker soldan sağa geçer.
- E) Sağ bölmede su seviyesi yükselir.

---

1. Zar yalnızca suyu geçirir, şeker geçemez.
2. Su, seyreltik (%5) taraftan derişik (%15) tarafa geçer, sağ bölmenin seviyesi yükselir. Doğru cevap E.

Diğer şıklar: **Sol bölmede su seviyesi yükselir.** su derişik tarafa değil seyreltik tarafa sanılmış / **Şeker sağdan sola geçer ve seviye eşitlenir.** zar şekeri geçirmez / **İki tarafta da seviye değişmez.** derişim farkı olduğu için su geçer / **Şeker soldan sağa geçer.** zar şekeri geçirmez.
:::

:::soru{cevap="D"}
Bir akyuvar, bir bakteriyi zarıyla çevreleyip hücre içine alıyor ve veziküle alınan bakteri lizozomla sindiriliyor. Bu olay ve enerji durumu için aşağıdakilerden hangisi doğrudur?

- A) Ekzositozdur ve ATP harcanmaz.
- B) Osmozdur ve ATP harcanmaz.
- C) Kolaylaştırılmış difüzyondur ve ATP harcanmaz.
- D) Fagositozdur ve ATP harcanır.
- E) Basit difüzyondur ve ATP harcanır.

---

1. Katı bir parçacığın zarla sarılarak içeri alınması fagositozdur, bu bir endositoz türüdür.
2. Vezikülle taşıma enerji (ATP) gerektirir. Doğru cevap D.

Diğer şıklar: **Ekzositozdur ve ATP harcanmaz.** madde hücreye alınıyor, dışarı atılmıyor / **Osmozdur ve ATP harcanmaz.** osmoz yalnızca su geçişidir / **Kolaylaştırılmış difüzyondur ve ATP harcanmaz.** bakteri taşıyıcı proteinle geçemeyecek kadar büyüktür / **Basit difüzyondur ve ATP harcanır.** basit difüzyonda ATP harcanmaz.
:::

## Kendini dene

:::dene
1. Oksijen hücreye hangi yolla girer? => Basit difüzyon.
2. Aktif taşımada ATP gerekir mi? => Evet, derişim farkına karşı taşınır.
3. Hipertonik ortamda bitki hücresinde ne olur? => Plazmoliz.
4. Akyuvarın bakteriyi yutması hangi olaydır? => Fagositoz.
5. Osmozda su hangi yöne geçer? => Seyreltikten derişiğe.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-bio' and name = 'Hücre Zarından Madde Geçişi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Hücre zarının yapısı, basit ve kolaylaştırılmış difüzyon, osmoz, aktif taşıma, endositoz ve ekzositoz, hipotonik izotonik hipertonik ortam, plazmoliz ve turgor. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür.
Kontrol edilecekler: Osmozun yönü "çözünen derişimi az olandan çok olana" olarak yazıldı. Ders kitabı ifadesi "su potansiyeli" ile verilebilir. Na-K pompası oranı (3 Na, 2 K) standart bilgidir.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Hücre Zarından Madde Geçişi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Yeryüzünde bilinen milyonlarca canlı türü var ve her yıl yenileri bulunuyor. Bu kadar çeşidi birbirinden ayırmak, ortak özelliklere göre gruplamak ve herkesin anladığı bir adla çağırmak için bilim insanları bir **sınıflandırma sistemi** kullanır. Bu konuda sınıflandırmanın amacını, **ikili adlandırmayı**, taksonomik basamakları, **beş âlemi** ve bitki ile hayvan gruplarının ayırt edici özelliklerini öğreneceksin.

:::hedefler
1. Sınıflandırmanın neden gerekli olduğunu açıklamak.
2. İkili adlandırmayı doğru yazmak ve taksonomik basamakları sıralamak.
3. Beş âlemin temel özelliklerini ayırt etmek.
4. Bitki gruplarını ve omurgalı sınıflarını özellikleriyle eşleştirmek.
5. Basit bir tanımlama anahtarını kullanmak.
:::

## 1. Sınıflandırmanın amacı

Sınıflandırma, canlıları **benzerliklerine ve akrabalıklarına** göre gruplamaktır. Faydaları:

- Canlıların incelenmesi ve tanınması kolaylaşır.
- Bilim insanları arasında ortak dil oluşur.
- Yeni bulunan bir canlının yeri belirlenir, akrabalıkları anlaşılır.
- Canlıların evrimsel ilişkileri ortaya konur.

Sınıflandırmaya **taksonomi (sistematik)** denir. Eskiden yapı benzerliklerine bakılırken günümüzde **DNA ve protein dizilerinin** karşılaştırılması da kullanılır.

## 2. Taksonomik basamaklar ve adlandırma

Büyükten küçüğe doğru basamaklar:

**Âlem → Şube (bitkilerde bölüm) → Sınıf → Takım → Aile → Cins → Tür**

Basamak küçüldükçe gruptaki canlı sayısı **azalır**, ortak özellik sayısı **artar**. Aynı cinsteki iki canlı, aynı ailedeki ama farklı cinsteki iki canlıdan birbirine daha çok benzer.

**Tür**, doğal ortamda kendi aralarında çiftleşip **verimli döl** verebilen bireyler topluluğudur. At ile eşek farklı türdür. İkisinin melezi olan katır ise **kısırdır**, bu yüzden aynı tür sayılmazlar.

**İkili adlandırma (binomiyal).** Linnaeus’un önerdiği adlandırmada canlının adı **cins adı + tür adından** oluşur. Kurallar:

- Latince yazılır, **italik** ya da altı çizili yazılır.
- Cins adı **büyük harfle**, tür adı **küçük harfle** başlar.
- Örnek: *Homo sapiens* (insan), *Canis lupus* (kurt), *Canis familiaris* (köpek).

Aynı cinsin farklı türleri aynı cins adını taşır, tür adı onları ayırır. Kurt ile köpek aynı cinstedir.

## 3. Beş âlem sistemi

| Âlem | Hücre | Beslenme | Özellik | Örnek |
| --- | --- | --- | --- | --- |
| Bakteriler | Prokaryot, tek hücreli | Ototrof ya da heterotrof | Çekirdek zarı yok, DNA halkasal | Escherichia coli |
| Protista | Ökaryot, çoğu tek hücreli | Ototrof ya da heterotrof | Çok çeşitli | Amip, paramesyum, öglena, algler |
| Mantarlar | Ökaryot, çoğu çok hücreli | Heterotrof (ayrıştırıcı) | Hücre duvarı kitin | Küf, şapkalı mantar, maya |
| Bitkiler | Ökaryot, çok hücreli | Ototrof (fotosentez) | Hücre duvarı selüloz | Eğrelti, çam, gül |
| Hayvanlar | Ökaryot, çok hücreli | Heterotrof | Hücre duvarı yok, hareketli | Balık, kuş, insan |

**Ototrof** kendi besinini üretir (fotosentez ya da kemosentez), **heterotrof** hazır besin alır. Mayalar tek hücreli mantarlardır. Algler çoğunlukla protistadan sayılır.

Günümüzde canlılar ayrıca üç **alana** ayrılır: **Bacteria, Archaea** (prokaryot) ve **Eukarya** (ökaryot). Virüsler hücre yapısında olmadıkları için bu sistemlerin hiçbirinde yer almaz.

:::ipucu{baslik="Âlemi hızlı bulmak için"}
Önce **çekirdek zarı var mı** diye bak: Yoksa bakteri. Varsa **tek hücreli mi**: Evetse genelde protista. Çok hücreliyse **fotosentez yapıyor mu**: Evetse bitki. Hayır ve hücre duvarı kitinse mantar, duvar yoksa hayvan.
:::

## 4. Bitkiler

| Grup | İletim demeti | Üreme | Örnek |
| --- | --- | --- | --- |
| Karayosunları (yosunlar) | Yok | Sporla | Yosun |
| Eğreltiler | Var | Sporla | Eğrelti otu, at kuyruğu |
| Açık tohumlular | Var | Tohum (çıplak), çiçek yok | Çam, ardıç |
| Kapalı tohumlular | Var | Tohum (meyve içinde), çiçek var | Buğday, gül, domates |

Kapalı tohumlular **tek çenekli** (buğday, mısır, zambak) ve **çift çenekli** (fasulye, ayçiçeği, gül) olarak ikiye ayrılır. Tek çeneklilerde yapraklar paralel damarlı, çift çeneklilerde ağsı damarlıdır.

## 5. Hayvanlar

**Omurgasızlar:** Süngerler, sölenterler (denizanası, hidra), yassı solucanlar, yuvarlak solucanlar, halkalı solucanlar (yer solucanı), yumuşakçalar (salyangoz, ahtapot), eklembacaklılar (böcek, örümcek, kerevit), derisi dikenliler (denizyıldızı). Eklembacaklılar en kalabalık gruptur.

**Omurgalılar** beş sınıfta incelenir:

| Sınıf | Solunum | Kalp | Vücut ısısı | Dış yapı |
| --- | --- | --- | --- | --- |
| Balıklar | Solungaç | 2 odacıklı | Değişken | Pul, yüzgeç |
| Amfibiler | Larvada solungaç, erişkinde akciğer ve deri | 3 odacıklı | Değişken | Çıplak nemli deri |
| Sürüngenler | Akciğer | 3 odacıklı (ventrikül yarım bölmeli) | Değişken | Pullu kuru deri |
| Kuşlar | Akciğer | 4 odacıklı | Sabit | Tüy, kanat |
| Memeliler | Akciğer | 4 odacıklı | Sabit | Kıl, süt bezi |

Ayrıca amfibilerde döllenme suda olur, yumurtaları zarsız ve jelatinimsidir. Sürüngenlerin yumurtası derimsi ya da sert kabukludur, kuşların yumurtası sert kabukludur. Memelilerin çoğunda yavru anne karnında gelişir.

## 6. Tanımlama anahtarı

Bilinmeyen bir canlıyı tanımak için kullanılan basamaklı sorular dizisidir. Her basamakta **iki seçenek** vardır (ikili anahtar) ve her cevap seni başka bir basamağa ya da canlının adına götürür.

**Örnek.** 1a: Tüyleri var => Kuş. 1b: Tüyleri yok => 2’ye git. 2a: Kılları ve süt bezleri var => Memeli. 2b: Kılları yok => 3’e git. Anahtarın amacı her adımda adayları azaltmaktır.

:::neden-sonuc
- Basamak küçülüyor => Gruptaki canlı sayısı azalır, ortak özellik artar.
- İki canlı aynı cinste => Aynı ailede olmak zorundadır.
- Hücre duvarı kitin, heterotrof ve ayrıştırıcı => Mantar.
- Hücresinde çekirdek zarı yok => Bakteri âlemi.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Mantarları bitki sanma.** Mantarlar fotosentez yapmaz, heterotroftur, hücre duvarları selülozdan değil kitindendir. Bir de **ikili adlandırmada cins adını küçük yazma**: *Homo sapiens* doğru, *homo sapiens* yanlıştır.
:::

:::baglanti
Bu konu, “Hücre ve Organelleri” konusundaki prokaryot ve ökaryot ayrımına dayanır. “Canlıların Ortak Özellikleri” konusundaki virüs tartışması sınıflandırmanın sınırını gösterir. “Ekosistem Ekolojisi” konusunda üretici, tüketici ve ayrıştırıcı kavramları, burada gördüğün ototrof ve heterotrof ayrımına bağlıdır.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Basamaklar | Âlem, şube, sınıf, takım, aile, cins, tür |
| Tür | Verimli döl veren topluluk |
| İkili ad | Cins (büyük) + tür (küçük), Latince |
| Bakteriler | Prokaryot |
| Mantarlar | Kitin, ayrıştırıcı |
| Bitkiler | Fotosentez, selüloz |
| Hayvanlar | Heterotrof, duvarsız |
| Kuş ve memeli | 4 odacıklı kalp, sabit ısı |

## Mini test

:::soru{cevap="A"}
Aslanın cins adı Panthera, tür adı leo, ait olduğu aile adı Felidae'dir. Aşağıdakilerden hangisi aslanın ikili adlandırmaya uygun bilimsel adıdır?

- A) Panthera leo
- B) Panthera
- C) leo
- D) Felidae leo
- E) Panthera leo Felidae

---

1. İkili adlandırma cins adı ve tür adından oluşur.
2. Önce cins adı (büyük harfle), sonra tür adı (küçük harfle) yazılır: Panthera leo. Doğru cevap A.

Diğer şıklar: **Panthera** yalnızca cins adı yazılmış / **leo** yalnızca tür adı yazılmış / **Felidae leo** cins adı yerine aile adı yazılmış / **Panthera leo Felidae** ikili ada aile adı eklenmiş.
:::

:::soru{cevap="B"}
Üç canlıdan K ile L aynı cinse, M ise yalnızca K ve L ile aynı aileye aittir. Bu canlılarla ilgili aşağıdakilerden hangisi kesinlikle doğrudur?

- A) M, K ile L'den daha çok ortak özelliğe sahiptir.
- B) K ile L'nin ortak özellik sayısı K ile M'ninkinden fazladır.
- C) Üçü de aynı türe aittir.
- D) K ile L farklı ailelerdendir.
- E) M, K ve L ile aynı şubede bulunmaz.

---

1. Basamak küçüldükçe canlılar arasındaki benzerlik artar.
2. K ve L aynı cinste, M ile yalnızca aynı ailededir. Bu yüzden K ile L birbirine M'den daha çok benzer. Doğru cevap B.

Diğer şıklar: **M, K ile L'den daha çok ortak özelliğe sahiptir.** ortak özellik sayısı ters değerlendirilmiş / **Üçü de aynı türe aittir.** farklı cinsler farklı türdür / **K ile L farklı ailelerdendir.** aynı cins aynı aileyi gerektirir / **M, K ve L ile aynı şubede bulunmaz.** aynı aile aynı şubeyi de kapsar.
:::

:::soru{cevap="A"}
Larva döneminde solungaçla, erişkin dönemde akciğer ve nemli deriyle solunum yapan, kalbi 3 odacıklı, derisi çıplak bir omurgalı hangi sınıfa aittir?

- A) Amfibiler
- B) Balıklar
- C) Sürüngenler
- D) Kuşlar
- E) Memeliler

---

1. Larvada solungaç, erişkinde akciğer ve deri solunumu amfibilere özgüdür.
2. Amfibilerin kalbi 3 odacıklı, derisi çıplak ve nemlidir. Doğru cevap A.

Diğer şıklar: **Balıklar** balığın kalbi 2 odacıklıdır ve akciğeri yoktur / **Sürüngenler** sürüngenlerin derisi pulludur ve larva dönemi yoktur / **Kuşlar** kuşların kalbi 4 odacıklıdır / **Memeliler** memelilerin kalbi 4 odacıklıdır.
:::

:::soru{cevap="E"}
Bir canlının hücrelerinde çekirdek zarı vardır, hücre duvarı kitinden oluşur, fotosentez yapmaz ve organik atıkları ayrıştırarak beslenir. Bu canlı hangi âleme aittir?

- A) Bitkiler
- B) Bakteriler
- C) Hayvanlar
- D) Protista
- E) Mantarlar

---

1. Çekirdek zarı varsa ökaryottur, bu yüzden bakteri değildir.
2. Duvarı kitindir, fotosentez yapmaz ve ayrıştırıcıdır, bu da mantarların özelliğidir. Doğru cevap E.

Diğer şıklar: **Bitkiler** bitkilerin duvarı selüloz, besini fotosentezdir / **Bakteriler** bakterilerde çekirdek zarı yoktur / **Hayvanlar** hayvan hücrelerinde hücre duvarı yoktur / **Protista** kitin duvarlı ayrıştırıcılar mantarlardır.
:::

## Kendini dene

:::dene
1. Taksonomik basamakların en küçüğü hangisidir? => Tür.
2. İnsanın bilimsel adı nasıl yazılır? => Homo sapiens.
3. Hangi âlemde hücre duvarı kitindir? => Mantarlar.
4. Kalbi 2 odacıklı omurgalı sınıfı hangisidir? => Balıklar.
5. Katır neden ayrı bir tür sayılmaz? => Kısırdır, verimli döl vermez.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-bio' and name = 'Canlıların Sınıflandırılması'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Sınıflandırmanın amacı, taksonomik basamaklar, ikili adlandırma, beş âlem sistemi, üç alan, bitki grupları, omurgasız ve omurgalı sınıfları, tanımlama anahtarı. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Sınıflandırma ders kitabına göre âlem sayısı (5 âlem, 3 alan) farklı sunulabilir.
Kontrol edilecekler: Algler tablo gereği protistaya yazıldı. Bazı kitaplar bitkilere dahil eder. "Memelilerin çoğunda yavru anne karnında gelişir" ifadesi tek geçişli memeliler (ornitorenk) için sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Canlıların Sınıflandırılması'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir yara kapanırken, boyun uzarken, saçın büyürken, bir bitki fidesi gelişirken hücreler sürekli bölünür. Başka bir bölünme türü ise yalnızca üreme hücrelerinin oluşumunda görülür ve yavrulara farklı gen kombinasyonları aktarır. Bu konuda **hücre döngüsünü**, **mitozu**, **mayozu** ve ikisi arasındaki farkları, kromozom ve DNA miktarının evrelere göre nasıl değiştiğini öğreneceksin.

:::hedefler
1. Hücre döngüsünün evrelerini sıralamak.
2. Mitozun evrelerini ve sonuçlarını açıklamak.
3. Mayozun iki bölünmesini, kromozom sayısındaki değişimi ve çeşitlilik kaynaklarını anlatmak.
4. Mitoz ile mayozu karşılaştırmak.
5. Evrelere göre kromozom, kromatit ve DNA miktarını hesaplamak.
:::

## 1. Temel kavramlar

- **Kromatin:** İnterfazda ince iplik halindeki DNA ve protein yumağı.
- **Kromozom:** Bölünme sırasında kromatinin yoğunlaşmış hali.
- **Kromatit:** DNA eşlendikten sonra bir kromozomun iki özdeş kolundan her biri. İki **kardeş kromatit** **sentromerde** bağlıdır.
- **Homolog kromozomlar:** Biri anneden, biri babadan gelen, aynı genleri aynı sırayla taşıyan kromozom çifti.
- **$2n$ (diploit):** Homolog çiftleri bulunduran vücut hücresi. **$n$ (haploit):** Her kromozomdan yalnızca birini içeren gamet.

İnsanın vücut hücresinde $2n = 46$ kromozom vardır (44 otozom, 2 eşey kromozomu). Gametlerde $n = 23$ olur.

**Önemli kural:** Bir kromozom **iki kromatitli olsa da bir kromozom sayılır**. Kromatitler birbirinden ayrıldığında her biri yeni bir kromozom olur.

## 2. Hücre döngüsü

**İnterfaz** (bölünmeler arası uzun dönem) ve **M evresinden** (mitoz ve sitokinez) oluşur.

- **G1:** Hücre büyür, organel ve protein üretir.
- **S:** **DNA eşlenir.** DNA miktarı 2 katına çıkar, kromozom sayısı değişmez ama her kromozom 2 kromatitli olur.
- **G2:** Hücre bölünmeye hazırlanır, iğ ipliği proteinleri yapılır.
- **M:** Mitoz ve sitokinez.

Sinir ve kalp kası gibi bazı hücreler bölünmez (G0). **Kanser**, hücre döngüsünün kontrol mekanizmaları bozulduğu için hücrelerin kontrolsüz mitozla çoğalmasıdır.

## 3. Mitoz

Vücut (somatik) hücrelerinde olur, **tek bölünmedir**. Bir $2n$ hücreden genetik olarak **özdeş 2 tane $2n$ hücre** oluşur.

![Mitozun evreleri. Kromozomlar belirginleşir, ekvatorda dizilir, kromatitler ayrılır ve iki hücre oluşur](/lessons/tyt-bio/mitoz-evreleri.svg "Mitoz evreleri | Yolumnet")

1. **Profaz:** Kromatin yoğunlaşıp kromozomlar belirgin olur. Çekirdek zarı ve çekirdekçik kaybolur, iğ iplikleri oluşur (hayvanda sentrozomdan).
2. **Metafaz:** Kromozomlar **ekvator düzleminde** tek sıra dizilir. Kromozomları saymak için en uygun evredir.
3. **Anafaz:** **Kardeş kromatitler ayrılır** ve zıt kutuplara çekilir. Kromozom sayısı geçici olarak iki katına çıkar.
4. **Telofaz:** Kutuplarda yeni çekirdek zarları oluşur, kromozomlar tekrar kromatine dönüşür.
5. **Sitokinez:** Hayvan hücresinde zar içe doğru boğumlanır, bitki hücresinde ortada **hücre plağı** oluşur ve yeni hücre duvarı yapılır.

**Örnek.** $2n = 8$ olan bir hücrede anafazda kromozom sayısı $2 \cdot 8 = 16$’dır. Telofaz sonunda her yavru hücrede 8 kromozom olur.

Mitozun **işlevi**: Büyüme, onarım ve yenilenme, tek hücrelilerde ve bazı bitki ve hayvanlarda eşeysiz üreme.

## 4. Mayoz

**Üreme ana hücrelerinde** olur ve **iki ardışık bölünmeden** oluşur. DNA yalnızca bir kez eşlenir. Bir $2n$ hücreden **4 tane $n$ hücre** oluşur.

**Mayoz I (indirgeme bölünmesi):** Homolog kromozomlar ayrılır.

- **Profaz I:** Homologlar yan yana gelip **tetrat** oluşturur. Homologlar arasında **krossing-over** (parça değişimi) olur.
- **Metafaz I:** Homolog çiftler ekvatorda **çiftler halinde** dizilir.
- **Anafaz I:** **Homologlar** ayrılır (kromatitler ayrılmaz).
- **Sonuç:** 2 hücre, her biri $n$ kromozomlu ama kromozomlar hâlâ 2 kromatitlidir.

**Mayoz II (eşitlik bölünmesi):** Mitoza benzer. Araya DNA eşlenmesi girmez.

- **Anafaz II:** **Kardeş kromatitler** ayrılır.
- **Sonuç:** 4 hücre, her biri $n$ kromozomlu ve kromozomlar tek kromatitli.

**Mayozda genetik çeşitlilik** iki yolla artar: **Krossing-over** ve homolog çiftlerin ekvatorda **bağımsız dağılımı**. Döllenmede iki gametin rastgele birleşmesi çeşitliliği daha da artırır.

**Gamet oluşumu:** Erkekte bir ana hücreden 4 sperm, dişide bir ana hücreden **1 yumurta ve 3 kutup hücresi** oluşur. Kutup hücreleri sonradan yok olur.

| Kriter | Mitoz | Mayoz |
| --- | --- | --- |
| Hücre türü | Vücut hücresi | Üreme ana hücresi |
| Bölünme sayısı | 1 | 2 |
| Ürün sayısı | 2 | 4 |
| Kromozom sayısı | $2n \to 2n$ | $2n \to n$ |
| Genetik yapı | Özdeş | Farklı |
| Krossing-over | Yok | Var (Profaz I) |
| Görevi | Büyüme, onarım | Gamet üretimi |

:::ipucu{baslik="Anafaz I ile anafaz II"}
**Mayoz I’de homolog kromozomlar**, **mayoz II’de kardeş kromatitler** ayrılır. Mitozun anafazı ise mayoz II’nin anafazına benzer. Kromatitler ayrıldıktan sonra her biri ayrı bir kromozom sayılır.
:::

## 5. DNA, kromozom ve kromatit sayısı

$2n = 4$ bir canlıyı düşünelim:

| Evre | Kromozom | Kromatit | DNA miktarı |
| --- | --- | --- | --- |
| G1 | 4 | 4 (kromozom başına 1) | $x$ |
| S sonrası, G2 | 4 | 8 | $2x$ |
| Mitoz metafaz | 4 | 8 | $2x$ |
| Mitoz anafaz | 8 | 8 | $2x$ |
| Mitoz telofaz sonu (her hücre) | 4 | 4 | $x$ |
| Mayoz I sonu (her hücre) | 2 | 4 | $x$ |
| Mayoz II sonu (her hücre) | 2 | 2 | $x/2$ |

Hücredeki DNA miktarı yalnızca S evresinde artar (2 katına). Anafazda kromozom sayısı değişse de hücrenin DNA miktarı değişmez. DNA miktarı **sitokinezle** hücre bölününce yarıya iner.

## 6. Mayozdaki hatalar

Homologların ya da kromatitlerin ayrılmaması (**ayrılmama**) gametlerde kromozom eksik ya da fazla olmasına yol açar. Kromozom 21’in üç kopya olması (**Down sendromu**, $2n + 1 = 47$) bunun bilinen örneğidir.

:::neden-sonuc
- DNA eşlenmesi gerçekleşiyor => S evresi, DNA miktarı 2 katına çıkar.
- Kardeş kromatitler ayrılıyor => Anafaz, kromozom sayısı geçici iki katına çıkar.
- Homolog kromozomlar ayrılıyor => Mayoz I, kromozom sayısı yarıya iner.
- Krossing-over gerçekleşiyor => Mayoz profaz I, genetik çeşitlilik artar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Kromatit sayısı ile kromozom sayısını karıştırma.** İki kromatitli bir kromozom **1 kromozom** sayılır. **Mayoz I sonunda kromozom sayısı yarıya iner ama DNA miktarı hemen yarıya inmez, kromatitler hâlâ çifttir**. Bir de **mitozda homologların eşleştiğini sanma**: Eşleşme (tetrat) yalnızca mayoz I’de olur.
:::

:::baglanti
Bu konu, “Hücre ve Organelleri” konusundaki çekirdek, sentrozom ve hücre duvarını bilmeni gerektirir. “Kalıtım” konusunda mayozun ürünü gametlerle çaprazlamaları yapacak, “Canlıların Ortak Özellikleri” konusundaki üreme ve büyümeyi mitoz ve mayoz üzerinden açıklayacaksın. “Canlıların Temel Bileşenleri” konusundaki DNA yapısı, S evresindeki eşlenmenin temelidir.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| İnterfaz | G1, S (DNA eşlenir), G2 |
| Mitoz | 2 özdeş hücre, $2n \to 2n$ |
| Mayoz | 4 farklı hücre, $2n \to n$ |
| Mayoz I | Homologlar ayrılır |
| Mayoz II ve mitoz anafaz | Kardeş kromatitler ayrılır |
| Krossing-over | Profaz I |
| Kromozom sayımı | Sentromer sayısına göre |

## Mini test

:::soru{cevap="D"}
Kromozom sayısı $2n = 14$ olan bir canlının vücut hücresinde mitoz bölünmenin anafaz evresinde hücrede kaç kromozom bulunur?

- A) 7
- B) 14
- C) 27
- D) 28
- E) 56

---

1. Anafazda kardeş kromatitler ayrılır ve her biri ayrı bir kromozom sayılır.
2. Kromozom sayısı geçici olarak iki katına çıkar: $2 \cdot 14 = 28$. Doğru cevap D.

Diğer şıklar: **7** gametteki kromozom sayısı alınmış / **14** kromatitlerin ayrılması hesaba katılmamış / **27** işlem hatasıyla bir eksik bulunmuş / **56** kromozom sayısı iki kez ikiye katlanmış.
:::

:::soru{cevap="E"}
$2n = 12$ olan bir üreme ana hücresi mayoza girmiştir. Mayoz I tamamlandığında oluşan hücrelerin her birinde kromozom ve kromatit sayısı aşağıdakilerden hangisinde doğru verilmiştir?

- A) 6 kromozom, 6 kromatit
- B) 12 kromozom, 24 kromatit
- C) 12 kromozom, 12 kromatit
- D) 3 kromozom, 6 kromatit
- E) 6 kromozom, 12 kromatit

---

1. Mayoz I'de homologlar ayrılır, kromozom sayısı $12 \to 6$ olur.
2. Kromatitler ayrılmadığı için her kromozom hâlâ iki kromatitlidir: $6 \cdot 2 = 12$. Doğru cevap E.

Diğer şıklar: **6 kromozom, 6 kromatit** mayoz II sonundaki değer yazılmış / **12 kromozom, 24 kromatit** bölünme başlamadan önceki değer yazılmış / **12 kromozom, 12 kromatit** mitozdan sonraki hücrenin değeri yazılmış / **3 kromozom, 6 kromatit** kromozom sayısı iki kez yarıya indirilmiş.
:::

:::soru{cevap="E"}
Aşağıdakilerden hangisi mitozda görülmez ve yalnızca mayozda gerçekleşir?

- A) İğ ipliklerinin oluşması
- B) Kardeş kromatitlerin ayrılması
- C) İnterfazda DNA eşlenmesi
- D) Hücre bölünmesinin sitokinezle tamamlanması
- E) Homolog kromozomların tetrat oluşturması

---

1. İğ ipliği, kromatit ayrılması, DNA eşlenmesi ve sitokinez mitozda da vardır.
2. Homologların yan yana gelip tetrat oluşturması yalnızca mayoz I'in profazında olur. Doğru cevap E.

Diğer şıklar: **İğ ipliklerinin oluşması** iğ iplikleri mitozda da oluşur / **Kardeş kromatitlerin ayrılması** mitozda anafazda gerçekleşir / **İnterfazda DNA eşlenmesi** mitoz öncesi S evresinde de gerçekleşir / **Hücre bölünmesinin sitokinezle tamamlanması** mitoz da sitokinezle biter.
:::

:::soru{cevap="C"}
Bir hücrenin ekvator düzleminde homolog kromozomlar çiftler halinde yan yana dizilmiş görülüyor. Bu hücre hangi evrededir?

- A) Mitoz metafazı
- B) Mayoz II metafazı
- C) Mayoz I metafazı
- D) Mayoz I anafazı
- E) Mitoz anafazı

---

1. Homologların çift halinde ekvatorda dizilmesi mayoz I'e özgüdür.
2. Mitoz ve mayoz II metafazında kromozomlar tek sıra dizilir. Doğru cevap C.

Diğer şıklar: **Mitoz metafazı** mitozda kromozomlar çift oluşturmadan tek sıra dizilir / **Mayoz II metafazı** mayoz II de kromozomlar tek sıra dizilir / **Mayoz I anafazı** anafazda homologlar ayrılmaya başlar / **Mitoz anafazı** anafazda kromatitler kutuplara gider.
:::

## Kendini dene

:::dene
1. DNA eşlenmesi hangi evrede olur? => S evresi.
2. Mitozun sonunda kaç hücre oluşur? => 2.
3. Kromozomların ekvatorda dizildiği evre hangisidir? => Metafaz.
4. Krossing-over mayozun hangi evresinde olur? => Profaz I.
5. $2n = 20$ olan hücrede mitoz anafazında kromozom sayısı kaçtır? => 40.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-bio' and name = 'Hücre Bölünmeleri'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Hücre döngüsü, mitoz, mayoz, krossing-over, kromozom, kromatit ve DNA miktarı değişimi, gamet oluşumu, ayrılmama. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Kromozom ve kromatit tablosu (2n=4) betik yerine elle denetlendi.
Kontrol edilecekler: Şekil yalnızca mitoz evrelerini gösterir, mayoz şeması yok. Hücre döngüsü G0 ifadesi ders kitabı düzeyinde sadeleştirildi. Tabloda "DNA miktarı" göreceli verilmiştir.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Hücre Bölünmeleri'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Gözünün rengi, kan grubun, saçının kıvrımlı ya da düz olması. Bunlar anne ve babandan geçen **genlerle** belirlenir. Kalıtım, bu özelliklerin kuşaktan kuşağa nasıl aktarıldığını inceler. Bu konuda Mendel’in çaprazlamalarını, **Punnett karesiyle olasılık hesabını**, eksik baskınlığı, **kan gruplarını**, eşeye bağlı kalıtımı, soyağacı okumayı ve DNA’dan proteine giden yolu öğreneceksin.

:::hedefler
1. Gen, alel, genotip, fenotip, homozigot ve heterozigot kavramlarını ayırt etmek.
2. Monohibrit ve dihibrit çaprazlamalarda oran ve olasılık hesaplamak.
3. Eksik baskınlık, çok alellilik ve eşeye bağlı kalıtımı yorumlamak.
4. Soyağacından kalıtım şeklini belirlemek.
5. DNA, RNA ve protein arasındaki bilgi akışını açıklamak.
:::

## 1. Temel kavramlar

- **Gen:** Bir özelliği belirleyen DNA parçası. **Alel:** Aynı genin farklı biçimleri (A ve a).
- **Baskın alel** büyük harfle (A), **çekinik alel** küçük harfle (a) yazılır. Baskın alel, heterozigotta kendini gösterir.
- **Homozigot (saf döl):** İki alel aynıdır (AA ya da aa). **Heterozigot (melez):** İki alel farklıdır (Aa).
- **Genotip:** Canlının gen yapısı (Aa). **Fenotip:** Gözlenen dış görünüş (boy, renk).
- Aynı genotipe sahip canlılar ortamın etkisiyle farklı fenotip gösterebilir. Fenotip = genotip + çevre.

Homolog kromozomların aynı lokusunda (gen yeri) bir alel çifti bulunur. Mayozda alel çifti ayrılır, **her gamet her alelden yalnızca birini** alır (Mendel’in ayrılma ilkesi).

## 2. Monohibrit çaprazlama

Tek bir özelliğin kalıtımını inceler. **Aa × Aa** çaprazlamasında gametler A ve a’dır.

![Aa x Aa çaprazlamasının Punnett karesi. Yavrularda 1 AA, 2 Aa ve 1 aa oranı, fenotipte 3 baskın ve 1 çekinik beklenir](/lessons/tyt-bio/punnett-aa.svg "Punnett karesi | Yolumnet")

- **Genotip oranı:** 1 AA : 2 Aa : 1 aa
- **Fenotip oranı:** 3 baskın : 1 çekinik
- Çekinik fenotip olasılığı $\dfrac{1}{4}$, yani %25’tir.

**Saf döl çaprazlaması:** AA × aa => bütün yavrular Aa. Bu ilk kuşak (F1) kendi aralarında çaprazlanırsa ikinci kuşakta (F2) 3 : 1 oranı yeniden görülür.

**Test çaprazlaması:** Baskın fenotipli bir bireyin AA mı Aa mı olduğunu bulmak için **çekinik (aa)** bireyle çaprazlanır. Yavrular hepsi baskın çıkarsa birey **AA**, yarısı çekinik çıkarsa **Aa**’dır.

**Olasılık kuralları:** Bağımsız olaylarda olasılıklar **çarpılır**. İki ayrı olaydan biri olabiliyorsa olasılıklar **toplanır**.

## 3. Dihibrit çaprazlama

İki özelliği birlikte inceler. Genler farklı kromozomlardaysa **bağımsız dağılır** (Mendel’in bağımsız dağılım ilkesi).

- **AaBb** bireyi **4 çeşit** gamet verir: AB, Ab, aB, ab.
- Heterozigot gen çifti sayısı $n$ ise gamet çeşidi $2^n$ olur.
- **AaBb × AaBb** çaprazlamasında 16 kutulu bir kare çıkar. Fenotip oranı **9 : 3 : 3 : 1**: 9 iki özellik de baskın, 3 yalnızca birinci baskın, 3 yalnızca ikinci baskın, 1 iki özellik de çekinik.
- **AaBb × aabb** çaprazlamasında oran 1 : 1 : 1 : 1’dir.

Dihibrit olasılığı, iki ayrı monohibrit olasılığın **çarpımıdır**. Örneğin AaBb × AaBb’de $aabb$ olasılığı $\dfrac{1}{4} \cdot \dfrac{1}{4} = \dfrac{1}{16}$.

## 4. Mendel kalıtımının istisnaları

- **Eksik baskınlık:** Heterozigot, iki homozigot arasında ara fenotip verir. Kırmızı ($\text{RR}$) ve beyaz ($\text{rr}$) çiçekli aslanağzının melezi pembe ($\text{Rr}$). F2’de fenotip oranı **1 : 2 : 1**’dir.
- **Eş baskınlık:** Heterozigotta iki alel de tam görünür (AB kan grubu).
- **Çok alellilik:** Bir gen için ikiden fazla alel vardır. ABO kan grubu örnektir. Bir birey yine en fazla **iki alel** taşır.

### ABO kan grubu

Aleller $I^A$, $I^B$ (ikisi eş baskın) ve $i$ (çekinik).

| Kan grubu | Genotip |
| --- | --- |
| A | $I^A I^A$ ya da $I^A i$ |
| B | $I^B I^B$ ya da $I^B i$ |
| AB | $I^A I^B$ |
| O | $ii$ |

Dört fenotip, altı genotip vardır. **Rh faktörü** ayrı bir gendir. Rh pozitif baskın (D), negatif çekiniktir (dd).

## 5. Eşeye bağlı kalıtım

Eşey kromozomları dişide **XX**, erkekte **XY**’dir. Y kromozomu X’ten çok küçüktür. **X kromozomuna bağlı çekinik** özelliklerde erkekte tek X olduğu için çekinik alel varsa özellik **doğrudan ortaya çıkar**. Renk körlüğü ve hemofili örnektir.

**Örnek.** Renk körlüğü alelini $\text{X}^d$ (çekinik), normal alelini $\text{X}^D$ ile gösterelim. **Taşıyıcı anne ($\text{X}^D\text{X}^d$) ile normal baba ($\text{X}^D\text{Y}$)** çaprazlanırsa:

| Çocuk | Olasılık | Durum |
| --- | --- | --- |
| $\text{X}^D\text{X}^D$ kız | $\dfrac{1}{4}$ | Normal |
| $\text{X}^D\text{X}^d$ kız | $\dfrac{1}{4}$ | Taşıyıcı |
| $\text{X}^D\text{Y}$ erkek | $\dfrac{1}{4}$ | Normal |
| $\text{X}^d\text{Y}$ erkek | $\dfrac{1}{4}$ | Renk körü |

Erkek çocukların yarısı hastadır. Erkek, X kromozomunu **anneden** alır. Bu yüzden renk körü bir babanın oğlu da renk körü olmaz, babasından Y alır.

## 6. Soyağacı okuma

- **Çekinik** özellik: Sağlam ebeveynlerin hasta çocuğu varsa özellik çekiniktir ve anne baba taşıyıcıdır.
- **Baskın** özellik: Hasta ebeveynlerin sağlam çocuğu varsa özellik baskındır ve ebeveyn heterozigottur.
- Hastalık yalnızca erkeklerde görülüyorsa ve anneden oğula geçiyorsa **X’e bağlı çekinik** olabilir.
- Sağlam bir bireyin çekinik hastalığı olan çocuğu varsa o birey kesin **heterozigottur**.

## 7. DNA’dan proteine

$$\text{DNA} \xrightarrow{\text{transkripsiyon}} \text{mRNA} \xrightarrow{\text{translasyon}} \text{protein}$$

- **Transkripsiyon (çekirdekte):** DNA’nın bir zincirinden mRNA sentezlenir.
- **Translasyon (ribozomda):** mRNA’daki **kodonlar** (3’lü nükleotit) tRNA’larla okunur, her kodon bir amino aside karşılık gelir.
- Genetik kod hemen hemen tüm canlılarda aynıdır.
- **Mutasyon:** DNA dizisindeki kalıcı değişikliktir. Mutasyon yeni alel oluşturur. Yalnızca **gametlerde** olursa yavruya geçer. Mutasyon zararlı, yansız ya da yararlı olabilir.

:::neden-sonuc
- Bir özelliğe ait iki alel farklı => Birey heterozigottur (Aa).
- Heterozigot ara fenotip veriyor => Eksik baskınlık vardır.
- Erkekte tek X olduğundan çekinik alel var => Özellik doğrudan ortaya çıkar.
- AaBb bireyi mayoz geçiriyor => 4 çeşit gamet oluşur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Bağımsız iki olay birlikte gerçekleşecekse olasılıkları toplama, çarp.** Bir de **her çocuğun olasılığı bağımsızdır**: İlk çocuk kız olduysa ikincinin kız olma olasılığı yine $\dfrac{1}{2}$’dir. **Eşeye bağlı çaprazlamalarda** genotipleri mutlaka X ve Y harfleriyle yaz.
:::

:::baglanti
Bu konu, “Hücre Bölünmeleri” konusundaki mayozun sonucu olan gametlerin oluşumunu kullanır. “Canlıların Temel Bileşenleri” konusunda DNA, RNA ve proteinin yapı taşlarını, “Hücre ve Organelleri” konusunda ribozomu öğrenmiştin. Matematikteki “Olasılık” konusu burada çarpma ve toplama kuralıyla aynı biçimde kullanılır.
:::

## 8. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Aa × Aa | 3 baskın : 1 çekinik, 1 : 2 : 1 genotip |
| AaBb × AaBb | 9 : 3 : 3 : 1 |
| Test çaprazlaması | Bilinmeyen birey × aa |
| Eksik baskınlık | Heterozigot ara fenotip, 1 : 2 : 1 |
| ABO | Çok alel, AB eş baskın |
| Eşeye bağlı | Erkekte tek X, çekinik hemen görülür |
| Gamet çeşidi | $2^n$ (n heterozigot gen) |
| DNA → mRNA → protein | Transkripsiyon, translasyon |

## Mini test

:::soru{cevap="C"}
Heterozigot esmer gözlü (Bb) bir baba ile mavi gözlü (bb) bir annenin çocuğunun mavi gözlü olma olasılığı yüzde kaçtır? (Esmer göz baskındır.)

- A) 25
- B) 49
- C) 50
- D) 75
- E) 100

---

1. Bb × bb çaprazlamasında baba gametleri B ve b, anne gametleri b'dir.
2. Yavrular $\dfrac{1}{2}$ Bb (esmer), $\dfrac{1}{2}$ bb (mavi) olur. Mavi göz olasılığı %50. Doğru cevap C.

Diğer şıklar: **25** iki heterozigotun çaprazlaması sanılmış / **49** işlem hatasıyla bir eksik bulunmuş / **75** baskın fenotip olasılığı alınmış / **100** annenin fenotipi çocuğa kesin geçer sanılmış.
:::

:::soru{cevap="D"}
AaBb × AaBb çaprazlamasından (genler farklı kromozomlarda ve tam baskın) 320 yavru elde ediliyor. Yavruların yaklaşık kaçının her iki özellik bakımından da baskın fenotipte olması beklenir?

- A) 20
- B) 60
- C) 80
- D) 180
- E) 240

---

1. Dihibrit çaprazlamada her iki özelliği de baskın olanların oranı $\dfrac{9}{16}$'dır.
2. $320 \cdot \dfrac{9}{16} = 180$. Doğru cevap D.

Diğer şıklar: **20** çift çekinik oranı alınmış / **60** yalnızca bir özelliği baskın olanlar alınmış / **80** AaBb genotipinin oranı alınmış / **240** tek özellik için baskın oranı (3/4) alınmış.
:::

:::soru{cevap="A"}
A kan gruplu bir annenin ve B kan gruplu bir babanın O kan gruplu bir çocuğu vardır. Anne ve babanın genotipleri aşağıdakilerden hangisidir?

- A) Anne $I^A i$, baba $I^B i$
- B) Anne $I^A I^A$, baba $I^B i$
- C) Anne $I^A i$, baba $I^B I^B$
- D) Anne $I^A I^A$, baba $I^B I^B$
- E) Anne $ii$, baba $I^B i$

---

1. O kan grubu $ii$ genotipindedir, çocuk $i$ aleli iki ebeveynden de almıştır.
2. Hem anne hem baba $i$ taşımalıdır. A grubu anne $I^A i$, B grubu baba $I^B i$ olmalıdır. Doğru cevap A.

Diğer şıklar: **Anne $I^A I^A$, baba $I^B i$** homozigot anne çocuğa $i$ aleli veremez / **Anne $I^A i$, baba $I^B I^B$** homozigot baba çocuğa $i$ aleli veremez / **Anne $I^A I^A$, baba $I^B I^B$** bu çiftin tüm çocukları AB olur / **Anne $ii$, baba $I^B i$** anne O grubu olurdu, A değil.
:::

:::soru{cevap="E"}
Renk körlüğü X kromozomunda çekinik bir alelle belirlenir. Renk körü bir baba ile taşıyıcı olmayan normal bir annenin çocukları için aşağıdakilerden hangisi doğrudur?

- A) Kız çocukları renk körü, erkek çocukları normaldir.
- B) Erkek çocukları renk körü, kızlar normaldir.
- C) Kız çocukları normal, erkek çocukların yarısı renk körüdür.
- D) Bütün çocukları renk körüdür.
- E) Kız çocukları taşıyıcı, erkek çocukları normaldir.

---

1. Baba $\text{X}^d\text{Y}$, anne $\text{X}^D\text{X}^D$.
2. Kızlar babadan $\text{X}^d$, anneden $\text{X}^D$ alır ve taşıyıcı olur. Oğullar babadan Y, anneden $\text{X}^D$ alır ve normaldir. Doğru cevap E.

Diğer şıklar: **Kız çocukları renk körü, erkek çocukları normaldir.** kızlar babadan X alır ama anneden normal alel de alır / **Erkek çocukları renk körü, kızlar normaldir.** erkekler X kromozomunu anneden alır / **Kız çocukları normal, erkek çocukların yarısı renk körüdür.** anne taşıyıcı değildir, oğullar hasta olmaz / **Bütün çocukları renk körüdür.** anne normal alel taşır.
:::

## Kendini dene

:::dene
1. Heterozigot birey hangi harflerle gösterilir? => Aa.
2. Aa × Aa’da çekinik fenotip yüzde kaçtır? => %25.
3. AaBb bireyi kaç çeşit gamet verir? => 4.
4. O kan grubunun genotipi nedir? => $ii$.
5. Renk körlüğü neden erkeklerde daha sık görülür? => Erkekte tek X vardır, çekinik alel doğrudan ortaya çıkar.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-bio' and name = 'Kalıtım'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Temel kalıtım kavramları, monohibrit ve dihibrit çaprazlama, test çaprazlaması, eksik baskınlık, çok alellilik (ABO), eşeye bağlı kalıtım, soyağacı, transkripsiyon ve translasyon, mutasyon. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. Oranlar (3:1, 9:3:3:1, 1:2:1) ve olasılık hesapları betikle doğrulandı.
Kontrol edilecekler: Bağlantılı genler ve krossing-over etkisi metne alınmadı. Soyağacı bölümü şekilsiz yazıldı, sınavda görsel soru çıkabilir. "Mutasyon yalnızca gametlerde olursa yavruya geçer" ifadesi ders kitabı düzeyinde sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Kalıtım'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Bir göl, bir orman ya da bir çayır düşün. Bitkiler, hayvanlar, mantarlar, bakteriler, toprak, su, ışık ve hava bir arada, birbirine bağlı olarak yaşar. **Ekoloji**, canlıların birbirleriyle ve cansız çevreleriyle ilişkisini inceler. Bu konuda **ekosistemin bileşenlerini**, besin zincirini ve enerji akışını, **madde döngülerini**, canlılar arası ilişkileri ve popülasyonların nasıl büyüdüğünü öğreneceksin.

:::hedefler
1. Biyotik ve abiyotik faktörleri, popülasyon, komünite ve ekosistem kavramlarını ayırt etmek.
2. Besin zinciri ve ağında üretici, tüketici ve ayrıştırıcıyı belirlemek.
3. Enerji akışının tek yönlü olduğunu ve her basamakta azaldığını hesaplamak.
4. Karbon ve azot döngülerini açıklamak.
5. Canlılar arası ilişkileri (mutualizm, parazitlik vb.) örneklemek.
:::

## 1. Ekosistemin bileşenleri

- **Abiyotik (cansız) faktörler:** Işık, sıcaklık, su, toprak, pH, tuzluluk, gazlar.
- **Biyotik (canlı) faktörler:** Üreticiler, tüketiciler, ayrıştırıcılar ve bunların etkileşimleri.
- **Popülasyon:** Aynı türün aynı yerde yaşayan bireyleri.
- **Komünite (topluluk):** Aynı alandaki farklı türlerin popülasyonları.
- **Ekosistem:** Komünite ile cansız çevrenin birlikte oluşturduğu sistem.
- **Biyom:** Geniş bir bölgedeki benzer iklim ve canlı topluluğu (çöl, tundra, yağmur ormanı).
- **Habitat:** Bir türün yaşadığı yer. **Niş:** Türün ekosistemdeki rolü ve kullandığı kaynaklar (ne yer, ne zaman aktiftir, nerede ürer).

Bir canlının yaşayabildiği abiyotik koşul aralığı ve bunlardan bir tanesinin yetersiz olması, popülasyonun boyutunu sınırlar. Buna **sınırlayıcı faktör** denir.

## 2. Besin zinciri ve besin ağı

- **Üretici:** Fotosentez ya da kemosentezle inorganikten organik madde üreten ototroflar (bitki, alg, fotosentetik bakteri). Zincirin ilk halkasıdır.
- **Tüketici:** Hazır besin alan heterotroflar. **1. derece tüketici** otçul, **2. derece** etçil (otçulu yer), **3. derece** onu yiyen etçildir. Hem bitki hem hayvan yiyene **hepçil** denir.
- **Ayrıştırıcı:** Ölü canlı ve atıkları parçalayan bakteri ve mantarlar. Maddeyi inorganik hale getirerek döngüye geri verir.

Basit bir zincir: **Çim → çekirge → kurbağa → yılan → şahin.**

Doğada tek zincir yerine, birçok zincirin birbirine bağlandığı **besin ağı** vardır. Bir türün azalması ağın başka halkalarını etkiler.

## 3. Enerji akışı ve piramitler

Ekosistemin enerjisi **Güneş’ten** gelir. Üretici ışık enerjisini kimyasal enerjiye çevirir. Enerji zincirde **tek yönlü** akar. Bir basamaktan diğerine geçerken **yaklaşık %10’u** aktarılır, geri kalanı **solunumla ısıya** dönüşür ya da atıklarla ayrıştırıcılara gider.

![Enerji piramidi. Üreticide 10 000 kJ varsa 1. derece tüketicide 1 000 kJ, 2. derecede 100 kJ, 3. derecede 10 kJ enerji bulunur](/lessons/tyt-bio/enerji-piramidi.svg "Enerji piramidi | Yolumnet")

**Örnek.** Üreticide 10 000 kJ enerji varsa 1. derece tüketiciye 1 000 kJ, 2. derece tüketiciye 100 kJ geçer.

Bu yüzden besin zincirleri uzun olmaz (genellikle 4 ya da 5 halka). Üst basamaklarda canlı sayısı ve toplam kütle azalır.

**Piramit türleri:**

- **Enerji piramidi:** Her zaman dik (tabanı geniş) olur.
- **Biyokütle piramidi:** Genellikle diktir, nadiren ters olabilir (okyanustaki planktonlarda).
- **Birey sayısı piramidi:** Bazen ters olabilir. Tek bir büyük ağaçta binlerce böcek yaşayabilir.

**Madde** ise enerjiden farklı olarak ekosistemde **döngü yapar**.

## 4. Madde döngüleri

### Karbon döngüsü

- Atmosferdeki $\text{CO}_2$, **fotosentezle** üreticilere girer.
- Besin zinciri boyunca karbon organik madde olarak taşınır.
- **Solunum, yanma ve ayrışma** ile $\text{CO}_2$ atmosfere geri döner.
- Fosil yakıtların yanması dengeyi bozar, atmosferde $\text{CO}_2$ artar.

### Azot döngüsü

Atmosferin yaklaşık **dörtte üçü** azot gazıdır ($\text{N}_2$). Bitkiler bu gazı doğrudan kullanamaz.

| Adım | Ne olur | Kim yapar |
| --- | --- | --- |
| Azot bağlama | $\text{N}_2 \to \text{NH}_3$ (amonyak) | Azot bağlayıcı bakteriler (baklagil kökündeki Rhizobium, siyanobakteri) |
| Amonifikasyon | Ölü organik azot $\to$ amonyum | Ayrıştırıcılar |
| Nitrifikasyon | $\text{NH}_4^+ \to \text{NO}_2^- \to \text{NO}_3^-$ | Nitrifikasyon bakterileri |
| Bitkiye alım | $\text{NO}_3^-$ ve $\text{NH}_4^+$ kökle alınır | Bitki |
| Denitrifikasyon | $\text{NO}_3^- \to \text{N}_2$ | Denitrifikasyon bakterileri |

Yıldırım da az miktarda azotu bağlar. Azot, proteinler ve nükleik asitler için gereklidir. Baklagil ekilen tarlalar bu yüzden toprağı azotça zenginleştirir.

### Su ve fosfor

Su döngüsü buharlaşma, terleme, yoğunlaşma ve yağışla gerçekleşir. **Fosfor** ise atmosferde bulunmaz, kayalar ve toprak yoluyla döner.

## 5. Canlılar arası ilişkiler

| İlişki | Türler | Örnek |
| --- | --- | --- |
| Mutualizm (+/+) | İkisi de yararlanır | Liken (mantar ve alg), Rhizobium ve baklagil |
| Komensalizm (+/0) | Biri yararlanır, diğeri etkilenmez | Ağaç gövdesinde yaşayan orkide |
| Parazitlik (+/-) | Biri yararlanır, diğeri zarar görür | Tenya, kene, bit |
| Yırtıcılık (+/-) | Yırtıcı avını öldürür ve yer | Aslan ve ceylan |
| Rekabet (-/-) | İkisi de zarar görür (kaynağı paylaşırken) | Aynı ağaçta beslenen iki kuş türü |

## 6. Popülasyon büyümesi

Besin, alan ve avcı gibi etkenler sınırsızsa popülasyon **üstel (J eğrisi)** büyür. Gerçek ekosistemde kaynaklar sınırlıdır ve popülasyon **taşıma kapasitesine** yaklaşınca büyüme yavaşlar, **S eğrisi** oluşur.

Bir popülasyonun büyüklüğünü **doğum, ölüm, göç (giriş) ve göç (çıkış)** belirler.

:::neden-sonuc
- Enerji bir basamaktan diğerine geçiyor => Yaklaşık %10’u aktarılır, geri kalanı ısıya döner.
- Besin zinciri çok uzuyor => Üst basamaklara ulaşan enerji çok azalır.
- Bitkiler azot gazını kullanamıyor => Azot bağlayıcı bakteriler gerekir.
- İki tür aynı kaynağı kullanıyor => Aralarında rekabet olur.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Enerjinin döngü yaptığını sanma.** Enerji ekosistemden **tek yönlü akar** ve sonunda ısı olarak kaybolur. **Döngü yapan madde** (karbon, azot, su) tekrar kullanılır. Bir de **ayrıştırıcıları besin zincirinin dışında tutma**: Her basamaktan geri dönen madde ayrıştırıcıdan geçer.
:::

:::baglanti
Bu konu, “Canlıların Sınıflandırılması” konusundaki ototrof ve heterotrof ayrımına dayanır. “Canlıların Ortak Özellikleri” konusundaki organizasyon düzeyleri, popülasyondan biyosfere uzanan düzeni burada genişletir. “Güncel Çevre Sorunları” konusunda karbon döngüsündeki bozulma küresel iklim değişimine bağlanır. Fizikte “Enerji” konusu ve kimyada “Doğa ve Kimya” konusu bu bilgiyi destekler.
:::

## 7. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Biyotik, abiyotik | Canlı ve cansız faktörler |
| Üretici | Ototrof, zincirin başı |
| Ayrıştırıcı | Maddeyi döngüye geri verir |
| Enerji | Tek yönlü, basamakta %10 aktarılır |
| Karbon | Fotosentezle girer, solunumla çıkar |
| Azot | Bağlama, nitrifikasyon, denitrifikasyon |
| Mutualizm | İkisi de kazanır |
| Parazit | Biri kazanır, biri zarar görür |

## Mini test

:::soru{cevap="B"}
Bir besin zincirinde üreticilerde 20 000 kJ enerji bulunmaktadır. Her basamakta enerjinin %10’u bir sonraki basamağa aktarıldığına göre 3. derece tüketicilere kaç kJ enerji ulaşır?

- A) 2
- B) 20
- C) 21
- D) 200
- E) 2000

---

1. 1. derece tüketici: $20\,000 \cdot 0{,}1 = 2000\ \text{kJ}$.
2. 2. derece: $200\ \text{kJ}$. 3. derece: $20\ \text{kJ}$. Doğru cevap B.

Diğer şıklar: **2** bir basamak fazla ilerlenmiş (4. derece tüketici) / **21** işlem hatasıyla bir fazla bulunmuş / **200** 2. derece tüketicinin enerjisi alınmış / **2000** 1. derece tüketicinin enerjisi alınmış.
:::

:::soru{cevap="C"}
Termitlerin bağırsağında yaşayan bazı mikroorganizmalar odundaki selülozu sindirir. Termit hem besinini sindirebilir hem de bu mikroorganizmalara barınak ve besin sağlar. Bu ilişki aşağıdakilerden hangisidir?

- A) Parazitlik
- B) Komensalizm
- C) Mutualizm
- D) Rekabet
- E) Yırtıcılık

---

1. Termit selülozu sindirebiliyor, mikroorganizmalar ise barınak ve besin buluyor.
2. İki tür de yarar sağladığına göre ilişki mutualizmdir. Doğru cevap C.

Diğer şıklar: **Parazitlik** termit zarar görmüyor, yarar sağlıyor / **Komensalizm** ikisi de yararlanıyor, biri etkilenmeden kalmıyor / **Rekabet** ikisi aynı kaynak için yarışmıyor / **Yırtıcılık** mikroorganizmalar termit tarafından avlanmıyor.
:::

:::soru{cevap="B"}
Çim → çekirge → kurbağa → yılan → şahin besin zincirinde çekirge popülasyonu bir hastalık nedeniyle kısa sürede büyük ölçüde azalıyor. Bu zincirde kısa vadede aşağıdakilerden hangisi beklenir?

- A) Çim miktarı azalır, kurbağa sayısı artar.
- B) Çim miktarı artar, kurbağa sayısı azalır.
- C) Çim ve kurbağa miktarı artar.
- D) Çim ve kurbağa miktarı azalır.
- E) Yılan sayısı hemen artar.

---

1. Çekirge çimi yer. Çekirge azalırsa çimin yenme baskısı azalır ve çim artar.
2. Kurbağa çekirge ile beslenir. Besin azalınca kurbağa azalır. Doğru cevap B.

Diğer şıklar: **Çim miktarı azalır, kurbağa sayısı artar.** otçul azalınca bitki yenmesi azalır, kurbağanın besini de azalır / **Çim ve kurbağa miktarı artar.** kurbağanın besini azaldığı için kurbağa artmaz / **Çim ve kurbağa miktarı azalır.** çekirge azalınca çimi yiyen azalır / **Yılan sayısı hemen artar.** besin zincirinde yılanın besini azalır.
:::

:::soru{cevap="A"}
Atmosferdeki serbest azot gazını ($\text{N}_2$) amonyağa çevirerek bitkilerin kullanabileceği hale getiren canlılar aşağıdakilerden hangisidir?

- A) Azot bağlayıcı bakteriler
- B) Denitrifikasyon bakterileri
- C) Nitrifikasyon bakterileri
- D) Ayrıştırıcı mantarlar
- E) Bitkilerin kök hücreleri

---

1. Serbest $\text{N}_2$'yi amonyağa çevirme işine azot bağlama denir.
2. Bunu Rhizobium gibi azot bağlayıcı bakteriler ve siyanobakteriler yapar. Doğru cevap A.

Diğer şıklar: **Denitrifikasyon bakterileri** nitratı azot gazına çevirerek atmosfere geri verir / **Nitrifikasyon bakterileri** amonyumu nitrata çevirir, N₂ bağlamaz / **Ayrıştırıcı mantarlar** ölü organik azotu amonyuma çevirir, N₂ bağlamaz / **Bitkilerin kök hücreleri** bitki N₂ gazını doğrudan kullanamaz.
:::

## Kendini dene

:::dene
1. Besin zincirinin ilk halkası hangi canlıdır? => Üretici.
2. Enerji her basamakta yaklaşık yüzde kaçı aktarılır? => %10.
3. Tenya ve insan arasındaki ilişki nedir? => Parazitlik.
4. Ölü canlıları ayrıştıran canlılara ne denir? => Ayrıştırıcı.
5. Atmosferdeki azotu amonyağa çeviren canlılar kimlerdir? => Azot bağlayıcı bakteriler.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 18, false from public.topics where subject_id = 'tyt-bio' and name = 'Ekosistem Ekolojisi'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Ekosistemin bileşenleri, besin zinciri ve ağı, enerji akışı ve piramitler, karbon ve azot döngüleri, canlılar arası ilişkiler, popülasyon büyümesi. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin, şekil ve sorular özgündür. %10 kuralı ortalama değerdir, kaynağa göre %5 ile %20 arasında verilebilir.
Kontrol edilecekler: Atmosferde azotun yaklaşık yüzde 78 olduğu ifadesi "dörtte üçü" olarak yazıldı. Biyokütle piramidinin ters örneği (plankton) sadeleştirildi.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Ekosistem Ekolojisi'
on conflict (topic_id) do nothing;

insert into public.lessons (topic_id, body, reading_minutes, published)
select id, $lesson$## Bu konuda ne öğreneceksin

Şehirlerde sisli, ağır bir hava, dereye akan köpüklü atıksu, yıllar geçtikçe sıcaklık rekorları, tükenen balık türleri ve denizde yüzen plastikler. Bunlar çevre sorunlarının günlük hayattaki görünümleridir. Bu sorunların çoğu **insan etkinliklerinden** kaynaklanır ve ekosistemdeki dengeyi bozar. Bu konuda **hava, su ve toprak kirliliğini**, küresel iklim değişimini, ozon tabakasının incelmesini, **biyolojik birikimi**, biyoçeşitlilik kaybını ve çözüm yollarını öğreneceksin.

:::hedefler
1. Hava, su ve toprak kirliliğinin nedenlerini ve sonuçlarını açıklamak.
2. Sera etkisi, küresel ısınma, asit yağmuru ve ozon incelmesini ayırt etmek.
3. Ötrofikasyonun oluşum basamaklarını sıralamak.
4. Biyolojik birikimi besin zinciri üzerinde yorumlamak.
5. Biyoçeşitliliğin korunması ve sürdürülebilirlik için bireysel ve toplumsal çözümleri sayabilmek.
:::

## 1. Hava kirliliği

Havaya salınan zararlı gazlar ve partiküllerdir. Başlıca kaynaklar **fosil yakıtlar** (kömür, petrol, doğal gaz), taşıtlar, sanayi ve ısınmadır.

| Kirletici | Kaynak | Etki |
| --- | --- | --- |
| Karbondioksit ($\text{CO}_2$) | Yanma, solunum, ormansızlaşma | Sera etkisi |
| Metan ($\text{CH}_4$) | Hayvancılık, çöp, pirinç tarlası | Güçlü sera gazı |
| Kükürt dioksit ($\text{SO}_2$) | Kükürtlü kömür, sanayi | Asit yağmuru, solunum hastalıkları |
| Azot oksitler ($\text{NO}_x$) | Taşıt motoru, sanayi | Asit yağmuru, sis |
| Karbon monoksit ($\text{CO}$) | Eksik yanma | Hemoglobine bağlanır, zehirleyici |
| Partikül madde | Yanma, toz | Akciğer sorunları |

**Karbon monoksit** kanda oksijenden daha güçlü bağlandığı için hemoglobinin oksijen taşımasını engeller. Kapalı ortamda sobadan kaynaklanan zehirlenmeler bu yüzdendir.

## 2. Sera etkisi ve küresel ısınma

Atmosferdeki **sera gazları** ($\text{CO}_2$, $\text{CH}_4$, $\text{N}_2\text{O}$, su buharı) Güneş ışınlarını geçirir, yeryüzünden yayılan ısı ışınlarını tutar. Bu doğal olay **sera etkisidir** ve yaşam için gereklidir. Sera gazları hiç olmasaydı Dünya’nın ortalama sıcaklığı bugünkünden çok daha düşük olurdu.

Sorun, insan etkinlikleriyle sera gazlarının **fazlalaşmasıdır**. Bu **kuvvetlenmiş sera etkisi** sonucu yeryüzü ortalama sıcaklığı yükselir. Buna **küresel ısınma**, bunun sonucunda iklimin uzun vadeli değişmesine **iklim değişikliği** denir.

Olası sonuçlar:

- Buzulların erimesi ve deniz seviyesinin yükselmesi
- Kuraklık, orman yangını, sel ve aşırı hava olaylarının artması
- Canlıların yaşam alanlarının kayması, bazı türlerin yok olması
- Tarım ürünü veriminin düşmesi, su kaynaklarının azalması

**Önlemler:** Fosil yakıt yerine güneş, rüzgâr gibi yenilenebilir enerji kullanımı, enerji tasarrufu, ağaçlandırma ve ormanların korunması, toplu taşıma. **Paris Anlaşması** ülkelerin sera gazı salımını azaltmayı ve küresel ısınmayı sınırlamayı hedefler.

## 3. Ozon tabakasının incelmesi

Stratosferdeki **ozon ($\text{O}_3$) tabakası** Güneş’ten gelen zararlı **mor ötesi (UV)** ışınların büyük kısmını tutar. Eski buzdolaplarında, klimalarda ve spreylerde kullanılan **CFC** (kloroflorokarbon) gazları ozonu parçalar. UV artışı cilt kanseri, göz hastalığı ve bitkilerde verim kaybı riskini yükseltir. **Montreal Protokolü** CFC kullanımını kısıtlamıştır.

Ozon incelmesi ile küresel ısınma **farklı olaylardır**. İkincisinin başlıca sebebi sera gazlarıdır, birincisinin sebebi CFC gibi maddelerdir.

## 4. Asit yağmuru

$\text{SO}_2$ ve $\text{NO}_x$ atmosferde suyla birleşip sülfürik ve nitrik asit oluşturur. Yağmurun pH’sı normalde yaklaşık 5,6’dır, asit yağmurunda bunun altına iner. Etkileri: Göl ve toprak asitlenir, ormanlar zarar görür, mermer ve kireç taşı yapılar ve heykeller aşınır, metaller korozyona uğrar.

## 5. Su kirliliği

- **Evsel ve sanayi atıkları**, deterjan, **gübre** ve tarım ilaçları, petrol sızıntıları, ağır metaller (kurşun, cıva) kirliliğe yol açar.
- **Ötrofikasyon:** Göl ve denize **azot ve fosfor** içeren gübre ya da deterjan karışırsa:
  1. Besin tuzları artar, **algler aşırı çoğalır** (alg patlaması).
  2. Su yüzeyi örtülür, ışık derine inemez, alt tabakadaki bitkiler ölür.
  3. Ölen algları ayrıştıran bakteriler suda çözünmüş **oksijeni tüketir**.
  4. Oksijensiz kalan balık ve diğer canlılar ölür.
- **Biyolojik birikim:** Doğada kolay parçalanmayan zehirli maddeler (DDT, cıva, kurşun) canlıda birikir. Besin zincirinde **basamak çıktıkça derişim artar**. Zincirin sonundaki canlılar (yırtıcı balık, kuşlar, insan) en yüksek derişime ulaşır.

**Örnek.** Suda 1 birim olan bir madde her basamakta 10 kat artıyorsa planktonda 10, küçük balıkta 100, yırtıcı balıkta 1000 birim olur.

## 6. Toprak kirliliği ve erozyon

- Tarım ilaçları, fazla kimyasal gübre, endüstriyel atık ve çöp toprağı kirletir.
- **Aşırı sulama ve kötü drenaj** toprakta tuz birikimine (**tuzlanma**) neden olur.
- Ormansızlaşma, aşırı otlatma ve yanlış tarım **erozyona**, yani verimli üst toprağın taşınmasına yol açar. Sürekli kuraklık ve erozyon bölgelerde **çölleşmeye** götürür.
- Çözümler: Doğru gübreleme, ağaçlandırma, teraslama, nadas ve ekim nöbeti.

## 7. Atıklar ve plastik kirliliği

Plastik, cam, kâğıt ve metaller **ayrı toplanıp geri dönüştürülürse** hammadde, enerji ve su tasarrufu sağlanır. Plastikler doğada çok yavaş parçalanır, **mikroplastikler** besin zincirine girer. Biyobozunur olmayan çöpler düzenli depolama alanlarında birikir. Ülkemizde **Sıfır Atık** uygulamasıyla atığı kaynağında azaltmak ve ayrı toplamak hedeflenir.

**Azaltma, yeniden kullanma, geri dönüştürme** sırası atık yönetiminin temelidir. En iyi atık, hiç oluşmamış atıktır.

## 8. Biyoçeşitlilik kaybı

Biyoçeşitlilik, genlerin, türlerin ve ekosistemlerin çeşitliliğidir. Kaybının başlıca sebepleri:

- **Yaşam alanlarının yok edilmesi** ve parçalanması (ormansızlaşma, şehirleşme)
- Aşırı avlanma ve kaçak ticaret
- Kirlilik ve iklim değişikliği
- **Yabancı (istilacı) türlerin** yeni ortama getirilmesi

Bir türün tamamen yok olmasına **nesil tükenmesi** denir. Korunması için milli parklar, doğal koruma alanları ve **gen bankaları** oluşturulur.

:::neden-sonuc
- Göle fazla fosfor ve azot karışıyor => Algler çoğalır, oksijen tükenir, balıklar ölür.
- CFC gazları atmosfere salınıyor => Ozon tabakası incelir, UV artar.
- Fosil yakıt yakılıyor => Sera gazları artar, küresel ısınma hızlanır.
- Zehirli madde besin zincirinde yukarı çıkıyor => Biyolojik birikim artar.
:::

:::ipucu{baslik="Sık yapılan hata"}
**Ozon incelmesi ile küresel ısınmayı aynı sanma.** İlkine CFC, ikincisine sera gazları yol açar. Asit yağmurunun da sebebi başka bir gruptur: $\text{SO}_2$ ve $\text{NO}_x$. Bir de **sera etkisinin tamamen zararlı olduğunu söyleme**: Doğal sera etkisi yaşam için gereklidir, sorun fazlalaşmasıdır.
:::

:::baglanti
Bu konu, “Ekosistem Ekolojisi” konusundaki besin zinciri, karbon ve azot döngüleri üzerine kurulur. Kimyada “Doğa ve Kimya” konusundaki sera etkisi ve “Kimya Her Yerde” konusundaki yakıtlar, plastikler ve geri dönüşüm doğrudan ilişkilidir. “Hücre Zarından Madde Geçişi” konusundaki derişim farkı, kirleticilerin canlıya girişini anlamana yardımcı olur.
:::

## 9. Konuyu toparla

| Başlık | Kısa not |
| --- | --- |
| Sera gazı | $\text{CO}_2$, $\text{CH}_4$, $\text{N}_2\text{O}$, su buharı |
| Küresel ısınma | Kuvvetlenmiş sera etkisi |
| Ozon incelmesi | CFC, UV artışı |
| Asit yağmuru | $\text{SO}_2$, $\text{NO}_x$ |
| Ötrofikasyon | Azot ve fosfor, alg, oksijen azalır |
| Biyolojik birikim | Yukarı basamakta derişim artar |
| Erozyon | Üst toprağın taşınması |
| Çözüm | Yenilenebilir enerji, geri dönüşüm, koruma |

## Mini test

:::soru{cevap="E"}
Bir göldeki alg, bitki ve su ürünleri zincirinde zehirli bir madde, her besin basamağında 10 kat artarak birikmektedir. Üreticilerde bu maddenin derişimi 2 birim ise 3. derece tüketicilerde kaç birim olur?

- A) 6
- B) 20
- C) 60
- D) 200
- E) 2000

---

1. Her basamakta 10 kat artar. 1. derece: $2 \cdot 10 = 20$.
2. 2. derece: $200$. 3. derece: $2000$ birim. Doğru cevap E.

Diğer şıklar: **6** basamak sayısı ile 2 çarpılmış / **20** 1. derece tüketicideki derişim alınmış / **60** basamak sayısıyla 10 çarpılmış / **200** 2. derece tüketicideki derişim alınmış.
:::

:::soru{cevap="B"}
Tarım arazilerinden göle fosforlu gübre karışıyor. Bu durumun sonucunda gölde aşağıdaki olayların hangisi sırasıyla gerçekleşir?

- A) Oksijen artar, algler azalır, balıklar çoğalır.
- B) Algler çoğalır, ölü algları ayrıştıran bakteriler oksijeni tüketir, balıklar ölür.
- C) Algler çoğalır, ışık derine daha çok girer, bitkiler çoğalır.
- D) Bakteriler azalır, ölü algların birikimi artar, oksijen artar.
- E) Algler azalır, su berraklaşır, balıklar artar.

---

1. Besin tuzları (fosfor, azot) alg patlamasına yol açar. Alg örtüsü ışığı keser.
2. Ölü algları ayrıştıran bakteriler oksijeni tüketir, oksijensiz kalan balıklar ölür. Doğru cevap B.

Diğer şıklar: **Oksijen artar, algler azalır, balıklar çoğalır.** besin tuzları algları artırır, oksijen azalır / **Algler çoğalır, ışık derine daha çok girer, bitkiler çoğalır.** alg örtüsü ışığı keser / **Bakteriler azalır, ölü algların birikimi artar, oksijen artar.** bakteriler çoğalır ve oksijeni tüketir / **Algler azalır, su berraklaşır, balıklar artar.** fosfor algları azaltmaz, artırır.
:::

:::soru{cevap="A"}
Kullanımı kısıtlanan ve eski buzdolaplarında bulunan bazı gazlar, atmosferin üst katmanında Güneş’ten gelen mor ötesi ışınları tutan bir tabakayı parçalıyor. Bu gazlar ve bu tabaka için aşağıdakilerden hangisi doğrudur?

- A) CFC gazlarıdır, ozon tabakasını inceltirler.
- B) CO₂ gazıdır, ozon tabakasını inceltir.
- C) SO₂ gazıdır, sera etkisini artırır.
- D) CFC gazlarıdır, asit yağmuru oluşturur.
- E) CH₄ gazıdır, ozon tabakasını kalınlaştırır.

---

1. Eski buzdolabı ve spreylerde bulunan gazlar CFC'dir.
2. CFC ozon tabakasını parçalar, UV geçişi artar. Doğru cevap A.

Diğer şıklar: **CO₂ gazıdır, ozon tabakasını inceltir.** karbondioksit ozonu değil sera etkisini artırır / **SO₂ gazıdır, sera etkisini artırır.** kükürt dioksit asit yağmuruna yol açar / **CFC gazlarıdır, asit yağmuru oluşturur.** CFC asit yağmuruna değil ozon incelmesine yol açar / **CH₄ gazıdır, ozon tabakasını kalınlaştırır.** metan ozonu kalınlaştırmaz.
:::

:::soru{cevap="A"}
Atmosferde sera gazlarının hiç bulunmadığını varsayalım. Bu durumda Dünya’nın yüzey sıcaklığı için aşağıdakilerden hangisi beklenir?

- A) Bugünkünden çok daha düşük olurdu.
- B) Bugünkünden çok daha yüksek olurdu.
- C) Bugünkü değerinde kalırdı.
- D) Gece ve gündüz arasında fark kalmazdı.
- E) Okyanuslar buharlaşıp kururdu.

---

1. Doğal sera etkisi, yeryüzünden yayılan ısı ışınlarının bir kısmını tutarak Dünya'yı ısıtır.
2. Sera gazları olmasaydı ısı uzaya kaçar, yüzey sıcaklığı bugünkünden çok düşük olurdu. Doğru cevap A.

Diğer şıklar: **Bugünkünden çok daha yüksek olurdu.** sera gazları ısıyı tutar, yokluğunda sıcaklık düşer / **Bugünkü değerinde kalırdı.** doğal sera etkisi sıcaklığı yükseltir / **Gece ve gündüz arasında fark kalmazdı.** ısı tutulmazsa fark artar / **Okyanuslar buharlaşıp kururdu.** sıcaklık düşeceğinden okyanus buharlaşmazdı.
:::

## Kendini dene

:::dene
1. Ozon tabakasını hangi gazlar inceltir? => CFC gazları.
2. Asit yağmurunun sebebi olan iki gaz hangisidir? => $\text{SO}_2$ ve $\text{NO}_x$.
3. Ötrofikasyonda suda hangi madde azalır? => Çözünmüş oksijen.
4. DDT gibi maddeler besin zincirinde nerede en yüksek derişimdedir? => En üst basamakta.
5. Atık yönetiminde önce ne yapılır? => Azaltma.
:::

Yanlış yaptığın soruları [yanlış soru defterine](/app/yanlislar) ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
$lesson$, 19, false from public.topics where subject_id = 'tyt-bio' and name = 'Güncel Çevre Sorunları'
on conflict (topic_id) do nothing;

insert into public.lesson_notes (topic_id, body)
select id, $lesson$Program: Hava, su ve toprak kirliliği, sera etkisi ve küresel ısınma, ozon tabakasının incelmesi, asit yağmuru, ötrofikasyon, biyolojik birikim, erozyon, atık yönetimi, biyoçeşitlilik. Kazanım kodlarını MEB programından doğrulayın.
Kaynak: Metin ve sorular özgündür. Birikim hesabı varsayımsal bir oran (10 kat) ile yapılır.
Kontrol edilecekler: Paris Anlaşması ve Montreal Protokolü yalnızca adıyla anıldı, tarih ve madde ayrıntısı yazılmadı. Sıfır Atık uygulaması yalnızca adıyla geçti, kapsamı doğrulanmalı.$lesson$ from public.topics where subject_id = 'tyt-bio' and name = 'Güncel Çevre Sorunları'
on conflict (topic_id) do nothing;
