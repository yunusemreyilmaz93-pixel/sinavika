import { useId, useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame } from './frame'

type Layer = 'basinc' | 'hareket' | 'ruzgar' | 'iklim'

const LAYERS: { id: Layer; label: string; text: string }[] = [
  {
    id: 'basinc',
    label: 'Basınç kuşakları',
    text: 'Dört sürekli basınç kuşağı vardır. Ekvatorda sıcaklıktan doğan termik alçak basınç, 30° enlemlerinde Dünya’nın dönüşünden doğan dinamik yüksek basınç, 60° enlemlerinde dinamik alçak basınç, kutuplarda soğuktan doğan termik yüksek basınç bulunur.',
  },
  {
    id: 'hareket',
    label: 'Hava hareketi',
    text: 'Alçak basınç kuşaklarında hava yükselir, bulut ve yağış oluşur. Yüksek basınç kuşaklarında hava alçalır, bulut oluşmaz ve hava açık olur.',
  },
  {
    id: 'ruzgar',
    label: 'Sürekli rüzgârlar',
    text: 'Rüzgârlar yüksek basınçtan alçak basınca eser. Dünya’nın dönüşü nedeniyle Kuzey Yarım Küre’de sağa, Güney Yarım Küre’de sola sapar. Alizeler 30°’den ekvatora, batı rüzgârları 30°’den 60°’ye, kutup rüzgârları kutuplardan 60°’ye eser.',
  },
  {
    id: 'iklim',
    label: 'İklim etkisi',
    text: 'Ekvator ve 60° enlemleri yağışlıdır. 30° enlemleri çevresi ve kutuplar kuraktır. Büyük çöller 30° enlemleri çevresinde yer alır.',
  },
]

const BELTS = [
  { lat: 90, kisa: 'TYB', ad: 'Kutup, termik yüksek basınç', yuksek: true },
  { lat: 60, kisa: 'DAB', ad: '60°, dinamik alçak basınç', yuksek: false },
  { lat: 30, kisa: 'DYB', ad: '30°, dinamik yüksek basınç', yuksek: true },
  { lat: 0, kisa: 'TAB', ad: 'Ekvator, termik alçak basınç', yuksek: false },
  { lat: -30, kisa: 'DYB', ad: '30°, dinamik yüksek basınç', yuksek: true },
  { lat: -60, kisa: 'DAB', ad: '60°, dinamik alçak basınç', yuksek: false },
  { lat: -90, kisa: 'TYB', ad: 'Kutup, termik yüksek basınç', yuksek: true },
]

const TOP = 22
const H = 336
const y = (lat: number) => TOP + ((90 - lat) / 180) * H

const WINDS = [
  { ad: 'Kutup rüzgârları', from: [225, 88], to: [150, 63] },
  { ad: 'Batı rüzgârları', from: [140, 32], to: [225, 57] },
  { ad: 'Alizeler', from: [225, 28], to: [150, 3] },
  { ad: 'Alizeler', from: [225, -28], to: [150, -3] },
  { ad: 'Batı rüzgârları', from: [140, -32], to: [225, -57] },
  { ad: 'Kutup rüzgârları', from: [225, -88], to: [150, -63] },
]

export function PressureSim() {
  const [layer, setLayer] = useState<Layer>('basinc')
  const id = useId()
  const current = LAYERS.find((l) => l.id === layer) ?? LAYERS[0]

  return (
    <SimFrame
      title="Basınç kuşakları ve rüzgârlar"
      hint="Bir katman seç. Enlemlere göre basınç, hava hareketi, rüzgâr yönü ve yağış durumunu aynı şemada gör."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {LAYERS.map((l) => (
          <Button key={l.id} variant={layer === l.id ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setLayer(l.id)}>
            {l.label}
          </Button>
        ))}
      </div>

      <div className="mt-3 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 360 380" role="img" aria-label={`Enlemlere göre ${current.label.toLowerCase()} şeması`} className="block w-full">
          <defs>
            <marker id={`${id}-ok`} viewBox="0 0 8 8" refX={6} refY={4} markerWidth={7} markerHeight={7} orient="auto">
              <path d="M0 0L8 4L0 8Z" className="fill-primary" />
            </marker>
          </defs>
          {BELTS.map((b) => {
            const top = Math.max(y(b.lat + 10), TOP)
            const bottom = Math.min(y(b.lat - 10), TOP + H)
            const wet = !b.yuksek
            const tone = layer === 'iklim' ? (wet ? 'fill-accent-soft' : 'fill-warning-soft') : b.yuksek ? 'fill-warning-soft' : 'fill-accent-soft'
            return (
              <g key={b.lat}>
                <rect x={60} y={top} width={260} height={bottom - top} className={tone} />
                <text x={36} y={y(b.lat) + 4} textAnchor="end" className="fill-muted text-[11px] font-semibold">
                  {Math.abs(b.lat)}°{b.lat > 0 ? ' K' : b.lat < 0 ? ' G' : ''}
                </text>
              </g>
            )
          })}
          {[90, 60, 30, 0, -30, -60, -90].map((lat) => (
            <line key={lat} x1={56} x2={324} y1={y(lat)} y2={y(lat)} className="stroke-line-strong" strokeWidth={lat === 0 ? 1.4 : 0.6} strokeDasharray={lat === 0 ? undefined : '3 3'} />
          ))}

          {layer === 'basinc' &&
            BELTS.map((b) => (
              <text key={b.lat} x={190} y={y(b.lat) + (b.lat === 90 ? 15 : b.lat === -90 ? -6 : 4)} textAnchor="middle" className="fill-fg text-[13px] font-bold">
                {b.kisa} · {b.yuksek ? 'yüksek basınç' : 'alçak basınç'}
              </text>
            ))}

          {layer === 'hareket' &&
            BELTS.map((b) => {
              const cy = y(b.lat) + (b.lat === 90 ? 12 : b.lat === -90 ? -12 : 0)
              const up = !b.yuksek
              return (
                <g key={b.lat}>
                  <line x1={190} x2={190} y1={up ? cy + 12 : cy - 12} y2={up ? cy - 12 : cy + 12} className="stroke-primary" strokeWidth={2.5} markerEnd={`url(#${id}-ok)`} />
                  <text x={206} y={cy + 4} className="fill-fg text-[12px] font-semibold">
                    {up ? 'yükselir' : 'alçalır'}
                  </text>
                </g>
              )
            })}

          {layer === 'ruzgar' &&
            WINDS.map((w, i) => (
              <g key={i}>
                <line x1={w.from[0]} y1={y(w.from[1])} x2={w.to[0]} y2={y(w.to[1])} className="stroke-primary" strokeWidth={2.5} markerEnd={`url(#${id}-ok)`} />
                <text x={w.from[0] > w.to[0] ? 236 : 70} y={(y(w.from[1]) + y(w.to[1])) / 2 + 4} className="fill-fg text-[11px] font-semibold">
                  {w.ad}
                </text>
              </g>
            ))}

          {layer === 'iklim' &&
            BELTS.map((b) => (
              <text key={b.lat} x={190} y={y(b.lat) + (b.lat === 90 ? 15 : b.lat === -90 ? -6 : 4)} textAnchor="middle" className="fill-fg text-[13px] font-bold">
                {b.yuksek ? 'Kurak' : 'Yağışlı'}
              </text>
            ))}
        </svg>
      </div>

      <p className="mt-3 rounded-xl bg-surface-2 p-3 text-sm" aria-live="polite">
        {current.text}
      </p>
    </SimFrame>
  )
}
