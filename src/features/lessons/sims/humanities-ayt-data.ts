import type { TimelineItem } from './timeline'

const e = (id: string, time: string, title: string, text: string): TimelineItem => ({ id, time, title, text })

export const MANTIK_TARIHI: TimelineItem[] = [
  e('aristoteles', 'MÖ 4. yüzyıl', 'Aristoteles', 'Mantığı sistemli hâle getiren ilk filozoftur. Mantık eserleri Organon adıyla toplanır. Kıyas kuramını kurdu.'),
  e('stoa', 'MÖ 3. yüzyıl', 'Stoacılar', 'Önermeler mantığının ilk biçimlerini geliştirdi. Ve, veya, ise gibi bağlaçları inceledi.'),
  e('farabi', '10. yüzyıl', 'Farabi', 'Aristoteles’in mantığını şerh ederek İslam dünyasında yaydı. Bu yüzden Muallim-i Sani olarak anılır.'),
  e('ibnsina', '11. yüzyıl', 'İbn Sina', 'Mantığı Şifa eserinde ayrıntılı işledi. İslam mantık geleneğinin en etkili isimlerindendir.'),
  e('skolastik', '12. ve 13. yüzyıl', 'Skolastik dönem', 'Avrupa üniversitelerinde Aristoteles mantığı temel ders oldu. Tümeller tartışması dil ve mantık konularını işledi.'),
  e('bacon', '1620', 'Francis Bacon', 'Novum Organum ile deney ve gözleme dayalı tümevarım yöntemini öne çıkardı.'),
  e('leibniz', '17. yüzyıl', 'Leibniz', 'Yeter sebep ilkesini ortaya koydu. Düşünceyi simgelerle hesaplanabilir hâle getirmeyi tasarladı.'),
  e('boole', '1854', 'George Boole', 'Mantığı cebirsel simgelerle ifade etti. Sembolik mantığın temelini attı.'),
  e('frege', '1879', 'Frege', 'Kavram yazısı adlı eseriyle önermeler ve niceleyiciler için modern simgesel mantığı kurdu.'),
  e('russell', '1910 ile 1913', 'Russell ve Whitehead', 'Principia Mathematica ile matematiği mantığa dayandırmaya çalıştılar.'),
  e('godel', '1931', 'Gödel', 'Eksiklik teoremleriyle biçimsel sistemlerin sınırlarını gösterdi.'),
]

export const FELSEFE_15_17: TimelineItem[] = [
  e('ronesans', '15. yüzyıl', 'Rönesans ve hümanizm', 'İnsan ve doğa merkezli düşünce yükseldi. Skolastik otorite sorgulandı. Eski Yunan ve Roma eserleri yeniden okundu.'),
  e('machiavelli', '1469 ile 1527', 'Machiavelli', 'Hükümdar eserinde siyaseti ahlak ve dinden ayırarak güç ve çıkar ilişkileri üzerinden inceledi.'),
  e('kopernik', '1543', 'Kopernik', 'Güneş merkezli evren görüşünü yayımladı. Galileo ve Kepler ile doğa matematikle ve deneyle incelenmeye başladı.'),
  e('bacon', '1561 ile 1626', 'Francis Bacon', 'Bilgi güçtür. Tümevarım yöntemini savundu ve zihni yanıltan idolleri eleştirdi. Empirizmin öncüsüdür.'),
  e('hobbes', '1588 ile 1679', 'Hobbes', 'Materyalist ve mekanisttir. Toplum sözleşmesiyle güçlü devleti savundu. Leviathan eserinin yazarıdır.'),
  e('descartes', '1596 ile 1650', 'Descartes', 'Rasyonalizmin kurucusu. Yöntemli kuşkuyla düşünüyorum, öyleyse varım ilkesine ulaştı. Düşünce ve yer kaplayan töz ikiliğini savundu.'),
  e('spinoza', '1632 ile 1677', 'Spinoza', 'Tek töz vardır, o da Tanrı ya da doğadır. Monist ve panteisttir. Ethica eserinin yazarıdır.'),
  e('locke', '1632 ile 1704', 'Locke', 'Empirizmin önemli temsilcisi. Zihin doğuşta boş levhadır. Bilgi deneyimden gelir. Siyasette doğal haklar ve sınırlı iktidarı savundu.'),
  e('leibniz', '1646 ile 1716', 'Leibniz', 'Evren sayısız monaddan oluşur. Yeter sebep ilkesini ortaya koydu. Rasyonalisttir.'),
  e('berkeley', '1685 ile 1753', 'Berkeley', 'Olmak algılanmaktır. Maddenin bağımsız varlığını reddetti. Öznel idealisttir.'),
]

