import type { HistoryEvent } from './history-data'

const e = (id: string, time: string, title: string, text: string): HistoryEvent => ({ id, time, title, text })

export const ILK_CAG: HistoryEvent[] = [
  e('sumer', 'MÖ 3200 civarı', 'Sümerler', 'Mezopotamya’da çivi yazısı bulundu. Yazının bulunuşu Tarih Çağları’nın başlangıcı sayılır.'),
  e('mısır', 'MÖ 2500 civarı', 'Mısır piramitleri', 'Nil kıyısında hiyeroglif yazısı kullanıldı ve Firavunlar için piramitler yapıldı.'),
  e('hammurabi', 'MÖ 1750 civarı', 'Hammurabi', 'Babil Kralı Hammurabi, bilinen ilk yazılı kanunlardan biri olan Hammurabi Kanunları’nı yazdırdı.'),
  e('kades', 'MÖ 1274', 'Kadeş Savaşı', 'Hititler ile Mısırlılar savaştı. Sonrasında yapılan Kadeş Antlaşması bilinen ilk yazılı barış antlaşmasıdır.'),
  e('lidya', 'MÖ 7. yüzyıl', 'Lidyalılar', 'Lidyalılar parayı kullanan ilk uygarlıktır. Sart’tan Efes’e uzanan Kral Yolu ticareti geliştirdi.'),
  e('maraton', 'MÖ 490', 'Maraton Savaşı', 'Atinalılar Pers ordusunu yendi. Yunan şehir devletleri (polis) Pers tehdidine karşı birleşti.'),
  e('iskender', 'MÖ 334', 'İskender’in doğu seferi', 'Makedonya Kralı İskender Granikos Savaşı ile Asya seferine başladı ve Helenistik dönemin yolunu açtı.'),
  e('roma', 'MÖ 27', 'Roma İmparatorluğu', 'Augustus ile Roma Cumhuriyeti imparatorluğa dönüştü.'),
  e('395', 'MS 395', 'Roma ikiye ayrıldı', 'Theodosius’un ölümüyle Roma Doğu ve Batı olarak ikiye bölündü. Orta Çağ’ın başlangıcı sayılır.'),
  e('476', 'MS 476', 'Batı Roma yıkıldı', 'Cermen komutan Odoakr Batı Roma’ya son verdi. Doğu Roma (Bizans) 1453’e kadar yaşadı.'),
]

export const ILK_TURK: HistoryEvent[] = [
  e('mete', 'MÖ 209', 'Mete Han', 'Asya Hun Devleti’nin başına geçti. Orduyu onlu sisteme göre düzenledi. Bilinen ilk Türk devletidir.'),
  e('hun48', 'MS 48', 'Hunlar ikiye ayrıldı', 'Asya Hunları Kuzey ve Güney Hunları olarak ikiye bölündü.'),
  e('375', '375', 'Avrupa Hunları', 'Hunların Karadeniz’in kuzeyine gelmesiyle Kavimler Göçü başladı.'),
  e('attila', '451', 'Katalon Ovası', 'Hun hükümdarı Attila Roma ve müttefiklerine karşı savaştı.'),
  e('bumin', '552', 'Bumin Kağan', 'Göktürk Devleti kuruldu. Türk adını taşıyan ilk Türk devletidir.'),
  e('582', '582', 'Göktürkler ikiye ayrıldı', 'Doğu ve Batı Göktürk Devleti olarak bölündü.'),
  e('682', '682', 'İkinci Göktürk Devleti', 'Kutluk (İlteriş) Kağan Göktürk devletini yeniden kurdu.'),
  e('orhun', '732-735', 'Orhun Yazıtları', 'Kül Tigin (732) ve Bilge Kağan (735) yazıtları dikildi. Türkçenin bilinen en eski yazılı belgeleridir.'),
  e('uygur', '744', 'Uygur Devleti', 'Kutluk Bilge Kül Kağan Uygur Devleti’ni kurdu. Uygurlar yerleşik hayata geçti ve Mani dinini kabul etti.'),
  e('840', '840', 'Uygurların yıkılışı', 'Kırgızlar Uygur Devleti’ne son verdi. Uygurlar Doğu Türkistan’a ve Çin’e dağıldı.'),
]

