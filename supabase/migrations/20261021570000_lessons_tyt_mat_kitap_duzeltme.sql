-- TYT Temel Matematik: MEB ders kitabı gösterimiyle uyum (Veri ve İstatistik)
update public.lessons l
set body = replace(
      replace(
        l.body,
        $a$$Q_3 - Q_1$ farkına **çeyrekler açıklığı** denir.$a$,
        $b$$Q_3 - Q_1$ farkına **çeyrekler açıklığı** denir. Ders kitaplarında bu değerler $Ç_1$, $Ç_2$ ve $Ç_3$ ile gösterilir.$b$),
      $a$Tüm değerler birbirine eşitse standart sapma 0'dır.$a$,
      $b$Tüm değerler birbirine eşitse standart sapma 0'dır.

**Ortalama mutlak sapma.** Her değerin ortalamadan uzaklığının (farkın mutlak değerinin) ortalamasıdır. **Örnek.** 2, 4, 4, 4, 5, 5, 7, 9 için ortalama 5 ve uzaklıklar 3, 1, 1, 1, 0, 0, 2, 4'tür. Toplamları 12 olduğundan ortalama mutlak sapma $\dfrac{12}{8} = 1{,}5$ bulunur.$b$)
from public.topics t
where t.id = l.topic_id and t.subject_id = 'tyt-mat' and t.name = 'Veri ve İstatistik'
  and position('**Ortalama mutlak sapma.**' in l.body) = 0;
