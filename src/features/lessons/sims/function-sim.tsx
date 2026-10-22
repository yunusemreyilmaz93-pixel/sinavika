import { useState } from 'react'
import { ArrowRight } from 'lucide-react'
import { SimFrame, Slider, decimal } from './frame'

function linear(a: number, b: number) {
  let out = ''
  for (const [k, s] of [[a, 'x'], [b, '']] as [number, string][]) {
    if (k === 0) continue
    const mag = Math.abs(k)
    const body = s && mag === 1 ? s : `${decimal.format(mag)}${s}`
    out += out ? ` ${k < 0 ? '-' : '+'} ${body}` : `${k < 0 ? '-' : ''}${body}`
  }
  return out || '0'
}

function Chain({ title, steps }: { title: string; steps: { name: string; value: number }[] }) {
  return (
    <div className="rounded-xl bg-surface-2 p-3">
      <p className="text-xs font-semibold text-muted">{title}</p>
      <div className="mt-2 flex flex-wrap items-center gap-2">
        {steps.map((s, i) => (
          <div key={i} className="flex items-center gap-2">
            {i > 0 && <ArrowRight className="size-4 shrink-0 text-muted" aria-hidden />}
            <div className="rounded-lg bg-surface px-3 py-1.5 text-center">
              <p className="text-xs text-muted">{s.name}</p>
              <p className="tabular font-display text-lg font-bold">{decimal.format(s.value)}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

export function FunctionSim() {
  const [x, setX] = useState(2)
  const [a, setA] = useState(2)
  const [b, setB] = useState(1)

  const f = (v: number) => a * v + b
  const g = (v: number) => v * v
  const fog = f(g(x))
  const gof = g(f(x))
  const rule = `f(x) = ${linear(a, b)}`

  return (
    <SimFrame
      title="Fonksiyon makinesi ve bileşke"
      hint="f ve g makinelerinin sırasını değiştirince sonucun değiştiğini gör. Bileşke işleminde sıra önemlidir."
    >
      <p className="mt-3 font-display text-base font-bold">
        {rule}, g(x) = x²
      </p>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Girdi (x)" value={x} display={decimal.format(x)} min={-4} max={4} step={1} onChange={setX} />
        <Slider label="f'nin katsayısı" value={a} display={decimal.format(a)} min={-3} max={3} step={1} onChange={setA} />
        <Slider label="f'nin sabit terimi" value={b} display={decimal.format(b)} min={-5} max={5} step={1} onChange={setB} />
      </div>

      <div className="mt-3 space-y-2">
        <Chain
          title="(f ∘ g)(x): önce g, sonra f"
          steps={[
            { name: 'x', value: x },
            { name: 'g', value: g(x) },
            { name: 'f(g(x))', value: fog },
          ]}
        />
        <Chain
          title="(g ∘ f)(x): önce f, sonra g"
          steps={[
            { name: 'x', value: x },
            { name: 'f', value: f(x) },
            { name: 'g(f(x))', value: gof },
          ]}
        />
      </div>
      <p className="mt-3 text-sm font-semibold">{fog === gof ? 'Bu girdide iki sıralama aynı sonucu verdi' : 'İki sıralama farklı sonuç verdi'}</p>
    </SimFrame>
  )
}