export const ISLAM_TARIHI: HistoryEvent[] = [
  e('610', '610', 'İlk vahiy', 'Hz. Muhammed’e Hira Mağarası’nda ilk vahiy geldi.'),
  e('622', '622', 'Hicret', 'Hz. Muhammed Mekke’den Medine’ye göç etti. Hicri takvimin başlangıcıdır. Medine’de İslam devleti kuruldu.'),
  e('624', '624', 'Bedir Savaşı', 'Müslümanlar ile Mekkeliler arasındaki ilk büyük savaş. Müslümanlar kazandı.'),
  e('628', '628', 'Hudeybiye Barışı', 'Mekke’yle on yıllık barış yapıldı.'),
  e('630', '630', 'Mekke’nin fethi', 'Mekke savaşsız fethedildi ve Kâbe putlardan temizlendi.'),
  e('632', '632', 'Hz. Muhammed’in vefatı', 'Veda Hutbesi’nden sonra vefat etti. Dört Halife dönemi (632-661) başladı.'),
  e('638', '638', 'Kudüs’ün fethi', 'Hz. Ömer döneminde Kudüs fethedildi.'),
  e('661', '661', 'Emeviler', 'Muaviye ile Emevi Devleti (661-750) kuruldu. Başkent Şam oldu. Arap milliyetçiliği öne çıktı.'),
  e('680', '680', 'Kerbela', 'Hz. Hüseyin ve yakınları Kerbela’da şehit edildi.'),
  e('711', '711', 'Endülüs', 'Tarık bin Ziyad komutasında İspanya’ya geçildi.'),
  e('750', '750', 'Abbasiler', 'Abbasi Devleti (750-1258) kuruldu. Ebu Müslim’in Horasan Türkleriyle desteği önemliydi.'),
  e('751', '751', 'Talas Savaşı', 'Abbasiler Çin’i yendi. Türklerin İslamiyet’e yaklaşması hızlandı ve kâğıt yapımı Batı’ya yayıldı.'),
  e('762', '762', 'Bağdat', 'Abbasi başkenti Bağdat kuruldu. Bağdat sonraki yüzyıllarda bilim merkezi oldu.'),
]

export const TURK_ISLAM: HistoryEvent[] = [
  e('karahan', '10. yüzyıl', 'Karahanlılar', 'Satuk Buğra Han ile Müslüman olan ilk Türk devletidir. Kutadgu Bilig bu dönemde yazıldı.'),
  e('gazne', '962', 'Gazneliler', 'Alptigin tarafından kuruldu. Sultan Mahmut Hindistan seferleriyle ünlüdür.'),
  e('dandan', '1040', 'Dandanakan Savaşı', 'Selçuklular Gazneli ordusunu yendi ve Büyük Selçuklu Devleti’nin kuruluşunu sağladı.'),
  e('bagdat', '1055', 'Bağdat', 'Tuğrul Bey Bağdat’a girerek Abbasi halifesini Büyük Selçuklu himayesine aldı.'),
  e('malazgirt', '1071', 'Malazgirt Zaferi', 'Alparslan Bizans İmparatoru Romen Diyojen’i yendi. Anadolu’nun kapıları Türklere açıldı.'),
  e('nizam', '1067-1092', 'Nizamülmülk', 'Alparslan ve Melikşah’ın veziri. Nizamiye Medreseleri’ni kurdu ve Siyasetname’yi yazdı.'),
  e('harezm', '1077', 'Harezmşahlar', 'Anuştigin Harezmşahlar Devleti’nin temelini attı.'),
  e('katvan', '1141', 'Katvan Savaşı', 'Sultan Sencer Karahıtaylara yenildi. Büyük Selçuklu Devleti’nin çöküşü hızlandı.'),
  e('1231', '1231', 'Celaleddin Harezmşah', 'Moğollara karşı direnen Celaleddin Harezmşah öldü. Harezmşahlar sona erdi.'),
]

