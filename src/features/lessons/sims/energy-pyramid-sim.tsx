import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const LEVELS = ['Üretici (bitki)', '1. düzey tüketici (otçul)', '2. düzey tüketici (etçil)', '3. düzey tüketici (etçil)']

export function EnergyPyramidSim() {
  const [energy, setEnergy] = useState(10000)
  const [rate, setRate] = useState(10)

  const values = LEVELS.map((_, i) => energy * (rate / 100) ** i)

  return (
    <SimFrame
      title="Enerji piramidi"
      hint="Bir basamaktan diğerine geçen enerji yüzdesini değiştir. Her basamakta enerjinin büyük kısmı kaybolur, bu yüzden besin zincirleri kısadır."
    >
      <ul className="mt-4 space-y-2" aria-label="Enerji piramidinin basamakları">
        {values.map((v, i) => (
          <li key={i} className="flex items-center gap-3">
            <div className="flex-1">
              <div
                className="mx-auto flex h-9 whitespace-nowrap items-center justify-center rounded-lg bg-primary text-sm font-semibold text-primary-fg transition-[width] duration-200 motion-reduce:transition-none"
                style={{ width: `max(${(v / energy) * 100}%, 4.75rem)` }}
              >
                {decimal.format(v)}
              </div>
            </div>
            <span className="w-32 shrink-0 text-xs text-muted">{LEVELS[i]}</span>
          </li>
        ))}
      </ul>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Üreticideki enerji (kJ)" value={energy} display={decimal.format(energy)} min={1000} max={20000} step={1000} onChange={setEnergy} />
        <Slider label="Basamaklar arası aktarım (%)" value={rate} display={String(rate)} min={5} max={20} step={5} onChange={setRate} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label="3. düzey tüketiciye ulaşan" value={`${decimal.format(values[3])} kJ`} highlight />
        <Stat label="Üreticiden tepeye kayıp" value={`%${decimal.format((1 - values[3] / energy) * 100)}`} />
      </div>
    </SimFrame>
  )
}
