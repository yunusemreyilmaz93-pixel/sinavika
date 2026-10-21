---
name: soru-yazimi
description: Yolumnet konu anlatımlarındaki mini test (`:::soru`) ve "Kendini dene" (`:::dene`) sorularını yazarken kullan. Çoktan seçmeli madde yazım ilkeleri, MEB bağlam temelli soru yazım kılavuzu, bağlam işlevselliği, çeldirici tasarımı, doğru şık yerleşimi, şık uzunluğu dengesi, zorluk ayarı, çözüm yazımı ve denetim komutları. LGS, TYT, AYT ve YDT soruları için geçerlidir.
---

# Soru yazımı

Bu dosya, soru yazarken yapay zekânın bilinen hatalarını önlemek içindir. Her anlatımın sorularını yazmadan önce oku. Soruları yazdıktan sonra "Denetim" bölümündeki komutları çalıştır.

Ayrıntılı kural ve örnekler için MEB'in bağlam temelli soru yazım kılavuzunun özeti `references/meb-baglam-temelli-kilavuz.md` dosyasındadır. Bağlamlı (metin, tablo, grafik, senaryo) soru yazarken önce onu oku.

## Biçim

- Mini test: konu başına 4 soru, `:::soru{cevap="X"}` bloğu. Kök, `- A) ...` şıkları, `---`, çözüm. Söz dizimi `src/features/lessons/markdown/parse.ts` içindedir.
- Şık sayısı sınav biçimine uyar: LGS 4 şık (A-D), TYT, AYT ve YDT 5 şık (A-E). Araştırmalar çoğu testte 3 şıkkın yeterli olduğunu söylese de gerçek sınav biçimine alıştırmak için bu sayılar korunur.
- `:::dene` maddeleri `soru => cevap` biçimindedir. Kısa cevaplı, anında kontrol edilebilir sorular yazılır.
- Öğrenciye "sen" denir. Uzun tire, noktalı virgül ve emoji kullanılmaz.

## İş akışı

1. **Hedefi yaz.** Soru hangi kazanımı ölçüyor? Düzey: hatırlama, anlama, uygulama, çözümleme. Mini testte hatırlama en fazla bir soru olur. Yeni nesil sorular çoğunlukla anlama, uygulama ve çözümleme düzeyindedir.
2. **Önce kavram yanılgılarını listele.** Bu konuda öğrencilerin yaptığı gerçek hataları yaz (işlem hatası, işaret hatası, birim hatası, yakın kavram karışıklığı, kökü yanlış okuma, genelleme). Çeldiriciler bu listeden gelir. Liste çıkmadan şık yazma.
3. **Doğru şık dizisini önceden planla.** Soruları yazmadan `node scripts/questions/plan-keys.mjs 4 4` çalıştır (soru sayısı, şık sayısı). Çıkan harfler soruların doğru cevabı olur. Doğru şıkkı "içimden geldiği yere" koyma.
4. **Kökü yaz.** Tek bir soru sorsun. Gereksiz bilgi ve tuzak yok. Olumsuz kök ("değildir", "yanlıştır") mümkün olduğunca az kullanılır, kullanılacaksa kalın yazılır. Çift olumsuz yok. Kökte konu anlatma, "sizce" deme. Bilgi bağlamda olsun, kök yalnızca ne istendiğini söylesin.
5. **Doğru şıkkı planlanan harfe yaz, sonra çeldiricileri yaz.** Her çeldirici, listendeki bir hatayı temsil etsin. Çözümde bu hatanın adı geçecek.
6. **Uzunluğu dengele.** Aşağıdaki "Şık uzunluğu" kuralını uygula.
7. **Çözümü yaz.** Adım adım. Doğru cevabın gerekçesi ve her çeldiricinin hangi hatadan geldiği yazılır.
8. **Doğrula.** Sayısal ve mantıksal her cevabı kodla (python) hesapla. Tarih, ayet, hadis, formül gibi bilgileri kaynakla karşılaştır. Emin değilsen soruyu yazma, anlatımın öğretmen notuna kontrol edilecekler olarak yaz.
9. **Hile testi.** Soruyu kökü okumadan yalnızca şıklara bakarak çözmeyi dene. Doğru şıkkı bulabiliyorsan soru kötüdür, yeniden yaz.
   **Bağlam işlevselliği testi (MEB):** bağlam (metin, tablo, grafik, senaryo) varsa onu okumadan, yalnızca ön bilgiyle soruyu çözmeyi dene. Çözülüyorsa bağlam süstür, soruyu bağlamdan veri okumayı gerektirecek biçimde yeniden kur. Tersi de hatadır: çözüm için gereken bilginin hepsi metinde verilirse soru alan bilgisini değil okuma anlamayı ölçer.
10. **Denetim komutlarını çalıştır.**

## Yapay zekânın sık yaptığı hatalar

