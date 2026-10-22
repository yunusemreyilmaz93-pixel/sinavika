import { SimFrame } from './frame'
import { ILK_CAG, ORTA_CAG } from './philosophy-data'
import { Timeline } from './timeline'

const hint = 'Şeridi kaydır ve bir düşünüre dokun. Görüşü altta açılır.'

export const AncientPhilosophySim = () => (
  <SimFrame title="İlk Çağ filozofları" hint={hint}>
    <Timeline items={ILK_CAG} label="İlk Çağ filozofları" />
  </SimFrame>
)

export const MedievalPhilosophySim = () => (
  <SimFrame title="Orta Çağ düşünürleri" hint={hint}>
    <Timeline items={ORTA_CAG} label="MS 2. yüzyıldan 15. yüzyıla düşünürler" />
  </SimFrame>
)
