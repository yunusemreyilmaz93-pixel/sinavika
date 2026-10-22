import type { TimelineItem } from './timeline'

export type HistoryEvent = TimelineItem & { place?: [number, number] }

const e = (id: string, time: string, title: string, text: string): HistoryEvent => ({ id, time, title, text })

export const SELCUKLU: HistoryEvent[] = [
  e('1071', '1071', 'Malazgirt Zaferi', 'Türkmen boylarının Anadolu’ya yerleşmesinin yolunu açtı.'),
  e('1075', '1075', 'Devletin kuruluşu', 'Kutalmışoğlu Süleyman Şah İznik’i merkez yaparak Anadolu Selçuklu Devleti’ni kurdu.'),
  e('1097', '1097', 'Dorylaion Savaşı', 'I. Haçlı Seferi sırasında Haçlılar İznik’i aldı, Selçuklular Dorylaion’da yenildi. Başkent Konya’ya taşındı.'),
  e('1176', '1176', 'Miryokefalon Savaşı', 'II. Kılıç Arslan Bizans ordusunu yendi. Anadolu’nun Türk yurdu olduğu kesinleşti.'),
  e('1207', '1207', 'Antalya', 'I. Gıyaseddin Keyhüsrev Antalya’yı aldı.'),
  e('1214', '1214', 'Sinop', 'I. İzzeddin Keykâvus Sinop’u alarak Karadeniz’e ulaştı.'),
  e('1221', '1221', 'Alanya', 'I. Alaeddin Keykubat Alanya’yı aldı. Akdeniz kıyısındaki limanlar güçlendi.'),
  e('1240', '1240', 'Babai isyanı', 'Baba İlyas önderliğinde çıkan isyan devleti zayıflattı.'),
  e('1243', '1243', 'Kösedağ Savaşı', 'Selçuklu ordusu Moğollara yenildi. Devlet Moğol hâkimiyetine girdi ve vergi ödemek zorunda kaldı.'),
  e('1277', '1277', 'Türkçe resmî dil', 'Karamanoğlu Mehmet Bey Türkçeyi resmî dil ilan etti.'),
  e('1308', '1308 civarı', 'Devletin sonu', 'Selçuklu devleti yıkıldı. Anadolu Beylikleri dönemi başladı, Osmanlı Beyliği bunlardan biridir.'),
]

export const OSMANLI_KURULUS: HistoryEvent[] = [
  e('1299', '1299 (gelenekle)', 'Osman Bey', 'Osmanlı Beyliği’nin kurucusudur. Selçuklu Devleti’nden bağımsız davranmaya başladı.'),
  e('1302', '1302', 'Koyunhisar Savaşı', 'Bizans’a karşı kazanılan ilk büyük zaferdir.'),
  e('1326', '1326', 'Bursa’nın fethi', 'Orhan Bey Bursa’yı fethetti ve Bursa başkent oldu.'),
  e('1331', '1331', 'İznik', 'İznik alındı, ilk medrese burada açıldı.'),
  e('1345', '1345', 'Karesi Beyliği', 'Osmanlıya katıldı. Osmanlı Çanakkale Boğazı’na ulaştı ve Rumeli’ye geçiş kolaylaştı.'),
  e('1352', '1352', 'Çimpe Kalesi', 'Süleyman Paşa Çimpe Kalesi’ni aldı. Bu, Rumeli’ye ilk yerleşmedir.'),
  e('1361', '1361 ya da 1362', 'Edirne', 'I. Murat Edirne’yi aldı. Edirne 1365’te başkent oldu.'),
  e('1364', '1364', 'Sırpsındığı Savaşı', 'Balkanlar’da Osmanlı’nın yerleşmesi güçlendi.'),
  e('1371', '1371', 'Çirmen Savaşı', 'Meriç kıyısında kazanıldı, Balkanlar’daki ilerleme sürdü.'),
  e('1389', '1389', 'I. Kosova Savaşı', 'Balkan krallıkları yenildi. I. Murat savaş alanında şehit edildi.'),
  e('1396', '1396', 'Niğbolu Savaşı', 'Yıldırım Bayezid Haçlı ordusunu yendi. Balkanlar’daki hâkimiyet kesinleşti.'),
  e('1402', '1402', 'Ankara Savaşı', 'Timur Yıldırım Bayezid’i yendi. Fetret Devri (1402 ile 1413) başladı.'),
  e('1413', '1413', 'Devletin birleşmesi', 'I. Mehmed kardeşlerini yenerek devleti yeniden birleştirdi. İkinci kurucu sayılır.'),
  e('1444', '1444', 'Varna Savaşı', 'II. Murat Macar ve Haçlı ordusunu yendi.'),
  e('1448', '1448', 'II. Kosova Savaşı', 'Macarlara karşı kesin sonuç alındı, Balkanlar’daki hâkimiyet kesinleşti.'),
  e('1453', '29 Mayıs 1453', 'İstanbul’un fethi', 'II. Mehmet İstanbul’u fethetti. Bizans İmparatorluğu yıkıldı, Orta Çağ sona erdi, Yeni Çağ başladı.'),
]

