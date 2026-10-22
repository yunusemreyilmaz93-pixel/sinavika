import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const MIN = -10
const MAX = 10
const toX = (v: number) => ((v - MIN) / (MAX - MIN)) * 100

export function AbsoluteSim() {
  const [a, setA] = useState(1)
  const [r, setR] = useState(3)
  const [x, setX] = useState(5)
  const [inside, setInside] = useState(true)

  const distance = Math.abs(x - a)
  const holds = inside ? distance < r : distance > r
  const low = a - r
  const high = a + r
  const solution = inside ? `${decimal.format(low)} < x < ${decimal.format(high)}` : `x < ${decimal.format(low)} veya x > ${decimal.format(high)}`

  return (
    <SimFrame
      title="Mutlak değer ve sayı doğrusu"
      hint="|x - a| ifadesi x ile a arasındaki uzaklıktır. Merkezi, yarıçapı ve x noktasını değiştirip çözüm aralığını izle."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={inside ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setInside(true)}>
          |x - a| &lt; r
        </Button>
        <Button variant={!inside ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setInside(false)}>
          |x - a| &gt; r
        </Button>
      </div>

      <div className="relative mx-2 mt-8 h-20" role="img" aria-label={`Çözüm kümesi: ${solution}`}>
        <div className="absolute inset-x-0 top-8 h-0.5 bg-fg" />
        <div
          className="absolute top-6 h-4 rounded-full bg-primary/40"
          style={inside ? { left: `${toX(low)}%`, width: `${toX(high) - toX(low)}%` } : { left: 0, width: `${toX(low)}%` }}
        />
        {!inside && <div className="absolute top-6 h-4 rounded-full bg-primary/40" style={{ left: `${toX(high)}%`, right: 0 }} />}
        {Array.from({ length: 11 }, (_, i) => MIN + i * 2).map((v) => (
          <div key={v} className="absolute top-8" style={{ left: `${toX(v)}%` }}>
            <div className="-translate-x-1/2">
              <div className="mx-auto h-2 w-0.5 bg-fg" />
              <p className="tabular text-xs text-muted">{v}</p>
            </div>
          </div>
        ))}
        {[low, high].map((v, i) => (
          <div
            key={i}
            className="absolute top-[26px] size-3 -translate-x-1/2 rounded-full border-2 border-primary bg-surface"
            style={{ left: `${toX(Math.min(Math.max(v, MIN), MAX))}%` }}
            aria-hidden
          />
        ))}
        <div className="absolute top-0 -translate-x-1/2 text-center" style={{ left: `${toX(a)}%` }}>
          <p className="text-xs font-semibold text-accent">a</p>
          <div className="mx-auto size-3 rounded-full bg-accent" />
        </div>
        <div className="absolute top-[58px] -translate-x-1/2" style={{ left: `${toX(x)}%` }}>
          <div className="mx-auto size-0 border-x-[6px] border-b-[8px] border-x-transparent border-b-warning" />
          <p className="text-center text-xs font-semibold">x</p>
        </div>
      </div>

      <div className="mt-2 grid gap-4 sm:grid-cols-3">
        <Slider label="Merkez (a)" value={a} display={decimal.format(a)} min={-6} max={6} step={1} onChange={setA} />
        <Slider label="Yarıçap (r)" value={r} display={decimal.format(r)} min={0} max={6} step={1} onChange={setR} />
        <Slider label="x noktası" value={x} display={decimal.format(x)} min={MIN} max={MAX} step={0.5} onChange={setX} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label={`|x - a| = |${decimal.format(x)} - ${decimal.format(a)}|`} value={decimal.format(distance)} />
        <Stat label={`Eşitsizlik ${inside ? '<' : '>'} ${decimal.format(r)}`} value={holds ? 'Sağlıyor' : 'Sağlamıyor'} highlight={holds} />
        <Stat label="Çözüm" value={solution} />
      </div>
    </SimFrame>
  )
}
