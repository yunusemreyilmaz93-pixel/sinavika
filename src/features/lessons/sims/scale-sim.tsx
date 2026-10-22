import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const SCALES = [25_000, 100_000, 250_000, 500_000, 1_000_000, 5_000_000]
const grouped = new Intl.NumberFormat('tr-TR')

function distance(km: number) {
  return km < 1 ? `${decimal.format(km * 1000)} m` : `${decimal.format(km)} km`
}

export function ScaleSim() {
  const [scale, setScale] = useState(250_000)
  const [cm, setCm] = useState(8)

  const km = (cm * scale) / 100_000
  const perCm = scale / 100_000

  return (
    <SimFrame
      title="Ölçek ve gerçek uzaklık"
      hint="Ölçeği ve haritadaki uzaklığı değiştir. Aynı uzaklığın gerçekte ne kadar ettiğini ve ölçek büyüdükçe ayrıntının nasıl arttığını gör."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {SCALES.map((s) => (
          <Button key={s} variant={scale === s ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setScale(s)}>
            1/{grouped.format(s)}
          </Button>
        ))}
      </div>

      <div className="mt-3">
        <Slider label="Haritadaki uzaklık" value={cm} display={`${decimal.format(cm)} cm`} min={1} max={20} step={0.5} onChange={setCm} />
      </div>

      <div className="mt-3 rounded-xl border border-line bg-surface p-3" role="img" aria-label={`1 santimetre gerçekte ${distance(perCm)} eder. ${decimal.format(cm)} santimetre ${distance(km)} eder.`}>
        <p className="text-xs text-muted">Çizgi ölçek: her çentik haritada 1 cm</p>
        <div
          className="mt-2 h-4 rounded bg-accent"
          style={{
            width: `${(cm / 20) * 100}%`,
            backgroundImage: 'linear-gradient(to right, transparent calc(100% - 1.5px), var(--accent-soft) 0)',
            backgroundSize: `calc(100% / ${cm}) 100%`,
          }}
        />
        <p className="tabular mt-1 text-xs">
          1 cm = {distance(perCm)}, {decimal.format(cm)} cm = {distance(km)}
        </p>
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Gerçek uzaklık = harita uzaklığı × payda" value={distance(km)} highlight />
        <Stat label="1 cm gerçekte" value={distance(perCm)} />
        <Stat label="Ölçek türü" value={scale <= 100_000 ? 'Büyük ölçek, ayrıntılı' : 'Küçük ölçek, geniş alan'} />
      </div>

      <div className="mt-3 overflow-x-auto">
        <table className="w-full text-left text-sm">
          <caption className="pb-1 text-left text-xs text-muted">Aynı {decimal.format(cm)} cm, farklı ölçeklerde</caption>
          <tbody>
            {SCALES.map((s) => (
              <tr key={s} className={s === scale ? 'bg-primary-soft font-semibold' : ''}>
                <th scope="row" className="py-1 pr-3 font-semibold">
                  1/{grouped.format(s)}
                </th>
                <td className="tabular py-1">{distance((cm * s) / 100_000)}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </SimFrame>
  )
}
