import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Stat } from './frame'

const GENOTYPES = ['AA', 'Aa', 'aa']

const sorted = (g: string) => (g[0] === g[1] ? g : 'Aa')
const gametes = (g: string) => (g[0] === g[1] ? [g[0], g[0]] : [g[0], g[1]])
const phenotype = (g: string) => (g.includes('A') ? 'Baskın' : 'Çekinik')

function Choice({ label, value, onChange }: { label: string; value: string; onChange: (v: string) => void }) {
  return (
    <div>
      <p className="text-sm font-semibold">{label}</p>
      <div className="mt-2 flex gap-2">
        {GENOTYPES.map((g) => (
          <Button key={g} variant={value === g ? 'primary' : 'secondary'} size="sm" className="min-h-11 min-w-14" onClick={() => onChange(g)}>
            {g}
          </Button>
        ))}
      </div>
    </div>
  )
}

export function PunnettSim() {
  const [mother, setMother] = useState('Aa')
  const [father, setFather] = useState('Aa')

  const mg = gametes(mother)
  const fg = gametes(father)
  const cells = mg.flatMap((m) => fg.map((f) => sorted(m + f)))
  const count = (g: string) => cells.filter((c) => c === g).length
  const dominant = cells.filter((c) => phenotype(c) === 'Baskın').length

  return (
    <SimFrame
      title="Punnett karesi"
      hint="Anne ve babanın genotiplerini seç. Gametlerin birleşmesiyle oluşan yavru genotiplerini ve oranlarını gör."
    >
      <div className="mt-4 grid gap-4 sm:grid-cols-2">
        <Choice label="Anne genotipi" value={mother} onChange={setMother} />
        <Choice label="Baba genotipi" value={father} onChange={setFather} />
      </div>

      <div className="mx-auto mt-4 grid max-w-xs grid-cols-[2.5rem_1fr_1fr] gap-1.5 text-center" role="table" aria-label="Punnett karesi">
        <div />
        {fg.map((f, i) => (
          <div key={i} className="rounded-lg bg-accent-soft py-2 font-display text-lg font-bold text-accent-soft-fg">
            {f}
          </div>
        ))}
        {mg.map((m, i) => (
          <div key={i} className="contents">
            <div className="grid place-items-center rounded-lg bg-primary-soft font-display text-lg font-bold text-primary-soft-fg">{m}</div>
            {fg.map((f, j) => {
              const g = sorted(m + f)
              return (
                <div key={j} className={`rounded-lg border border-line py-4 font-display text-xl font-bold ${phenotype(g) === 'Baskın' ? 'bg-surface-2' : 'bg-warning-soft'}`}>
                  {g}
                </div>
              )
            })}
          </div>
        ))}
      </div>

      <div className="mt-4 grid gap-2 sm:grid-cols-2">
        <Stat label="Genotip oranı (AA : Aa : aa)" value={`${count('AA')} : ${count('Aa')} : ${count('aa')}`} highlight />
        <Stat label="Fenotip oranı (baskın : çekinik)" value={`${dominant} : ${4 - dominant}`} />
      </div>
    </SimFrame>
  )
}
