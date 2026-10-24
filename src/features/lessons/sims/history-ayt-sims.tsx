import { SimFrame } from './frame'
import { DENGE, DEVRIMLER, DUNYA_SAVASI_1, DUNYA_SAVASI_2, ILK_CAG, ILK_TURK, ISLAM_TARIHI, KURESEL, SOGUK_SAVAS, TURK_ISLAM } from './history-ayt-data'
import type { HistoryEvent } from './history-data'
import { Timeline } from './timeline'

const hint = 'Şeridi kaydır ve bir olaya dokun. Tarihi ve ne olduğu altta açılır.'

function Strip({ title, label, items }: { title: string; label: string; items: HistoryEvent[] }) {
  return (
    <SimFrame title={title} hint={hint}>
      <Timeline items={items} label={label} />
    </SimFrame>
  )
}

export const AncientSim = () => <Strip title="İlk Çağ uygarlıkları" label="İlk Çağ olayları" items={ILK_CAG} />
export const EarlyTurksSim = () => <Strip title="İlk Türk devletleri" label="İlk Türk devletleri olayları" items={ILK_TURK} />
export const IslamHistorySim = () => <Strip title="İslam tarihi: Hz. Muhammed’den Abbasilere" label="İslam tarihi olayları" items={ISLAM_TARIHI} />
export const TurkIslamSim = () => <Strip title="Türk İslam devletleri" label="Türk İslam devletleri olayları" items={TURK_ISLAM} />
export const RevolutionsSim = () => <Strip title="Devlet ve toplum düzeninde değişim" label="Tanzimat ve Meşrutiyet olayları" items={DEVRIMLER} />
export const BalanceSim = () => <Strip title="Denge stratejisi, 1774 ile 1914" label="Osmanlı dış politikası olayları" items={DENGE} />
export const WorldWar1Sim = () => <Strip title="XX. yüzyıl başlarında dünya" label="1904 ile 1919 arası olaylar" items={DUNYA_SAVASI_1} />
export const WorldWar2Sim = () => <Strip title="II. Dünya Savaşı" label="II. Dünya Savaşı olayları" items={DUNYA_SAVASI_2} />
export const ColdWarSim = () => <Strip title="Soğuk Savaş dönemi" label="Soğuk Savaş olayları" items={SOGUK_SAVAS} />
export const GlobalSim = () => <Strip title="Küreselleşen dünya" label="1989’dan sonraki olaylar" items={KURESEL} />
