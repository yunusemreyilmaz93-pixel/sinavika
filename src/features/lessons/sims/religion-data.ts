import type { TimelineItem } from './timeline'

const e = (id: string, time: string, title: string, text: string): TimelineItem => ({ id, time, title, text })

export const HZ_MUHAMMED: TimelineItem[] = [
  e('dogum', '570 civarı', 'Doğum', 'Mekke’de doğdu. Babası Abdullah doğumundan önce, annesi Âmine altı yaşındayken vefat etti. Dedesi Abdülmuttalib, sonra amcası Ebu Talib himayesinde büyüdü.'),
  e('evlilik', '25 yaşında', 'Hz. Hatice ile evlilik', 'Gençliğinde doğruluğu ve güvenilirliğiyle el-Emin olarak tanındı. Ticaret ortağı Hz. Hatice ile evlendi.'),
  e('vahiy', '610 civarı, 40 yaşında', 'İlk vahiy', 'Hira Mağarası’nda ilk vahiy geldi. İlk ayetler “Oku” emriyle başlayan Alak suresindendir.'),
  e('hicret', '622', 'Medine’ye hicret', 'Mekke’deki baskı ve eziyetin ardından Medine’ye hicret edildi. İslam toplumu burada kurumlaştı.'),
  e('fetih', '630 civarı', 'Mekke’nin fethi', 'Yıllarca zulmedenlere karşı gösterilen affedici tutum, tarihin en çarpıcı örneklerinden biri olarak anılır.'),
  e('vefat', '632', 'Vefat', 'Vahyin inişi yaklaşık 23 yılda tamamlandı. Hz. Muhammed son peygamberdir, hatemülenbiya olarak anılır.'),
]

export const ISLAM_DUSUNCESI: TimelineItem[] = [
  e('ebuhanife', '699 ile 767', 'Ebu Hanife', 'Hanefî mezhebinin imamıdır, İmam-ı Azam olarak anılır. Kur’an ve sünneti yorumlarken aklın ilkelerini gözetir.'),
  e('cafer', '702 ile 765', 'Cafer Sadık', 'Caferî mezhebi görüşlerine dayanır. On iki imamı kabul ettikleri için İsnâaşeriyye ya da İmamiye de denir.'),
  e('safii', '767 ile 819', 'İmam Şafii', 'Fıkıh usulünün temellerini atan ilk âlimdir. Er-Risale eseriyle bilinir.'),
  e('esari', '873 ile 935', 'Eşari', 'Kelamın iki önemli temsilcisinden biridir. Maķalatü’l-İslamiyyin eserinin yazarıdır.'),
  e('maturidi', 'öl. 944', 'Matüridi', 'Semerkant’ta yaşadı. Kitabü’t-Tevhid yazarıdır. Akıl ile nakli uzlaştırdı. Türkiye’de Hanefilikle birlikte itikadî olarak kabul görür.'),
  e('geylani', '1077 ile 1166', 'Abdülkadir Geylani', 'Kadirilik tarikatının adını aldığı mutasavvıftır. Zikir meclisleriyle tanınır.'),
  e('yesevi', '1093 ile 1166', 'Ahmed Yesevi', 'Yesevilik tarikatının kurucusudur. Divan-ı Hikmet eserini sade Türkçeyle yazdı.'),
  e('ahievran', '1171 doğumlu', 'Ahi Evran', 'Kırşehir’e yerleşti. Ahilik teşkilatını yaydı ve otuz iki çeşit esnafı teşkilatlandırdı.'),
  e('mevlana', '1207 ile 1273', 'Mevlana', 'Konya’da yaşadı. Mesnevi, Divan-ı Kebir ve Fihi Mâ Fih eserlerini yazdı. Mevlevilik düşüncesini oğlu Sultan Veled sistemleştirdi.'),
  e('yunus', '1240 ile 1320', 'Yunus Emre', 'Mürşidi Tapduk Emre’dir. Arı Türkçeyle yazdığı şiirlerle eski Anadolu Türkçesinin oluşumunda önemli rol oynadı.'),
  e('bektas', '1247 ile 1337', 'Hacı Bektaş Veli', 'Bektaşiliğin adını aldığı mutasavvıftır. Makalat eseri ve “Eline, beline, diline sahip ol” öğüdüyle anılır.'),
  e('nakshibend', '1318 ile 1389', 'Bahaeddin Nakşibend', 'Nakşibendilik onun görüşlerine dayanır. Zikrin gizlice, kalpten yapılmasını esas alır.'),
  e('hacibayram', '1340 ile 1430', 'Hacı Bayram Veli', 'Ankara’da yaşadı. Somuncu Baba’nın öğrencisidir. Yardımlaşma ve toplumsal dayanışmaya önem verdi.'),
]
