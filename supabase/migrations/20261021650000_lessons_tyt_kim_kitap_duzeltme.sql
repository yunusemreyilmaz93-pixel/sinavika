-- TYT Kimya: MEB ders kitabıyla uyum (alt disiplinler, orbitaller, gruplar, Lewis, tepkime türleri, sıvılar, katılar, ppm)

update public.lessons l
set body = replace(replace(l.body, $a$## Elektron dizilimini gör$a$, $b$**Orbitaller ve orbital gösterimi.** Elektronun bulunma olasılığının yüksek olduğu bölgeye **orbital** denir. Her orbitalde en çok 2 elektron bulunabilir (**Pauli dışlama ilkesi**). s orbitali küresel simetriktir ve tek orbitaldir, p alt katmanı üç orbital içerir. Elektronlar orbitallere enerjisi düşük olandan yükseğe doğru yerleşir (**Aufbau ilkesi**):

$$1s < 2s < 2p < 3s < 3p < 4s$$

Enerjileri eşit orbitallerde (örneğin üç p orbitalinde) elektronlar önce tek tek ve aynı yönde yerleşir, sonra eşlenir (**Hund kuralı**). Elektron dizilimi bu gösterimle yazılır:

| Element | Orbital gösterimi | Son katman (valans) elektronu |
| --- | --- | --- |
| O ($Z = 8$) | $1s^2\ 2s^2\ 2p^4$ | 6 |
| Na ($Z = 11$) | $1s^2\ 2s^2\ 2p^6\ 3s^1$ | 1 |
| Ca ($Z = 20$) | $1s^2\ 2s^2\ 2p^6\ 3s^2\ 3p^6\ 4s^2$ | 2 |

Katyon oluşurken elektronlar en dış katmandan verilir. $\text{Na}^+$, $\text{Mg}^{2+}$ ve Ne aynı elektron sayısına (10) sahiptir, bunlara **izoelektronik** türler denir.

## Elektron dizilimini gör$b$), $a$| 8A | Soygazlar | He, Ne, Ar |$a$, $b$| 3A | Toprak metalleri (B yarı metaldir) | Al |
| 8A | Soygazlar | He, Ne, Ar |

1A metalleri bileşiklerinde yalnızca $+1$, 2A metalleri yalnızca $+2$ yüklü iyon oluşturur. 1A metalleri en aktif metallerdir ve su ile tepkimeye girerek metal hidroksit ile hidrojen gazı oluşturur. Hidrojen ametaldir, ametallerle bileşiklerinde $+1$, metallerle bileşiklerinde $-1$ yük alır.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Atom ve Periyodik Sistem'
  and position($a$## Elektron dizilimini gör$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(l.body, $a$Önce metal, sonra ametalin “-ür / -ür” ya da “oksit” gibi adı yazılır: NaCl sodyum klorür, MgO magnezyum oksit.$a$, $b$Önce metalin adı, sonra ametalin adı yazılır. Ametalin adına “-ür” eki gelir ya da “oksit” denir: NaCl sodyum klorür, MgO magnezyum oksit.$b$), $a$Su H-O-H, karbon dioksit O=C=O, azot $\text{N}\equiv\text{N}$ biçimindedir.$a$, $b$Su H-O-H, karbon dioksit O=C=O, azot $\text{N}\equiv\text{N}$ biçimindedir.

**Lewis nokta yapısı.** Atomun son katmandaki (valans) elektronları nokta ile gösterilir. Bağ yapan elektron çifti çizgiyle, bağa katılmayan çift ise iki noktayla yazılır. Suda oksijenin iki bağ çifti ve iki ortaklanmamış çifti vardır. Amonyakta azotun üç bağ çifti ve bir ortaklanmamış çifti, karbon dioksitte karbonun iki çift bağı vardır. Bağ yapan her atom, oktete (hidrojen ve helyum için dublete) ulaşacak biçimde elektron paylaşır.$b$), $a$**Hidrojen bağı:** H atomu F, O ya da N atomlarından birine bağlıysa$a$, $b$Polar bir molekül ya da bir iyon, yakınındaki apolar bir molekülde geçici dipol oluşturabilir. Buna dipol-indüklenmiş dipol ve iyon-indüklenmiş dipol etkileşimi denir. Bunlar da zayıf etkileşimlerdir.

**Hidrojen bağı:** H atomu F, O ya da N atomlarından birine bağlıysa$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyasal Türler Arası Etkileşimler'
  and position($a$Önce metal, sonra ametalin “-ür / -ür” ya da “oksit” gibi adı yazılır: NaCl sodyum klorür, MgO magnezyum oksit.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$Bu değer **normal koşullar (NK)** için molar hacimdir.$a$, $b$Bu değer **normal koşullar (NK)** için molar hacimdir. Ders kitaplarında bu koşul NŞA (normal şartlar altında) olarak da geçer.$b$), $a$## 6. Konuyu toparla$a$, $b$## 6. Sıvıların özellikleri

- **Buhar basıncı:** Kapalı kapta sıvı ile buharı dengeye geldiğinde buharın yaptığı basınçtır. Sıcaklık arttıkça artar. Sıvının miktarına ve kabın şekline bağlı değildir. Moleküller arası etkileşimleri zayıf olan sıvının buhar basıncı yüksektir.
- **Kaynama sıcaklığı:** Buhar basıncı dış basınca eşit olduğunda sıvı kaynar. Dış basınç arttıkça kaynama sıcaklığı yükselir. Moleküller arası etkileşim güçlüyse kaynama sıcaklığı yüksektir.
- **Viskozite (akmazlık):** Sıvının akmaya karşı direncidir. Moleküller arası etkileşim güçlendikçe artar, sıcaklık arttıkça azalır. Bal, su ve alkolden daha viskozdur.
- **Adezyon ve kohezyon:** Aynı tür moleküller arasındaki çekime kohezyon, farklı tür moleküller arasındaki çekime adezyon denir. Su cama yapışır çünkü adezyon kohezyondan büyüktür. Bu yüzden dar borularda su yükselir (kılcallık).
- **Yüzey gerilimi:** Sıvı yüzeyindeki moleküllerin içeriye doğru çekilmesinden oluşur. Moleküller arası etkileşim güçlendikçe artar, sıcaklık arttıkça ve deterjan eklenince azalır. Su damlasının küre biçimi ve böceğin su üstünde yürümesi bunun sonucudur.

## 7. Katıların özellikleri

Katılar atom ya da moleküllerin dizilişine göre ikiye ayrılır:

| Tür | Dizilim | Örnek |
| --- | --- | --- |
| Kristal katı | Taneciklerin düzenli ve tekrarlanan dizilimi vardır, belirli erime sıcaklığı vardır | NaCl, elmas, buz, metaller |
| Amorf katı | Düzenli bir dizilim yoktur, belirli bir erime sıcaklığı yoktur, yumuşayarak erir | Cam, plastik, kauçuk |

Kristal katılar, birimlerini birbirine bağlayan etkileşime göre iyonik, metalik, kovalent ve moleküler kristaller olarak sınıflanır. Etkileşim güçlendikçe erime sıcaklığı yükselir.

## 8. Konuyu toparla$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Maddenin Halleri'
  and position($a$Bu değer **normal koşullar (NK)** için molar hacimdir.$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$### Seyreltme$a$, $b$### ppm derişimi

Çok seyreltik çözeltilerde derişim ppm (milyonda bir kısım) ile verilir. 1 ppm, 1 milyon gram çözeltide 1 gram çözünen bulunması demektir:

$$\text{ppm} = \frac{\text{çözünen kütlesi}}{\text{çözelti kütlesi}} \cdot 10^6$$

**Örnek.** 2000 g çözeltide 0,01 g madde varsa derişim $\dfrac{0{,}01}{2000} \cdot 10^6 = 5\ \text{ppm}$ olur.

### Seyreltme$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Karışımlar'
  and position($a$### Seyreltme$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$| Endüstriyel kimya | Kimyasal maddelerin sanayide üretimi |$a$, $b$| Polimer kimyası | Plastik, kauçuk ve lif gibi polimerlerin yapısı ve üretimi |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimya Bilimi'
  and position($a$| Endüstriyel kimya | Kimyasal maddelerin sanayide üretimi |$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$| Nötrleşme | Asit + baz → tuz + su | $\text{HCl} + \text{NaOH} \to \text{NaCl} + \text{H}_2\text{O}$ |$a$, $b$| Nötrleşme | Asit + baz → tuz + su | $\text{HCl} + \text{NaOH} \to \text{NaCl} + \text{H}_2\text{O}$ |
| Çökelme | İki çözeltinin karışınca suda çözünmeyen bir katı (çökelek) oluşturması | $\text{AgNO}_3 + \text{NaCl} \to \text{AgCl} + \text{NaNO}_3$ |

Elektron aktarımının olduğu tepkimelere **indirgenme-yükseltgenme (redoks)** tepkimesi denir. Yanma ve metallerin yer değiştirme tepkimeleri redokstur.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Kimyasal Tepkimeler ve Hesaplamalar'
  and position($a$| Nötrleşme | Asit + baz → tuz + su | $\text{HCl} + \text{NaOH} \to \text{NaCl} + \text{H}_2\text{O}$ |$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$**Normal koşullar (NK):** 0 °C ve 1 atm.$a$, $b$**Normal koşullar (NK):** 0 °C ve 1 atm. Ders kitaplarında NŞA (normal şartlar altında) olarak da yazılır.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-kim' and t.name = 'Mol Kavramı'
  and position($a$**Normal koşullar (NK):** 0 °C ve 1 atm.$a$ in l.body) > 0;
