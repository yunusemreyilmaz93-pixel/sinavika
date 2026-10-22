import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const G = 10
const H0 = 20
const TRACK_W = 180

export function EnergySim() {
  const [h, setH] = useState(H0)
  const [m, setM] = useState(2)
  const [friction, setFriction] = useState(false)

  const total = m * G * H0
  const ep = m * G * h
  const drop = m * G * (H0 - h)
  const lost = friction ? drop * 0.25 : 0
  const ek = drop - lost
  const speed = Math.sqrt((2 * ek) / m)
  const bar = (value: number) => (value / total) * 100
  const frac = (H0 - h) / H0
  const px = 40 + frac * TRACK_W
  const py = 14 + frac * 64

  return (
    <SimFrame
      title="Enerji dönüşümü"
      hint="Cismin yüksekliğini değiştir. Sürtünme yokken potansiyel enerji azaldıkça aynı miktar kinetik enerjiye dönüşür."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 240 100" role="img" aria-label={`${decimal.format(h)} metre yükseklikte cisim`} className="block w-full">
          <path d={`M40,14 L${40 + TRACK_W},78 L236,78`} fill="none" className="stroke-fg" strokeWidth={2} strokeLinejoin="round" />
          <line x1={30} y1={14} x2={30} y2={78} className="stroke-line-strong" strokeWidth={1} strokeDasharray="3 3" />
          <text x={27} y={48} textAnchor="end" fontSize={8} className="fill-muted">
            {H0} m
          </text>
          <circle cx={px} cy={py - 5} r={5.5} className="fill-primary" />
        </svg>
      </div>

      <div className="mt-3 space-y-2" aria-live="polite">
        {[
          { label: 'Potansiyel enerji', value: ep, cls: 'bg-accent' },
          { label: 'Kinetik enerji', value: ek, cls: 'bg-primary' },
          { label: 'Isıya dönüşen', value: lost, cls: 'bg-warning' },
        ].map((b) => (
          <div key={b.label}>
            <div className="flex items-baseline justify-between text-sm">
              <span className="font-semibold">{b.label}</span>
              <span className="tabular text-muted">{decimal.format(b.value)} J</span>
            </div>
            <div className="mt-1 h-3 overflow-hidden rounded-full bg-surface-2">
              <div className={`h-full rounded-full transition-[width] duration-200 motion-reduce:transition-none ${b.cls}`} style={{ width: `${bar(b.value)}%` }} />
            </div>
          </div>
        ))}
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Yükseklik (m)" value={h} display={decimal.format(h)} min={0} max={H0} step={1} onChange={setH} />
        <Slider label="Kütle (kg)" value={m} display={decimal.format(m)} min={1} max={5} step={1} onChange={setM} />
      </div>
      <div className="mt-3">
        <Button variant={friction ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setFriction((f) => !f)} aria-pressed={friction}>
          Sürtünme var
        </Button>
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Toplam enerji (m·g·h₀)" value={`${decimal.format(total)} J`} />
        <Stat label="Mekanik enerji (Ep + Ek)" value={`${decimal.format(ep + ek)} J`} highlight={!friction} />
        <Stat label="Hız (m/s)" value={decimal.format(speed)} />
      </div>
    </SimFrame>
  )
}
