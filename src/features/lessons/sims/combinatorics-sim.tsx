import { useState } from 'react'
import { SimFrame, Slider, Stat } from './frame'

const LETTERS = 'ABCDEFG'
const LIST_LIMIT = 21

const factorial = (n: number): number => (n <= 1 ? 1 : n * factorial(n - 1))

function combinations(n: number, r: number): string[] {
  const out: string[] = []
  const walk = (from: number, picked: string) => {
    if (picked.length === r) {
      out.push(picked)
      return
    }
    for (let i = from; i < n; i++) walk(i + 1, picked + LETTERS[i])
  }
  walk(0, '')
  return out
}

export function CombinatoricsSim() {
  const [n, setN] = useState(5)
  const [r, setR] = useState(3)

  const pick = Math.min(r, n)
  const perm = factorial(n) / factorial(n - pick)
  const comb = perm / factorial(pick)
  const list = combinations(n, pick)

  return (
    <SimFrame
      title="Permütasyon ve kombinasyon"
      hint="Eleman sayısını ve seçilecek sayıyı değiştir. Aynı seçim kaç farklı sırada dizilirse permütasyon o kadar fazla olur."
    >
      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Eleman sayısı (n)" value={n} display={String(n)} min={3} max={7} step={1} onChange={(v) => setN(v)} />
        <Slider label="Seçilecek sayı (r)" value={pick} display={String(pick)} min={0} max={n} step={1} onChange={setR} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label={`P(${n}, ${pick}) = ${n}! / ${n - pick}!`} value={String(perm)} />
        <Stat label={`C(${n}, ${pick}) = P / ${pick}!`} value={String(comb)} highlight />
        <Stat label="Bir seçimin dizilişi" value={`${pick}! = ${factorial(pick)}`} />
      </div>

      <p className="mt-4 text-sm font-semibold">
        {LETTERS.slice(0, n).split('').join(', ')} arasından {pick} elemanlı seçimler
      </p>
      <ul className="mt-2 flex flex-wrap gap-1.5" aria-label="Seçimlerin listesi">
        {list.slice(0, LIST_LIMIT).map((c) => (
          <li key={c} className="tabular rounded-lg bg-surface-2 px-2.5 py-1 text-sm font-semibold">
            {c || 'Boş küme'}
          </li>
        ))}
        {list.length > LIST_LIMIT && <li className="px-1 py-1 text-sm text-muted">ve {list.length - LIST_LIMIT} seçim daha</li>}
      </ul>
    </SimFrame>
  )
}