export const OSMANLI_DUNYA: HistoryEvent[] = [
  e('1461', '1461', 'Trabzon', 'Fatih döneminde Trabzon Rum İmparatorluğu Osmanlı’ya katıldı.'),
  e('1473', '1473', 'Otlukbeli Savaşı', 'Akkoyunlu hükümdarı Uzun Hasan yenildi. Doğu Anadolu’da Osmanlı hâkimiyeti sağlandı.'),
  e('1475', '1475', 'Kırım Hanlığı', 'Osmanlı himayesine girdi.'),
  e('1480', '1480', 'Otranto', 'Gedik Ahmet Paşa Güney İtalya’da Otranto’yu aldı.'),
  e('1492', '1492', 'Endülüs’ten gelenler', 'II. Bayezid Endülüs’ten kaçan Yahudilere sığınma verdi.'),
  e('1514', '1514', 'Çaldıran Savaşı', 'Yavuz Sultan Selim Safevi Şahı İsmail’i yendi. Safevi tehdidi kırıldı.'),
  e('1516', '1516', 'Mercidabık Savaşı', 'Memlük Devleti’ne karşı kazanıldı.'),
  e('1517', '1517', 'Ridaniye Savaşı', 'Memlük Devleti yıkıldı. Suriye, Filistin, Mısır ve Hicaz Osmanlıya geçti. Halifelik Osmanlılara geçti.'),
  e('1521', '1521 ile 1522', 'Belgrad ve Rodos', 'Kanuni Sultan Süleyman Belgrad’ı ve Rodos’u aldı.'),
  e('1526', '1526', 'Mohaç Savaşı', 'Macar Kralı II. Lajos yenildi. Macaristan’ın büyük kısmı Osmanlı hâkimiyetine girdi.'),
  e('1529', '1529', 'I. Viyana Kuşatması', 'Başarısız oldu. Osmanlı’nın Avrupa’da ulaştığı en uzak noktadır.'),
  e('1534', '1534 ile 1535', 'Irakeyn Seferi', 'Bağdat alındı, Irak Osmanlıya geçti.'),
  e('1538', '1538', 'Preveze Deniz Savaşı', 'Barbaros Hayrettin Paşa Haçlı donanmasını yendi. Osmanlı Akdeniz’in hâkimi oldu.'),
  e('1555', '1555', 'Amasya Antlaşması', 'Safevilerle yapıldı.'),
  e('1571', '1571', 'Kıbrıs ve İnebahtı', 'Kıbrıs alındı. Aynı yıl İnebahtı Deniz Savaşı kaybedildi ama donanma kısa sürede yenilendi.'),
]

