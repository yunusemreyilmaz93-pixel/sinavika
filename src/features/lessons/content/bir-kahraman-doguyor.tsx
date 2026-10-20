import { Link } from 'react-router'
import {
  CauseEffect,
  Connect,
  DataTable,
  Figure,
  Lead,
  LifeTimeline,
  Question,
  Section,
  SelfCheck,
  Tip,
  TraitTable,
  Video,
  YearScale,
} from '../blocks'
import type { LessonBodyProps, LessonOutline } from '../types'

export const outline: LessonOutline = [
  { id: 'hedefler', title: 'Bu konuda ne öğreneceksin' },
  { id: 'avrupa', title: 'Avrupa değişiyor, Osmanlı zorlanıyor' },
  { id: 'cocukluk', title: 'Çocukluk ve okul yılları' },
  { id: 'genclik', title: 'Gençlik yılları' },
  { id: 'askerlik', title: 'Askerlik hayatı' },
  { id: 'ozet', title: 'Aklında kalsın' },
  { id: 'karistirilanlar', title: 'Sık karıştırılanlar' },
  { id: 'lgs', title: 'LGS’de nasıl sorulur' },
  { id: 'kendini-dene', title: 'Kendini dene' },
]

const img = (name: string) => `/lessons/bir-kahraman-doguyor/${name}.webp`

const lifeEvents = [
  { year: 1881, label: 'Selanik’te doğdu', group: 'Çocukluk' },
  { year: 1893, label: 'Selanik Askeri Rüştiyesi', detail: 'Matematik öğretmeni Mustafa Sabri Bey “Kemal” adını verdi.', group: 'Okul yılları' },
  { year: 1896, label: 'Manastır Askeri İdadisi', detail: 'Edebiyata, tarihe ve hitabete ilgi duydu.', group: 'Okul yılları' },
  { year: 1899, label: 'İstanbul Harp Okulu', group: 'Okul yılları' },
  { year: 1902, label: 'Teğmen olarak mezun oldu', group: 'Okul yılları' },
  { year: 1905, label: 'Kurmay yüzbaşı', detail: 'Harp Akademisi’nden mezun oldu.', group: 'Görev ve cephe' },
  { year: 1906, label: 'Vatan ve Hürriyet Cemiyeti', detail: 'Şam’da arkadaşlarıyla kurdu.', group: 'Görev ve cephe' },
  { year: 1909, label: 'Hareket Ordusu', detail: '31 Mart Olayı’nı bastıran orduya bu adı verdi.', group: 'Görev ve cephe' },
  { year: 1911, label: 'Trablusgarp Savaşı', detail: 'Tobruk ve Derne’de yerel halkı örgütledi.', group: 'Görev ve cephe' },
  { year: 1912, label: 'Balkan Savaşları', detail: 'Bolayır’daki kolordunun kurmay başkanıydı.', group: 'Görev ve cephe' },
  { year: 1913, label: 'Sofya’da ataşemiliter', detail: 'Bulgaristan’ın meclisini ve toplum hayatını gözlemledi.', group: 'Görev ve cephe' },
]

