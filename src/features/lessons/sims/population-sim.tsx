import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame } from './frame'

const POINTS = [
  { year: 1804, billion: 1, forecast: false },
  { year: 1927, billion: 2, forecast: false },
  { year: 1960, billion: 3, forecast: false },
  { year: 1974, billion: 4, forecast: false },
  { year: 1987, billion: 5, forecast: false },
  { year: 1998, billion: 6, forecast: false },
  { year: 2010, billion: 7, forecast: false },
  { year: 2022, billion: 8, forecast: false },
  { year: 2037, billion: 9, forecast: true },
  { year: 2058, billion: 10, forecast: true },
]

export function PopulationSim() {
  const [mode, setMode] = useState<'population' | 'years'>('years')
  const [index, setIndex] = useState(6)

  const rows = POINTS.map((p, i) => ({ ...p, gap: i === 0 ? 0 : p.year - POINTS[i - 1].year }))
  const max = mode === 'years' ? 123 : 10
  const value = (r: (typeof rows)[number]) => (mode === 'years' ? r.gap : r.billion)
  const current = rows[index]

  return (
    <SimFrame
      title="Dünya nüfusu kaç yılda arttı"
      hint="Her bir milyarlık artışın kaç yılda gerçekleştiğine bak. Bir çubuğa dokunarak ayrıntısını gör."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={mode === 'years' ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('years')}>
          Bir milyar artış süresi
        </Button>
        <Button variant={mode === 'population' ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('population')}>
          Nüfus (milyar)
        </Button>
      </div>

      <ul className="mt-3 space-y-1.5" aria-label="Dünya nüfusunun milyar basamakları">
        {rows.slice(mode === 'years' ? 1 : 0).map((r) => {
          const i = rows.indexOf(r)
          return (
            <li key={r.year}>
              <button
                type="button"
                onClick={() => setIndex(i)}
                aria-pressed={index === i}
                className={`flex min-h-11 w-full items-center gap-2 rounded-lg px-2 text-left ${index === i ? 'bg-primary-soft' : 'hover:bg-surface-2'}`}
              >
                <span className="tabular w-12 shrink-0 text-sm font-semibold">{r.year}</span>
                <span className="h-4 flex-1 overflow-hidden rounded bg-surface-2">
                  <span
                    className={`block h-full rounded transition-[width] duration-200 motion-reduce:transition-none ${r.forecast ? 'bg-accent/50' : 'bg-accent'}`}
                    style={{ width: `${(value(r) / max) * 100}%` }}
                  />
                </span>
                <span className="tabular w-16 shrink-0 text-right text-sm">{mode === 'years' ? `${r.gap} yıl` : `${r.billion} milyar`}</span>
              </button>
            </li>
          )
        })}
      </ul>

      <p className="mt-3 rounded-xl bg-surface-2 p-3 text-sm" aria-live="polite">
        {current.year} yılında dünya nüfusu {current.billion} milyara {current.forecast ? 'ulaşacağı tahmin ediliyor' : 'ulaştı'}.
        {current.gap > 0 && ` Bir önceki milyardan bu yana ${current.gap} yıl geçti.`}
      </p>
      <p className="mt-1 text-xs text-muted">Kaynak: Birleşmiş Milletler Nüfus Dairesi (2022). 2037 ve 2058 tahminidir, soluk renkle gösterilir.</p>
    </SimFrame>
  )
}
