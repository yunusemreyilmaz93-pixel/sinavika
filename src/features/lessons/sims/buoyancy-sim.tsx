import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const LIQUIDS = [
  { name: 'Yağ', density: 0.8 },
  { name: 'Su', density: 1 },
  { name: 'Tuzlu su', density: 1.2 },
]
const VOLUME = 100
const G = 10

export function BuoyancySim() {
  const [liquid, setLiquid] = useState(1)
  const [density, setDensity] = useState(0.6)

  const dl = LIQUIDS[liquid].density
  const floats = density <= dl
  const submerged = floats ? density / dl : 1
  const weight = (density * VOLUME * G) / 1000
  const buoyancy = (dl * VOLUME * submerged * G) / 1000
  const state = density === dl ? 'Askıda kalır' : floats ? 'Yüzer' : 'Batar'

  const level = 36
  const top = 8
  const bottom = 92
  const cube = 28
  const sink = submerged * cube
  const cubeTop = floats ? level - (cube - sink) : bottom - cube

  return (
    <SimFrame
      title="Kaldırma kuvveti"
      hint="Cismin ve sıvının özkütlesini değiştir. Cisim, kendi ağırlığına eşit kaldırma kuvveti oluşana kadar batar."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {LIQUIDS.map((l, i) => (
          <Button key={l.name} variant={liquid === i ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setLiquid(i)}>
            {l.name} ({decimal.format(l.density)})
          </Button>
        ))}
      </div>

      <div className="mx-auto mt-3 max-w-xs overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 120 100" role="img" aria-label={`${state}. Cismin özkütlesi ${decimal.format(density)}, sıvının özkütlesi ${decimal.format(dl)}`} className="block w-full">
          <rect x={20} y={level} width={80} height={bottom - level} className="fill-accent" fillOpacity={0.25} />
          <path d={`M20,${top} V${bottom} H100 V${top}`} fill="none" className="stroke-fg" strokeWidth={2} strokeLinejoin="round" />
          <line x1={20} y1={level} x2={100} y2={level} className="stroke-accent" strokeWidth={1} strokeDasharray="3 3" />
          <rect x={46} y={cubeTop} width={cube} height={cube} rx={2} className="fill-warning" fillOpacity={0.85} />
          <g stroke="currentColor" strokeWidth={1.6} className="text-fg">
            <line x1={60} y1={cubeTop + cube / 2} x2={60} y2={cubeTop + cube / 2 + 16} />
            <polygon points={`60,${cubeTop + cube / 2 + 20} 56,${cubeTop + cube / 2 + 14} 64,${cubeTop + cube / 2 + 14}`} fill="currentColor" />
          </g>
          <g stroke="currentColor" strokeWidth={1.6} className="text-primary">
            <line x1={60} y1={cubeTop + cube / 2} x2={60} y2={cubeTop + cube / 2 - 16} />
            <polygon points={`60,${cubeTop + cube / 2 - 20} 56,${cubeTop + cube / 2 - 14} 64,${cubeTop + cube / 2 - 14}`} fill="currentColor" />
          </g>
        </svg>
      </div>

      <div className="mt-3">
        <Slider label="Cismin özkütlesi (g/cm³)" value={density} display={decimal.format(density)} min={0.2} max={2.4} step={0.2} onChange={setDensity} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Ağırlık (100 cm³ cisim)" value={`${decimal.format(weight)} N`} />
        <Stat label="Kaldırma kuvveti" value={`${decimal.format(buoyancy)} N`} highlight={floats} />
        <Stat label="Durum" value={`${state}, batan hacim %${Math.round(submerged * 100)}`} />
      </div>
    </SimFrame>
  )
}
