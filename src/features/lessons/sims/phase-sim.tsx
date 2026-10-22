import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const C_ICE = 2.1
const C_WATER = 4.186
const L_FUSION = 334
const L_VAPOR = 2260
const T_START = -20

const W = 300
const H = 170
const PAD = { l: 34, r: 10, t: 10, b: 24 }

export function PhaseSim() {
  const [mass, setMass] = useState(1)
  const [fraction, setFraction] = useState(0.2)

  const q1 = mass * C_ICE * -T_START
  const q2 = q1 + mass * L_FUSION
  const q3 = q2 + mass * C_WATER * 100
  const q4 = q3 + mass * L_VAPOR
  const q = fraction * q4

  let temp: number
  let state: string
  if (q <= q1) {
    temp = T_START + q / (mass * C_ICE)
    state = 'Katı (buz)'
  } else if (q <= q2) {
    temp = 0
    state = `Erime, ${Math.round(((q - q1) / (q2 - q1)) * 100)}% sıvı`
  } else if (q <= q3) {
    temp = (q - q2) / (mass * C_WATER)
    state = 'Sıvı (su)'
  } else {
    temp = 100
    state = q >= q4 ? 'Tamamı gaz (buhar)' : `Kaynama, ${Math.round(((q - q3) / (q4 - q3)) * 100)}% gaz`
  }

  const gx = (value: number) => PAD.l + (value / q4) * (W - PAD.l - PAD.r)
  const gy = (value: number) => H - PAD.b - ((value - T_START) / (100 - T_START)) * (H - PAD.t - PAD.b)
  const corners: [number, number][] = [
    [0, T_START],
    [q1, 0],
    [q2, 0],
    [q3, 100],
    [q4, 100],
  ]
  const reached = [corners[0], ...corners.slice(1).filter(([v]) => v <= q), [q, temp] as [number, number]]
  const done = reached.map(([v, t], i) => `${i === 0 ? 'M' : 'L'}${gx(v)},${gy(t)}`).join(' ')
  const path = `M${gx(0)},${gy(T_START)} L${gx(q1)},${gy(0)} L${gx(q2)},${gy(0)} L${gx(q3)},${gy(100)} L${gx(q4)},${gy(100)}`

  return (
    <SimFrame
      title="Hal değişimi grafiği"
      hint="Buza verilen ısıyı artır. Erime ve kaynama sırasında ısı verilmesine rağmen sıcaklığın sabit kaldığını gör."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${W} ${H}`} role="img" aria-label="Isı sıcaklık grafiği" className="block w-full">
          <line x1={PAD.l} y1={gy(0)} x2={W - PAD.r} y2={gy(0)} className="stroke-line-strong" strokeWidth={0.8} strokeDasharray="3 3" />
          <line x1={PAD.l} y1={H - PAD.b} x2={W - PAD.r} y2={H - PAD.b} className="stroke-fg" strokeWidth={1} />
          <line x1={PAD.l} y1={PAD.t} x2={PAD.l} y2={H - PAD.b} className="stroke-fg" strokeWidth={1} />
          <g className="fill-muted" fontSize={9} textAnchor="end">
            {[-20, 0, 50, 100].map((v) => (
              <text key={v} x={PAD.l - 4} y={gy(v) + 3}>
                {v}
              </text>
            ))}
          </g>
          <text x={W - PAD.r} y={H - 8} textAnchor="end" fontSize={9} className="fill-muted">
            Verilen ısı (kJ)
          </text>
          <text x={PAD.l + 4} y={PAD.t + 8} fontSize={9} className="fill-muted">
            °C
          </text>
          <path d={path} fill="none" className="stroke-line-strong" strokeWidth={2} strokeLinejoin="round" />
          <path d={done} fill="none" className="stroke-primary" strokeWidth={2.6} strokeLinejoin="round" />
          <circle cx={gx(q)} cy={gy(temp)} r={5} className="fill-warning" />
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Verilen ısı" value={fraction} display={`${decimal.format(q)} kJ`} min={0} max={1} step={0.005} onChange={setFraction} />
        <Slider label="Kütle (kg)" value={mass} display={decimal.format(mass)} min={0.5} max={2} step={0.5} onChange={setMass} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label="Sıcaklık" value={`${decimal.format(temp)} °C`} highlight />
        <Stat label="Hâl" value={state} />
      </div>
      <p className="mt-3 text-sm text-muted">
        Buzun öz ısısı 2,1 kJ/kg°C, suyun öz ısısı 4,186 kJ/kg°C, erime ısısı 334 kJ/kg, buharlaşma ısısı 2260 kJ/kg alındı.
      </p>
    </SimFrame>
  )
}
