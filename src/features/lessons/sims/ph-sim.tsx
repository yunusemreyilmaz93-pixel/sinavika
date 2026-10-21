import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/cn'
import { SimFrame } from './frame'

const SUBSTANCES = [
  { name: 'Mide asidi', ph: 1 },
  { name: 'Limon suyu', ph: 3 },
  { name: 'Kahve', ph: 5 },
  { name: 'Saf su', ph: 7 },
  { name: 'Kabartma tozu çözeltisi', ph: 9 },
  { name: 'Sabunlu su', ph: 11 },
  { name: 'Çamaşır suyu', ph: 13 },
]

function Swatch({ label, tone, result }: { label: string; tone: string; result: string }) {
  return (
    <div className="rounded-xl border border-line p-2 text-center">
      <div
        className={cn(
          'mx-auto h-10 w-full rounded-lg border border-line transition-colors duration-200 motion-reduce:transition-none',
          tone,
        )}
      />
      <p className="mt-2 text-xs font-semibold">{label}</p>
      <p className="text-xs text-muted">{result}</p>
    </div>
  )
}

export function PhSim() {
  const [index, setIndex] = useState(1)
  const { name, ph } = SUBSTANCES[index]
  const acid = ph < 7
  const base = ph > 7
  const kind = acid ? 'Asit' : base ? 'Baz' : 'Nötr'

  return (
    <SimFrame title="pH ölçeği ve indikatörler" hint="Bir madde seç. pH değerine ve indikatörlerin rengine bak.">
      <div className="mt-4 flex flex-wrap gap-2">
        {SUBSTANCES.map((s, i) => (
          <Button key={s.name} variant={i === index ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setIndex(i)}>
            {s.name}
          </Button>
        ))}
      </div>

      <div className="mt-5 px-1">
        <div
          className="relative h-4 rounded-full"
          style={{ background: 'linear-gradient(to right, var(--danger), var(--warning) 35%, var(--success) 50%, var(--accent))' }}
        >
          <span
            className="absolute top-1/2 size-6 -translate-x-1/2 -translate-y-1/2 rounded-full border-4 border-surface bg-fg transition-[left] duration-200 motion-reduce:transition-none"
            style={{ left: `${(ph / 14) * 100}%` }}
            aria-hidden
          />
        </div>
        <div className="tabular mt-2 flex justify-between text-xs text-muted">
          <span>0</span>
          <span>7</span>
          <span>14</span>
        </div>
      </div>

      <p className="mt-3 text-center font-display text-xl font-bold" aria-live="polite">
        {name}: pH {ph}, {kind.toLowerCase()}
      </p>

      <div className="mt-3 grid grid-cols-3 gap-2">
        <Swatch label="Mavi turnusol" tone={acid ? 'bg-danger' : 'bg-accent'} result={acid ? 'Kırmızı olur' : 'Mavi kalır'} />
        <Swatch label="Kırmızı turnusol" tone={base ? 'bg-accent' : 'bg-danger'} result={base ? 'Mavi olur' : 'Kırmızı kalır'} />
        <Swatch label="Fenolftalein" tone={base ? 'bg-danger-soft' : 'bg-surface'} result={base ? 'Pembe olur' : 'Renksiz kalır'} />
      </div>
    </SimFrame>
  )
}
