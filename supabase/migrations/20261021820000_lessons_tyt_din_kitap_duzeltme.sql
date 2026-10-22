-- TYT Din Kültürü konularını MEB ders kitaplarına (9., 11. ve 12. sınıf) göre düzeltir ve tamamlar

update public.lessons l
set body = replace(replace(replace(replace(l.body, $a$- **İslam:** Allah’a teslim olmak, bağlanmak. Hem dinin adı hem de Müslümanların yaşayışıdır.$a$, $b$- **İslam:** Allah’a teslim olmak, bağlanmak. Hem dinin adı hem de Müslümanların yaşayışıdır.
- **Mümin:** İman eden kişidir. İmanın geçerliliği için kalp ile tasdik yeterlidir. Kişinin mümin olarak bilinmesi ve ona göre muamele görmesi için imanını ikrar etmesi gerekir. İman ile amel arasında güçlü bir ilişki vardır, **salih amel** imanı kuvvetlendirir.
- **Din kavramı:** Klasik İslam kaynaklarında din, ceza ve mükâfat, hesap, itaat, âdet, şeriat gibi anlamlarla açıklanır. Felsefe, psikoloji, sosyoloji ve antropoloji de dini kendi bakış açılarıyla tanımlar ve her biri dinin yalnızca bir yönünü vurgular.$b$), $a$**İnsanın inanç ihtiyacı:**$a$, $b$**Fıtrat ve inanç:** İnsan Allah’a iman edecek yetenekte yaratılmıştır. İnanma duygusu **fıtrî bir ihtiyaçtır**. Din olgusu geçmiş toplumların hepsinde görülür (ibadet yerleri bunun göstergesidir). İman, gerçekleşme şekline göre **taklidî** (herhangi bir delile dayanmadan çevrenin inancını benimsemek) ve **tahkikî** (yaratılış üzerine düşünerek, Kur’an ve sünnetten bilgi edinerek, delile dayalı) olarak ikiye ayrılır.

**İnsanın inanç ihtiyacı:**$b$), $a$**İmanın şartlarından birine inanmayan** kişi imanın bütünlüğünü bozar. İman **kalpte** yerleşir, **ameller** (davranışlar) imanın gereğidir.$a$, $b$**İmanın şartlarından birine inanmayan** kişi imanın bütünlüğünü bozar. İman **kalpte** yerleşir, **ameller** (davranışlar) imanın gereğidir.

**İman esaslarının özellikleri:** Tevhit ilkesine dayanır, fıtrata uygundur, sade ve anlaşılırdır, insanın özgür iradesiyle yaptığı bilinçli bir tercihtir (dinde zorlama yoktur), kesinlik içerir ve zamana, topluma göre değişmez, bir bütündür.

- **Ahiret hayatının aşamaları:** Ölüm, kabir hayatı, kıyamet (Sûr’a ilk üfürülüşle âlemin yok olması), baas (yeniden diriliş), haşir (toplanma), hesap, mizan (amellerin tartılması), sırat, cennet ya da cehennem.
- **Peygamberlik:** Peygamberler Allah’ın vahyini tebliğ eden seçilmiş insanlardır. İnkâr edenlere karşı olağanüstü olaylar (**mucize**) gösterdiler. Nübüvvet Hz. Muhammed’le sona ermiştir, o **hatemülenbiya** (peygamberlerin sonuncusu) kabul edilir.
- **Kader ve kaza:** **Kader**, Allah’ın her şeyi ezelî ilmiyle bilmesi ve takdir etmesidir. **Kaza**, olayların bu bilgi ve takdir doğrultusunda vakti gelince gerçekleşmesidir. Kader ve kaza Allah’ın ilim, irade, kudret ve tekvin sıfatlarıyla ilgilidir.

**İmanın bireye ve topluma kazandırdıkları:** Bireyi güzel ahlaka yönlendirir, kaygıdan uzak tutar, yalnızlıktan kurtarır, huzur ve güven verir, sabır ve tevekkül kazandırır. Toplumda birlik, düzen ve istikrarı sağlar, iyilik ve merhamet duygularını canlı tutar, yardımlaşma ve dayanışmayı artırır.$b$), $a$| **Kadere iman** | Allah’ın her şeyi bilmesine, dilemesine ve yaratmasına inanmak, insanın iradesiyle sorumlu olduğuna inanmak |$a$, $b$| **Kadere ve kazaya iman** | Allah’ın her şeyi ezelî ilmiyle bilmesine, takdir etmesine ve yaratmasına inanmak, insanın iradesiyle sorumlu olduğuna inanmak |$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Bilgi ve İnanç'
  and position($a$- **İslam:** Allah’a teslim olmak, bağlanmak. Hem dinin adı hem de Müslümanların yaşayışıdır.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(replace(replace(l.body, $a$**İbadet**, kulun Allah’a olan **saygı, bağlılık ve şükrünü** Allah’ın emrettiği ve Hz. Muhammed’in öğrettiği biçimde göstermesidir. Kelime anlamı “kulluk etmek, boyun eğmek”tir.$a$, $b$**İbadet**, kulun Allah’a olan **saygı, bağlılık ve şükrünü** Allah’ın emrettiği ve Hz. Muhammed’in öğrettiği biçimde göstermesidir. Kelime anlamı “kulluk etmek, boyun eğmek”tir.

İbadetin iki anlamı vardır. **Genel anlamda** ibadet, Allah’ın rızasını kazanmak için ortaya konan her güzel fiil, duygu ve düşüncedir (dürüstlük, yardımseverlik, adalet gibi ahlaki davranışlar dâhil). **Özel anlamda** ibadet, Allah’ın emrettiği ve Resulü’nün açıkladığı görevlerdir (namaz, oruç, zekât, hac, kurban gibi). Dinî yükümlülük **teklif** terimiyle anlatılır, buna muhatap olan akıllı ve ergenlik çağına ulaşmış kişiye **mükellef** denir.$b$), $a$**İbadetin esasları:** İbadet **niyetle** yapılır, **Allah’ın rızası** için yapılır, **gösteriş (riya) için olmaz.** İbadetin biçimi **Hz. Peygamber’in öğrettiği şekildedir.**$a$, $b$**İbadetin temel ilkeleri:** **Kur’an ve sünnete uygunluk** (ibadet Hz. Peygamber’in öğrettiği şekilde yapılır), **niyet** (yalnızca Allah’a kulluk niyeti), **ihlas** (samimiyet, ibadeti yalnızca Allah’ın rızası için yapmak, zıddı **riya**, yani gösterişi), **süreklilik** (“Allah’ın en çok sevdiği amel, az da olsa devamlı olanıdır”) ve **itidal** (aşırılıklardan kaçınmak, dengeli olmak).

**İbadetin hükümleri:** **Farz** (kesinlikle istenen, terki günah, örnek beş vakit namaz, Ramazan orucu), **vacip** (farz seviyesinde olmayan ama sünnetten güçlü, örnek kurban, bayram ve vitir namazı), **sünnet** (Hz. Peygamber’in farz ve vacibin dışında yaptığı ibadetler, örnek teravih namazı), **mendup** (zorunlu olmayan ama övülen güzel davranışlar) ve **nafile** (sevap kazanmak için yapılan, farz ve vacip dışındaki ibadetler).$b$), $a$- **Hem bedenî hem malî ibadetler:** **Hac.**$a$, $b$- **Hem bedenî hem malî ibadetler:** **Hac.** Sadaka da yapılışına göre hem mal hem beden ile yapılabilir. İtikâf bedenî ibadetlerdendir.$b$), $a$- Namazın **şartları:** Temizlik (abdest, gusül), temiz elbise ve yer, avret yerlerini örtme, kıbleye yönelme, vaktinde kılma, niyet.$a$, $b$- Namazın **hazırlık şartları** altıdır: **Hadesten taharet** (abdest ya da gerekirse gusül), **necasetten taharet** (beden, elbise ve yerin temiz olması), **setriavret** (örtülmesi gereken yerlerin örtülmesi), **istikbalikıble** (kıbleye yönelme), **vakit** ve **niyet**. Namazın **kılınış şartları** (rükünleri): **İftitah tekbiri** (“Allahüekber” diyerek başlamak), **kıyam** (ayakta durmak), **kıraat** (Kur’an okumak), **rükû** (eğilmek), **secde** ve **kadeiahire** (son oturuş).
- Abdest ve gusül için su bulunamadığında **teyemmüm** yapılır: Niyet edilir, temiz toprağa eller sürülür, yüz ve kollar sırayla mesh edilir.$b$), $a$- **Faydaları:** Allah ile bağ kurar, **disiplin ve düzen** kazandırır, kötülüklerden korur, huzur verir. Cemaatle kılmak **birlik ve eşitlik** duygusunu güçlendirir.$a$, $b$- **Faydaları:** Allah ile bağ kurar, **disiplin ve düzen** kazandırır, kötülüklerden korur, huzur verir. Cemaatle kılmak **birlik ve eşitlik** duygusunu güçlendirir. İbadet insanda **takva** (Allah’a saygı sebebiyle O’nun razı olmayacağı her durumdan sakınmak) ve **tevazu** oluşturur, **ihsan** bilincine ulaştırır. **Tefekkür** (Allah’ın ayetleri ve yarattıkları üzerinde düşünmek) de bir ibadettir.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'İslam ve İbadet'
  and position($a$**İbadet**, kulun Allah’a olan **saygı, bağlılık ve şükrünü** Allah’ın emrettiği ve Hz. Muhammed’in öğrettiği biçimde göstermesidir. Kelime anlamı “kulluk etmek, boyun eğmek”tir.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$**Dinî sorumluluk:** İslam’da bir kişi **akıl ve ergenlik (büluğ)** çağına geldiğinde dinî sorumluluk (teklif) başlar.$a$, $b$**Dinî sorumluluk:** İslam’da bir kişi **akıl ve ergenlik (büluğ)** çağına geldiğinde dinî sorumluluk (teklif) başlar. Dinin emir ve yasakları karşısında sorumlu olan kişiye **mükellef** denir. İnsan özgür iradeye sahiptir ve davranışlarının sonuçlarından sorumludur.$b$), $a$- **Gençlik:** İlim öğrenme, ibadet, güzel ahlak ve topluma yarar sağlama dönemidir.$a$, $b$- Hz. Peygamber: “İnsanlar içinde Allah’ın en sevdiği kimse, kötülükleri terk edip iyiliklere yönelen gençtir.” Gençlerle iletişimin temelinde güven, sevgi, saygı, dostluk, dayanışma, merhamet ve samimiyet vardır.
- **Gençlik:** İlim öğrenme, ibadet, güzel ahlak ve topluma yarar sağlama dönemidir.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Gençlik ve Değerler'
  and position($a$**Dinî sorumluluk:** İslam’da bir kişi **akıl ve ergenlik (büluğ)** çağına geldiğinde dinî sorumluluk (teklif) başlar.$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(l.body, $a$## 3. İnsanın yaratılış amacı ve sorumluluğu
$a$, $b$## 3. İnsanın yaratılış amacı ve sorumluluğu

**Fıtrat:** İnsanın yaratılışında bulunan, hayatı anlamlandırma çabasına yön veren ve inanmayı da içeren doğuştan yetenektir. Allah insana yeni bilgiler edinebilme özelliği vermiş, Âdem’e varlıkların isimlerini öğretmiştir. İnsan duyuları ve aklıyla evreni gözlemler, **tefekkür** eder. Ama duyu ve akılla ulaşılamayan konularda (ahiret, ibadet biçimleri gibi) **vahye ve peygamberlere** ihtiyaç duyar. Allah **Hâdî**’dir (doğru yolu gösteren), insan samimiyetle hakikate yönelirse **hidayet** verir. **Marifet**, Allah’ı derin düşünme ya da ilham yoluyla tanımaktır.
$b$), $a$- **Sorumluluk:** İnsan iradesiyle yaptığından sorumludur. **Hesap günü** her insan yaptıklarının karşılığını görür.$a$, $b$- **Sorumluluk:** İnsan iradesiyle yaptığından sorumludur. Sorumluluk dört alanda düşünülür: **kendine, aileye, topluma ve Allah’a** karşı. **Hesap günü** her insan yaptıklarının karşılığını görür.$b$), $a$- **Dua:** Allah’a yalvarmak, dilekte bulunmak.$a$, $b$- **İbadet ve hamt:** İnsan Allah’la ibadet, dua, tövbe ve Kur’an okuyarak bağ kurar. **Hamt**, Allah’ı bütün övgü çeşitlerini içeren sevgi ve saygıyla anmak ve emirlerini yerine getirip yasaklarından kaçınmaktır.
- **Dua:** Allah’a yalvarmak, dilekte bulunmak.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Allah İnsan İlişkisi'
  and position($a$## 3. İnsanın yaratılış amacı ve sorumluluğu
$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(replace(l.body, $a$## 1. Doğumu ve çocukluğu
$a$, $b$## 1. Cahiliye ortamı, doğumu ve çocukluğu

Hz. Muhammed’in yaşadığı Arap Yarımadası’nın en önemli şehri **Mekke**’dir (Kâbe, hac ve ticaret merkezi). Toplum **bedevi** (çadırda yaşayan) ve **hadari** (yerleşik) olarak yaşar, kabile bağları çok güçlüdür, şiir ve hitabet yaygındır, Mekke’de çok az kişi okuryazardır. İnsanlar hür, köle ve mevali (azat edilmiş) olmak üzere üç sınıfa ayrılır. İslam öncesi bu döneme **Cahiliye Dönemi** denir. Sebepleri şirk koşulması, putlara tapılması, kız çocuklarının diri diri gömülmesi, yağmacılığın geçim tarzı olması gibi uygulamalardır. Arap Yarımadası’nda az sayıda **hanif** (Hz. İbrahim’in tevhit inancını sürdüren) de vardı.
$b$), $a$**Hz. Muhammed’in gençliğini yalnızca “çocukluk ve peygamberlik” arasında bir boşluk sanma.**$a$, $b$**Hz. Muhammed’in gençliğini yalnızca “çocukluk ve peygamberlik” arasında bir boşluk sanma.**$b$), $a$## 4. Peygamber’in gençlere verdiği önem
$a$, $b$## 4. Peygamber’in gençlere verdiği önem

Hz. Muhammed hem **beşer** hem **peygamberdir**. Doğmuş, büyümüş, öksüz ve yetim kalmış, çalışmış, evlenmiş, hastalanmış, bu dünyanın zorluklarıyla karşılaşmıştır. Kendisi de “ben Allah’ın kuluyum” diyerek bunu hatırlatmıştır. Peygamberlik yönünün görevleri dörttür:

- **Tebliğ:** Vahyi eksiltmeden ve ekleme yapmadan insanlara iletmek.
- **Tebyin:** Kur’an’ı sözlü ve uygulamalı olarak açıklamak.
- **Teşri:** Kur’an’da hükmü olmayan konularda hüküm koyma yetkisi.
- **Temsil:** İslam’ı en iyi biçimde anlayıp yaşayarak insanlara örnek olmak. Kur’an’da güzel örnek anlamında **üsveihasene** denir.

**Hatemülenbiya** (peygamberlerin sonuncusu) olan Hz. Muhammed’e güvenilirliği nedeniyle **Muhammedülemin** denmiştir. **Sünnet**, onun söz, fiil ve onaylarıdır. Hadis ise onun sözleridir. Kültürümüzde Hz. Peygamber sevgisi **Ehlibeyt** (eşi, çocukları, torunları ve yakın akrabaları) sevgisiyle birlikte yaşatılır, naat, mevlit, siyer, kırk hadis ve hilye gibi eserlerde ifade edilir.

**Gençlere değer vermesi:** Genç sahabileri Suffe’de eğitmiştir (Ebu Hureyre, Abdullah b. Ömer, Abdullah b. Mesud, Abdullah b. Abbas, Muaz b. Cebel, Enes b. Malik). Malik b. Huveyris ve arkadaşları Medine’de yaklaşık yirmi gün kalıp ailelerini özleyince onları anlayışla karşılamış, öğrendiklerini onlara öğretmeleri için memleketlerine göndermiştir. **Zeyd b. Sabit** mektuplar yazmış ve gelen mektupları tercüme etmiş, Tebük Seferi’nde sancağı taşımıştır.
$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Hz. Muhammed ve Gençlik'
  and position($a$## 1. Doğumu ve çocukluğu
$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$## 1. Dinin işlevleri
$a$, $b$## 1. Din, felsefe, bilim ve dinin işlevleri

Din, insanın varlığı anlamasını ve hayat tarzını belirlemesini sağlayan inanç, değer ve kurallar bütünüdür. Din, bilim ve felsefe insanın kendisini, çevresini ve evreni anlamlandırma çabasında birbirini tamamlar. Bilim gözlem ve araştırmayla evrenin nasıl işlediğini açıklar, felsefe bilgileri akıl ve mantık süzgecinden geçirerek “varlık, bilgi, değer” alanlarında sorgular, din manevi ihtiyaçları karşılar ve ahlaki hayatın temelini oluşturur. Üçü çelişmez, etkileşim hâlindedir.

İslam medeniyetinde eğitim kurumları bilimin gelişmesine katkı sağlamıştır: **cami, mescit, mektep, medrese, darülkurra, darülhadis, Beytülhikme, kütüphane, rasathane ve şifahane**. Tercüme faaliyetleri Emeviler Dönemi’nde başlamış, yaklaşık 8. yüzyılın ortasından 9. yüzyılın ortasına kadar sürmüş, ardından özgün eserlerin verildiği dönem başlamıştır.
$b$), $a$**Din istismarı**, dinî duyguların ve değerlerin **kişisel, siyasi ya da maddi çıkar için** kullanılmasıdır. Zararları:$a$, $b$**Din istismarı**, dinî duyguların ve değerlerin **kişisel, siyasi ya da maddi çıkar için** kötüye kullanılmasıdır. Dinin Allah tarafından gönderiliş amacının dışında kullanılması en yaygın biçimidir. Dinî değerlerin aşağılanması, onlarla alay edilmesi ya da hafife alınması da bu kapsamda değerlendirilebilir. Din toplumda önemli bir güven ve meşruiyet kaynağı olduğu için tarih boyunca bazı kişilerce istismar edilmiştir. Eleştirel düşünme eksikliği, yanlış otorite algısı ve dinî bilgileri yanlış kaynaklardan öğrenmek bunu kolaylaştırır. Zararları:$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Din ve Toplumsal Hayat'
  and position($a$## 1. Dinin işlevleri
$a$ in l.body) > 0;

update public.lessons l
set body = replace(replace(l.body, $a$- **Hz. Muhammed** güzel ahlakın en güzel örneğidir.$a$, $b$- İslam’da **ahlakın kaynağı Allah’tır**. Allah’ın razı olduğu ve emrettiği iyi, razı olmadığı ve yasakladığı kötüdür. Kur’an ve sünnet bunu belirleyen temel kaynaklardır. **Akıl, irade ve vicdan** ahlaka kaynaklık eden unsurlardır. İnsan **nefis** sahibidir ve nefis bencillik, kibir, hevese uyma gibi nedenlerle kötülüğe meyillidir, nefsini arındıran kurtuluşa erer. Ahlak **terbiye** ile güzelleşir, terbiye ailede başlar ve yaşam boyu sürer. İslam ahlakının amacı insanı manevi bakımdan olgunlaştırmak ve erdemli bir toplum oluşturmaktır.
- **Hz. Muhammed** güzel ahlakın en güzel örneğidir.$b$), $a$## 2. Güzel ahlak örnekleri
$a$, $b$## 2. Güzel ahlak örnekleri

**Ahlakın temel unsurları** dörttür: **adalet** (denge, ölçülülük, her şeyi yerli yerine koymak, itidal), **şecaat** (cesaret, korkaklık ile saldırganlık arasında orta yol), **iffet** (bedenî ve maddi ihtiyaçları ölçülü karşılamak, onuru korumak) ve **hikmet** (bilgelik, aklın iman nuruyla aydınlanıp hakikati kavraması). Ahlaki tutum ve davranışların temelini **dürüstlük** (sıdk), **yardımseverlik** (infak, zekât, sadaka, hibe, karz-ı hasen, vakıf) ve **sabır** oluşturur. **Adab-ı muaşeret** toplumda uyulan nezaket ve görgü kurallarıdır (selamlaşmak, güler yüzlü olmak, teşekkür etmek, sıraya riayet etmek gibi). Dürüstlük, yiğitlik ve cömertlik gibi değerleri toplayan **Ahilik** teşkilatı bu anlayışın kültürümüzdeki örneklerindendir.
$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'Ahlaki Tutum ve Davranışlar'
  and position($a$- **Hz. Muhammed** güzel ahlakın en güzel örneğidir.$a$ in l.body) > 0;

update public.lessons l
set body = replace(l.body, $a$## 5. Türk-İslam dünyasında yorumlar ve tarikatlar
$a$, $b$## 5. Türk-İslam dünyasında yorumlar ve tarikatlar

**Türklerin Müslüman oluşu:** Türkler Emeviler zamanında (Maveraünnehir’in 706’da fethi) İslam’la tanıştı. Talas Savaşı’ndan (751) sonra Türklerin yüzü İslam dünyasına döndü ve Abbasiler onları askerî ve idari kadrolarda görevlendirdi. Karahanlılar (Satuk Buğra Han) ilk Müslüman Türk devletlerindendir. Derviş ve velilerin insan sevgisi ve ahlak vurgusu, ticari ilişkiler ve İslam’ın Türklerin karakterine uygunluğu etkili oldu. Malazgirt’ten sonra Anadolu’ya göç eden Türkmenlerle Anadolu’nun Türkleşmesi ve İslamlaşması sürdü. **Ribat, fütüvvet ve Ahilik** teşkilatları İslam’ın yayılmasında etkili oldu. **Fütüvvet** ahlaki değerleri öne çıkaran mesleki bir birliktir (Abbasiler Dönemi), Ahilik buradan doğmuştur.

**Mezhep imamları ve kelamcılar:** **Ebu Hanife** (699 ile 767, Hanefilik, aklın ilkelerini gözetir), **Cafer Sadık** (702 ile 765, Caferilik, on iki imam, İsnâaşeriyye ya da İmamiye), **Şafii** (767 ile 819, fıkıh usulünün temellerini atan ilk âlim, er-Risale), **Matüridi** (öl. 944, Semerkant, Kitabü’t-Tevhid, akıl ile nakli uzlaştırır), **Eşari** (873 ile 935, Maķalatü’l-İslamiyyin).

**Şahsiyetler:** **Ahmed Yesevi** (1093 ile 1166, Yesevilik, Divan-ı Hikmet, Arslan Baba ve Yusuf Hemedani’nin öğrencisi). **Mevlana** (1207 ile 1273, Divan-ı Kebir, Mesnevi, Fihi Mâ Fih, Mektubat, Mecalis-i Seba, düşüncesini oğlu Sultan Veled sistemleştirmiştir). **Ahi Evran** (1171 doğumlu, Kırşehir, otuz iki çeşit esnafı teşkilatlandırdı). **Hacı Bektaş Veli** (1247 ile 1337, Makalat, “Eline, beline, diline sahip ol”, Bektaşilik, Yeniçeri Ocağı’nın pir kabul edilmesi). **Yunus Emre** (1240 ile 1320, mürşidi Tapduk Emre, arı Türkçeyle şiirler). **Sarı Saltuk** (Balkanların İslamlaşmasında etkili alperen). **Hacı Bayram Veli** (1340 ile 1430, Ankara, Somuncu Baba’nın öğrencisi, yardımlaşma).

**Tasavvufi düşüncenin dönemleri:** **Züht Dönemi** (hicri 2. yüzyıla kadar, Hasan Basri, Rabia el-Adeviyye), **Tasavvuf Dönemi** (Cüneyd-i Bağdadî, Zünnun Mısri, Bayezid Bistami, Gazali) ve **Tarikat Dönemi** (hicri 6. yüzyıldan itibaren, tarikatların kurumsallaştığı dönem, Abdülkadir Geylani, Ahmed Yesevi, Ahmed Rıfai, Bahaeddin Nakşibend). Tasavvufta ahlak ve **edep** önemlidir, amaç **insanıkâmil** (olgun insan) mertebesine ulaşmaktır.

| Yol | Kurucu ya da temel isim | Özellik |
| --- | --- | --- |
| **Yesevilik** | Ahmed Yesevi (1093 ile 1166) | Kur’an ve sünnete uygun yaşamak, züht, zikir, Türkçe hikmetler |
| **Kadirilik** | Abdülkadir Geylani (1077 ile 1166) | Zikir, tevazu, Anadolu’ya Eşrefoğlu Rumi getirdi |
| **Rifailik** | Ahmed Rıfai (öl. 1182) | Riyazat, mücahede, halvet, zikir |
| **Mevlevilik** | Mevlana (1207 ile 1273) | Şiir, sema ve musiki, mukabele |
| **Nakşibendilik** | Bahaeddin Nakşibend (1318 ile 1389) | Gizli (kalpten) zikir, toplu zikre hatmihacegan denir |
| **Alevilik-Bektaşilik** | Hacı Bektaş Veli | Ehlibeyt sevgisi, dört kapı kırk makam, cem erkânı, musahiplik, ocaklar |
$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-din' and t.name = 'İslam Düşüncesinde Yorumlar'
  and position($a$## 5. Türk-İslam dünyasında yorumlar ve tarikatlar
$a$ in l.body) > 0;
