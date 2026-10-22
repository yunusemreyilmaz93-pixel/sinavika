import type { TimelineItem } from './timeline'

const e = (id: string, time: string, title: string, text: string): TimelineItem => ({ id, time, title, text })

export const ILK_CAG: TimelineItem[] = [
  e('thales', 'MÖ 624 ile 546', 'Thales', 'Bilinen ilk Yunan filozofu. Arkhe sudur. Evreni mitlerle değil, tek bir doğal maddeyle açıkladı.'),
  e('anaksimandros', 'MÖ 6. yüzyıl', 'Anaksimandros', 'Arkhe apeirondur, yani sınırsız ve belirsiz madde.'),
  e('anaksimenes', 'MÖ 6. yüzyıl', 'Anaksimenes', 'Arkhe havadır. Hava yoğunlaşıp seyrelerek her şeyi oluşturur.'),
  e('pythagoras', 'MÖ 6. yüzyıl', 'Pythagoras', 'Philosophia terimini ilk kullanan kişi olarak bilinir. Evrenin özü sayılardır.'),
  e('herakleitos', 'MÖ 6. ve 5. yüzyıl', 'Herakleitos', 'Arkhe ateştir. Her şey sürekli değişir. Aynı ırmakta iki kez yıkanılmaz.'),
  e('parmenides', 'MÖ 5. yüzyıl', 'Parmenides', 'Varlık tektir, değişmez ve sonsuzdur. Değişim duyuların yanılgısıdır.'),
  e('empedokles', 'MÖ 5. yüzyıl', 'Empedokles', 'Dört element (toprak, su, hava, ateş) ve iki güç (sevgi ve nefret).'),
  e('demokritos', 'MÖ 5. yüzyıl', 'Demokritos', 'Evren boşlukta hareket eden bölünemez atomlardan oluşur. Materyalisttir.'),
  e('protagoras', 'MÖ 5. yüzyıl', 'Protagoras', 'Sofisttir. İnsan her şeyin ölçüsüdür. Bilgi ve ahlak göreceldir.'),
  e('sokrates', 'MÖ 470 ile 399', 'Sokrates', 'Yazı yazmadı. Diyalog yöntemiyle önce ironi, sonra ebelik uyguladı. Erdem bilgidir.'),
  e('platon', 'MÖ 427 ile 347', 'Platon', 'Akademia’yı kurdu. İdealar kuramı ve mağara alegorisi. Filozoflar yönetmelidir.'),
  e('aristoteles', 'MÖ 384 ile 322', 'Aristoteles', 'Lykeion’u kurdu. Madde ve form, mantığın kurucusu. Erdem iki aşırı uç arasında orta yoldur.'),
  e('epikuros', 'MÖ 4. ve 3. yüzyıl', 'Helenistik okullar', 'Epikuros haz ve ruh dinginliğini, Stoa doğaya uygun yaşamayı, Pyrrhon yargıdan kaçınmayı savunur.'),
]

export const ORTA_CAG: TimelineItem[] = [
  e('plotinos', 'MS 3. yüzyıl', 'Plotinos', 'Yeni Platonculuk. Her şey Bir’den taşar (sudur).'),
  e('augustinus', '354 ile 430', 'Augustinus', 'Patristik felsefenin en önemli temsilcisi. Anlamak için inanıyorum. Kötülük iyiliğin yokluğudur.'),
  e('beytulhikme', '8. ve 9. yüzyıl', 'Beytülhikme', 'Bağdat’ta Yunanca, Süryanice, Farsça ve Sanskritçe eserler Arapçaya çevrildi.'),
  e('kindi', '801 ile 873', 'Kindi', 'İlk İslam filozofu. Felsefe ile dinin uyumlu olduğunu savundu.'),
  e('farabi', '870 ile 950', 'Farabi', 'Muallim-i Sani (İkinci Öğretmen). Erdemli Şehir eserinin yazarı.'),
  e('ibnsina', '980 ile 1037', 'İbn Sina', 'Şifa ve el-Kanun fi’t-Tıb eserleri. Uçan adam deneyi. Zorunlu varlık Tanrı’dır.'),
  e('anselmus', '1033 ile 1109', 'Anselmus', 'Skolastik düşünür. Tanrı’nın varlığı için ontolojik delil.'),
  e('gazali', '1058 ile 1111', 'Gazali', 'Tehafütü’l-Felasife ile filozofları eleştirdi. İhya-u Ulumi’d-Din tasavvuf ve ahlak eseridir.'),
  e('abelardus', '12. yüzyıl', 'Abelardus', 'Tümeller tartışmasında kavramcı (konseptüalist) görüşü savundu.'),
  e('ibnrusd', '1126 ile 1198', 'İbn Rüşd', 'Aristoteles şârihi. Tehafütü’t-Tehafüt ile Gazali’ye cevap verdi.'),
  e('aquinas', '1225 ile 1274', 'Thomas Aquinas', 'Skolastiğin en büyük düşünürü. Akıl ile iman uyumludur. Tanrı’nın varlığı için beş yol.'),
  e('ockham', '14. yüzyıl', 'William of Ockham', 'Nominalizmi savundu. Gereksiz varsayımlar yapma (Ockham’ın usturası).'),
  e('ibnhaldun', '1332 ile 1406', 'İbn Haldun', 'Mukaddime eserinin yazarı. Toplum, tarih ve asabiyet.'),
]
