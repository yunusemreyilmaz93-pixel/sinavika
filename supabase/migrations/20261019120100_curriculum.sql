insert into public.subjects (id, exam, name, short, question_count, fields, sort, color) values
  ('lgs-tr', 'LGS', 'Türkçe', 'Türkçe', 20, null, 1, 'coral'),
  ('lgs-mat', 'LGS', 'Matematik', 'Mat', 20, null, 2, 'sea'),
  ('lgs-fen', 'LGS', 'Fen Bilimleri', 'Fen', 20, null, 3, 'pine'),
  ('lgs-ink', 'LGS', 'T.C. İnkılap Tarihi ve Atatürkçülük', 'İnkılap', 10, null, 4, 'amber'),
  ('lgs-din', 'LGS', 'Din Kültürü ve Ahlak Bilgisi', 'Din', 10, null, 5, 'teal'),
  ('lgs-ing', 'LGS', 'İngilizce', 'İngilizce', 10, null, 6, 'violet'),

  ('tyt-tr', 'TYT', 'Türkçe', 'Türkçe', 40, null, 1, 'coral'),
  ('tyt-mat', 'TYT', 'Temel Matematik', 'Mat', 40, null, 2, 'sea'),
  ('tyt-fiz', 'TYT', 'Fizik', 'Fizik', 7, null, 3, 'pine'),
  ('tyt-kim', 'TYT', 'Kimya', 'Kimya', 7, null, 4, 'teal'),
  ('tyt-bio', 'TYT', 'Biyoloji', 'Biyoloji', 6, null, 5, 'lime'),
  ('tyt-tar', 'TYT', 'Tarih', 'Tarih', 5, null, 6, 'amber'),
  ('tyt-cog', 'TYT', 'Coğrafya', 'Coğrafya', 5, null, 7, 'orange'),
  ('tyt-fel', 'TYT', 'Felsefe', 'Felsefe', 5, null, 8, 'violet'),
  ('tyt-din', 'TYT', 'Din Kültürü', 'Din', 5, null, 9, 'rose'),

  ('ayt-mat', 'AYT', 'Matematik', 'Mat', 40, '{say,ea}', 1, 'sea'),
  ('ayt-fiz', 'AYT', 'Fizik', 'Fizik', 14, '{say}', 2, 'pine'),
  ('ayt-kim', 'AYT', 'Kimya', 'Kimya', 13, '{say}', 3, 'teal'),
  ('ayt-bio', 'AYT', 'Biyoloji', 'Biyoloji', 13, '{say}', 4, 'lime'),
  ('ayt-edb', 'AYT', 'Türk Dili ve Edebiyatı', 'Edebiyat', 24, '{ea,soz}', 5, 'coral'),
  ('ayt-tar1', 'AYT', 'Tarih-1', 'Tarih-1', 10, '{ea,soz}', 6, 'amber'),
  ('ayt-cog1', 'AYT', 'Coğrafya-1', 'Coğrafya-1', 6, '{ea,soz}', 7, 'orange'),
  ('ayt-tar2', 'AYT', 'Tarih-2', 'Tarih-2', 11, '{soz}', 8, 'amber'),
  ('ayt-cog2', 'AYT', 'Coğrafya-2', 'Coğrafya-2', 11, '{soz}', 9, 'orange'),
  ('ayt-fel', 'AYT', 'Felsefe Grubu', 'Felsefe', 12, '{soz}', 10, 'violet'),
  ('ayt-din', 'AYT', 'Din Kültürü', 'Din', 6, '{soz}', 11, 'rose'),

  ('ydt-dil', 'YDT', 'Yabancı Dil', 'Dil', 80, '{dil}', 1, 'violet');

