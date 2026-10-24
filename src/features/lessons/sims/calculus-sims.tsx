import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const radians = (deg: number) => (deg * Math.PI) / 180

function quadrant(deg: number) {
  if (deg % 90 === 0) return 'Eksen üzerinde'
  return ['I. bölge', 'II. bölge', 'III. bölge', 'IV. bölge'][Math.floor(deg / 90)]
}

export function UnitCircleSim() {
  const [deg, setDeg] = useState(30)
  const c = Math.cos(radians(deg))
  const s = Math.sin(radians(deg))
  const tan = Math.abs(c) < 1e-9 ? 'Tanımsız' : decimal.format(s / c)
  const arc = Array.from({ length: Math.round(deg / 5) + 1 }, (_, i) => {
    const a = radians(Math.min(i * 5, deg))
    return `${i === 0 ? 'M' : 'L'}${0.3 * Math.cos(a)},${-0.3 * Math.sin(a)}`
  }).join(' ')

  return (
    <SimFrame title="Birim çember" hint="Açıyı değiştir. Noktanın yatay koordinatı kosinüs, dikey koordinatı sinüstür.">
      <div className="mx-auto mt-4 max-w-xs overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="-1.5 -1.5 3 3" role="img" aria-label={`${deg} derecelik açının birim çemberdeki görünümü`} className="block w-full">
          <line x1={-1.4} y1={0} x2={1.4} y2={0} className="stroke-fg" strokeWidth={0.015} />
          <line x1={0} y1={-1.4} x2={0} y2={1.4} className="stroke-fg" strokeWidth={0.015} />
          <circle cx={0} cy={0} r={1} fill="none" className="stroke-line-strong" strokeWidth={0.02} />
          <path d={arc} fill="none" className="stroke-accent" strokeWidth={0.03} />
          <line x1={0} y1={0} x2={c} y2={-s} className="stroke-primary" strokeWidth={0.03} />
          <line x1={c} y1={0} x2={c} y2={-s} className="stroke-warning" strokeWidth={0.03} strokeDasharray="0.05 0.04" />
          <line x1={0} y1={-s} x2={c} y2={-s} className="stroke-accent" strokeWidth={0.03} strokeDasharray="0.05 0.04" />
          <circle cx={c} cy={-s} r={0.05} className="fill-primary" />
          <g className="fill-muted" fontSize={0.1} textAnchor="middle">
            <text x={1.12} y={-0.04}>1</text>
            <text x={-1.12} y={-0.04}>-1</text>
            <text x={0.08} y={-1.08}>1</text>
            <text x={0.1} y={1.17}>-1</text>
          </g>
        </svg>
      </div>

      <div className="mt-3">
        <Slider label="Açı" value={deg} display={`${deg}° = ${decimal.format(deg / 180)}π radyan`} min={0} max={360} step={15} onChange={setDeg} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-4">
        <Stat label="Kosinüs (yatay)" value={decimal.format(c)} />
        <Stat label="Sinüs (dikey)" value={decimal.format(s)} highlight />
        <Stat label="Tanjant" value={tan} />
        <Stat label="Bölge" value={quadrant(deg)} />
      </div>
    </SimFrame>
  )
}

const curves = {
  kare: { label: 'x²', f: (x: number) => x * x, d: (x: number) => 2 * x },
  kup: { label: 'x³ - 3x', f: (x: number) => x ** 3 - 3 * x, d: (x: number) => 3 * x * x - 3 },
  sinus: { label: 'sin x', f: (x: number) => Math.sin(x), d: (x: number) => Math.cos(x) },
} as const

type CurveKey = keyof typeof curves