export const FELSEFE_18_19: TimelineItem[] = [
  e('aydinlanma', '18. yüzyıl', 'Aydınlanma Çağı', 'Akla, bilime ve özgürlüğe güven öne çıktı. Voltaire, Montesquieu, Rousseau ve Diderot bu dönemin düşünürleridir.'),
  e('hume', '1711 ile 1776', 'Hume', 'Empirist ve kuşkucudur. Nedensellik, olaylar arasında alışkanlıktan doğan bir beklentidir. Bilgi izlenimlere dayanır.'),
  e('rousseau', '1712 ile 1778', 'Rousseau', 'Toplum Sözleşmesi eserinin yazarıdır. Genel irade ilkesini savundu. İnsan doğuştan iyidir, toplum bozar.'),
  e('kant', '1724 ile 1804', 'Kant', 'Eleştirel felsefenin kurucusu. Bilgi akıl ve deneyimin birlikteliğiyle oluşur. Fenomen ve numen ayrımı. Kategorik imperatif.'),
  e('hegel', '1770 ile 1831', 'Hegel', 'Diyalektik yöntem (tez, antitez, sentez). Mutlak tin tarihte kendini gerçekleştirir. Nesnel idealisttir.'),
  e('schopenhauer', '1788 ile 1860', 'Schopenhauer', 'Dünya irade ve tasavvurdur. Hayatın özü bitmeyen istektir. Kötümser bir felsefe savundu.'),
  e('comte', '1798 ile 1857', 'Auguste Comte', 'Pozitivizmin kurucusu. Üç hâl yasası (teolojik, metafizik, pozitif). Sosyolojinin kurucusu sayılır.'),
  e('mill', '1806 ile 1873', 'John Stuart Mill', 'Faydacılığı savundu. Doğru eylem en çok kişiye en çok mutluluk sağlayandır. Özgürlük üzerine eseriyle bilinir.'),
  e('kierkegaard', '1813 ile 1855', 'Kierkegaard', 'Varoluşçuluğun öncüsüdür. Bireyin seçimi, kaygısı ve imanı üzerinde durdu.'),
  e('marx', '1818 ile 1883', 'Marx', 'Tarihsel materyalizm ve sınıf mücadelesi. Altyapı üstyapıyı belirler. Kapital eserinin yazarıdır.'),
  e('nietzsche', '1844 ile 1900', 'Nietzsche', 'Tanrı öldü der. Üstinsan ve güç istenci kavramlarını savundu. Değerlerin yeniden değerlendirilmesini önerdi.'),
]

