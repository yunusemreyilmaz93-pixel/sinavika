import { useState } from 'react'
import { SimFrame, Slider, Stat } from './frame'

const K = 9e9
const sci = new Intl.NumberFormat('tr-TR', { maximumSignificantDigits: 3 })

export function CoulombSim() {
  const [q1, setQ1] = useState(2)
  const [q2, setQ2] = useState(-3)
  const [d, setD] = useState(30)

  const force = (K * Math.abs(q1) * Math.abs(q2) * 1e-12) / (d / 100) ** 2
  const repel = q1 * q2 > 0
  const gap = 40 + (d - 10) * 3.2
  const left = 120 - gap / 2
  const right = 120 + gap / 2
  const arrow = Math.min(34, 8 + force * 4)

  return (
    <SimFrame
      title="Coulomb kuvveti"
      hint="Yüklerin işaretini ve büyüklüğünü, aralarındaki uzaklığı değiştir. Uzaklık iki katına çıkınca kuvvetin dörtte birine indiğini gör."
    >
      <div className="mx-auto mt-4 max-w-md overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 240 90" role="img" aria-label={repel ? 'Yükler birbirini itiyor' : 'Yükler birbirini çekiyor'} className="block w-full">
          <line x1={4} y1={45} x2={236} y2={45} className="stroke-line" strokeWidth={1} />
          {[
            { cx: left, q: q1, dir: repel ? -1 : 1 },
            { cx: right, q: q2, dir: repel ? 1 : -1 },
          ].map((c, i) => (
            <g key={i}>
              <circle cx={c.cx} cy={45} r={11} className={c.q > 0 ? 'fill-danger' : 'fill-accent'} />
              <text x={c.cx} y={49} textAnchor="middle" fontSize={11} fontWeight={700} className="fill-white">
                {c.q > 0 ? '+' : '-'}
              </text>
              <text x={c.cx} y={76} textAnchor="middle" fontSize={9} className="fill-fg">
                {Math.abs(c.q)} µC
              </text>
              <line
                x1={c.cx + c.dir * 14}
                y1={45}
                x2={c.cx + c.dir * (14 + arrow)}
                y2={45}
                className="stroke-warning"
                strokeWidth={2.6}
                strokeLinecap="round"
              />
              <polygon
                points={`${c.cx + c.dir * (14 + arrow + 5)},45 ${c.cx + c.dir * (14 + arrow - 1)},41 ${c.cx + c.dir * (14 + arrow - 1)},49`}
                className="fill-warning"
              />
            </g>
          ))}
          <text x={120} y={22} textAnchor="middle" fontSize={9} className="fill-muted">
            d = {d} cm
          </text>
          <line x1={left} y1={28} x2={right} y2={28} className="stroke-muted" strokeWidth={0.8} />
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="1. yük (µC)" value={q1} display={`${q1 > 0 ? '+' : ''}${q1}`} min={-5} max={5} step={1} onChange={(v) => setQ1(v === 0 ? 1 : v)} />
        <Slider label="2. yük (µC)" value={q2} display={`${q2 > 0 ? '+' : ''}${q2}`} min={-5} max={5} step={1} onChange={(v) => setQ2(v === 0 ? 1 : v)} />
        <Slider label="Uzaklık (cm)" value={d} display={String(d)} min={10} max={60} step={5} onChange={setD} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="F = k·q₁·q₂ / d²" value={`${sci.format(force)} N`} highlight />
        <Stat label="Etkileşim" value={repel ? 'İtme' : 'Çekme'} />
        <Stat label="Uzaklık 2 katına çıksa" value={`${sci.format(force / 4)} N`} />
      </div>
    </SimFrame>
  )
}