export const DEVRIMLER: HistoryEvent[] = [
  e('1808', '1808', 'Sened-i İttifak', 'II. Mahmut ile ayanlar arasında imzalanan belge. Padişahın otoritesi ilk kez sınırlandı.'),
  e('1826', '1826', 'Vaka-i Hayriye', 'Yeniçeri Ocağı kaldırıldı. Yeni ordu Asakir-i Mansure-i Muhammediye kuruldu.'),
  e('1839', '1839', 'Tanzimat Fermanı', 'Gülhane Hatt-ı Hümayunu ile can, mal ve namus güvenliği ve vergide eşitlik vaat edildi.'),
  e('1856', '1856', 'Islahat Fermanı', 'Gayrimüslimlere eşit haklar verildi. Paris Antlaşması’yla Osmanlı Avrupa devletler hukukuna alındı.'),
  e('1876', '1876', 'I. Meşrutiyet', 'Kanun-ı Esasi ilan edildi. Osmanlı’nın ilk anayasasıdır. Meclis-i Mebusan açıldı.'),
  e('1878', '1878', 'Meclisin kapanışı', 'II. Abdülhamit 93 Harbi’ni bahane ederek Meclis’i kapattı ve Meşrutiyeti askıya aldı.'),
  e('1908', '1908', 'II. Meşrutiyet', 'İttifak ve Terakki Cemiyeti’nin baskısıyla Kanun-ı Esasi yeniden yürürlüğe girdi.'),
  e('1909', '1909', '31 Mart Vakası', 'İsyan bastırıldı ve II. Abdülhamit tahttan indirildi.'),
  e('1913', '1913', 'Bab-ı Ali Baskını', 'İttihat ve Terakki yönetimi tek parti egemenliğine yöneldi.'),
]

export const DENGE: HistoryEvent[] = [
  e('1774', '1774', 'Küçük Kaynarca', 'Kırım bağımsız oldu. Rusya Ortodoks tebaanın koruyuculuğu iddiasını kazandı.'),
  e('1798', '1798', 'Napolyon’un Mısır seferi', 'Fransa Mısır’ı işgal etti. Osmanlı ilk kez Fransa’ya karşı İngiltere ve Rusya ile ittifak etti.'),
  e('1829', '1829', 'Edirne Antlaşması', 'Yunanistan’ın bağımsızlığı kabul edildi.'),
  e('1833', '1833', 'Hünkâr İskelesi', 'Rusya ile savunma ittifakı. Mısır sorunu nedeniyle Rus yardımı alındı.'),
  e('1841', '1841', 'Londra Boğazlar Sözleşmesi', 'Barış zamanında Boğazlar yabancı savaş gemilerine kapatıldı.'),
  e('1856', '1856', 'Paris Antlaşması', 'Kırım Savaşı sona erdi. Osmanlı’nın toprak bütünlüğü Avrupa devletlerinin güvencesine alındı.'),
  e('1878', '1878', 'Berlin Antlaşması', '93 Harbi sonrası Ayastefanos hükümleri hafifletildi. Kıbrıs İngiltere’ye, Bosna-Hersek Avusturya-Macaristan’a bırakıldı.'),
  e('1881', '1881-1882', 'Tunus ve Mısır', 'Tunus Fransa’ya, Mısır İngiltere’ye geçti.'),
  e('1908', '1908', 'Bosna’nın ilhakı', 'Bulgaristan bağımsızlığını ilan etti, Avusturya-Macaristan Bosna-Hersek’i ilhak etti.'),
]

export const DUNYA_SAVASI_1: HistoryEvent[] = [
  e('1904', '1904-1905', 'Rus-Japon Savaşı', 'Japonya Rusya’yı yendi. Rusya’da 1905 ayaklanması çıktı.'),
  e('1907', '1907', 'Üçlü İtilaf', 'İngiltere, Fransa ve Rusya bloğu tamamlandı. Karşısında Almanya, Avusturya-Macaristan ve İtalya’nın Üçlü İttifakı vardı.'),
  e('1911', '1911-1912', 'Trablusgarp Savaşı', 'İtalya Trablusgarp’ı işgal etti. Uşi Antlaşması ile Osmanlı Libya’yı fiilen kaybetti.'),
  e('1912', '1912-1913', 'Balkan Savaşları', 'Balkan devletleri Osmanlı’ya karşı birleşti. Osmanlı Rumeli’de büyük toprak kaybetti.'),
  e('1914', '1914', 'Saraybosna suikastı', '28 Haziran’da Avusturya veliahdı öldürüldü. I. Dünya Savaşı başladı. Osmanlı Ağustos’ta Almanya ile gizli ittifak yaptı.'),
  e('1915', '1915', 'Çanakkale', 'İtilaf Devletleri’nin Boğazları geçme girişimi başarısız oldu. Rusya’ya yardım yolu açılamadı.'),
  e('1917', '1917', 'Rus İhtilali ve ABD', 'Rusya savaştan çekilmeye başladı. ABD İtilaf Devletleri yanında savaşa girdi.'),
  e('1918', '1918', 'Mondros Ateşkesi', '30 Ekim’de Osmanlı savaştan çekildi. Wilson ilkeleri (14 madde) yayımlanmıştı.'),
  e('1919', '1919', 'Paris Barış Konferansı', 'Versay Antlaşması ile Almanya ağır şartlar aldı. Milletler Cemiyeti kuruldu.'),
]