export const FELSEFE_20: TimelineItem[] = [
  e('husserl', '1859 ile 1938', 'Husserl', 'Fenomenolojinin kurucusu. Şeylerin kendisine dönmeyi önerdi. Bilinç her zaman bir şeye yönelmiştir (yönelimsellik).'),
  e('pragmatizm', '19. yüzyıl sonu ve 20. yüzyıl', 'Pragmatizm', 'Peirce, James ve Dewey. Bir düşüncenin doğruluğu pratik sonuçlarıyla ölçülür.'),
  e('russell', '1872 ile 1970', 'Russell', 'Analitik felsefenin kurucularındandır. Dili ve mantığı felsefenin temel aracı yaptı.'),
  e('wittgenstein', '1889 ile 1951', 'Wittgenstein', 'Tractatus ile dil ve dünyanın mantıksal yapısını inceledi. Sonra anlamın dilin kullanımında aranması gerektiğini savundu.'),
  e('heidegger', '1889 ile 1976', 'Heidegger', 'Varlık ve Zaman eserinin yazarıdır. İnsan dünyaya atılmış bir varlıktır. Ölüm ve kaygı varoluşun parçasıdır.'),
  e('viyana', '1920’ler ve 1930’lar', 'Viyana Çevresi', 'Mantıksal pozitivizm. Doğrulanamayan önermeler anlamsızdır. Carnap ve Schlick çevrenin önemli isimleridir.'),
  e('frankfurt', '1920’ler', 'Frankfurt Okulu', 'Eleştirel kuram. Adorno, Horkheimer ve Marcuse. Kültür endüstrisi ve tek boyutlu insan eleştirisi.'),
  e('sartre', '1905 ile 1980', 'Sartre', 'Varoluş özden önce gelir. İnsan özgürlüğe mahkûmdur. Varlık ve Hiçlik eserinin yazarıdır.'),
  e('popper', '1902 ile 1994', 'Popper', 'Bilimsel kuramlar yanlışlanabilir olmalıdır. Açık toplum düşüncesini savundu.'),
  e('kuhn', '1922 ile 1996', 'Kuhn', 'Bilimsel Devrimlerin Yapısı eserinin yazarıdır. Normal bilim, kriz ve paradigma değişimi.'), // copy-ok
  e('foucault', '1926 ile 1984', 'Foucault', 'Bilgi ve iktidar ilişkisini inceledi. Hapishane ve akıl hastanesi gibi kurumları çözümledi.'),
  e('derrida', '1930 ile 2004', 'Derrida', 'Yapıbozum. Metinlerdeki ikili karşıtlıkları ve kesin anlam fikrini sorguladı.'),
]

export const PSIKOLOJI_TARIHI: TimelineItem[] = [
  e('wundt', '1879', 'Wundt', 'Leipzig’de ilk deneysel psikoloji laboratuvarını kurdu. Psikoloji felsefeden ayrı bir bilim oldu. İçebakış yöntemini kullandı.'),
  e('james', '1890', 'William James', 'İşlevselcilik. Zihnin canlının çevreye uyumundaki işlevine odaklandı. Principles of Psychology eserinin yazarıdır.'),
  e('freud', '1900 civarı', 'Freud', 'Psikanalizin kurucusu. Bilinçdışı, rüyalar ve çocukluk yaşantıları. Kişiliği id, ego ve süperego ile açıkladı.'),
  e('pavlov', '1900’ler', 'Pavlov', 'Klasik koşullanmayı köpeklerle yaptığı salya deneyleriyle gösterdi.'),
  e('gestalt', '1912', 'Gestalt', 'Wertheimer, Köhler ve Koffka. Bütün, parçaların toplamından fazladır. Algı ve problem çözmeyi bütün olarak ele aldı.'),
  e('watson', '1913', 'Watson', 'Davranışçılığı başlattı. Psikoloji yalnızca gözlenebilir davranışı incelemelidir.'),
  e('skinner', '1938', 'Skinner', 'Edimsel koşullanma. Davranışlar sonuçlarına göre pekişir ya da sönerler.'),
  e('humanistik', '1950’ler', 'Hümanistik psikoloji', 'Maslow ve Rogers. İnsanın kendini gerçekleştirme eğilimi ve bütüncül bakış.'),
  e('bilissel', '1950’ler ve 1960’lar', 'Bilişsel psikoloji', 'Zihin bilgi işleyen bir sistem olarak incelendi. Bellek, dikkat ve düşünme araştırmaları arttı.'),
  e('bandura', '1961', 'Bandura', 'Bobo bebek deneyi. Gözlem yoluyla öğrenme (sosyal öğrenme) kuramını geliştirdi.'),
  e('norobilim', 'Günümüz', 'Güncel yaklaşımlar', 'Beyin görüntüleme yöntemleri, nörobilim ve pozitif psikoloji.'),
]

