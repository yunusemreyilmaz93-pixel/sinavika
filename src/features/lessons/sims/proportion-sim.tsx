import { useId, useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

type Mode = 'dogru' | 'ters'

const W = 300
const H = 190
const PAD = { l: 30, r: 10, t: 10, b: 24 }
const X_MAX = 12
const Y_MAX = 24

export function ProportionSim() {
  const clip = useId()
  const [mode, setMode] = useState<Mode>('dogru')
  const [k, setK] = useState(2)
  const [x, setX] = useState(4)

  const direct = mode === 'dogru'
  const y = direct ? k * x : (k * 6) / x
  const f = (v: number) => (direct ? k * v : (k * 6) / v)
  const gx = (v: number) => PAD.l + (v / X_MAX) * (W - PAD.l - PAD.r)
  const gy = (v: number) => H - PAD.b - (v / Y_MAX) * (H - PAD.t - PAD.b)
  const path = Array.from({ length: 121 }, (_, i) => {
    const v = Math.max(i / 10, 0.25)
    return `${i === 0 ? 'M' : 'L'}${gx(v)},${gy(f(v))}`
  }).join(' ')
  const rows = [1, 2, 3, 4, 6]

  return (
    <SimFrame
      title="Doğru ve ters orantı"
      hint="Doğru orantıda y/x sabittir, ters orantıda x·y sabittir. x'i değiştirip y'nin nasıl tepki verdiğine bak."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={direct ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('dogru')}>
          Doğru orantı
        </Button>
        <Button variant={!direct ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('ters')}>
          Ters orantı
        </Button>
      </div>

      <div className="mt-3 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${W} ${H}`} role="img" aria-label={direct ? 'Orijinden geçen doğru' : 'Hiperbol'} className="block w-full">
          <clipPath id={clip}>
            <rect x={PAD.l} y={PAD.t} width={W - PAD.l - PAD.r} height={H - PAD.t - PAD.b} />
          </clipPath>
          <line x1={PAD.l} y1={H - PAD.b} x2={W - PAD.r} y2={H - PAD.b} className="stroke-fg" strokeWidth={1} />
          <line x1={PAD.l} y1={PAD.t} x2={PAD.l} y2={H - PAD.b} className="stroke-fg" strokeWidth={1} />
          <g className="fill-muted" fontSize={9} textAnchor="middle">
            {[0, 4, 8, 12].map((v) => (
              <text key={v} x={gx(v)} y={H - 10}>
                {v}
              </text>
            ))}
          </g>
          <g className="fill-muted" fontSize={9} textAnchor="end">
            {[0, 8, 16, 24].map((v) => (
              <text key={v} x={PAD.l - 4} y={gy(v) + 3}>
                {v}
              </text>
            ))}
          </g>
          <g clipPath={`url(#${clip})`}>
            <path d={path} fill="none" className="stroke-primary" strokeWidth={2.2} strokeLinejoin="round" />
            <line x1={gx(x)} y1={gy(0)} x2={gx(x)} y2={gy(y)} className="stroke-warning" strokeWidth={1} strokeDasharray="3 3" />
            <line x1={gx(0)} y1={gy(y)} x2={gx(x)} y2={gy(y)} className="stroke-warning" strokeWidth={1} strokeDasharray="3 3" />
            <circle cx={gx(x)} cy={gy(y)} r={5} className="fill-warning" />
          </g>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="x" value={x} display={String(x)} min={1} max={12} step={1} onChange={setX} />
        <Slider label={direct ? 'Oran (k)' : 'Sabit çarpım için k'} value={k} display={String(k)} min={1} max={4} step={1} onChange={setK} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="y" value={decimal.format(y)} highlight />
        <Stat label={direct ? 'y / x' : 'x · y'} value={decimal.format(direct ? y / x : y * x)} />
        <Stat label="x iki katına çıkarsa y" value={decimal.format(f(x * 2))} />
      </div>

      <div className="mt-3 overflow-x-auto">
        <table className="tabular w-full text-center text-sm">
          <tbody>
            <tr className="border-b border-line">
              <th className="py-1.5 pr-3 text-left font-semibold text-muted">x</th>
              {rows.map((v) => (
                <td key={v} className="py-1.5">
                  {v}
                </td>
              ))}
            </tr>
            <tr>
              <th className="py-1.5 pr-3 text-left font-semibold text-muted">y</th>
              {rows.map((v) => (
                <td key={v} className="py-1.5 font-semibold">
                  {decimal.format(f(v))}
                </td>
              ))}
            </tr>
          </tbody>
        </table>
      </div>
    </SimFrame>
  )
}
