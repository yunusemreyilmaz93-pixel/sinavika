import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

type Species = { name: string; coef: number }
type Reaction = { label: string; reactants: Species[]; products: Species[] }

const REACTIONS: Reaction[] = [
  { label: '2H₂ + O₂ → 2H₂O', reactants: [{ name: 'H₂', coef: 2 }, { name: 'O₂', coef: 1 }], products: [{ name: 'H₂O', coef: 2 }] },
  { label: 'N₂ + 3H₂ → 2NH₃', reactants: [{ name: 'N₂', coef: 1 }, { name: 'H₂', coef: 3 }], products: [{ name: 'NH₃', coef: 2 }] },
  { label: 'CH₄ + 2O₂ → CO₂ + 2H₂O', reactants: [{ name: 'CH₄', coef: 1 }, { name: 'O₂', coef: 2 }], products: [{ name: 'CO₂', coef: 1 }, { name: 'H₂O', coef: 2 }] },
]
const MAX = 10

function Bars({ rows }: { rows: { name: string; before: number; after: number }[] }) {
  return (
    <ul className="space-y-3">
      {rows.map((r) => (
        <li key={r.name}>
          <div className="flex items-baseline justify-between text-sm">
            <span className="font-semibold">{r.name}</span>
            <span className="tabular text-muted">
              {decimal.format(r.before)} mol → {decimal.format(r.after)} mol
            </span>
          </div>
          <div className="mt-1 h-3 overflow-hidden rounded-full bg-surface-2">
            <div className="h-full rounded-full bg-line-strong" style={{ width: `${Math.min(r.before / (MAX * 1.5), 1) * 100}%` }} />
          </div>
          <div className="mt-1 h-3 overflow-hidden rounded-full bg-surface-2">
            <div className="h-full rounded-full bg-primary transition-[width] duration-200 motion-reduce:transition-none" style={{ width: `${Math.min(r.after / (MAX * 1.5), 1) * 100}%` }} />
          </div>
        </li>
      ))}
    </ul>
  )
}

export function ReactionSim() {
  const [index, setIndex] = useState(1)
  const [a, setA] = useState(2)
  const [b, setB] = useState(3)

  const r = REACTIONS[index]
  const [ra, rb] = r.reactants
  const extent = Math.min(a / ra.coef, b / rb.coef)
  const limiting = a / ra.coef < b / rb.coef ? ra.name : a / ra.coef > b / rb.coef ? rb.name : 'İkisi de tükenir'
  const rows = [
    { name: ra.name, before: a, after: a - extent * ra.coef },
    { name: rb.name, before: b, after: b - extent * rb.coef },
    ...r.products.map((p) => ({ name: p.name, before: 0, after: extent * p.coef })),
  ]

  return (
    <SimFrame
      title="Sınırlayıcı bileşen"
      hint="Girenlerin mol sayısını değiştir. Önce biten madde sınırlayıcıdır ve oluşan ürün miktarını o belirler."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {REACTIONS.map((x, i) => (
          <Button key={x.label} variant={index === i ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setIndex(i)}>
            {x.label}
          </Button>
        ))}
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label={`${ra.name} (mol)`} value={a} display={decimal.format(a)} min={0.5} max={MAX} step={0.5} onChange={setA} />
        <Slider label={`${rb.name} (mol)`} value={b} display={decimal.format(b)} min={0.5} max={MAX} step={0.5} onChange={setB} />
      </div>

      <div className="mt-4">
        <p className="mb-2 text-xs text-muted">Gri çubuk başlangıcı, yeşil çubuk tepkime sonrasını gösterir.</p>
        <Bars rows={rows} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label="Sınırlayıcı bileşen" value={limiting} highlight />
        <Stat label="Artan madde" value={rows.filter((x) => x.before > 0 && x.after > 0).map((x) => `${x.name}: ${decimal.format(x.after)} mol`).join(', ') || 'Yok'} />
      </div>
    </SimFrame>
  )
}
