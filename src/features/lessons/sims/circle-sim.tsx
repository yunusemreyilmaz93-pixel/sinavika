import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const R = 10
const rad = (deg: number) => (deg * Math.PI) / 180

function at(deg: number): [number, number] {
  return [R * Math.cos(rad(deg)), -R * Math.sin(rad(deg))]
}

function angleBetween(from: [number, number], p: [number, number], q: [number, number]) {
  const a = Math.atan2(p[1] - from[1], p[0] - from[0])
  const b = Math.atan2(q[1] - from[1], q[0] - from[0])
  let diff = Math.abs(a - b)
  if (diff > Math.PI) diff = 2 * Math.PI - diff
  return (diff * 180) / Math.PI
}

export function CircleSim() {
  const [arc, setArc] = useState(100)
  const [pos, setPos] = useState(0.5)

  const A = at(90 + arc / 2)
  const B = at(90 - arc / 2)
  const start = 90 + arc / 2 + 6
  const end = 90 - arc / 2 + 360 - 6
  const P = at(start + (end - start) * pos)
  const O: [number, number] = [0, 0]
  const central = arc
  const inscribed = angleBetween(P, A, B)
  const largeArc = arc > 180 ? 1 : 0

  return (
    <SimFrame
      title="Merkez açı ve çevre açı"
      hint="P noktasını çember üzerinde gezdir. Aynı yayı gören çevre açı hiç değişmez ve merkez açının yarısıdır."
    >
      <div className="mx-auto mt-4 max-w-xs overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="-13 -13 26 26" role="img" aria-label={`Merkez açı ${decimal.format(central)} derece, çevre açı ${decimal.format(inscribed)} derece`} className="block w-full">
          <circle cx={0} cy={0} r={R} className="fill-none stroke-line-strong" strokeWidth={0.12} />
          <path d={`M${A[0]},${A[1]} A${R},${R} 0 ${largeArc} 1 ${B[0]},${B[1]}`} fill="none" className="stroke-primary" strokeWidth={0.45} strokeLinecap="round" />
          <g className="stroke-accent" strokeWidth={0.14}>
            <line x1={O[0]} y1={O[1]} x2={A[0]} y2={A[1]} />
            <line x1={O[0]} y1={O[1]} x2={B[0]} y2={B[1]} />
          </g>
          <g className="stroke-warning" strokeWidth={0.14}>
            <line x1={P[0]} y1={P[1]} x2={A[0]} y2={A[1]} />
            <line x1={P[0]} y1={P[1]} x2={B[0]} y2={B[1]} />
          </g>
          <circle cx={0} cy={0} r={0.3} className="fill-accent" />
          <circle cx={A[0]} cy={A[1]} r={0.34} className="fill-fg" />
          <circle cx={B[0]} cy={B[1]} r={0.34} className="fill-fg" />
          <circle cx={P[0]} cy={P[1]} r={0.4} className="fill-warning" />
          <g fontSize={1.3} className="fill-fg" fontWeight={700} textAnchor="middle">
            <text x={A[0] * 1.14} y={A[1] * 1.14 + 0.45}>
              A
            </text>
            <text x={B[0] * 1.14} y={B[1] * 1.14 + 0.45}>
              B
            </text>
            <text x={P[0] * 1.16} y={P[1] * 1.16 + 0.45}>
              P
            </text>
            <text x={0.2} y={1.6} className="fill-accent">
              O
            </text>
          </g>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="AB yayı" value={arc} display={`${arc}°`} min={20} max={340} step={10} onChange={setArc} />
        <Slider label="P noktasının konumu" value={pos} display={`${Math.round(pos * 100)}%`} min={0.05} max={0.95} step={0.05} onChange={setPos} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Merkez açı (AOB)" value={`${decimal.format(central)}°`} />
        <Stat label="Çevre açı (APB)" value={`${decimal.format(inscribed)}°`} highlight />
        <Stat label="Merkez / çevre" value={decimal.format(central / inscribed)} />
      </div>
    </SimFrame>
  )
}