export function DerivativeSim() {
  const [key, setKey] = useState<CurveKey>('kup')
  const [x0, setX0] = useState(1.5)
  const { f, d } = curves[key]
  const y0 = f(x0)
  const m = d(x0)
  const path = Array.from({ length: 161 }, (_, i) => {
    const x = -4 + i * 0.05
    return `${i === 0 ? 'M' : 'L'}${x},${-f(x)}`
  }).join(' ')
  const tangent = (x: number) => y0 + m * (x - x0)
  const trend = Math.abs(m) < 0.05 ? 'Yatay teğet' : m > 0 ? 'Artan' : 'Azalan'

  return (
    <SimFrame title="Türev ve teğetin eğimi" hint="Noktayı kaydır. Teğetin eğimi o noktadaki türevdir. Eğim sıfır olunca fonksiyon dönüş yapar.">
      <div className="mt-3 flex flex-wrap gap-2" role="group" aria-label="Fonksiyon seç">
        {(Object.keys(curves) as CurveKey[]).map((k) => (
          <button
            key={k}
            type="button"
            onClick={() => setKey(k)}
            aria-pressed={key === k}
            className={`h-11 rounded-xl border px-4 text-sm font-semibold ${key === k ? 'border-primary bg-primary text-primary-fg' : 'border-line bg-surface'}`}
          >
            {curves[k].label}
          </button>
        ))}
      </div>

      <div className="mx-auto mt-3 max-w-md overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="-4.5 -5 9 10" role="img" aria-label={`${curves[key].label} fonksiyonunun grafiği ve teğeti`} className="block w-full">
          <clipPath id="turev-clip">
            <rect x={-4.4} y={-4.9} width={8.8} height={9.8} />
          </clipPath>
          <line x1={-4.4} y1={0} x2={4.4} y2={0} className="stroke-fg" strokeWidth={0.04} />
          <line x1={0} y1={-4.9} x2={0} y2={4.9} className="stroke-fg" strokeWidth={0.04} />
          <g clipPath="url(#turev-clip)">
            <path d={path} fill="none" className="stroke-primary" strokeWidth={0.07} strokeLinejoin="round" />
            <line x1={-5} y1={-tangent(-5)} x2={5} y2={-tangent(5)} className="stroke-accent" strokeWidth={0.05} />
            <circle cx={x0} cy={-y0} r={0.12} className="fill-warning" />
          </g>
        </svg>
      </div>

      <div className="mt-3">
        <Slider label="Nokta (x)" value={x0} display={decimal.format(x0)} min={-3} max={3} step={0.1} onChange={setX0} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="f(x)" value={decimal.format(y0)} />
        <Stat label="Teğetin eğimi f'(x)" value={decimal.format(m)} highlight />
        <Stat label="Durum" value={trend} />
      </div>
    </SimFrame>
  )
}

type Rule = 'sol' | 'sag' | 'orta'
const rules: [Rule, string][] = [
  ['sol', 'Sol uç'],
  ['sag', 'Sağ uç'],
  ['orta', 'Orta nokta'],
]

export function IntegralSim() {
  const [n, setN] = useState(6)
  const [rule, setRule] = useState<Rule>('sol')
  const a = 0
  const b = 3
  const f = (x: number) => (x * x) / 3 + 0.5
  const w = (b - a) / n
  const bars = Array.from({ length: n }, (_, i) => {
    const x = a + i * w
    const at = rule === 'sol' ? x : rule === 'sag' ? x + w : x + w / 2
    return { x, h: f(at) }
  })
  const sum = bars.reduce((s, r) => s + r.h * w, 0)
  const exact = (b ** 3 - a ** 3) / 9 + 0.5 * (b - a)
  const path = Array.from({ length: 61 }, (_, i) => {
    const x = a + (i * (b - a)) / 60
    return `${i === 0 ? 'M' : 'L'}${x},${-f(x)}`
  }).join(' ')

  return (
    <SimFrame
      title="Eğri altındaki alan"
      hint="Dikdörtgen sayısını artır. Dikdörtgenlerin alanları toplamı, integralin değerine yaklaşır."
    >
      <div className="mt-3 flex flex-wrap gap-2" role="group" aria-label="Yükseklik seçimi">
        {rules.map(([k, label]) => (
          <button
            key={k}
            type="button"
            onClick={() => setRule(k)}
            aria-pressed={rule === k}
            className={`h-11 rounded-xl border px-4 text-sm font-semibold ${rule === k ? 'border-primary bg-primary text-primary-fg' : 'border-line bg-surface'}`}
          >
            {label}
          </button>
        ))}
      </div>

      <div className="mx-auto mt-3 max-w-md overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="-0.4 -4.2 3.8 4.8" role="img" aria-label={`${n} dikdörtgenle eğri altındaki alan yaklaşımı`} className="block w-full">
          <line x1={-0.3} y1={0} x2={3.3} y2={0} className="stroke-fg" strokeWidth={0.02} />
          <line x1={0} y1={0.1} x2={0} y2={-4} className="stroke-fg" strokeWidth={0.02} />
          {bars.map((r) => (
            <rect key={r.x} x={r.x} y={-r.h} width={w} height={r.h} className="fill-primary/25 stroke-primary" strokeWidth={0.01} />
          ))}
          <path d={path} fill="none" className="stroke-accent" strokeWidth={0.04} />
        </svg>
      </div>

      <div className="mt-3">
        <Slider label="Dikdörtgen sayısı" value={n} display={String(n)} min={1} max={60} step={1} onChange={setN} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Dikdörtgenlerin toplamı" value={decimal.format(sum)} highlight />
        <Stat label="İntegralin değeri" value={decimal.format(exact)} />
        <Stat label="Fark" value={decimal.format(Math.abs(exact - sum))} />
      </div>
    </SimFrame>
  )
}
