import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const SUBSTANCES = [
  { name: 'Su', formula: 'H₂O', molar: 18, atoms: 3, gas: false },
  { name: 'Karbondioksit', formula: 'CO₂', molar: 44, atoms: 3, gas: true },
  { name: 'Oksijen', formula: 'O₂', molar: 32, atoms: 2, gas: true },
  { name: 'Amonyak', formula: 'NH₃', molar: 17, atoms: 4, gas: true },
  { name: 'Sofra tuzu', formula: 'NaCl', molar: 58.5, atoms: 2, gas: false },
]
const sci = new Intl.NumberFormat('tr-TR', { maximumSignificantDigits: 3 })

function power(value: number) {
  const exp = Math.floor(Math.log10(value))
  return `${decimal.format(value / 10 ** exp)} · 10${String(exp).replace(/\d/g, (d) => '⁰¹²³⁴⁵⁶⁷⁸⁹'[Number(d)])}`
}

export function MoleSim() {
  const [index, setIndex] = useState(0)
  const [mole, setMole] = useState(2)

  const s = SUBSTANCES[index]
  const particles = mole * 6.02e23

  return (
    <SimFrame
      title="Mol hesabı"
      hint="Madde miktarını (mol) değiştir. Kütle, tanecik sayısı ve gaz hacmi mol ile doğru orantılı değişir."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {SUBSTANCES.map((x, i) => (
          <Button key={x.name} variant={index === i ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setIndex(i)}>
            {x.name} ({x.formula})
          </Button>
        ))}
      </div>

      <div className="mt-3">
        <Slider label="Madde miktarı (mol)" value={mole} display={decimal.format(mole)} min={0.5} max={5} step={0.5} onChange={setMole} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label={`Kütle = mol × molar kütle (${decimal.format(s.molar)} g/mol)`} value={`${decimal.format(mole * s.molar)} g`} highlight />
        <Stat label="Tanecik sayısı = mol × 6,02 · 10²³" value={power(particles)} />
        <Stat label={`Toplam atom sayısı (formülde ${s.atoms} atom)`} value={power(particles * s.atoms)} />
        <Stat label="Gaz hacmi (normal koşullar, 22,4 L/mol)" value={s.gas ? `${sci.format(mole * 22.4)} L` : 'Gaz değil'} />
      </div>
    </SimFrame>
  )
}