export const OSMANLI_DEGISIM: HistoryEvent[] = [
  e('1638', '1638', 'Bağdat', 'IV. Murat Bağdat’ı aldı ve devlet toparlandı.'),
  e('1669', '1669', 'Girit', 'Köprülü Fazıl Ahmet Paşa Girit’i aldı.'),
  e('1683', '1683', 'II. Viyana Kuşatması', 'Kara Mustafa Paşa başarısız oldu. Kutsal İttifak kuruldu, Osmanlı geri çekilmeye başladı.'),
  e('1699', '1699', 'Karlofça Antlaşması', 'Osmanlı’nın ilk toprak kaybıdır. Osmanlı savunmaya geçti.'),
  e('1718', '1718', 'Pasarofça ve Lale Devri', 'Lale Devri 1718 ile 1730 arasındadır. 1727’de İbrahim Müteferrika ilk Türk matbaasını kurdu.'),
  e('1774', '1774', 'Küçük Kaynarca', 'Kırım bağımsız oldu. Rusya Osmanlı Ortodokslarını koruma hakkı elde etti.'),
  e('1789', '1789', 'III. Selim', 'Nizam-ı Cedid ordusunu kurdu. Fransız İhtilali aynı yıl başladı.'),
  e('1792', '1792', 'Yaş Antlaşması', 'Rusya Kırım’ı ve Karadeniz’in kuzeyini kesinleştirdi.'),
  e('1808', '1808', 'Sened-i İttifak', 'Padişahın yetkisini ilk kez sınırlayan belge olarak anılır.'),
  e('1826', '1826', 'Vaka-i Hayriye', 'II. Mahmud Yeniçeri Ocağı’nı kaldırdı.'),
  e('1839', '1839', 'Tanzimat Fermanı', 'Can, mal ve namus güvenliği, vergide eşitlik ve düzenli askerlik getirildi.'),
  e('1856', '1856', 'Islahat Fermanı', 'Gayrimüslimlere ek haklar verildi. Kırım Savaşı sonunda Osmanlı Avrupa devletleri topluluğuna kabul edildi.'),
  e('1876', '1876', 'I. Meşrutiyet', 'Kanun-ı Esasi ilan edildi, Meclis-i Mebusan açıldı. II. Abdülhamit 1878’de meclisi kapattı.'),
  e('1881', '1881', 'Düyun-ı Umumiye', 'Osmanlı borçlarının yönetimi için kuruldu.'),
]

export const YIRMINCI_YUZYIL: HistoryEvent[] = [
  e('1908', '1908', 'II. Meşrutiyet', 'Makedonya’daki subayların ayaklanması üzerine Kanun-ı Esasi yeniden yürürlüğe girdi.'),
  e('1909', '1909', '31 Mart Vakası', 'Hareket Ordusu ayaklanmayı bastırdı. II. Abdülhamit tahttan indirildi, V. Mehmet Reşat geçti.'),
  e('1911', '1911 ile 1912', 'Trablusgarp Savaşı', 'İtalya Osmanlı’nın Kuzey Afrika’daki topraklarına saldırdı. Uşi Antlaşması 1912’de imzalandı.'),
  e('1912', '1912 ile 1913', 'I. Balkan Savaşı', 'Balkan Birliği Osmanlı’yı yendi. Osmanlı Edirne’yi bıraktı, Londra Antlaşması imzalandı.'),
  e('1913', '1913', 'II. Balkan Savaşı', 'Balkan devletleri birbirine girdi. Osmanlı Edirne’yi geri aldı, İstanbul Antlaşması imzalandı.'),
  e('1914a', '28 Haziran 1914', 'Saraybosna Suikastı', 'Avusturya-Macaristan Prensi Ferdinand öldürüldü. İttifaklar yüzünden savaş büyüdü.'),
  e('1914b', '29 Ekim 1914', 'Osmanlı savaşa giriyor', 'Osmanlı donanması Rus limanlarını bombaladı. Osmanlı İttifak Devletleri yanında savaşa girdi.'),
  e('1915a', '18 Mart 1915', 'Çanakkale Deniz Savaşı', 'İtilaf donanması boğazı geçemedi. Nusret mayın gemisi önemli rol oynadı.'),
  e('1915b', '25 Nisan 1915', 'Çanakkale kara savaşları', 'İtilaf kuvvetleri Gelibolu’ya çıkarma yaptı. Ocak 1916’da geri çekildiler.'),
  e('1917', '1917', 'Bolşevik İhtilali', 'Rusya savaştan çekildi. ABD İtilaf tarafında savaşa girdi.'),
  e('1918', '30 Ekim 1918', 'Mondros Mütarekesi', 'Osmanlı savaştan çekildi. 7. madde sonraki işgallerin dayanağı oldu.'),
]