export default function BirKahramanDoguyor({ role }: LessonBodyProps) {
  return (
    <div className="space-y-12">
      <Section id="hedefler" title="Bu konuda ne öğreneceksin">
        <p>
          Bu ünitede bir çocuğun nasıl bir lidere dönüştüğünü, onu şekillendiren dünyayla birlikte öğreneceksin. Konunun sonunda
          şunları yapabileceksin:
        </p>
        <ol className="grid gap-2 sm:grid-cols-2">
          {[
            'Avrupa’daki büyük değişimlerin 20. yüzyıl başında Osmanlı Devleti’ni nasıl etkilediğini açıklamak.',
            'Mustafa Kemal’in çocukluğundan ve okul yıllarından yola çıkarak kişiliğinin nasıl oluştuğunu yorumlamak.',
            'Gençliğinde düşüncelerini etkileyen kişileri ve olayları tanımak.',
            'Askerlik hayatındaki olayları, onun liderlik özellikleriyle ilişkilendirmek.',
          ].map((goal, i) => (
            <li key={goal} className="flex gap-3 rounded-2xl border border-line bg-surface p-4">
              <span className="grid size-7 shrink-0 place-items-center rounded-lg bg-primary-soft font-display text-sm font-bold text-primary-soft-fg">
                {i + 1}
              </span>
              <span className="text-[15px] leading-relaxed">{goal}</span>
            </li>
          ))}
        </ol>
        <Tip>
          Bu ünitede ezberden çok <strong>neden-sonuç ilişkisi</strong> önemli. LGS’de “Mustafa Kemal kaç yılında doğdu?” gibi
          sorulardan çok, “Bu olay onun hangi özelliğini gösterir?” gibi sorular çıkar.
        </Tip>
        <Video id="F7iM0-3PmG8" label="Konu anlatımı videosu" title="Tekte Bitir: Bir Kahraman Doğuyor" channel="Hız Yayınları Ortaokul" />
      </Section>

      <Section id="avrupa" number={1} title="Avrupa değişiyor, Osmanlı zorlanıyor">
        <p>
          Mustafa Kemal 1881’de doğduğunda Osmanlı Devleti eski gücünü kaybetmişti. Bunun en önemli sebebi, Avrupa’da birkaç yüzyıl
          içinde yaşanan büyük değişimlerdi.
        </p>
        <Lead title="Fikir alanındaki değişim.">
          Rönesans ve Reform hareketleriyle Avrupa’da insanlar kiliseye ve geleneklere bağlı kalmadan düşünmeye başladı. Aydınlanma
          Çağı’nda akıl ve bilim her şeyin ölçüsü oldu.
        </Lead>
        <Lead title="Fransız İhtilali (1789).">
          Bu ihtilal milliyetçilik, eşitlik, özgürlük ve adalet fikirlerini bütün dünyaya yaydı. Milliyetçilik, “her millet kendi
          devletini kurmalı” düşüncesidir. Bu fikir, içinde pek çok milleti barındıran Osmanlı için büyük bir tehlikeydi.
        </Lead>
        <Lead title="Sanayi İnkılabı.">
          18. yüzyılın sonunda İngiltere’de başlayan bu dönüşümle üretim el emeğinden makineye geçti. Fabrikalar çok fazla mal
          üretiyordu. Avrupa devletleri bu fabrikalar için <strong>ham madde</strong> ve ürettiklerini satacak{' '}
          <strong>pazar</strong> aramaya başladı. Bu ihtiyaç, sömürgeciliği hızlandırdı.
        </Lead>
        <CauseEffect
          items={[
            {
              cause: 'Milliyetçilik fikri',
              effect: 'Devletteki farklı milletler bağımsızlık için ayaklandı. Sırplar 1804’te isyan etti, Yunanistan 1830’da bağımsız oldu.',
            },
            {
              cause: 'Sanayi İnkılabı',
              effect:
                'Ucuz Avrupa malları Osmanlı pazarını doldurdu, yerli üreticiler zarar gördü. Devlet borçlandı, 1881’de borçları yönetmek için Duyun-u Umumiye kuruldu.',
            },
            {
              cause: 'Aydınlanma ve özgürlük fikirleri',
              effect: 'Osmanlı aydınları anayasa ve meclis istedi. 1876’da Kanun-i Esasi ilan edildi, I. Meşrutiyet başladı.',
            },
          ]}
        />
        <Lead title="Osmanlı ne yaptı?">
          Devleti kurtarmak için yenilikler yapıldı: Tanzimat Fermanı (1839), Islahat Fermanı (1856), I. Meşrutiyet (1876) ve II.
          Meşrutiyet (1908). Aydınlar da devleti kurtarmak için farklı fikirler ileri sürdü: Osmanlıcılık,
          İslamcılık, Türkçülük ve Batıcılık. Ama 20. yüzyılın başında Osmanlı hâlâ toprak kaybediyor, ekonomisi dışa bağlı kalıyordu.
        </Lead>
        <YearScale
          title="Osmanlı’nın yenilik adımları"
          from={1839}
          to={1908}
          events={[
            { year: 1839, label: 'Tanzimat Fermanı' },
            { year: 1856, label: 'Islahat Fermanı' },
            { year: 1876, label: 'I. Meşrutiyet' },
            { year: 1908, label: 'II. Meşrutiyet' },
          ]}
        />
        <Connect>
          Mustafa Kemal, devletin yıkılmak üzere olduğu bu dönemde büyüdü. İleride yaptığı inkılapların çoğu, bu dönemin sorunlarına
          verilmiş cevaplardır.
        </Connect>
      </Section>

      <Section id="cocukluk" number={2} title="Selanik’te bir çocuk: Çocukluk ve okul yılları">
        <Figure
          side
          aspect="aspect-[3/4]"
          src={img('selanik-ev')}
          alt="Selanik’te Mustafa Kemal’in doğduğu üç katlı pembe ev"
          caption="Mustafa Kemal’in doğduğu ev, Selanik. Bugün müze olarak ziyaret ediliyor."
          credit="Fotoğraf: CeeGee, Wikimedia Commons, CC BY-SA 4.0"
        />
        <p>
          Mustafa, 1881’de Selanik’te doğdu. Babası Ali Rıza Efendi önce gümrük memuruydu, sonra kereste ticaretiyle uğraştı. Annesi
          Zübeyde Hanım’dı. Kardeşlerinden yalnızca Makbule yaşadı.
        </p>
        <Figure
          aspect="aspect-[900/382]"
          src={img('aile')}
          alt="Makbule Hanım, Zübeyde Hanım ve Mustafa Kemal’in portreleri yan yana"
          caption="Soldan sağa: Kız kardeşi Makbule, annesi Zübeyde Hanım ve Mustafa Kemal."
          credit="Wikimedia Commons, CC0"
        />
        <Lead title="Selanik neden önemli?">
          Selanik, Osmanlı’nın Avrupa’daki en gelişmiş şehirlerinden biriydi. Limanı ve demiryolu sayesinde Avrupa ile bağlantısı
          güçlüydü. Farklı dinlerden ve milletlerden insanlar bir arada yaşıyordu. Avrupa’daki yeni fikirler buraya çok çabuk
          ulaşıyordu. Mustafa, dünyaya açık bir şehirde büyüdü.
        </Lead>
        <Lead title="İlk karar: Hangi okul?">
          Annesi onun mahalle mektebinde okumasını istiyordu. Babası ise yeni yöntemlerle eğitim veren Şemsi Efendi Okulu’nu tercih
          ediyordu. Mustafa önce Hafız Mehmet Efendi’nin mahalle mektebine başladı, kısa süre sonra Şemsi Efendi Okulu’na geçti.
          Babasının bu tercihi, ailenin yeniliğe açık olduğunu gösterir.
        </Lead>
        <Lead title="Erken gelen sorumluluk.">
          Babası öldüğünde Mustafa yedi yaşındaydı. Bir süre dayısının Rapla Çiftliği’nde yaşadı, burada çalışarak büyüdü. Okula
          dönmek için Selanik’e geldi ve Selanik Mülkiye Rüştiyesi’ne başladı. Burada bir öğretmeninden haksız yere dayak yiyince
          okulu bıraktı.
        </Lead>
        <Lead title="Kendi yolunu seçmek.">
          Komşularının oğlunun askeri öğrenci kıyafetine özeniyordu. Annesi istemese de 1893’te sınava girdi ve Selanik Askeri
          Rüştiyesi’ni kazandı. Matematik öğretmeni Mustafa Sabri Bey, onun başarısını görünce adına <strong>“Kemal”</strong> adını
          ekledi. Bu ad “olgunluk, mükemmellik” anlamına gelir.
        </Lead>
        <Figure
          aspect="aspect-[748/410]"
          src={img('harp-okulu')}
          alt="Harp Okulu öğrencileri üniformalarıyla toplu fotoğrafta"
          caption="İstanbul Harp Okulu’nda arkadaşlarıyla, yaklaşık 1902. Mustafa Kemal ön sırada, soldan ikinci oturan. Bilinen en eski fotoğrafıdır."
          credit="Askeri Müze arşivi, renklendirilmiş. Wikimedia Commons, kamu malı"
        />
        <DataTable
          head={['Okul', 'Yıl', 'Onun hakkında ne söyler?']}
          rows={[
            ['Şemsi Efendi Okulu', '1880’ler', 'Ailesi yeni eğitim yöntemlerine açıktı.'],
            ['Selanik Askeri Rüştiyesi', '1893', 'Kendi kararını verdi, matematikte çok başarılıydı.'],
            ['Manastır Askeri İdadisi', '1896', 'Edebiyata, tarihe ve hitabete ilgi duydu.'],
            ['İstanbul Harp Okulu', '1899', '1902’de teğmen olarak mezun oldu.'],
            ['Harp Akademisi', '1902-1905', '1905’te kurmay yüzbaşı rütbesiyle mezun oldu.'],
          ]}
        />
        <Connect>
          Erken yaşta babasını kaybetmesi onu sorumluluk sahibi yaptı. Askeri okulu kendi seçmesi, kararlı ve bağımsız bir kişiliği
          olduğunu gösterir. LGS’de bu tür olaylar, “Mustafa Kemal’in hangi özelliğini gösterir?” diye sorulur.
        </Connect>
      </Section>

      <Section id="genclik" number={3} title="Fikirler nasıl oluştu: Gençlik yılları">
        <p>Mustafa Kemal’in düşünce dünyası, okuduğu kitaplardan, öğretmenlerinden ve gördüğü olaylardan beslendi.</p>
        <div className="grid gap-3 sm:grid-cols-3">
          {[
            { title: 'Öğretmenler', text: 'Ömer Naci ile edebiyat ve hitabet, Mehmet Tevfik Bey ile tarih merakı.' },
            { title: 'Yazarlar', text: 'Namık Kemal, Tevfik Fikret, Ziya Gökalp, Voltaire, Montesquieu, Rousseau.' },
            { title: 'Olaylar', text: 'Balkan milletlerinin örgütlenmesi, yönetimi eleştiren okul gazetesi.' },
          ].map((card) => (
            <div key={card.title} className="rounded-2xl border border-line bg-surface p-4">
              <p className="font-display font-bold text-primary">{card.title}</p>
              <p className="mt-1 text-[15px] leading-relaxed">{card.text}</p>
            </div>
          ))}
        </div>
        <Lead title="Manastır’daki öğretmenleri.">
          Manastır Askeri İdadisi’nde arkadaşı Ömer Naci ile edebiyata ve güzel konuşmaya (hitabet) ilgi duydu. Tarih öğretmeni
          Mehmet Tevfik Bey, onun tarihe olan merakını artırdı. Bu ilgi, ileride etkili konuşmalar yapan bir lider olmasında pay
          sahibidir.
        </Lead>
        <Lead title="Okuduğu yazarlar.">
          Namık Kemal’in vatan ve hürriyet şiirlerini severek okudu. Tevfik Fikret’in ve Ziya Gökalp’in eserlerinden etkilendi.
          Fransızca öğrenerek Voltaire, Montesquieu ve Rousseau gibi Aydınlanma düşünürlerini okudu. Bu yazarların ortak noktası vatan
          sevgisi, özgürlük ve aklın önemiydi.
        </Lead>
        <Lead title="Gözlemlediği olaylar.">
          Manastır’da Balkan milletlerinin bağımsızlık için nasıl örgütlendiğini yakından gördü. Milliyetçilik fikrinin bir devleti
          nasıl parçalayabileceğini burada anladı. Harp Okulu’nda arkadaşlarıyla yönetimin hatalarını eleştiren bir gazete çıkardı.
        </Lead>
        <Lead title="İlk örgüt.">
          Okuldan sonra fikirleri yüzünden bir süre tutuklandı ve Şam’a görevlendirildi. 1906’da burada arkadaşlarıyla{' '}
          <strong>Vatan ve Hürriyet Cemiyeti</strong>’ni kurdu. Amacı, vatanı kurtarmak ve meşrutiyet yönetimini getirmekti.
        </Lead>
        <Connect>
          Okuduğu yazarlardaki vatan, özgürlük ve akıl fikirleri ileride Cumhuriyet’in, milli egemenliğin ve laikliğin temelini
          oluşturacaktır.
        </Connect>
      </Section>

      <Section id="askerlik" number={4} title="Cephede bir subay: Askerlik hayatı">
        <p>Mustafa Kemal’in liderlik özellikleri, ilk görevlerinde ve savaşlarda ortaya çıktı.</p>
        <Lead title="Ordu ve siyaset.">
          1909’da İstanbul’da 31 Mart Olayı çıktı. Meşrutiyete karşı çıkan bu ayaklanmayı bastırmak için Selanik’ten bir ordu yola
          çıktı. Mustafa Kemal bu ordunun kurmay başkanıydı ve orduya <strong>Hareket Ordusu</strong> adını verdi. Aynı yıllarda
          askerlerin siyasetten uzak durması gerektiğini savundu. Bu fikir, Cumhuriyet döneminde de önemsediği bir ilke oldu.
        </Lead>
        <Lead title="Trablusgarp Savaşı (1911).">
          İtalya, Osmanlı’ya ait Trablusgarp’a (bugünkü Libya) saldırdı. Osmanlı’nın buraya kara ve deniz yoluyla asker göndermesi çok
          zordu. Mustafa Kemal, gazeteci kimliğiyle Mısır üzerinden gizlice bölgeye geçti. <strong>Tobruk</strong> ve{' '}
          <strong>Derne</strong>’de yerel halkı örgütleyerek İtalyanlara karşı başarılı savaştı. Ancak Balkan Savaşları başlayınca
          Osmanlı, 1912’de Uşi Antlaşması ile Trablusgarp’ı İtalya’ya bırakmak zorunda kaldı.
        </Lead>
        <Figure
          aspect="aspect-[760/550]"
          src={img('derne-1912')}
          alt="Mustafa Kemal çölde çadırın önünde, yanında yerel savaşçılar"
          caption="Kurmay Binbaşı Mustafa Kemal (solda), Derne’de yerel savaşçıların önünde emirlerini yazdırıyor, 1912."
          credit="Anıtkabir arşivi. Wikimedia Commons, kamu malı"
        />
        <Lead title="Balkan Savaşları (1912-1913).">
          Balkan devletleri birleşerek Osmanlı’ya saldırdı. Mustafa Kemal, Gelibolu Yarımadası’nda Bolayır’daki kolordunun kurmay
          başkanıydı. Bu savaşlarda Osmanlı Balkanlar’daki topraklarının büyük bölümünü kaybetti. Mustafa Kemal’in doğduğu şehir
          Selanik de elden çıktı. II. Balkan Savaşı’nda Edirne geri alındı.
        </Lead>
        <Lead title="Sofya’da ataşemiliter (1913).">
          Savaştan sonra Sofya’ya askeri ataşe olarak gönderildi. Burada Bulgaristan’ın meclisini, demokratik kurumlarını ve toplum
          hayatını yakından gözlemledi. Bu gözlemler, ileride kuracağı yeni devlete dair fikirlerini zenginleştirdi.
        </Lead>
        <TraitTable
          rows={[
            { event: 'Hareket Ordusu adını vermesi', traits: ['Öncülük', 'Sorumluluk alma'] },
            { event: 'Ordunun siyasete karışmamasını savunması', traits: ['İleri görüşlülük', 'İlkeli olma'] },
            { event: 'Trablusgarp’a gizlice gitmesi', traits: ['Vatanseverlik', 'Cesaret', 'Fedakârlık'] },
            { event: 'Yerel halkı örgütlemesi', traits: ['Teşkilatçılık', 'Liderlik'] },
            { event: 'Sofya’daki gözlemleri', traits: ['Yeniliğe açıklık', 'Çok yönlülük'] },
          ]}
        />
        <Connect>
          Trablusgarp’ta yerel halkı örgütleme deneyimi, Milli Mücadele’de halkı örgütlerken çok işine yarayacaktır. Bu konu bir
          sonraki ünitenin temelidir.
        </Connect>
      </Section>

      <Section id="ozet" title="Aklında kalsın">
        <LifeTimeline
          from={1881}
          to={1913}
          eras={[
            { label: 'Çocukluk', from: 1881, to: 1893 },
            { label: 'Okul yılları', from: 1893, to: 1905 },
            { label: 'Görev ve cephe', from: 1905, to: 1913 },
          ]}
          events={lifeEvents}
        />
        <p>
          On iki yıl okulda, sonraki yedi yılın çoğu cephede geçti. Askerlik hayatındaki olaylar birbirine çok yakın: 1909 ile 1913
          arasında dört büyük olay var.
        </p>
        <ul className="space-y-2">
          {[
            <>
              Avrupa’dan gelen iki büyük etki: <strong>Milliyetçilik</strong> (Fransız İhtilali) devleti içeriden böldü,{' '}
              <strong>Sanayi İnkılabı</strong> ekonomiyi dışa bağladı.
            </>,
            <>
              <strong>Kemal</strong> adını Selanik Askeri Rüştiyesi’nde matematik öğretmeni Mustafa Sabri Bey verdi.
            </>,
            <>
              Edebiyat ve hitabet ilgisi <strong>Manastır</strong>’da, Ömer Naci ile başladı.
            </>,
            <>
              <strong>Vatan ve Hürriyet Cemiyeti:</strong> 1906, Şam.
            </>,
            <>
              <strong>Hareket Ordusu</strong> adını Mustafa Kemal verdi (31 Mart Olayı, 1909).
            </>,
            <>
              <strong>Trablusgarp:</strong> Tobruk ve Derne. <strong>Balkan Savaşları:</strong> Bolayır. <strong>1913:</strong> Sofya
              ataşemiliterliği.
            </>,
          ].map((item, i) => (
            <li key={i} className="flex gap-3">
              <span className="mt-2.5 size-1.5 shrink-0 rounded-full bg-primary" />
              <span>{item}</span>
            </li>
          ))}
        </ul>
        <Video id="ZGT93gr3IX4" label="Tekrar videosu" title="5 dakikada Bir Kahraman Doğuyor" channel="Tonguç 8. Sınıf" />
      </Section>

      <Section id="karistirilanlar" title="Sık karıştırılanlar">
        <DataTable
          head={['Karıştırılan', 'Doğrusu']}
          rows={[
            [
              'Mülkiye Rüştiyesi ile Askeri Rüştiye',
              'Önce sivil okul olan Mülkiye Rüştiyesi’ne gitti, bıraktı. “Kemal” adını Askeri Rüştiye’de aldı.',
            ],
            ['Tobruk ve Derne ile Bolayır', 'Tobruk ve Derne Trablusgarp’ta, Bolayır Balkan Savaşları’nda.'],
            ['I. Meşrutiyet ile II. Meşrutiyet', 'I. Meşrutiyet 1876, II. Meşrutiyet 1908. 31 Mart Olayı II. Meşrutiyet’e karşıydı.'],
            [
              'Tanzimat Fermanı ile Islahat Fermanı',
              'Tanzimat 1839, Islahat 1856. İkisi de eşitlik ve haklarla ilgilidir, ama Islahat gayrimüslimlere daha fazla hak tanıdı.',
            ],
          ]}
        />
      </Section>

      <Section id="lgs" title="LGS’de nasıl sorulur">
        <p>
          LGS’deki İnkılap Tarihi soruları çoğu zaman bir metin, tablo ya da görselle başlar. Senden ezber bilgi değil, verilen
          bilgiden doğru sonucu çıkarman istenir.
        </p>
        <Question
          number={1}
          passage="19. yüzyılın sonunda Selanik limanına her gün farklı ülkelerden gemiler yanaşıyordu. Şehrin sokaklarında Türkçe, Rumca, Bulgarca ve Ladino konuşuluyordu. Avrupa’da çıkan gazeteler birkaç gün içinde şehre ulaşıyordu."
          stem={
            <>
              Bu bilgilere göre Mustafa Kemal’in çocukluğunu geçirdiği şehirle ilgili aşağıdakilerden hangisine{' '}
              <strong>ulaşılabilir</strong>?
            </>
          }
          options={[
            'Selanik, yeni fikirlerin kolayca yayıldığı bir şehirdir.',
            'Selanik’te yalnızca tek bir millet yaşamıştır.',
            'Selanik, Osmanlı Devleti’nin başkentidir.',
            'Selanik’te askeri okul bulunmamaktadır.',
          ]}
          answer={0}
          solution={
            <ol className="list-decimal space-y-1.5 pl-5">
              <li>Soru köküne bak: Soruda “ulaşılabilir” deniyor. Yani doğru cevabın dayanağı metinde olmalı.</li>
              <li>B seçeneği metinle çelişiyor, çünkü dört farklı dil konuşuluyor.</li>
              <li>C ve D seçenekleri hakkında metinde hiçbir bilgi yok. Doğru olsalar bile bu metinden çıkarılamazlar.</li>
              <li>A seçeneği metne dayanıyor: Liman, farklı milletler ve hızla gelen Avrupa gazeteleri, fikirlerin kolayca yayıldığını gösterir.</li>
            </ol>
          }
        />
        <Question
          number={2}
          passage="Mustafa Kemal, Trablusgarp’a gitmek için gazeteci kimliğiyle Mısır üzerinden gizlice yolculuk etti. Bölgede yerel halkı örgütleyerek İtalyanlara karşı savaştı." // copy-ok
          stem={
            <>
              Bu bilgiler Mustafa Kemal’in aşağıdaki özelliklerinden hangisiyle <strong>ilişkilendirilemez</strong>?
            </>
          }
          options={['Vatanseverlik', 'Teşkilatçılık', 'Cesaret', 'Sanatseverlik']}
          answer={3}
          solution={
            <p>
              Gizlice ve tehlikeli bir yolculuğa çıkması cesaretini, vatanı için savaşmaya gitmesi vatanseverliğini, halkı örgütlemesi {/* copy-ok */}
              teşkilatçılığını gösterir. Metinde sanatla ilgili hiçbir bilgi yok. Mustafa Kemal sanatsever biriydi, ama bu metin bunu
              göstermez.
            </p>
          }
        />
        <Tip>
          <strong>İpucu:</strong> “İlişkilendirilemez” ya da “ulaşılamaz” diyen sorularda, doğru bir bilgi bile metinde dayanağı
          yoksa cevap olabilir.
        </Tip>
      </Section>

      <Section id="kendini-dene" title="Kendini dene">
        <p>
          Cevaplara bakmadan önce her soruyu kendi cümlelerinle cevaplamaya çalış. Hatırlamaya zorlamak, tekrar okumaktan daha kalıcı
          öğretir.
        </p>
        <SelfCheck
          items={[
            {
              question: 'Fransız İhtilali’nin yaydığı milliyetçilik fikri, Osmanlı Devleti’ni neden diğer devletlerden daha çok etkiledi?',
              answer: 'Osmanlı içinde çok sayıda farklı millet yaşıyordu. Her millet kendi devletini kurmak isteyince devlet içeriden parçalandı.',
            },
            {
              question: 'Sanayi İnkılabı ile Avrupa devletlerinin sömürgeciliğe yönelmesi arasında nasıl bir bağ vardır?',
              answer: 'Fabrikalar ham maddeye ve ürünlerini satacak pazara ihtiyaç duydu. Avrupa devletleri bu ihtiyacı karşılamak için sömürge aradı.',
            },
            {
              question: 'Mustafa Kemal’in Selanik’te büyümesi, onun düşüncelerini nasıl etkilemiş olabilir?',
              answer:
                'Farklı milletlerin bir arada yaşadığı, Avrupa’daki fikirlerin hızla ulaştığı bir şehirde büyüdü. Bu, onu yeni fikirlere açık biri yaptı.',
            },
            {
              question: 'Mustafa Kemal’e “Kemal” adını kim, hangi okulda verdi?',
              answer: 'Matematik öğretmeni Mustafa Sabri Bey, Selanik Askeri Rüştiyesi’nde.',
            },
            {
              question: 'Trablusgarp’ta kazandığı hangi deneyim, Milli Mücadele’de işine yaradı?',
              answer: 'Yerel halkı örgütleyip düzenli bir orduya karşı savaştırma deneyimi.',
            },
          ]}
        />
        <p className="text-[15px] text-muted">
          Yanlış yaptığın soruları{' '}
          {role === 'student' ? (
            <Link to="/app/yanlislar" className="font-semibold text-accent hover:underline">
              yanlış soru defterine
            </Link>
          ) : (
            'yanlış soru defterine'
          )}{' '}
          ekleyebilirsin. Birkaç gün sonra tekrar karşına çıkar.
        </p>
      </Section>
    </div>
  )
}