Bu hatalar ölçülmüştür. Yolumnet'in ilk 216 LGS sorusunda belirgin biçimde en uzun şık olan 52 sorunun 41'inde (%79) doğru cevap o şıktı. Rastgelede bu %25 olurdu. Doğru şık harfleri ise dengeliydi, çünkü harf dağılımı bilinçli yönetilmişti. Yani bir yanlılığı yönetmek diğerini kendiliğinden düzeltmez.

| Hata | Neden olur | Önlem |
| --- | --- | --- |
| Doğru şık B ve C'de toplanır, D az gelir | Modellerde şık konumu yanlılığı vardır. Araştırmalarda model ailesine göre A ya da B ağırlığı, D'nin az çıkması görülür | Anahtarı önceden `plan-keys.mjs` ile planla |
| Doğru şık en uzun şıktır | Model doğruyu ayrıntılı ve kayıtlı yazar, çeldiriciyi kısa bırakır | Tüm şıkları aynı kalıpta ve ±%15 uzunlukta yaz. Doğru şıkkı en uzun bırakma |
| Doğru şıkta "çünkü", "ve", gerekçe var, çeldiricide yok | Aynı neden | Gerekçeyi ya her şıkka ekle ya da hiçbirine ekleme |
| Çeldirici saçma ya da çok kolay | Çeldirici kavram yanılgısından değil, rastgele üretilir | Her çeldiriciyi bir hataya bağla. En az iki çeldirici "neredeyse doğru" olmalı |
| Çeldirici çok zor, iki şık doğru sayılabilir | Yakın anlam, ince fark | Tek doğru şık için kökte ölçüt belirt, uzman gözüyle iki doğru var mı bak |
| Mutlak sözcük yalnızca çeldiricide ("her zaman", "asla", "yalnızca", "hiçbir") | Model çeldiriciyi uçlaştırır | Mutlak sözcük kullanma. Kullanılacaksa doğru şıkta da olsun |
| Doğru şık kökten sözcük alır | Kopyalama | Kökteki ifadeleri çeldiricilere de dağıt |
| Sayısal şıklarda doğru sonuç ortadadır | Model değerleri sıralayıp ortaya doğruyu koyar | Sayılar artan sırada yazılır, doğru değer planlanan harfe düşer, uçlarda da olur |
| Şıklar dilbilgisi olarak köke uymaz | Yalnızca doğru şık köke uygun yazılır | Her şık köke eklenince dilbilgisi doğru olsun |
| "Hepsi", "hiçbiri", "yukarıdakilerin hepsi" | Kolay çeldirici ya da kaçış | Kullanma. Test bunu denetler |
| Aynı kalıpta çözüm: "A yanlış. B yanlış. C yanlış." | Tembel çözüm | Her çeldiricinin hatasını adlandır |
| Dört sorunun dördü de aynı güçlükte | Zorluk planlanmaz | Aşağıdaki dağılımı kullan |
| Bağlam süs, soru bağlamsız çözülür | Önce soru yazılır, bağlam sonradan eklenir | Bağlam işlevselliği testi (iş akışı 9) |
| Doğru şık metindeki cümleyi aynen alır | Kopyalama kolaydır | Doğru şıkkı anlamca özdeş, farklı sözcüklerle yaz. Çeldirici de metinden sözcük alabilir |
| Köke ders bilgisi girer ("Hücre canlılığın temel birimidir, buna göre ...") | Bağlam ile kök karışır | Bilgiyi bağlama taşı |
| Çift olumsuzluk ("olmadığı söylenemez") | Model olumsuzu iki kez kurar | Tek olumsuz kök, koyu yazılı |
| İkinci soru birincinin cevabına dayanır | Zincir kurgu | Her soru ortak veriye dayansın ama bağımsız çözülsün ("Verilen tabloya göre ...") |
| Çözümde yalnızca doğru şık anlatılır | Çeldirici hata adı yazılmaz | Her çeldirici için hangi yanılgıdan geldiğini yaz |
| Bağlam yalnızca belirli bir kesimin bildiği şeyi anlatır (borsa, golf) | Kurgu sınırlı bir dünyadan gelir | Okul, park, doğa, alışveriş gibi ortak bağlam |
| Bağlam yapay ("3 × 2 + 5 ekmek aldı") | Soru bağlama sonradan yapıştırılır | Gerçek durum: birim fiyat karşılaştırma, tarif büyütme, ölçekli plan |

## Şık uzunluğu

- Şıkların hepsi aynı cümle yapısında olsun. Biri tam cümle, diğeri kelime olmasın.
- En uzun şık, ikinci en uzun şıktan %20'den ve 8 karakterden fazla uzun olmasın. `tests/question-quality.test.ts` bu eşiği ölçer.
- Doğru şık fazla ayrıntılıysa ayrıntıyı kısalt, çeldiricileri aynı ayrıntı düzeyine çıkar. Çeldiricilere anlamsız dolgu ekleme, kavram yanılgısını açan bir yan cümle ekle.
- Sayısal ve çok kısa şıklarda (20 karakterden kısa) uzunluk ipucu sayılmaz.

## Zorluk

