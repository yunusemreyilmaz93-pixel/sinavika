-- TYT Din Kültürü: yönetici notları doğrulama sonucuna göre güncellendi

update public.lesson_notes n
set body = $n$Program: Bilgi kaynakları, İslam'da ilim ve bilgi, din, inanç ve iman kavramları, iman esasları, akıl ve vahiy ilişkisi, Kur'an'ın indirilmesi. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 9. sınıf Din Kültürü ders kitabının 2. ünitesiyle karşılaştırıldı (2026 baskısı). İman, tasdik, ikrar, amel, mümin, taklidî ve tahkikî iman, iman esaslarının özellikleri, ahiret hayatının aşamaları, kader ve kaza tanımı, mucize, hatemülenbiya, imanın bireye ve topluma kazandırdıkları kitaba göre eklendi. Din kavramının klasik ve disiplinlere göre tanımları 11. sınıf kitabından alındı.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Bilgi kaynakları (duyu, akıl, doğru haber, vahiy, ilham) ve Kur'an'ın 23 yılda inmesi güncel 9. sınıf kitabında bu başlıkla geçmez, klasik kapsam için tutuldu. Melek ve kitap isimleri ders kitabıyla ayrıca teyit edilmeli.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'Bilgi ve İnanç';

update public.lesson_notes n
set body = $n$Program: İbadet kavramı ve türleri, İslam'ın şartları, namaz, oruç, zekât, hac, umre, dua, zikir, tövbe, kurban, ibadetin faydaları. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 9. sınıf kitabının 3. ünitesiyle karşılaştırıldı. İbadetin genel ve özel anlamı, teklif ve mükellef, ibadetin beş temel ilkesi (Kur'an ve sünnete uygunluk, niyet, ihlas, süreklilik, itidal), farz, vacip, sünnet, mendup ve nafile ayrımı, yapılışa göre sınıflama, namazın altı hazırlık şartı ve altı kılınış şartı, teyemmüm, takva, tevazu, ihsan ve tefekkür kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Zekât oranının kırkta bir olması, nisap ve zekât alanlar ile hac ve umre ayrıntıları 9. sınıf kitabında sayı olarak geçmez, standart ilmihal bilgisi olarak tutuldu. Namaz rekât sayıları (17 farz) kitapta ayrıca verilmez.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'İslam ve İbadet';

update public.lesson_notes n
set body = $n$Program: Gençlik dönemi gelişim özellikleri, gençlerin sorunları, değer kavramı ve türleri, Kur'an'da genç örnekleri (Ashab-ı Kehf, Hz. Yusuf, Hz. İbrahim, Hz. İsmail), İslam'da gençliğin değeri. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 9. ve 11. sınıf kitaplarındaki genç sahabeler bölümüyle karşılaştırıldı. Beş şeyi beş şeyden önce değerlendir hadisi (Hâkim), Hz. Peygamber'in gençlere verdiği değer, mükellef ve teklif kavramları kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Konu güncel kitaplarda ayrı bir ünite olarak yer almaz (10. sınıf kitabı yayımlanmadığı için doğrulanamadı). Gençlik dönemi gelişimi, akran baskısı ve bağımlılık içerikleri ile Ashab-ı Kehf, Hz. Yusuf ve Hz. İbrahim örnekleri kitapla doğrulanamadı, genel bilgi olarak tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'Gençlik ve Değerler';

update public.lesson_notes n
set body = $n$Program: Tevhid ve şirk, Allah'ın isim ve sıfatları, insanın yaratılış amacı ve sorumluluğu, halifelik, imtihan, kader ve özgür irade, dua, şükür, sabır, tevekkül, tövbe, ihlas, takva. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 9. sınıf kitabının 1. ünitesiyle karşılaştırıldı. Fıtrat, tefekkür, hidayet, Hâdî ismi, marifet, vahiy ve peygamberlere duyulan ihtiyaç, mükellef, dört alanda sorumluluk (kendine, aileye, topluma, Allah'a), ibadet, hamt, dua ve tövbe kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Zâtî ve sübûtî sıfatlar, 99 isim, kader ile cüz'î irade ve havf-reca kitapta bu ünitede ayrıntılı geçmez, klasik kelam bilgisi olarak tutuldu. Kader konusu 11. sınıf kitabının 1. ünitesinde (Kader, İrade ve Sorumluluk) ayrıca işlenir, metinle karşılaştırılmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'Allah İnsan İlişkisi';