export const INKILAPLAR: HistoryEvent[] = [
  e('1922', '1 Kasım 1922', 'Saltanatın kaldırılması', 'Osmanlı saltanatı sona erdi. Egemenlik kayıtsız şartsız millete geçti.'),
  e('1923', '29 Ekim 1923', 'Cumhuriyet’in ilanı', 'Mustafa Kemal ilk cumhurbaşkanı, İsmet İnönü ilk başbakan oldu. Başkent Ankara’dır.'),
  e('1924', '3 Mart 1924', 'Halifelik ve Tevhid-i Tedrisat', 'Halifelik kaldırıldı. Bütün eğitim kurumları Maarif Vekâleti’ne bağlandı.'),
  e('1925', '1925', 'Şapka Kanunu', 'Kıyafette çağdaşlaşma sağlandı. Tekke, zaviye ve türbeler kapatıldı.'),
  e('1926', '1926', 'Medeni Kanun', 'İsviçre Medeni Kanunu’ndan alındı. Resmî nikâh ve kadın erkek eşitliği getirildi.'),
  e('1928', '1928', 'Harf İnkılabı', 'Arap alfabesi yerine Latin harfleri kabul edildi. Millet Mektepleri açıldı.'),
  e('1930', '1930 ile 1934', 'Kadınlara siyasi haklar', '1930’da belediye, 1933’te muhtar seçimlerinde, 1934’te milletvekili seçme ve seçilme hakkı verildi.'),
  e('1933', '1933', 'Üniversite reformu', 'Darülfünun kapatıldı, İstanbul Üniversitesi kuruldu. I. Beş Yıllık Sanayi Planı da bu yıl uygulandı.'),
  e('1934', '1934', 'Soyadı Kanunu', 'Herkes soyadı aldı. Mustafa Kemal’e Atatürk soyadı verildi. Lakap ve unvanlar kaldırıldı.'),
  e('1936', '1936', 'Montrö Sözleşmesi', 'Türkiye’nin Boğazlar üzerindeki egemenlik hakkı yeniden sağlandı.'),
  e('1939', '1939', 'Hatay', 'Hatay anavatana katıldı.'),
]