Hedef güçlük indeksi (doğru yanıtlayanların oranı) p = 0,30 ile 0,70 arasıdır. Mini testte dağılım:

- 1 kolay soru (p yaklaşık 0,8): tek adım, çeldiriciler belirgin.
- 2 orta soru (p yaklaşık 0,5): iki adım ya da yakın kavram karışıklığı.
- 1 zor soru (p yaklaşık 0,35): çok adımlı, uygulama ya da çözümleme.

Zorluğu şıklarla değil bilişsel basamakla ayarla. Daha uzun kök ya da daha kafa karıştırıcı dil zorluk değildir. Gerçek öğrenci verisi gelince `lesson_answers.first_correct` oranıyla (soru başına) güçlük hesaplanır. p 0,25'in altı ya da 0,85'in üstü olan sorular gözden geçirilir. Ayırt edicilik hedefi D 0,30 ve üzeri, çeldiricilerin her biri en az yaklaşık %5 oranında seçilmeli.

## Sesli düşünme ile sınama

MEB kılavuzu (3.5) soruların pilot uygulama ve bilişsel görüşmeyle doğrulanmasını ister. Öğrenci soruyu çözerken sesli düşünür, ardından kısa sorular sorulur: bağlamı özetle, cevabı nasıl buldun, şıkları neden eledin, metne bakmadan çözebilir miydin. Soru kökü yanlış anlaşılıyorsa, bağlam okunmadan cevaplanıyorsa ya da doğru şık gerekçesiz seçiliyorsa soru yeniden yazılır. Soru formu ve bulgular `references/meb-baglam-temelli-kilavuz.md` içindedir. Yolumnet'te `lesson_answers` verisi (ilk deneme doğruluğu, hiç seçilmeyen çeldirici) soruyu gözden geçirme işaretidir.

## Sınav biçimleri

Ayrıntılar `references/sinav-bicimleri.md` içindedir. Kısaca: LGS yeni nesil sorular bağlam, tablo ve grafik içerir. TYT ve AYT sorular kısa ve nettir, matematikte işlem ağırlıklıdır. YDT sorular boşluk doldurma, cümle tamamlama, anlam bulma ve çeviridir.

## Denetim

```sh
node scripts/questions/plan-keys.mjs 4 4        # doğru şık dizisi planı
npx vitest run tests/question-quality.test.ts   # dağılım, uzunluk ve yasak şık denetimi
npx vitest run tests/lessons-content.test.ts    # söz dizimi, doğru cevap ve çözüm var mı
```

`tests/question-quality.test.ts` şunları denetler: doğru şık dağılımı (ki-kare), aynı harfin üst üste gelmesi, belirgin en uzun şıkkın doğru olma oranı (en fazla %40), anlatım başına en uzun şık yanlılığı, "hepsi" ya da "hiçbiri" şıkları, "sizce" gibi öznel kök, çift olumsuz kök, olumsuz kökün koyu yazılması, "önceki soruda" gibi zincir kök.

Testin yakalayamadığı şeyler elle denetlenir: bağlam işlevselliği, çeldiricinin gerçek bir yanılgıya dayanması, tek doğru şık, metinden aynen alınmış şık.

## Kaynaklar

- Haladyna, Downing ve Rodriguez (2002), "A Review of Multiple-Choice Item-Writing Guidelines for Classroom Assessment": 31 madde yazım ilkesi. Çeldiriciler yaygın öğrenci hatalarından gelmeli, ipucu vermemeli.
- Rodriguez (2005) meta-analizi: 3 şık çoğu durumda yeterli. Biz sınav biçimi için 4 ve 5 şık kullanırız.
- Tang, Duan ve Cai (2026), "Do Large Language Models Plan Answer Positions?": yapay zekâ ile üretilen sorularda doğru şık konumu yanlılığı. Dengeli dağılım isteyen açık talimat yanlılığı azaltır, küçük modellerde sınırlı.
- MEB, Türkiye Yüzyılı Maarif Modeli Bağlam Temelli Çoktan Seçmeli Soru Yazım Kılavuzu (Mart 2026). Özeti `references/meb-baglam-temelli-kilavuz.md` içindedir. Branş örnek soruları (3.4) ilke düzeyinde özetlendi, tek tek sorulara aktarılmadı.
- Kılavuzun dayandığı kaynaklar (kılavuzdan aktarılan atıflar): Haladyna (1992, 1997), Haladyna ve Rodriguez (2013) çeldirici ve şık kuralları, Sweller (1988) bilişsel yük, Wiggins (1998) özgün görev, Ebel (1951) bağlama dayalı soruların kökeni, Messick (1995) ve Ericsson ve Simon (1993) bilişsel görüşme.
- Güçlük ve ayırt edicilik eşikleri klasik test kuramından alınmıştır. ÖSYM'nin madde yazım kılavuzuna erişilemedi, `references/sinav-bicimleri.md` içindeki ÖSYM ve sınav biçimi notları doğrulanmamış genel bilgidir.

Bu dosyayı yeni bir hata gözlemlediğinde güncelle.