update public.lesson_notes n
set body = $n$Program: Hz. Muhammed'in doğumu, çocukluğu ve gençliği, el-Emin unvanı, Hilfü'l-Fudul, Hacerülesved olayı, evlilik, ilk vahiy, genç sahabiler (Hz. Ali, Mus'ab b. Umeyr, Üsame b. Zeyd, Muaz b. Cebel, Zeyd b. Sabit), Peygamber'in gençlere öğütleri. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 9. sınıf kitabının 5. ünitesiyle karşılaştırıldı. Cahiliye ortamı, beşerî ve peygamberlik yönü, tebliğ, tebyin, teşri, temsil, hatemülenbiya, Muhammedülemin, üsveihasene, sünnet ve hadis tanımı, Ehlibeyt, Suffe, Malik b. Huveyris, Zeyd b. Sabit, Musab b. Umeyr, Muaz b. Cebel ve Üsame b. Zeyd bilgileri kitaba göre.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Doğum yılı (570), çocukluk, Hilfü'l-Fudul, Hacerülesved, Hatice ile evlilik ve hicret tarihleri siyer bilgisidir, güncel 9. sınıf kitabında yoktur (10. sınıf kitabı yayımlanmadığı için doğrulanamadı).$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'Hz. Muhammed ve Gençlik';

update public.lesson_notes n
set body = $n$Program: Dinin bireysel ve toplumsal işlevleri, yardımlaşma ve dayanışma (zekât, sadaka, vakıf), hoşgörü ve barış, Medine Vesikası, din ve kültür, din istismarı, laiklik. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 11. sınıf kitabının 2. ve 4. üniteleriyle karşılaştırıldı. Din tanımı, din, felsefe ve bilim ilişkisi, İslam medeniyetinin eğitim kurumları, tercüme faaliyetlerinin dönemi ve din istismarı tanımı kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Medine Vesikası, vakıf uygulamaları, millet sistemi, Mimar Sinan, laiklik ve Veda Hutbesi alıntısı kitapla doğrulanamadı, genel bilgi olarak tutuldu. Sanat ve din ilişkisi (11. sınıf 2.3) ve yeni dinî hareketler metne alınmadı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'Din ve Toplumsal Hayat';

update public.lesson_notes n
set body = $n$Program: Ahlak kavramı, güzel ahlak (doğruluk, emanet, adalet, merhamet, sabır, tevazu, cömertlik), kötü ahlak (yalan, gıybet, iftira, hased, kibir, israf), kul hakkı, toplumsal ahlak ilkeleri, dijital ortamda ahlaki tutum. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 9. sınıf kitabının 4. ünitesiyle karşılaştırıldı. Ahlakın kaynağı, akıl, irade, vicdan ve nefis, terbiye, İslam ahlakının amacı, adalet, şecaat, iffet ve hikmet, dürüstlük, yardımseverlik, sabır, adab-ı muaşeret ve Ahilik kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Dijital ortamda ahlaki tutum ve kötü ahlaki davranışlar (gıybet, hased vb.) bölümleri kitapta bu ünitede ayrıntılı geçmez, genel ahlak bilgisi olarak tutuldu.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'Ahlaki Tutum ve Davranışlar';

update public.lesson_notes n
set body = $n$Program: Mezhep ve yorum çeşitliliği, itikadî mezhepler (Maturidîlik, Eş'arîlik, Mutezile, Şia), amelî mezhepler (Hanefî, Mâlikî, Şâfiî, Hanbelî), edille-i şer'iyye, tasavvuf, Türk-İslam dünyasında tarikatlar ve mutasavvıflar. Kazanım kodlarını MEB Din Kültürü ve Ahlak Bilgisi programından doğrulayın.
Kazanım: Din Kültürü ve Ahlak Bilgisi öğretim programı MEB sitesinde bulunamadı, kazanım kodu eşleştirmesi yapılmadı.
Doğrulama: 12. sınıf kitabının 2. ve 3. üniteleriyle karşılaştırıldı. Türklerin Müslüman oluşu, ribat, fütüvvet ve Ahilik, Ebu Hanife, Cafer Sadık, Şafii, Eşari, Matüridi, Ahmed Yesevi, Mevlana, Ahi Evran, Hacı Bektaş Veli, Yunus Emre, Sarı Saltuk ve Hacı Bayram Veli bilgileri ve yılları, tasavvufi düşüncenin üç dönemi, edep ve insanıkâmil ile altı tarikat özeti kitaba göre eklendi.
Kaynak: Metin ve sorular özgündür, ders kitabı metni kopyalanmadı. Dinî ifadeler genel Sünni ders kitabı anlatımına uygun yazılmıştır.
Açık nokta: Mutezile, Hariciler, Şia kolları, Mâlikî ve Hanbelî imamları ve edille-i şer'iyye kitapta bu ünitelerde geçmez, klasik kapsam için tutuldu. Alevilik-Bektaşilik erkânı (cem, musahiplik, on iki hizmet) kitapta ayrıntılı anlatılır, metinde yalnızca başlıkları verildi, ayrıntı için kitaba bakılmalı.$n$, updated_at = now()
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-din' and t.name = 'İslam Düşüncesinde Yorumlar';
