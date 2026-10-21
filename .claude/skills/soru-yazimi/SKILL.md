---
name: soru-yazimi
description: Yolumnet konu anlatımlarındaki mini test (`:::soru`) ve "Kendini dene" (`:::dene`) sorularını yazarken kullan. Çoktan seçmeli madde yazım ilkeleri, çeldirici tasarımı, doğru şık yerleşimi, şık uzunluğu dengesi, zorluk ayarı, çözüm yazımı ve denetim komutları. LGS, TYT, AYT ve YDT soruları için geçerlidir.
---

# Soru yazımı

Bu dosya, soru yazarken yapay zekânın bilinen hatalarını önlemek içindir. Her anlatımın sorularını yazmadan önce oku. Soruları yazdıktan sonra "Denetim" bölümündeki komutları çalıştır.

## Biçim

- Mini test: konu başına 4 soru, `:::soru{cevap="X"}` bloğu. Kök, `- A) ...` şıkları, `---`, çözüm. Söz dizimi `src/features/lessons/markdown/parse.ts` içindedir.
- Şık sayısı sınav biçimine uyar: LGS 4 şık (A-D), TYT, AYT ve YDT 5 şık (A-E). Araştırmalar çoğu testte 3 şıkkın yeterli olduğunu söylese de gerçek sınav biçimine alıştırmak için bu sayılar korunur.
- `:::dene` maddeleri `soru => cevap` biçimindedir. Kısa cevaplı, anında kontrol edilebilir sorular yazılır.
- Öğrenciye "sen" denir. Uzun tire, noktalı virgül ve emoji kullanılmaz.

## İş akışı

1. **Hedefi yaz.** Soru hangi kazanımı ölçüyor? Düzey: hatırlama, anlama, uygulama, çözümleme. Mini testte hatırlama en fazla bir soru olur. Yeni nesil sorular çoğunlukla anlama, uygulama ve çözümleme düzeyindedir.
2. **Önce kavram yanılgılarını listele.** Bu konuda öğrencilerin yaptığı gerçek hataları yaz (işlem hatası, işaret hatası, birim hatası, yakın kavram karışıklığı, kökü yanlış okuma, genelleme). Çeldiriciler bu listeden gelir. Liste çıkmadan şık yazma.
3. **Doğru şık dizisini önceden planla.** Soruları yazmadan `node scripts/questions/plan-keys.mjs 4 4` çalıştır (soru sayısı, şık sayısı). Çıkan harfler soruların doğru cevabı olur. Doğru şıkkı "içimden geldiği yere" koyma.
4. **Kökü yaz.** Tek bir soru sorsun. Gereksiz bilgi ve tuzak yok. Olumsuz kök ("değildir", "yanlıştır") mümkün olduğunca az kullanılır, kullanılacaksa kalın yazılır. Çift olumsuz yok.
5. **Doğru şıkkı planlanan harfe yaz, sonra çeldiricileri yaz.** Her çeldirici, listendeki bir hatayı temsil etsin. Çözümde bu hatanın adı geçecek.
6. **Uzunluğu dengele.** Aşağıdaki "Şık uzunluğu" kuralını uygula.
7. **Çözümü yaz.** Adım adım. Doğru cevabın gerekçesi ve her çeldiricinin hangi hatadan geldiği yazılır.
8. **Doğrula.** Sayısal ve mantıksal her cevabı kodla (python) hesapla. Tarih, ayet, hadis, formül gibi bilgileri kaynakla karşılaştır. Emin değilsen soruyu yazma, anlatımın öğretmen notuna kontrol edilecekler olarak yaz.
9. **Hile testi.** Soruyu kökü okumadan yalnızca şıklara bakarak çözmeyi dene. Doğru şıkkı bulabiliyorsan soru kötüdür, yeniden yaz.
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

## Sınav biçimleri

Ayrıntılar `references/sinav-bicimleri.md` içindedir. Kısaca: LGS yeni nesil sorular bağlam, tablo ve grafik içerir. TYT ve AYT sorular kısa ve nettir, matematikte işlem ağırlıklıdır. YDT sorular boşluk doldurma, cümle tamamlama, anlam bulma ve çeviridir.

## Denetim

```sh
node scripts/questions/plan-keys.mjs 4 4        # doğru şık dizisi planı
npx vitest run tests/question-quality.test.ts   # dağılım, uzunluk ve yasak şık denetimi
npx vitest run tests/lessons-content.test.ts    # söz dizimi, doğru cevap ve çözüm var mı
```

`tests/question-quality.test.ts` şunları denetler: doğru şık dağılımı (ki-kare), aynı harfin üst üste gelmesi, belirgin en uzun şıkkın doğru olma oranı (en fazla %40), anlatım başına en uzun şık yanlılığı, "hepsi" ya da "hiçbiri" şıkları.

## Kaynaklar

- Haladyna, Downing ve Rodriguez (2002), "A Review of Multiple-Choice Item-Writing Guidelines for Classroom Assessment": 31 madde yazım ilkesi. Çeldiriciler yaygın öğrenci hatalarından gelmeli, ipucu vermemeli.
- Rodriguez (2005) meta-analizi: 3 şık çoğu durumda yeterli. Biz sınav biçimi için 4 ve 5 şık kullanırız.
- Tang, Duan ve Cai (2026), "Do Large Language Models Plan Answer Positions?": yapay zekâ ile üretilen sorularda doğru şık konumu yanlılığı. Dengeli dağılım isteyen açık talimat yanlılığı azaltır, küçük modellerde sınırlı.
- Güçlük ve ayırt edicilik eşikleri klasik test kuramından alınmıştır. ÖSYM ve MEB'in resmi madde yazım kılavuzlarına erişilemedi, bu dosyadaki sınav biçimi notları doğrulanmamış genel bilgidir.

Bu dosyayı yeni bir hata gözlemlediğinde güncelle.
