-- TYT Matematik notlarını yeni biçime geçirir, Fizik Madde ve Özellikleri notuna Kimya 9 uyarısı ekler

update public.lesson_notes n
set body = replace(replace(body,
      ' Simülasyon sonradan eklenecek (mutlak değer uzaklık).', ''),
      ' Yayına almadan önce "Deneyle gör" simülasyonunun yerini görün.', '')
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-mat' and t.name in ('Mutlak Değer', 'Olasılık');

update public.lesson_notes n
set body = regexp_replace(
      regexp_replace(
        regexp_replace(n.body, ' Kazanım kodlarını MEB programından doğrulayın\.', E'\nKazanım: MEB kazanım kodu eşleştirmesi yapılmadı. Kapsam ÖSYM TYT Matematik bölümüne göre alındı.'),
        E'\nKaynak:',
        E'\nDoğrulama: 9., 10. ve 11. sınıf Matematik ders kitaplarıyla gösterim ve kapsam düzeyinde karşılaştırıldı, bulunan fark düzeltildi (Veri ve İstatistik gösterimi). Her örnek kitapla tek tek eşleştirilmedi.' || E'\nKaynak:'),
      E'\nKontrol edilecekler:', E'\nAçık nokta:')
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-mat' and n.body like '%Kontrol edilecekler:%';

update public.lesson_notes n
set body = regexp_replace(n.body, E'\nAçık nokta: .*$', E'\nAçık nokta: Adezyon, kohezyon, yüzey gerilimi ve kılcallık 9. sınıf Kimya kitabında (KİM.9.2.12 ve KİM.9.2.13) işlenir, Fizik kitaplarında yer almaz. TYT Fizik konu listesinde olduğu için burada tutuldu. Karışım örneğinde hacmin toplam olarak korunduğu varsayıldı, ilk soruda belirtildi.')
from public.topics t
where t.id = n.topic_id and t.subject_id = 'tyt-fiz' and t.name = 'Madde ve Özellikleri';