// Yerler: [boylam, enlem]. Haritada işaret olarak kullanılır
export const KURTULUS: HistoryEvent[] = [
  { ...e('izmir', '15 Mayıs 1919', 'İzmir’in işgali', 'Yunanlılar İzmir’i işgal etti. Halk mitinglerle tepki gösterdi, Kuva-yi Milliye ve Müdafaa-i Hukuk cemiyetleri örgütlendi.'), place: [27.14, 38.42] },
  { ...e('samsun', '19 Mayıs 1919', 'Samsun’a çıkış', 'Mustafa Kemal 9. Ordu Müfettişi olarak Samsun’a çıktı. Millî Mücadele’nin başlangıcı kabul edilir.'), place: [36.33, 41.29] },
  { ...e('amasya', '22 Haziran 1919', 'Amasya Genelgesi', 'Vatanın bütünlüğü ve milletin istiklalinin tehlikede olduğu belirtildi. Sivas’ta kongre toplanması kararlaştırıldı.'), place: [35.83, 40.65] },
  { ...e('erzurum', '23 Temmuz ile 7 Ağustos 1919', 'Erzurum Kongresi', 'Doğu illerinin temsilcileriyle yapılan bölgesel kongredir. Manda ve himaye kabul edilmedi, Heyet-i Temsiliye seçildi.'), place: [41.27, 39.9] },
  { ...e('sivas', '4 ile 11 Eylül 1919', 'Sivas Kongresi', 'Ülke genelini temsil eden ulusal kongredir. Cemiyetler Anadolu ve Rumeli Müdafaa-i Hukuk Cemiyeti adı altında birleştirildi.'), place: [37.02, 39.75] },
  { ...e('misak', '28 Ocak 1920', 'Misak-ı Millî', 'Son Osmanlı Mebusan Meclisi İstanbul’da Misak-ı Millî’yi kabul etti.'), place: [28.98, 41.01] },
  { ...e('istanbul', '16 Mart 1920', 'İstanbul’un işgali', 'İtilaf devletleri İstanbul’u resmen işgal etti, Meclis kapatıldı.'), place: [28.98, 41.01] },
  { ...e('tbmm', '23 Nisan 1920', 'TBMM’nin açılışı', 'Ankara’da TBMM açıldı. Başkanı Mustafa Kemal’dir. Meclis hem yasama hem yürütme gücünü elinde topladı.'), place: [32.86, 39.93] },
  { ...e('gumru', 'Aralık 1920', 'Gümrü Antlaşması', 'TBMM’nin imzaladığı ilk antlaşmadır. Doğu sınırı belirlendi.'), place: [43.85, 40.79] },
  { ...e('inonu1', 'Ocak 1921', 'I. İnönü Savaşı', 'Düzenli ordunun ilk zaferidir. Kuva-yi Milliye dönemi sona erdi.'), place: [30.15, 39.82] },
  { ...e('inonu2', 'Mart 1921', 'II. İnönü Savaşı', 'Yunan ordusu yeniden yenildi.'), place: [30.15, 39.82] },
  { ...e('kutahya', 'Temmuz 1921', 'Kütahya-Eskişehir Savaşları', 'Türk ordusu Sakarya Nehri’nin doğusuna çekildi. Mustafa Kemal 5 Ağustos’ta Başkomutan seçildi.'), place: [29.98, 39.42] },
  { ...e('sakarya', '23 Ağustos ile 13 Eylül 1921', 'Sakarya Meydan Muharebesi', '22 gün süren savaşta Yunan ordusu geri püskürtüldü. Mustafa Kemal’e Mareşal rütbesi ve Gazi unvanı verildi.'), place: [32.15, 39.58] },
  { ...e('ankara', '20 Ekim 1921', 'Ankara Antlaşması', 'Fransa TBMM’yi resmen tanıyan ilk Batılı devlet oldu. Güney sınırı belirlendi.'), place: [32.86, 39.93] },
  { ...e('taarruz', '26 Ağustos 1922', 'Büyük Taarruz', 'Afyon Kocatepe’den başlatıldı.'), place: [30.55, 38.73] },
  { ...e('dumlupinar', '30 Ağustos 1922', 'Başkomutan Meydan Muharebesi', 'Dumlupınar’da Yunan ordusu yok edildi.'), place: [30.1, 38.95] },
  { ...e('kurtulus', '9 Eylül 1922', 'İzmir’in kurtuluşu', 'İzmir kurtarıldı. İlk hedef Akdeniz’dir emri verilmişti.'), place: [27.14, 38.42] },
  { ...e('mudanya', '11 Ekim 1922', 'Mudanya Ateşkesi', 'Doğu Trakya ve Edirne Türklere bırakıldı. Savaş fiilen bitti.'), place: [28.88, 40.38] },
  e('saltanat', '1 Kasım 1922', 'Saltanatın kaldırılması', 'Osmanlı saltanatı sona erdi.'),
  e('lozan', '24 Temmuz 1923', 'Lozan Barış Antlaşması', 'Yeni Türkiye Devleti’nin sınırları uluslararası alanda tanındı. Kapitülasyonlar kaldırıldı, Sevr geçersiz oldu. Lozan İsviçre’dedir, haritada gösterilmez.'),
]