do $$
declare
  data jsonb := $json${
    "lgs-tr": ["Sözcükte Anlam", "Deyimler ve Atasözleri", "Cümlede Anlam", "Paragrafta Anlam", "Metin Türleri", "Söz Sanatları", "Fiilimsiler", "Cümlenin Ögeleri", "Fiilde Çatı", "Cümle Türleri", "Yazım Kuralları", "Noktalama İşaretleri", "Anlatım Bozuklukları", "Sözel Mantık ve Görsel Okuma"],
    "lgs-mat": ["Çarpanlar ve Katlar", "Üslü İfadeler", "Kareköklü İfadeler", "Veri Analizi", "Basit Olayların Olma Olasılığı", "Cebirsel İfadeler ve Özdeşlikler", "Doğrusal Denklemler", "Eşitsizlikler", "Üçgenler", "Eşlik ve Benzerlik", "Dönüşüm Geometrisi", "Geometrik Cisimler"],
    "lgs-fen": ["Mevsimler ve İklim", "DNA ve Genetik Kod", "Basınç", "Madde ve Endüstri", "Basit Makineler", "Enerji Dönüşümleri ve Çevre Bilimi", "Elektrik Yükleri ve Elektrik Enerjisi"],
    "lgs-ink": ["Bir Kahraman Doğuyor", "Milli Uyanış: Bağımsızlık Yolunda Atılan Adımlar", "Milli Bir Destan: Ya İstiklal Ya Ölüm", "Atatürkçülük ve Çağdaşlaşan Türkiye", "Demokratikleşme Çabaları", "Atatürk Dönemi Türk Dış Politikası", "Atatürk'ün Ölümü ve Sonrası"],
    "lgs-din": ["Kader İnancı", "Zekât ve Sadaka", "Din ve Hayat", "Hz. Muhammed'in Örnekliği", "Kur'an-ı Kerim ve Özellikleri"],
    "lgs-ing": ["Friendship", "Teen Life", "In the Kitchen", "On the Phone", "The Internet", "Adventures", "Tourism", "Chores", "Science", "Natural Forces"],

    "tyt-tr": ["Sözcükte Anlam", "Cümlede Anlam", "Paragraf", "Ses Bilgisi", "Yazım Kuralları", "Noktalama İşaretleri", "Sözcükte Yapı", "İsim ve Sıfat", "Zamir ve Zarf", "Edat, Bağlaç, Ünlem", "Fiiller ve Ek Fiil", "Fiilimsiler", "Fiil Çatısı", "Cümlenin Ögeleri", "Cümle Türleri", "Anlatım Bozuklukları"],
    "tyt-mat": ["Temel Kavramlar", "Sayı Basamakları", "Bölme ve Bölünebilme", "EBOB ve EKOK", "Rasyonel Sayılar", "Basit Eşitsizlikler", "Mutlak Değer", "Üslü Sayılar", "Köklü Sayılar", "Çarpanlara Ayırma", "Oran ve Orantı", "Denklem Çözme", "Sayı ve Kesir Problemleri", "Yaş Problemleri", "Hareket Problemleri", "İşçi ve Havuz Problemleri", "Yüzde, Kâr ve Zarar Problemleri", "Karışım Problemleri", "Grafik Problemleri", "Kümeler", "Mantık", "Fonksiyonlar", "Polinomlar", "İkinci Dereceden Denklemler", "Permütasyon ve Kombinasyon", "Olasılık", "Veri ve İstatistik", "Doğruda ve Üçgende Açılar", "Özel Üçgenler", "Açıortay ve Kenarortay", "Üçgende Alan", "Üçgende Benzerlik", "Çokgenler ve Dörtgenler", "Çember ve Daire", "Analitik Geometri", "Katı Cisimler"],
    "tyt-fiz": ["Fizik Bilimine Giriş", "Madde ve Özellikleri", "Hareket ve Kuvvet", "İş, Güç ve Enerji", "Isı ve Sıcaklık", "Elektrostatik", "Elektrik ve Manyetizma", "Basınç ve Kaldırma Kuvveti", "Dalgalar", "Optik"],
    "tyt-kim": ["Kimya Bilimi", "Atom ve Periyodik Sistem", "Kimyasal Türler Arası Etkileşimler", "Maddenin Halleri", "Doğa ve Kimya", "Kimyanın Temel Kanunları", "Mol Kavramı", "Kimyasal Tepkimeler ve Hesaplamalar", "Karışımlar", "Asitler, Bazlar ve Tuzlar", "Kimya Her Yerde"],
    "tyt-bio": ["Canlıların Ortak Özellikleri", "Canlıların Temel Bileşenleri", "Hücre ve Organelleri", "Hücre Zarından Madde Geçişi", "Canlıların Sınıflandırılması", "Hücre Bölünmeleri", "Kalıtım", "Ekosistem Ekolojisi", "Güncel Çevre Sorunları"],
    "tyt-tar": ["Tarih ve Zaman", "İnsanlığın İlk Dönemleri", "Orta Çağ'da Dünya", "İlk ve Orta Çağlarda Türk Dünyası", "İslam Medeniyetinin Doğuşu", "İlk Türk İslam Devletleri", "Selçuklu Türkiyesi", "Beylikten Devlete Osmanlı", "Dünya Gücü Osmanlı", "Değişim Çağında Avrupa ve Osmanlı", "XX. Yüzyıl Başlarında Osmanlı ve Dünya", "Milli Mücadele", "Atatürkçülük ve Türk İnkılabı"],
    "tyt-cog": ["Doğa ve İnsan", "Dünya'nın Şekli ve Hareketleri", "Coğrafi Konum", "Harita Bilgisi", "Atmosfer ve İklim", "İç ve Dış Kuvvetler", "Su, Toprak ve Bitki", "Nüfus ve Göç", "Yerleşme", "Türkiye'nin Yer Şekilleri", "Ekonomik Faaliyetler", "Bölgeler", "Ulaşım Hatları", "Çevre ve Toplum", "Doğal Afetler"],
    "tyt-fel": ["Felsefeyi Tanıma", "Bilgi Felsefesi", "Varlık Felsefesi", "Ahlak Felsefesi", "Sanat Felsefesi", "Din Felsefesi", "Siyaset Felsefesi", "Bilim Felsefesi", "İlk Çağ Felsefesi", "MS 2. Yüzyıldan 15. Yüzyıla Felsefe"],
    "tyt-din": ["Bilgi ve İnanç", "İslam ve İbadet", "Gençlik ve Değerler", "Allah İnsan İlişkisi", "Hz. Muhammed ve Gençlik", "Din ve Toplumsal Hayat", "Ahlaki Tutum ve Davranışlar", "İslam Düşüncesinde Yorumlar"],

    "ayt-mat": ["Fonksiyonlar", "Polinomlar", "İkinci Dereceden Denklemler", "Eşitsizlikler", "Parabol", "Permütasyon, Kombinasyon, Olasılık", "Trigonometri", "Logaritma", "Diziler", "Limit ve Süreklilik", "Türev", "İntegral", "Analitik Geometri", "Çemberin Analitik İncelemesi", "Dönüşüm Geometrisi", "Katı Cisimler"],
    "ayt-fiz": ["Vektörler", "Bağıl Hareket", "Newton'un Hareket Yasaları", "Atışlar", "İş, Güç ve Enerji", "İtme ve Momentum", "Tork ve Denge", "Basit Makineler", "Elektriksel Kuvvet ve Alan", "Elektriksel Potansiyel ve Sığa", "Manyetizma ve Elektromanyetik İndükleme", "Alternatif Akım ve Transformatörler", "Çembersel Hareket", "Basit Harmonik Hareket", "Dalga Mekaniği", "Atom Fiziği ve Radyoaktivite", "Modern Fizik", "Modern Fiziğin Teknolojideki Uygulamaları"],
    "ayt-kim": ["Modern Atom Teorisi", "Gazlar", "Sıvı Çözeltiler ve Çözünürlük", "Kimyasal Tepkimelerde Enerji", "Kimyasal Tepkimelerde Hız", "Kimyasal Tepkimelerde Denge", "Asit Baz Dengesi", "Çözünürlük Dengesi", "Kimya ve Elektrik", "Karbon Kimyasına Giriş", "Organik Bileşikler", "Enerji Kaynakları ve Bilimsel Gelişmeler"],
    "ayt-bio": ["Sinir Sistemi", "Endokrin Sistem", "Duyu Organları", "Destek ve Hareket Sistemi", "Sindirim Sistemi", "Dolaşım ve Bağışıklık Sistemi", "Solunum Sistemi", "Boşaltım Sistemi", "Üreme Sistemi ve Embriyonik Gelişim", "Komünite ve Popülasyon Ekolojisi", "Nükleik Asitler ve Genetik Şifre", "Protein Sentezi", "Fotosentez ve Kemosentez", "Hücresel Solunum", "Bitki Biyolojisi", "Canlılar ve Çevre"],
    "ayt-edb": ["Anlam Bilgisi", "Dil Bilgisi", "Şiir Bilgisi", "Edebi Sanatlar", "Metin Türleri", "İslamiyet Öncesi Türk Edebiyatı", "Geçiş Dönemi Türk Edebiyatı", "Halk Edebiyatı", "Divan Edebiyatı", "Tanzimat Edebiyatı", "Servet-i Fünun Edebiyatı", "Fecr-i Ati Edebiyatı", "Milli Edebiyat", "Cumhuriyet Dönemi Türk Edebiyatı", "Edebi Akımlar", "Dünya Edebiyatı"],
    "ayt-tar1": ["Tarih Bilimi", "İlk Çağ Uygarlıkları", "İlk Türk Devletleri", "İslam Tarihi ve Uygarlığı", "Türk İslam Devletleri", "Selçuklu Türkiyesi", "Osmanlı Kuruluş ve Yükselme", "Osmanlı Kültür ve Medeniyeti", "XX. Yüzyıl Başlarında Osmanlı", "Milli Mücadele", "Atatürk İlke ve İnkılapları"],
    "ayt-tar2": ["Değişen Dünya Dengeleri Karşısında Osmanlı", "Değişim Çağında Avrupa ve Osmanlı", "Uluslararası İlişkilerde Denge Stratejisi", "Devrimler Çağında Devlet ve Toplum", "Sermaye ve Emek", "XIX. ve XX. Yüzyılda Gündelik Hayat", "XX. Yüzyıl Başlarında Dünya", "II. Dünya Savaşı", "Soğuk Savaş Dönemi", "Yumuşama Dönemi ve Sonrası", "Küreselleşen Dünya", "Türklerde Devlet ve Toplum Yapısı"],
    "ayt-cog1": ["Ekosistem", "Nüfus Politikaları", "Türkiye'de Nüfus ve Yerleşme", "Ekonomik Faaliyetler ve Doğal Kaynaklar", "Türkiye'de Tarım ve Hayvancılık", "Madenler ve Enerji Kaynakları", "Sanayi", "Ulaşım ve Ticaret", "Turizm", "Bölgesel Kalkınma Projeleri"],
    "ayt-cog2": ["Küresel Ortam: Bölgeler ve Ülkeler", "Kültür Bölgeleri", "Jeopolitik Konum", "Ülkeler Arası Etkileşim", "Çevre ve Toplum", "Doğal Kaynakların Sürdürülebilir Kullanımı", "Küresel ve Bölgesel Örgütler", "Çatışma Bölgeleri"],
    "ayt-fel": ["Mantığa Giriş", "Klasik Mantık", "Mantık ve Dil", "Sembolik Mantık", "Psikoloji Bilimini Tanıyalım", "Psikolojinin Temel Süreçleri", "Öğrenme, Bellek, Düşünme", "Ruh Sağlığının Temelleri", "Sosyolojiye Giriş", "Birey ve Toplum", "Toplumsal Yapı ve Değişme", "Toplum ve Kültür", "Toplumsal Kurumlar", "MÖ 6. Yüzyıl ile MS 2. Yüzyıl Felsefesi", "15. ve 17. Yüzyıl Felsefesi", "18. ve 19. Yüzyıl Felsefesi", "20. Yüzyıl Felsefesi"],
    "ayt-din": ["Dünya ve Ahiret", "Kur'an'a Göre Hz. Muhammed", "Kur'an'da Bazı Kavramlar", "İnançla İlgili Meseleler", "Yahudilik ve Hristiyanlık", "İslam ve Bilim", "Anadolu'da İslam", "Tasavvufi Yorumlar", "Güncel Dini Meseleler", "Hint ve Çin Dinleri"],

    "ydt-dil": ["Kelime Bilgisi", "Dil Bilgisi", "Cloze Test", "Cümle Tamamlama", "İngilizceden Türkçeye Çeviri", "Türkçeden İngilizceye Çeviri", "Paragraf", "Diyalog Tamamlama", "Yakın Anlamlı Cümle", "Anlamı Bozan Cümle"]
  }$json$;
  subject text;
begin
  for subject in select jsonb_object_keys(data) loop
    insert into public.topics (subject_id, name, sort)
    select subject, t.name, t.ord::smallint
    from jsonb_array_elements_text(data -> subject) with ordinality as t(name, ord);
  end loop;
end $$;
