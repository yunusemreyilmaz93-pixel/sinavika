import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

type Mode = 'karsi' | 'ayni'

const HOURS = 6
const W = 300
const H = 170
const PAD = { l: 34, r: 10, t: 10, b: 24 }

export function MotionSim() {
  const [mode, setMode] = useState<Mode>('karsi')
  const [d, setD] = useState(240)
  const [v1, setV1] = useState(60)
  const [v2, setV2] = useState(40)
  const [t, setT] = useState(1)

  const opposite = mode === 'karsi'
  const p1 = (time: number) => v1 * time
  const p2 = (time: number) => (opposite ? d - v2 * time : d + v2 * time)

  const gap = opposite ? v1 + v2 : v1 - v2
  const meet = gap > 0 ? d / gap : null
  const meetPoint = meet === null ? null : p1(meet)

  const values = [0, d, p1(HOURS), p2(HOURS)]
  const lo = Math.min(...values)
  const hi = Math.max(...values)
  const gx = (time: number) => PAD.l + (time / HOURS) * (W - PAD.l - PAD.r)
  const gy = (pos: number) => H - PAD.b - ((pos - lo) / (hi - lo)) * (H - PAD.t - PAD.b)
  const road = (pos: number) => 4 + ((pos - lo) / (hi - lo)) * 92

  const line = (f: (time: number) => number) => `M${gx(0)},${gy(f(0))} L${gx(HOURS)},${gy(f(HOURS))}`
  const ticks = [0, 1, 2, 3, 4, 5, 6]
  const met = meet !== null && t >= meet

  return (
    <SimFrame
      title="İki aracın hareketi"
      hint="Yol, hız ve zamanı değiştir. Çizgilerin kesiştiği nokta araçların karşılaştığı andır."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={opposite ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('karsi')}>
          Birbirine doğru
        </Button>
        <Button variant={!opposite ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('ayni')}>
          Aynı yönde
        </Button>
      </div>

      <div className="relative mt-5 h-14" role="img" aria-label={`${decimal.format(t)}. saatte birinci araç ${decimal.format(p1(t))}, ikinci araç ${decimal.format(p2(t))} km konumunda`}>
        <div className="absolute inset-x-0 top-7 h-1.5 rounded-full bg-surface-2" />
        {[
          { pos: p1(t), cls: 'bg-primary', label: '1' },
          { pos: p2(t), cls: 'bg-accent', label: '2' },
        ].map((c) => (
          <div key={c.label} className="absolute top-0 -translate-x-1/2" style={{ left: `${road(c.pos)}%` }}>
            <div className={`mx-auto grid size-6 place-items-center rounded-full text-xs font-bold text-white ${c.cls}`}>{c.label}</div>
            <div className="mx-auto h-4 w-0.5 bg-fg/40" />
          </div>
        ))}
      </div>

      <div className="mt-2 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`0 0 ${W} ${H}`} role="img" aria-label="Yol zaman grafiği" className="block w-full">
          <g className="stroke-line" strokeWidth={0.6}>
            {ticks.map((h) => (
              <line key={h} x1={gx(h)} y1={PAD.t} x2={gx(h)} y2={H - PAD.b} />
            ))}
          </g>
          <line x1={PAD.l} y1={H - PAD.b} x2={W - PAD.r} y2={H - PAD.b} className="stroke-fg" strokeWidth={1} />
          <line x1={PAD.l} y1={PAD.t} x2={PAD.l} y2={H - PAD.b} className="stroke-fg" strokeWidth={1} />
          <g className="fill-muted" fontSize={9} textAnchor="middle">
            {ticks.map((h) => (
              <text key={h} x={gx(h)} y={H - 10}>
                {h}
              </text>
            ))}
            <text x={W - PAD.r} y={H - 1} textAnchor="end">
              saat
            </text>
          </g>
          <g className="fill-muted" fontSize={9} textAnchor="end">
            <text x={PAD.l - 4} y={gy(lo) + 3}>
              {decimal.format(lo)}
            </text>
            <text x={PAD.l - 4} y={gy(hi) + 3}>
              {decimal.format(hi)}
            </text>
          </g>
          <path d={line(p1)} fill="none" className="stroke-primary" strokeWidth={2.2} strokeLinecap="round" />
          <path d={line(p2)} fill="none" className="stroke-accent" strokeWidth={2.2} strokeLinecap="round" />
          <line x1={gx(t)} y1={PAD.t} x2={gx(t)} y2={H - PAD.b} className="stroke-warning" strokeWidth={1.2} strokeDasharray="3 3" />
          <circle cx={gx(t)} cy={gy(p1(t))} r={4} className="fill-primary" />
          <circle cx={gx(t)} cy={gy(p2(t))} r={4} className="fill-accent" />
          {meet !== null && meet <= HOURS && <circle cx={gx(meet)} cy={gy(meetPoint ?? 0)} r={5} className="fill-warning stroke-surface" strokeWidth={1.5} />}
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Başlangıçtaki uzaklık (km)" value={d} display={decimal.format(d)} min={60} max={360} step={20} onChange={setD} />
        <Slider label="Zaman (saat)" value={t} display={decimal.format(t)} min={0} max={HOURS} step={0.25} onChange={setT} />
        <Slider label="1. aracın hızı (km/sa)" value={v1} display={decimal.format(v1)} min={20} max={100} step={5} onChange={setV1} />
        <Slider label="2. aracın hızı (km/sa)" value={v2} display={decimal.format(v2)} min={20} max={100} step={5} onChange={setV2} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label={opposite ? 'Hızlar toplamı' : 'Hızlar farkı'} value={`${decimal.format(Math.abs(gap))} km/sa`} />
        <Stat label="Karşılaşma süresi (yol / hız)" value={meet === null ? 'Yetişemez' : `${decimal.format(meet)} saat`} highlight={met} />
        <Stat label="Karşılaşma noktası" value={meetPoint === null ? '-' : `1. araçtan ${decimal.format(meetPoint)} km`} />
      </div>
    </SimFrame>
  )
}
