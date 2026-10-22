import { useState } from 'react'
import { TURKIYE_ILLER, TURKIYE_VIEW, turkiyeNokta } from '../maps/turkiye'
import { SimFrame } from './frame'
import { INKILAPLAR, KURTULUS, OSMANLI_DEGISIM, OSMANLI_DUNYA, OSMANLI_KURULUS, SELCUKLU, YIRMINCI_YUZYIL, type HistoryEvent } from './history-data'
import { Timeline } from './timeline'

function Strip({ title, hint, label, items }: { title: string; hint: string; label: string; items: HistoryEvent[] }) {
  return (
    <SimFrame title={title} hint={hint}>
      <Timeline items={items} label={label} />
    </SimFrame>
  )
}

const hint = 'Şeridi kaydır ve bir olaya dokun. Tarihi ve ne olduğu altta açılır.'

export const SeljukSim = () => <Strip title="Anadolu Selçuklu Devleti’nin zaman şeridi" hint={hint} label="Anadolu Selçuklu Devleti olayları" items={SELCUKLU} />
export const OttomanRiseSim = () => <Strip title="Beylikten devlete Osmanlı" hint={hint} label="Osmanlı’nın kuruluş ve yükselme olayları" items={OSMANLI_KURULUS} />
export const OttomanPowerSim = () => <Strip title="Osmanlı’nın yükseliş dönemi" hint={hint} label="Fatih’ten II. Selim’e önemli olaylar" items={OSMANLI_DUNYA} />
export const OttomanReformSim = () => <Strip title="Duraklama, gerileme ve ıslahatlar" hint={hint} label="17. yüzyıldan 19. yüzyıla Osmanlı olayları" items={OSMANLI_DEGISIM} />
export const EarlyCenturySim = () => <Strip title="II. Meşrutiyet’ten Mondros’a" hint={hint} label="1908 ile 1918 arasındaki olaylar" items={YIRMINCI_YUZYIL} />
export const ReformsSim = () => <Strip title="Atatürk dönemi inkılapları" hint={hint} label="Cumhuriyet dönemi inkılapları" items={INKILAPLAR} />

// Ankara, İzmir gibi aynı yerde birden çok olay olduğunda işaretler üst üste biner, bu yüzden yerler gruplanır
function groupPlaces(items: HistoryEvent[]) {
  const groups = new Map<string, { place: [number, number]; ids: string[] }>()
  for (const item of items) {
    if (!item.place) continue
    const key = item.place.join(',')
    const g = groups.get(key) ?? { place: item.place, ids: [] }
    g.ids.push(item.id)
    groups.set(key, g)
  }
  return [...groups.values()]
}

export function LiberationSim() {
  const [active, setActive] = useState(KURTULUS[0].id)
  const groups = groupPlaces(KURTULUS)
  const current = KURTULUS.find((i) => i.id === active)
  const pick = (ids: string[]) => {
    const at = ids.indexOf(active)
    setActive(ids[(at + 1) % ids.length])
  }

  return (
    <SimFrame
      title="Millî Mücadele haritası"
      hint="Haritadaki noktalara ya da şeritteki olaylara dokun. Aynı yerde birden çok olay varsa nokta her dokunuşta bir sonrakine geçer."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${TURKIYE_VIEW.width} ${TURKIYE_VIEW.height}`} role="group" aria-label="Millî Mücadele olaylarının Türkiye haritasındaki yerleri" className="block w-full">
          {TURKIYE_ILLER.map((il) => (
            <path key={il.ad} d={il.d} className="fill-surface-2 stroke-surface" strokeWidth={1} strokeLinejoin="round" />
          ))}
          {groups.map((g) => {
            const [x, y] = turkiyeNokta(g.place[0], g.place[1])
            const on = g.ids.includes(active)
            return (
              <g
                key={g.ids.join()}
                role="button"
                tabIndex={0}
                aria-label={g.ids.map((id) => KURTULUS.find((i) => i.id === id)?.title).join(', ')}
                className="cursor-pointer outline-none"
                onClick={() => pick(g.ids)}
                onKeyDown={(e) => {
                  if (e.key === 'Enter' || e.key === ' ') {
                    e.preventDefault()
                    pick(g.ids)
                  }
                }}
              >
                <circle cx={x} cy={y} r={36} className="fill-transparent" />
                <circle cx={x} cy={y} r={on ? 17 : 12} className={`${on ? 'fill-danger' : 'fill-primary'} stroke-surface transition-all duration-150 motion-reduce:transition-none`} strokeWidth={3} />
              </g>
            )
          })}
          {current?.place && (
            <text
              x={Math.min(Math.max(turkiyeNokta(current.place[0], current.place[1])[0], 150), TURKIYE_VIEW.width - 150)}
              y={turkiyeNokta(current.place[0], current.place[1])[1] - 28}
              textAnchor="middle"
              className="pointer-events-none select-none fill-fg stroke-surface text-[26px] font-semibold"
              strokeWidth={6}
              paintOrder="stroke"
            >
              {current.title}
            </text>
          )}
        </svg>
      </div>
      <Timeline items={KURTULUS} label="Millî Mücadele olayları" active={active} onSelect={setActive} />
    </SimFrame>
  )
}
