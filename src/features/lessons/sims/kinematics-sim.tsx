import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const W = 300
const H = 170
const PAD = { l: 36, r: 10, t: 10, b: 24 }
const T_MAX = 10

export function KinematicsSim() {
  const [v0, setV0] = useState(5)
  const [a, setA] = useState(2)
  const [t, setT] = useState(4)

  const v = (time: number) => v0 + a * time
  const x = v0 * t + 0.5 * a * t * t
  const end = v(T_MAX)
  const hi = Math.max(v0, end, 1)
  const lo = Math.min(v0, end, 0)
  const gx = (time: number) => PAD.l + (time / T_MAX) * (W - PAD.l - PAD.r)
  const gy = (value: number) => H - PAD.b - ((value - lo) / (hi - lo)) * (H - PAD.t - PAD.b)
  const area = `M${gx(0)},${gy(0)} L${gx(0)},${gy(v(0))} L${gx(t)},${gy(v(t))} L${gx(t)},${gy(0)} Z`
  const stop = a !== 0 && v0 / -a > 0 && v0 / -a <= T_MAX ? v0 / -a : null
  const motion = a === 0 ? 'Düzgün doğrusal hareket' : v0 === 0 && a > 0 ? 'Durgun halden hızlanma' : a * v(t) > 0 ? 'Hızlanıyor' : a * v(t) < 0 ? 'Yavaşlıyor' : 'Anlık durma'

  return (
    <SimFrame
      title="Hız-zaman grafiği ve yol"
      hint="İlk hızı, ivmeyi ve süreyi değiştir. Grafiğin eğimi ivmeyi, boyalı alan ise yer değiştirmeyi verir."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${W} ${H}`} role="img" aria-label="Hız zaman grafiği" className="block w-full">
          <g className="stroke-line" strokeWidth={0.6}>
            {[0, 2, 4, 6, 8, 10].map((s) => (
              <line key={s} x1={gx(s)} y1={PAD.t} x2={gx(s)} y2={H - PAD.b} />
            ))}
          </g>
          <path d={area} className="fill-primary" fillOpacity={0.22} />
          <line x1={PAD.l} y1={gy(0)} x2={W - PAD.r} y2={gy(0)} className="stroke-fg" strokeWidth={1} />
          <line x1={PAD.l} y1={PAD.t} x2={PAD.l} y2={H - PAD.b} className="stroke-fg" strokeWidth={1} />
          <g className="fill-muted" fontSize={9} textAnchor="middle">
            {[0, 2, 4, 6, 8, 10].map((s) => (
              <text key={s} x={gx(s)} y={H - 10}>
                {s}
              </text>
            ))}
            <text x={W - PAD.r} y={H - 1} textAnchor="end">
              s
            </text>
          </g>
          <g className="fill-muted" fontSize={9} textAnchor="end">
            <text x={PAD.l - 4} y={gy(hi) + 3}>
              {decimal.format(hi)}
            </text>
            {lo < 0 && (
              <text x={PAD.l - 4} y={gy(lo) + 3}>
                {decimal.format(lo)}
              </text>
            )}
            <text x={PAD.l - 4} y={gy(0) + 3}>
              0
            </text>
          </g>
          <line x1={gx(0)} y1={gy(v(0))} x2={gx(T_MAX)} y2={gy(end)} className="stroke-primary" strokeWidth={2.2} strokeLinecap="round" />
          <line x1={gx(t)} y1={gy(0)} x2={gx(t)} y2={gy(v(t))} className="stroke-warning" strokeWidth={1.2} strokeDasharray="3 3" />
          <circle cx={gx(t)} cy={gy(v(t))} r={4.5} className="fill-warning" />
          {stop !== null && <circle cx={gx(stop)} cy={gy(0)} r={3.5} className="fill-fg" />}
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="İlk hız (m/s)" value={v0} display={decimal.format(v0)} min={0} max={20} step={1} onChange={setV0} />
        <Slider label="İvme (m/s²)" value={a} display={decimal.format(a)} min={-4} max={4} step={0.5} onChange={setA} />
        <Slider label="Süre (s)" value={t} display={decimal.format(t)} min={0} max={T_MAX} step={0.5} onChange={setT} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label={`v = ${decimal.format(v0)} + ${decimal.format(a)} · ${decimal.format(t)}`} value={`${decimal.format(v(t))} m/s`} highlight />
        <Stat label="Yer değiştirme (alan)" value={`${decimal.format(x)} m`} />
        <Stat label="Hareket" value={motion} />
      </div>
    </SimFrame>
  )
}
