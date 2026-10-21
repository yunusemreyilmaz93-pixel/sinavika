import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/cn'
import { SimFrame, decimal } from './frame'

type Kind = 'para' | 'zar'

const KINDS: Record<Kind, { label: string; outcomes: string[] }> = {
  para: { label: 'Madeni para', outcomes: ['Yazı', 'Tura'] },
  zar: { label: 'Zar', outcomes: ['1', '2', '3', '4', '5', '6'] },
}

export function ProbabilitySim() {
  const [kind, setKind] = useState<Kind>('para')
  const [counts, setCounts] = useState<number[]>([0, 0])
  const [last, setLast] = useState<string | null>(null)

  const { outcomes } = KINDS[kind]
  const total = counts.reduce((a, b) => a + b, 0)
  const theory = 1 / outcomes.length

  const choose = (next: Kind) => {
    setKind(next)
    setCounts(new Array(KINDS[next].outcomes.length).fill(0))
    setLast(null)
  }

  const roll = (times: number) => {
    const next = counts.slice()
    let latest = 0
    for (let i = 0; i < times; i++) {
      latest = Math.floor(Math.random() * outcomes.length)
      next[latest]++
    }
    setCounts(next)
    setLast(outcomes[latest])
  }

  return (
    <SimFrame
      title="Olasılık deneyi"
      hint="Deneyi tekrarladıkça deneysel olasılık, teorik olasılığa yaklaşır. Atış sayısını artırıp çubukların nasıl değiştiğine bak."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {(Object.keys(KINDS) as Kind[]).map((k) => (
          <Button key={k} variant={kind === k ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => choose(k)}>
            {KINDS[k].label}
          </Button>
        ))}
      </div>

      <ul className="mt-4 space-y-3" aria-live="polite">
        {outcomes.map((name, i) => {
          const freq = total ? counts[i] / total : 0
          const scale = theory * 2
          return (
            <li key={name}>
              <div className="flex items-baseline justify-between gap-3 text-sm">
                <span className="font-semibold">{name}</span>
                <span className="tabular text-muted">
                  {counts[i]} / {total} = {decimal.format(freq)}
                </span>
              </div>
              <div className="relative mt-1 h-4 overflow-hidden rounded-full bg-surface-2">
                <div
                  className={cn('h-full rounded-full bg-primary transition-[width] duration-200 motion-reduce:transition-none')}
                  style={{ width: `${Math.min(freq / scale, 1) * 100}%` }}
                />
                <div className="absolute inset-y-0 w-0.5 bg-fg" style={{ left: '50%' }} aria-hidden />
              </div>
            </li>
          )
        })}
      </ul>
      <p className="mt-2 text-sm text-muted">
        Çizgi teorik olasılığı gösterir: 1/{outcomes.length} = {decimal.format(theory)}
      </p>

      <div className="mt-3 flex flex-wrap items-center gap-2">
        <Button size="sm" className="min-h-11" onClick={() => roll(1)}>
          1 kez at
        </Button>
        <Button variant="secondary" size="sm" className="min-h-11" onClick={() => roll(10)}>
          10 kez at
        </Button>
        <Button variant="secondary" size="sm" className="min-h-11" onClick={() => roll(100)}>
          100 kez at
        </Button>
        <Button variant="ghost" size="sm" className="min-h-11" onClick={() => choose(kind)}>
          Sıfırla
        </Button>
      </div>
      <p className="mt-3 text-[15px]">
        Toplam atış: <span className="tabular font-semibold">{total}</span>
        {last && (
          <>
            {' '}
            · Son sonuç: <span className="font-semibold">{last}</span>
          </>
        )}
      </p>
    </SimFrame>
  )
}