export const DUNYA_SAVASI_2: HistoryEvent[] = [
  e('1939', '1 Eylül 1939', 'Almanya Polonya’ya girdi', 'II. Dünya Savaşı başladı. İngiltere ve Fransa Almanya’ya savaş ilan etti.'),
  e('1940', '1940', 'Fransa’nın düşüşü', 'Almanya Fransa’yı işgal etti. İtalya Almanya yanında savaşa girdi.'),
  e('1941', '1941', 'SSCB ve Pearl Harbor', 'Almanya SSCB’ye saldırdı. Japonya Pearl Harbor’a saldırınca ABD savaşa girdi.'),
  e('1943', '1942-1943', 'Stalingrad', 'Sovyetler Almanları yendi. Savaşın dönüm noktasıdır.'),
  e('1944', '6 Haziran 1944', 'Normandiya Çıkarması', 'Müttefikler Batı Avrupa’da ikinci cepheyi açtı.'),
  e('1945a', '8 Mayıs 1945', 'Almanya teslim oldu', 'Avrupa’da savaş sona erdi.'),
  e('1945b', 'Ağustos 1945', 'Atom bombası', 'ABD Hiroşima (6 Ağustos) ve Nagasaki’ye (9 Ağustos) atom bombası attı. Japonya teslim oldu.'),
  e('1945c', 'Ekim 1945', 'Birleşmiş Milletler', 'Milletler Cemiyeti’nin yerine BM kuruldu.'),
]

export const SOGUK_SAVAS: HistoryEvent[] = [
  e('1947', '1947', 'Truman Doktrini', 'ABD, komünizm tehdidi altındaki Türkiye ve Yunanistan’a yardım kararı aldı. Soğuk Savaş’ın başlangıcı sayılır.'),
  e('1948', '1947-1948', 'Marshall Planı', 'ABD Avrupa’nın ekonomik yeniden yapılanması için yardım verdi.'),
  e('1949', '1949', 'NATO', 'Batı bloğunun askeri örgütü kuruldu. Türkiye 1952’de katıldı.'),
  e('1950', '1950-1953', 'Kore Savaşı', 'Kore Yarımadası’nda Soğuk Savaş’ın ilk sıcak çatışması. Türkiye BM kuvvetleriyle katıldı.'),
  e('1955', '1955', 'Varşova Paktı', 'Doğu bloğunun askeri örgütü kuruldu.'),
  e('1961', '1961', 'Berlin Duvarı', 'Doğu Almanya Berlin’i duvarla ikiye böldü.'),
  e('1962', '1962', 'Küba Füze Krizi', 'ABD ile SSCB nükleer savaşın eşiğine geldi. Kriz diyalogla çözüldü ve yumuşamanın yolu açıldı.'),
  e('1974', '1974', 'Kıbrıs Barış Harekâtı', 'Türkiye Kıbrıs’ta garantörlük hakkını kullandı.'),
]

export const KURESEL: HistoryEvent[] = [
  e('1989', '1989', 'Berlin Duvarı yıkıldı', 'Doğu Avrupa’da komünist rejimler çöktü ve Almanya birleşme yoluna girdi (1990).'),
  e('1991', '1991', 'SSCB dağıldı', 'Soğuk Savaş sona erdi. Türk cumhuriyetleri bağımsızlığını kazandı.'),
  e('1992', '1992-1993', 'Maastricht', 'Avrupa Birliği kuruldu.'),
  e('1995', '1995', 'Dünya Ticaret Örgütü', 'Küresel ticaret kuralları ortak çatı altında toplandı.'),
  e('2001', '11 Eylül 2001', 'Terör saldırıları', 'ABD’ye saldırılar küresel terörle mücadele politikalarını başlattı.'),
]