export const SOSYOLOJI_TARIHI: TimelineItem[] = [
  e('ibnhaldun', '14. yüzyıl', 'İbn Haldun', 'Mukaddime eserinde toplumların ve devletlerin yükseliş ve çöküşünü asabiyet gibi toplumsal olgularla açıkladı. Sosyolojinin öncülerindendir.'),
  e('comte', '1838 civarı', 'Comte', 'Sosyoloji terimini ilk kez kullandı. Toplumu bilimsel yöntemle inceleyen pozitivist bir bilim tasarladı.'),
  e('spencer', '19. yüzyıl', 'Spencer', 'Toplumu canlı bir organizmaya benzetti. Toplumsal evrim fikrini savundu.'),
  e('marx', '1848', 'Marx', 'Komünist Manifesto. Toplumu sınıf çatışması ve ekonomik yapıyla açıkladı. Çatışma kuramının öncüsüdür.'),
  e('durkheim', '1895 ile 1897', 'Durkheim', 'Sosyolojik Yöntemin Kuralları ve İntihar eserlerinin yazarıdır. Toplumsal olgular bireyin dışındadır ve onu zorlar. İşlevselciliğin öncüsüdür.'),
  e('weber', '1904 ile 1905', 'Weber', 'Protestan Ahlakı ve Kapitalizmin Ruhu. Anlayıcı sosyoloji ve toplumsal eylem kavramı. Bürokrasi çözümlemesiyle bilinir.'),
  e('mead', '1934', 'Mead', 'Sembolik etkileşimcilik. Benlik toplumsal etkileşim içinde oluşur.'),
  e('gokalp', '1920’ler', 'Ziya Gökalp', 'Türk sosyolojisinin kurucusudur. Kültür ve medeniyet ayrımını yaptı. Türkçülüğün Esasları eserinin yazarıdır.'),
  e('parsons', '1950’ler', 'Parsons', 'Yapısal işlevselcilik. Toplumun kurumları birbirini tamamlayan parçalardır.'),
  e('guncel', 'Günümüz', 'Güncel sosyoloji', 'Küreselleşme, kimlik, medya ve dijital toplum.'),
]

export const ISLAM_BILIM: TimelineItem[] = [
  e('beytulhikme', '9. yüzyıl', 'Beytülhikme', 'Bağdat’ta kurulan çeviri ve araştırma merkezidir. Yunan, Hint ve Fars eserleri Arapçaya çevrildi.'),
  e('harezmi', '780 ile 850', 'Harezmî', 'Cebirin kurucusudur. Hint rakamlarını tanıttı. Algoritma sözcüğü adından türemiştir.'),
  e('razi', '865 ile 925', 'Razi', 'Hekim ve kimyagerdir. Çiçek ve kızamığı birbirinden ayırdı. El-Havi adlı tıp ansiklopedisini yazdı.'),
  e('ibnheysem', '965 ile 1040', 'İbn Heysem', 'Optiğin kurucusudur. Kitabü’l-Menazır eserinde görmenin gözün içine gelen ışıkla olduğunu gösterdi. Deneye dayalı yöntemi kullandı.'),
  e('biruni', '973 ile 1048', 'Biruni', 'Matematik, astronomi ve coğrafya alanlarında çalıştı. Dünyanın çevresini hesapladı. Hindistan hakkındaki eseriyle bilinir.'),
  e('ibnsina', '980 ile 1037', 'İbn Sina', 'El-Kanun fi’t-Tıb eseri yüzyıllarca Avrupa üniversitelerinde okutuldu.'),
  e('cezeri', '1136 ile 1206', 'Cezerî', 'Otomatlar ve mekanik aletler üzerine çalıştı. Mühendislik alanında önemli eserler bıraktı.'),
  e('ulugbey', '1394 ile 1449', 'Uluğ Bey', 'Semerkant’ta rasathane kurdu. Zic-i Cedid-i Sultani adlı yıldız cetvelini hazırladı.'),
  e('alikuscu', '1403 ile 1474', 'Ali Kuşçu', 'Uluğ Bey’in öğrencisidir. Fatih Sultan Mehmed zamanında İstanbul’a gelerek medreselerde ders verdi.'),
  e('takiyyuddin', '1526 ile 1585', 'Takiyyüddin', 'İstanbul Rasathanesi’ni kurdu. Mekanik saat ve astronomi aletleri üzerine çalıştı.'),
]

