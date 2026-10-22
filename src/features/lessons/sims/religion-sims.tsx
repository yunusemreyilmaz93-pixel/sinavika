import { SimFrame } from './frame'
import { HZ_MUHAMMED, ISLAM_DUSUNCESI } from './religion-data'
import { Timeline } from './timeline'

export const ProphetLifeSim = () => (
  <SimFrame title="Hz. Muhammed’in hayatı" hint="Şeridi kaydır ve bir olaya dokun. Ayrıntısı altta açılır.">
    <Timeline items={HZ_MUHAMMED} label="Hz. Muhammed’in hayatındaki önemli olaylar" />
  </SimFrame>
)

export const IslamicThoughtSim = () => (
  <SimFrame title="İslam düşüncesinde önemli şahsiyetler" hint="Şeridi kaydır ve bir şahsiyete dokun. Bilgisi altta açılır.">
    <Timeline items={ISLAM_DUSUNCESI} label="Mezhep imamları, kelamcılar ve mutasavvıflar" />
  </SimFrame>
)
