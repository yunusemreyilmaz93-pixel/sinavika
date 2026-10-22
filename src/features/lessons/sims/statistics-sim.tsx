import { useState } from 'react'
import { Minus, Plus } from 'lucide-react'
import { SimFrame, Stat, decimal } from './frame'

const MAX = 10
const BAR_HEIGHT = 128

function median(values: number[]) {
  const sorted = values.slice().sort((a, b) => a - b)
  const mid = sorted.length >> 1
  return sorted.length % 2 ? sorted[mid] : (sorted[mid - 1] + sorted[mid]) / 2
}

function modes(values: number[]) {
  const counts = new Map<number, number>()
  for (const v of values) counts.set(v, (counts.get(v) ?? 0) + 1)
  const top = Math.max(...counts.values())
  if (top === 1) return 'Yok'
  return [...counts].filter(([, c]) => c === top).map(([v]) => v).sort((a, b) => a - b).join(', ')
}

export function StatisticsSim() {
  const [values, setValues] = useState([3, 5, 5, 7, 4, 8, 5])

  const change = (index: number, delta: number) =>
    setValues((prev) => prev.map((v, i) => (i === index ? Math.min(MAX, Math.max(1, v + delta)) : v)))

  const mean = values.reduce((a, b) => a + b, 0) / values.length

  return (
    <SimFrame
      title="Veri, ortalama ve ortanca"
      hint="Çubukları artırıp azalt. Ortalamanın uç değerlerden, ortancanın sıradan etkilendiğini karşılaştır."
    >
      <div className="relative mt-4">
        <div className="grid grid-cols-7 gap-1.5">
          {values.map((v, i) => (
            <div key={i} className="flex flex-col items-center gap-1">
              <button
                type="button"
                aria-label={`${i + 1}. değeri artır`}
                disabled={v >= MAX}
                onClick={() => change(i, 1)}
                className="grid size-11 place-items-center rounded-xl bg-surface-2 text-fg transition-colors hover:bg-primary-soft disabled:opacity-40"
              >
                <Plus className="size-4" aria-hidden />
              </button>
              <div className="flex items-end" style={{ height: BAR_HEIGHT }}>
                <div className="w-8 rounded-t-lg bg-primary transition-[height] duration-200 motion-reduce:transition-none" style={{ height: (v / MAX) * BAR_HEIGHT }} />
              </div>
              <span className="tabular text-sm font-bold">{v}</span>
              <button
                type="button"
                aria-label={`${i + 1}. değeri azalt`}
                disabled={v <= 1}
                onClick={() => change(i, -1)}
                className="grid size-11 place-items-center rounded-xl bg-surface-2 text-fg transition-colors hover:bg-primary-soft disabled:opacity-40"
              >
                <Minus className="size-4" aria-hidden />
              </button>
            </div>
          ))}
        </div>
        <div
          className="pointer-events-none absolute inset-x-0 border-t-2 border-dashed border-warning"
          style={{ top: 44 + 4 + BAR_HEIGHT - (mean / MAX) * BAR_HEIGHT }}
          aria-hidden
        />
      </div>
      <p className="mt-1 text-xs text-muted">Kesikli çizgi aritmetik ortalamayı gösterir.</p>

      <div className="mt-3 grid grid-cols-2 gap-2 sm:grid-cols-4">
        <Stat label="Aritmetik ortalama" value={decimal.format(mean)} highlight />
        <Stat label="Ortanca" value={decimal.format(median(values))} />
        <Stat label="Tepe değer" value={modes(values)} />
        <Stat label="Açıklık" value={String(Math.max(...values) - Math.min(...values))} />
      </div>
    </SimFrame>
  )
}