export const HINT_CIN: TimelineItem[] = [
  e('veda', 'MÖ 1500 civarı', 'Veda dönemi', 'Hint dininin kutsal metinleri olan Vedalar bu dönemde oluştu. Hinduizm, Hindistan’ın eski dinî geleneğidir.'),
  e('upanisad', 'MÖ 800 ile 400', 'Upanişadlar', 'Brahman ve Atman öğretisi. Samsara (yeniden doğuş) ve karma düşüncesi.'),
  e('caynizm', 'MÖ 6. yüzyıl', 'Caynizm', 'Mahavira’nın öğretisidir. Ahimsa, yani hiçbir canlıya zarar vermeme ilkesi.'),
  e('budizm', 'MÖ 6. ve 5. yüzyıl', 'Buda', 'Siddhartha Gautama. Dört asil gerçek ve sekiz katlı yol. Nirvana, ıstıraptan kurtuluştur.'),
  e('konfucyus', 'MÖ 551 ile 479', 'Konfüçyüs', 'Ahlak, aile ve toplumsal düzen üzerinde durdu. İnsanlık (ren) ve törel kurallar (li) kavramları.'),
  e('taoizm', 'MÖ 6. yüzyıl', 'Lao Tzu', 'Tao Te Ching eseriyle anılır. Tao, doğanın akışıdır. Doğallık ve sadelik öğütlenir.'),
  e('asoka', 'MÖ 3. yüzyıl', 'Aşoka', 'Hint imparatoru Aşoka Budizmi destekledi ve yayılmasını sağladı.'),
]

export const YAHUDI_HRISTIYAN: TimelineItem[] = [
  e('ibrahim', 'MÖ 2000 civarı', 'Hz. İbrahim', 'İbrahimî dinlerin ortak atası kabul edilir.'),
  e('musa', 'MÖ 13. yüzyıl', 'Hz. Musa', 'İsrailoğullarının Mısır’dan çıkışı. Tevrat ve On Emir bu döneme bağlanır.'),
  e('davud', 'MÖ 1000 civarı', 'Hz. Davud ve Hz. Süleyman', 'İsrail krallığının güçlendiği dönem. Kudüs’te Süleyman Mabedi inşa edildi.'),
  e('babil', 'MÖ 586', 'Babil sürgünü', 'Kudüs yıkıldı ve Yahudilerin önemli bir bölümü Babil’e götürüldü.'),
  e('isa', 'MS 1. yüzyıl', 'Hz. İsa', 'Hristiyanlık, Hz. İsa’nın öğretisine dayanır. İncil, Hristiyanların kutsal kitabıdır.'),
  e('milano', '313', 'Milano Fermanı', 'Roma İmparatorluğu’nda Hristiyanlığa dinî serbestlik tanındı.'),
  e('iznik', '325', 'İznik Konsili', 'Hristiyan inancının temel ilkeleri tartışıldı.'),
  e('resmi', '380', 'Resmî din', 'Hristiyanlık Roma İmparatorluğu’nda resmî din oldu.'),
  e('ayrilik', '1054', 'Büyük ayrılık', 'Katolik ve Ortodoks kiliseleri birbirinden ayrıldı.'),
  e('reform', '1517', 'Reform', 'Martin Luther’in eleştirileriyle Protestanlık doğdu.'),
]
