import { useState } from 'react'
import { SimFrame, Slider, Stat } from './frame'

const ELEMENTS = [
  ['H', 'Hidrojen'], ['He', 'Helyum'], ['Li', 'Lityum'], ['Be', 'Berilyum'], ['B', 'Bor'], ['C', 'Karbon'], ['N', 'Azot'], ['O', 'Oksijen'],
  ['F', 'Flor'], ['Ne', 'Neon'], ['Na', 'Sodyum'], ['Mg', 'Magnezyum'], ['Al', 'Alüminyum'], ['Si', 'Silisyum'], ['P', 'Fosfor'], ['S', 'Kükürt'],
  ['Cl', 'Klor'], ['Ar', 'Argon'], ['K', 'Potasyum'], ['Ca', 'Kalsiyum'], ['Sc', 'Skandiyum'], ['Ti', 'Titanyum'], ['V', 'Vanadyum'], ['Cr', 'Krom'],
  ['Mn', 'Mangan'], ['Fe', 'Demir'], ['Co', 'Kobalt'], ['Ni', 'Nikel'], ['Cu', 'Bakır'], ['Zn', 'Çinko'], ['Ga', 'Galyum'], ['Ge', 'Germanyum'],
  ['As', 'Arsenik'], ['Se', 'Selenyum'], ['Br', 'Brom'], ['Kr', 'Kripton'],
] as const

const ORDER: [number, string, number][] = [
  [1, 's', 2], [2, 's', 2], [2, 'p', 6], [3, 's', 2], [3, 'p', 6], [4, 's', 2], [3, 'd', 10], [4, 'p', 6],
]
const SUPER = '⁰¹²³⁴⁵⁶⁷⁸⁹'
const sup = (n: number) => String(n).split('').map((d) => SUPER[Number(d)]).join('')
const LAYERS = ['K', 'L', 'M', 'N']
const GROUPS = [1, 18, 1, 2, 13, 14, 15, 16, 17, 18, 1, 2, 13, 14, 15, 16, 17, 18, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
const A_GROUPS: Record<number, string> = { 1: 'IA', 2: 'IIA', 13: 'IIIA', 14: 'IVA', 15: 'VA', 16: 'VIA', 17: 'VIIA', 18: 'VIIIA' }

function configure(z: number) {
  const parts: { n: number; l: string; e: number }[] = []
  let left = z
  for (const [n, l, cap] of ORDER) {
    if (left <= 0) break
    const e = Math.min(cap, left)
    parts.push({ n, l, e })
    left -= e
  }
  if (z === 24 || z === 29) {
    const d = parts.find((p) => p.l === 'd')!
    const s = parts.find((p) => p.n === 4 && p.l === 's')!
    d.e = z === 24 ? 5 : 10
    s.e = 1
  }
  return parts
}

export function AtomSim() {
  const [z, setZ] = useState(11)

  const [symbol, name] = ELEMENTS[z - 1]
  const parts = configure(z)
  const shells = [1, 2, 3, 4].map((n) => parts.filter((p) => p.n === n).reduce((a, p) => a + p.e, 0))
  const used = shells.filter((s) => s > 0).length
  const group = GROUPS[z - 1]
  const transition = group >= 3 && group <= 12
  const valence = shells[used - 1]
  const groupText = transition ? `${group}. grup (B grubu)` : `${group}. grup (${A_GROUPS[group]})`

  return (
    <SimFrame
      title="Atomun elektron dizilimi"
      hint="Atom numarasını değiştir. Elektronların katmanlara nasıl yerleştiğini, periyodu ve grubu gör."
    >
      <div className="mx-auto mt-4 max-w-xs overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="-62 -62 124 124" role="img" aria-label={`${name} atomu, katmanlarda ${shells.slice(0, used).join(', ')} elektron`} className="block w-full">
          {shells.slice(0, used).map((count, i) => {
            const r = 17 + i * 13
            return (
              <g key={i}>
                <circle cx={0} cy={0} r={r} fill="none" className="stroke-line-strong" strokeWidth={0.6} />
                {Array.from({ length: count }, (_, k) => {
                  const a = (k / count) * Math.PI * 2 - Math.PI / 2
                  return <circle key={k} cx={r * Math.cos(a)} cy={r * Math.sin(a)} r={2.1} className={i === used - 1 ? 'fill-warning' : 'fill-primary'} />
                })}
              </g>
            )
          })}
          <circle cx={0} cy={0} r={11} className="fill-accent" />
          <text x={0} y={-1} textAnchor="middle" fontSize={7} fontWeight={700} className="fill-white">
            {symbol}
          </text>
          <text x={0} y={7} textAnchor="middle" fontSize={5} className="fill-white">
            +{z}
          </text>
        </svg>
      </div>

      <div className="mt-3">
        <Slider label={`Atom numarası (${name})`} value={z} display={String(z)} min={1} max={36} step={1} onChange={setZ} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label="Elektron dizilimi" value={parts.map((p) => `${p.n}${p.l}${sup(p.e)}`).join(' ')} highlight />
        <Stat label="Katmanlar" value={shells.slice(0, used).map((s, i) => `${LAYERS[i]}: ${s}`).join(', ')} />
        <Stat label="Periyot ve grup" value={`${used}. periyot, ${groupText}`} />
        <Stat label="Son katmandaki elektron" value={String(valence)} />
      </div>
    </SimFrame>
  )
}
