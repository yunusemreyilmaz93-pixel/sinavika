-- TYT Biyoloji: MEB ders kitabıyla uyum (üç üst âlem sistemi, ekolojik ayak izi)

update public.lessons l
set body = replace(replace(replace(replace(l.body, $a$## 3. Beş âlem sistemi

| Âlem | Hücre | Beslenme | Özellik | Örnek |
| --- | --- | --- | --- | --- |
| Bakteriler | Prokaryot, tek hücreli | Ototrof ya da heterotrof | Çekirdek zarı yok, DNA halkasal | Escherichia coli |
| Protista | Ökaryot, çoğu tek hücreli | Ototrof ya da heterotrof | Çok çeşitli | Amip, paramesyum, öglena, algler |
| Mantarlar | Ökaryot, çoğu çok hücreli | Heterotrof (ayrıştırıcı) | Hücre duvarı kitin | Küf, şapkalı mantar, maya |
| Bitkiler | Ökaryot, çok hücreli | Ototrof (fotosentez) | Hücre duvarı selüloz | Eğrelti, çam, gül |
| Hayvanlar | Ökaryot, çok hücreli | Heterotrof | Hücre duvarı yok, hareketli | Balık, kuş, insan |

**Ototrof** kendi besinini üretir (fotosentez ya da kemosentez), **heterotrof** hazır besin alır. Mayalar tek hücreli mantarlardır. Algler çoğunlukla protistadan sayılır.

Günümüzde canlılar ayrıca üç **alana** ayrılır: **Bacteria, Archaea** (prokaryot) ve **Eukarya** (ökaryot). Virüsler hücre yapısında olmadıkları için bu sistemlerin hiçbirinde yer almaz.$a$, $b$## 3. Üç üst âlem (domain)

Günümüzde canlılar hücresel yapılarına ve moleküler özelliklerine göre üç **üst âleme (domain)** ayrılır: **Bakteriler**, **Arkeler** ve **Ökaryotlar**. Bakteriler ve arkeler prokaryot, ökaryotlar ökaryot hücre yapısındadır.

| Üst âlem | Hücre | Özellik | Örnek |
| --- | --- | --- | --- |
| Bakteriler | Prokaryot, tek hücreli | Hücre duvarında genellikle peptidoglikan bulunur. DNA halkasaldır, histona sarılı değildir, plazmit içerebilir. Ototrof ya da heterotrof olabilir | Escherichia coli, Salmonella |
| Arkeler | Prokaryot, tek hücreli | Hücre duvarında peptidoglikan yoktur, zarlarında farklı lipitler bulunur. Bazı türlerin DNA’sı histona sarılıdır. Çok sıcak, tuzlu, asidik ya da oksijensiz ortamlarda yaşayanlar vardır | Sıcak su kaynaklarında yaşayan arkeler |
| Ökaryotlar | Ökaryot, tek ya da çok hücreli | Belirgin çekirdek ve zarla çevrili yapılar vardır. DNA histon proteinlerine sarılıdır, hücresel iskelet bulunur | Maya, öglena, bitki, hayvan |

Ökaryotlar protistler, mantarlar, bitkiler ve hayvanlar olarak gruplanır (eskiden bunlar ayrı âlemler olarak anılırdı).

| Ökaryot grubu | Hücre | Beslenme | Özellik | Örnek |
| --- | --- | --- | --- | --- |
| Protistler | Çoğu tek hücreli | Ototrof ya da heterotrof | Çok çeşitli | Amip, paramesyum, öglena, algler |
| Mantarlar | Çoğu çok hücreli | Heterotrof (ayrıştırıcı) | Hücre duvarı kitin | Küf, şapkalı mantar, maya |
| Bitkiler | Çok hücreli | Ototrof (fotosentez) | Hücre duvarı selüloz | Eğrelti, çam, gül |
| Hayvanlar | Çok hücreli | Heterotrof | Hücre duvarı yok, hareketli | Balık, kuş, insan |

**Ototrof** kendi besinini üretir (fotosentez ya da kemosentez), **heterotrof** hazır besin alır. Mayalar tek hücreli mantarlardır. Algler çoğunlukla protistlerden sayılır. Virüsler hücre yapısında olmadıkları için bu sistemde yer almaz.$b$), $a$3. Beş âlemin temel özelliklerini ayırt etmek.$a$, $b$3. Üç üst âlemi ve ökaryot gruplarını ayırt etmek.$b$), $a$Önce **çekirdek zarı var mı** diye bak: Yoksa bakteri.$a$, $b$Önce **çekirdek zarı var mı** diye bak: Yoksa prokaryottur (bakteri ya da arke).$b$), $a$- Hücresinde çekirdek zarı yok => Bakteri âlemi.$a$, $b$- Hücresinde çekirdek zarı yok => Prokaryottur, bakteri ya da arke.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Canlıların Sınıflandırılması'
  and position($a$## 3. Beş âlem sistemi

| Âlem | Hücre | Beslenme | Özellik | Örnek |
| --- | --- | --- | --- | --- |
| Bakteriler | Prokaryot, tek hücreli | Ototrof ya da heterotrof | Çekirdek zarı yok, DNA halkasal | Escherichia coli |
| Protista | Ökaryot, çoğu tek hücreli | Ototrof ya da heterotrof | Çok çeşitli | Amip, paramesyum, öglena, algler |
| Mantarlar | Ökaryot, çoğu çok hücreli | Heterotrof (ayrıştırıcı) | Hücre duvarı kitin | Küf, şapkalı mantar, maya |
| Bitkiler | Ökaryot, çok hücreli | Ototrof (fotosentez) | Hücre duvarı selüloz | Eğrelti, çam, gül |
| Hayvanlar | Ökaryot, çok hücreli | Heterotrof | Hücre duvarı yok, hareketli | Balık, kuş, insan |

**Ototrof** kendi besinini üretir (fotosentez ya da kemosentez), **heterotrof** hazır besin alır. Mayalar tek hücreli mantarlardır. Algler çoğunlukla protistadan sayılır.

Günümüzde canlılar ayrıca üç **alana** ayrılır: **Bacteria, Archaea** (prokaryot) ve **Eukarya** (ökaryot). Virüsler hücre yapısında olmadıkları için bu sistemlerin hiçbirinde yer almaz.$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 8. Biyoçeşitlilik kaybı$a$, $b$## Ekolojik ayak izi

**Ekolojik ayak izi**, bir kişinin, topluluğun ya da ülkenin kullandığı enerji, kaynak ve ham maddenin yeniden üretilmesi ile oluşan atıkların etkisiz hâle getirilmesi için gereken verimli toprak ve su alanı miktarıdır. Dünyanın tüketilen kaynakları yeniden üretebilme kapasitesine **biyokapasite** denir. Ekolojik ayak izi ile biyokapasite arasındaki fark **ekolojik açıklıktır**. Açık büyüdükçe kaynaklar sürdürülebilir olmayan biçimde tüketiliyor demektir.

Ayak izini küçültmek için enerji ve suyu tasarruflu kullanmak, geri dönüşüm yapmak, gıda atığını azaltmak ve toplu taşımayı tercih etmek gerekir. Su ayak izi ve karbon ayak izi de aynı mantıkla suyun ve sera gazı salımının ölçülmesidir.

## 8. Biyoçeşitlilik kaybı$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-bio' and t.name = 'Güncel Çevre Sorunları'
  and position($a$## 8. Biyoçeşitlilik kaybı$a$ in l.body) > 0;
