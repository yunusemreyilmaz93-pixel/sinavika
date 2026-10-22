import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame } from './frame'
import { Timeline, type TimelineItem } from './timeline'

type Era = 'Eski Çağ' | 'Orta Çağ' | 'Yeni Çağ' | 'Yakın Çağ'
const ERAS: Era[] = ['Eski Çağ', 'Orta Çağ', 'Yeni Çağ', 'Yakın Çağ']

const ITEMS: (TimelineItem & { era: Era })[] = [
  { era: 'Eski Çağ', id: 'eratosthenes', time: 'MÖ 276 - MÖ 194', title: 'Eratosthenes', text: 'Coğrafya sözcüğünü ilk kullanan bilim insanıdır. Dünya’nın şekli ve boyutları üzerine çalışmıştır.' },
  { era: 'Eski Çağ', id: 'strabon', time: 'MÖ 64 - MS 24', title: 'Amasyalı Strabon', text: 'Dönemin en önemli coğrafyacılarındandır. Bilinen dünyayı anlatan çalışmalar yapmıştır.' },
  { era: 'Eski Çağ', id: 'batlamyus', time: '100 - 170', title: 'Batlamyus', text: 'İskenderiyeli coğrafyacıdır. Koordinat sistemi ve yerlerin konumunun belirlenmesi üzerine çalışmıştır.' },
  { era: 'Orta Çağ', id: 'biruni', time: '973 - 1048', title: 'Biruni', text: 'Matematik ve astronomi çalışmalarıyla coğrafyaya katkı veren Müslüman bilim insanıdır.' },
  { era: 'Orta Çağ', id: 'idrisi', time: '1100 - 1166', title: 'Muhammed İdrisi', text: 'Müslüman coğrafyacıdır. Haritaları ve coğrafya eseriyle tanınır.' },
  { era: 'Orta Çağ', id: 'battuta', time: '1304 - 1369', title: 'İbni Battuta', text: 'Seyyahtır. Gezilerini anlatan eseriyle coğrafyaya katkı vermiştir.' },
  { era: 'Yeni Çağ', id: 'piri', time: '1470 - 1554', title: 'Piri Reis', text: 'Osmanlı denizcisidir. Haritalarıyla coğrafyanın gelişmesinde öncü olmuştur.' },
  { era: 'Yeni Çağ', id: 'ortelius', time: '1527 - 1598', title: 'Ortelius', text: 'Harita çalışmalarıyla tanınan coğrafyacıdır.' },
  { era: 'Yeni Çağ', id: 'katip', time: '1609 - 1657', title: 'Kâtip Çelebi', text: 'Osmanlı bilginidir. Harita ve coğrafya eserleri yazmıştır.' },
  { era: 'Yakın Çağ', id: 'humboldt', time: '1769 - 1859', title: 'Von Humboldt', text: 'Alman bilim insanıdır. Coğrafyanın yöntemlerinin oluşmasında öncü olmuştur.' },
  { era: 'Yakın Çağ', id: 'ritter', time: '1779 - 1859', title: 'Carl Ritter', text: 'Alman coğrafyacıdır. Coğrafyanın bilimsel bir disiplin olarak kurulmasına katkı vermiştir.' },
  { era: 'Yakın Çağ', id: 'blache', time: '1845 - 1918', title: 'P. V. Blache', text: 'Fransız coğrafyacıdır. Coğrafyanın bugünkü konu ve bölümlerinin oluştuğu dönemde çalışmıştır.' },
  { era: 'Yakın Çağ', id: 'sauer', time: '1889 - 1975', title: 'C. O. Sauer', text: 'Amerikalı coğrafyacıdır. Beşerî coğrafya alanındaki çalışmalarıyla tanınır.' },
  { era: 'Yakın Çağ', id: 'cumhuriyet', time: 'Cumhuriyet Dönemi', title: 'Türk coğrafyacılar', text: 'Besim Darkot, Faik Sabri Duran, Reşat İzbırak ve Sırrı Erinç Türkiye’de coğrafya bilimine önemli katkılarda bulunmuştur.' },
]

export function GeographyHistorySim() {
  const [era, setEra] = useState<Era | null>(null)
  const items = era ? ITEMS.filter((i) => i.era === era) : ITEMS

  return (
    <SimFrame
      title="Coğrafya biliminin gelişimi"
      hint="Bir çağ seç ya da şeridi kaydır. Bir bilim insanına dokunarak ne yaptığını gör."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={era === null ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setEra(null)}>
          Tümü
        </Button>
        {ERAS.map((e) => (
          <Button key={e} variant={era === e ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setEra(e)}>
            {e}
          </Button>
        ))}
      </div>
      <Timeline key={era ?? 'hepsi'} items={items} label="Coğrafya biliminin gelişimine katkı sağlayan bilim insanları" />
    </SimFrame>
  )
}
