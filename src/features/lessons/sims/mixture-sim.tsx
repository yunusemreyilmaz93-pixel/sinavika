import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const CAP = 12

function Beaker({ x, volume, percent, label }: { x: number; volume: number; percent: number; label: string }) {
  const h = (volume / CAP) * 56
  return (
    <g>
      <rect x={x} y={14} width={44} height={56} rx={4} className="fill-surface-2" />
      <rect x={x} y={70 - h} width={44} height={h} rx={4} className="fill-accent" fillOpacity={0.12 + (percent / 100) * 0.88} />
      <rect x={x} y={14} width={44} height={56} rx={4} className="fill-none stroke-line-strong" strokeWidth={1.5} />
      <text x={x + 22} y={9} textAnchor="middle" fontSize={9} className="fill-fg" fontWeight={700}>
        {label}
      </text>
      <text x={x + 22} y={83} textAnchor="middle" fontSize={9} className="fill-muted">
        {decimal.format(volume)} L
      </text>
      <text x={x + 22} y={93} textAnchor="middle" fontSize={9} className="fill-fg" fontWeight={700}>
        %{decimal.format(percent)}
      </text>
    </g>
  )
}

export function MixtureSim() {
  const [v1, setV1] = useState(4)
  const [p1, setP1] = useState(20)
  const [v2, setV2] = useState(6)
  const [p2, setP2] = useState(50)

  const total = v1 + v2
  const pure = (v1 * p1 + v2 * p2) / 100
  const result = (pure / total) * 100

  return (
    <SimFrame
      title="Karışım problemi"
      hint="İki çözeltinin miktarını ve yoğunluğunu değiştir. Karışımın yoğunluğu her zaman ikisinin arasında kalır."
    >
      <div className="mx-auto mt-3 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 220 100" role="img" aria-label={`Karışım: ${decimal.format(total)} litre, yüzde ${decimal.format(result)}`} className="block w-full">
          <Beaker x={8} volume={v1} percent={p1} label="1. çözelti" />
          <Beaker x={88} volume={v2} percent={p2} label="2. çözelti" />
          <text x={74} y={46} textAnchor="middle" fontSize={16} className="fill-muted">
            +
          </text>
          <text x={156} y={46} textAnchor="middle" fontSize={16} className="fill-muted">
            =
          </text>
          <Beaker x={168} volume={Math.min(total, CAP)} percent={result} label="Karışım" />
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="1. çözelti miktarı (L)" value={v1} display={decimal.format(v1)} min={1} max={6} step={1} onChange={setV1} />
        <Slider label="1. çözelti yoğunluğu (%)" value={p1} display={decimal.format(p1)} min={0} max={100} step={5} onChange={setP1} />
        <Slider label="2. çözelti miktarı (L)" value={v2} display={decimal.format(v2)} min={1} max={6} step={1} onChange={setV2} />
        <Slider label="2. çözelti yoğunluğu (%)" value={p2} display={decimal.format(p2)} min={0} max={100} step={5} onChange={setP2} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Toplam miktar" value={`${decimal.format(total)} L`} />
        <Stat label="Saf madde" value={`${decimal.format(pure)} L`} />
        <Stat label="Karışımın yoğunluğu" value={`%${decimal.format(result)}`} highlight />
      </div>
      <p className="tabular mt-3 text-sm text-muted">
        ({decimal.format(v1)} × {decimal.format(p1)} + {decimal.format(v2)} × {decimal.format(p2)}) / {decimal.format(total)} = {decimal.format(result)}
      </p>
    </SimFrame>
  )
}
