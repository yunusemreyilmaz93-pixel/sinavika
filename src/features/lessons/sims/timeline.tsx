import { useState } from 'react'

export type TimelineItem = { id: string; time: string; title: string; text: string }

// Kaydırılabilir olay şeridi. Bir olaya dokununca ayrıntısı altta açılır
export function Timeline({ items, label }: { items: TimelineItem[]; label: string }) {
  const [active, setActive] = useState(items[0]?.id)
  const current = items.find((i) => i.id === active) ?? items[0]
  if (!current) return null

  return (
    <div>
      <div className="relative mt-3">
        <div className="absolute inset-x-0 top-3 h-0.5 bg-line-strong" aria-hidden />
        <ol className="relative flex gap-2 overflow-x-auto pb-2" aria-label={label}>
          {items.map((item) => {
            const on = item.id === current.id
            return (
              <li key={item.id} className="shrink-0">
                <button
                  type="button"
                  onClick={() => setActive(item.id)}
                  aria-pressed={on}
                  className="flex min-h-11 w-28 flex-col items-center text-center"
                >
                  <span className={`size-6 rounded-full border-2 border-surface transition-colors duration-150 motion-reduce:transition-none ${on ? 'bg-primary' : 'bg-line-strong'}`} />
                  <span className={`tabular mt-1 text-xs ${on ? 'font-bold text-primary' : 'text-muted'}`}>{item.time}</span>
                  <span className={`text-xs leading-tight ${on ? 'font-bold' : 'font-semibold'}`}>{item.title}</span>
                </button>
              </li>
            )
          })}
        </ol>
      </div>
      <div className="mt-2 rounded-xl bg-surface-2 p-3" aria-live="polite">
        <p className="font-display text-base font-bold">{current.title}</p>
        <p className="tabular text-xs text-muted">{current.time}</p>
        <p className="mt-1 text-sm">{current.text}</p>
      </div>
    </div>
  )
}
