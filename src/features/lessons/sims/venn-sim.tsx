import { useState } from 'react'
import { SimFrame, Slider, Stat } from './frame'

const UNIVERSE = 50

export function VennSim() {
  const [a, setA] = useState(18)
  const [b, setB] = useState(14)
  const [both, setBoth] = useState(6)

  const common = Math.min(both, a, b)
  const union = a + b - common
  const onlyA = a - common
  const onlyB = b - common
  const outside = UNIVERSE - union

  return (
    <SimFrame
      title="İki kümenin birleşimi"
      hint="Küme eleman sayılarını ve kesişimi değiştir. Kesişimdeki elemanlar toplamda iki kez sayılmaz."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 240 150" role="img" aria-label={`Yalnız A ${onlyA}, kesişim ${common}, yalnız B ${onlyB}, dışarıda ${outside} eleman`} className="block w-full">
          <rect x={4} y={4} width={232} height={142} rx={8} className="fill-none stroke-line-strong" strokeWidth={1.5} />
          <text x={12} y={20} fontSize={10} className="fill-muted">
            E ({UNIVERSE})
          </text>
          <circle cx={92} cy={80} r={52} className="fill-primary" fillOpacity={0.22} stroke="none" />
          <circle cx={148} cy={80} r={52} className="fill-accent" fillOpacity={0.22} stroke="none" />
          <circle cx={92} cy={80} r={52} className="fill-none stroke-primary" strokeWidth={2} />
          <circle cx={148} cy={80} r={52} className="fill-none stroke-accent" strokeWidth={2} />
          <g textAnchor="middle" className="fill-fg" fontWeight={700}>
            <text x={66} y={85} fontSize={16}>
              {onlyA}
            </text>
            <text x={120} y={85} fontSize={16}>
              {common}
            </text>
            <text x={174} y={85} fontSize={16}>
              {onlyB}
            </text>
            <text x={214} y={136} fontSize={14}>
              {outside}
            </text>
          </g>
          <g textAnchor="middle" fontSize={11} fontWeight={700}>
            <text x={42} y={44} className="fill-primary">
              A
            </text>
            <text x={198} y={44} className="fill-accent">
              B
            </text>
          </g>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="s(A)" value={a} display={String(a)} min={0} max={25} step={1} onChange={setA} />
        <Slider label="s(B)" value={b} display={String(b)} min={0} max={25} step={1} onChange={setB} />
        <Slider label="s(A ∩ B)" value={common} display={String(common)} min={0} max={Math.min(a, b)} step={1} onChange={setBoth} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label={`s(A ∪ B) = ${a} + ${b} - ${common}`} value={String(union)} highlight />
        <Stat label="Hiçbirinde olmayan" value={String(outside)} />
      </div>
    </SimFrame>
  )
}
