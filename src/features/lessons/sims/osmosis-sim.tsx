import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const INSIDE = 0.9

export function OsmosisSim() {
  const [plant, setPlant] = useState(false)
  const [outside, setOutside] = useState(0.9)

  const diff = outside - INSIDE
  const medium = Math.abs(diff) < 0.05 ? 'İzotonik' : diff < 0 ? 'Hipotonik' : 'Hipertonik'
  const water = medium === 'İzotonik' ? 'Net su geçişi yok' : medium === 'Hipotonik' ? 'Su hücreye girer' : 'Su hücreden çıkar'
  const size = 1 - diff * 0.28
  const radius = plant ? 30 * Math.min(Math.max(size, 0.55), 1.04) : 30 * Math.min(Math.max(size, 0.6), 1.45)
  const burst = !plant && diff < -0.7
  const state = plant
    ? medium === 'Hipotonik' ? 'Turgor basıncı oluşur, hücre duvarı patlamayı önler' : medium === 'Hipertonik' ? 'Plazmoliz: Zar hücre duvarından ayrılır' : 'Hücre normal'
    : burst ? 'Hücre patlayabilir' : medium === 'Hipotonik' ? 'Hücre şişer' : medium === 'Hipertonik' ? 'Hücre büzülür' : 'Hücre normal'

  return (
    <SimFrame
      title="Osmoz ve hücre"
      hint="Ortamın tuz derişimini değiştir. Su, derişimin düşük olduğu taraftan yüksek olduğu tarafa geçer."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={!plant ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setPlant(false)}>
          Hayvan hücresi
        </Button>
        <Button variant={plant ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setPlant(true)}>
          Bitki hücresi
        </Button>
      </div>

      <div className="mx-auto mt-3 max-w-xs overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 120 90" role="img" aria-label={`${medium} ortamda ${state}`} className="block w-full">
          <rect x={0} y={0} width={120} height={90} className="fill-accent" fillOpacity={0.05 + Math.min(outside / 2, 1) * 0.3} />
          {plant && <rect x={22} y={7} width={76} height={76} rx={14} fill="none" className="stroke-primary" strokeWidth={3} />}
          <circle cx={60} cy={45} r={radius} className="fill-primary-soft stroke-primary" strokeWidth={2} />
          {plant && medium === 'Hipertonik' && <circle cx={60} cy={45} r={radius} fill="none" className="stroke-warning" strokeWidth={1.5} strokeDasharray="3 2" />}
          <circle cx={60} cy={45} r={6} className="fill-primary" />
          <text x={60} y={86} textAnchor="middle" fontSize={7} className="fill-muted">
            Ortam: %{decimal.format(outside)} tuz
          </text>
          <text x={60} y={13} textAnchor="middle" fontSize={7} className="fill-muted">
            Hücre içi: %{decimal.format(INSIDE)}
          </text>
        </svg>
      </div>

      <div className="mt-3">
        <Slider label="Ortamın tuz derişimi (%)" value={outside} display={decimal.format(outside)} min={0} max={1.8} step={0.1} onChange={setOutside} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Ortam" value={medium} highlight />
        <Stat label="Suyun yönü" value={water} />
        <Stat label="Hücre" value={state} />
      </div>
    </SimFrame>
  )
}
