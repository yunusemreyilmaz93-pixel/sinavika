import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat } from './frame'

const TILT = 23.44
const LATITUDE = 39
const CX = 180
const CY = 115
const RX = 135
const RY = 50
const DATES = [
  { label: '21 Mart', day: 79 },
  { label: '21 Haziran', day: 171 },
  { label: '23 Eylül', day: 265 },
  { label: '21 Aralık', day: 354 },
]

const rad = (deg: number) => (deg * Math.PI) / 180

function seasonNorth(day: number) {
  if (day >= 79 && day < 171) return 'İlkbahar'
  if (day >= 171 && day < 265) return 'Yaz'
  if (day >= 265 && day < 354) return 'Sonbahar'
  return 'Kış'
}

const opposite: Record<string, string> = { İlkbahar: 'Sonbahar', Yaz: 'Kış', Sonbahar: 'İlkbahar', Kış: 'Yaz' }

function declination(day: number) {
  return -TILT * Math.cos(rad((360 / 365) * (day + 11)))
}

function dayLength(day: number) {
  const x = -Math.tan(rad(LATITUDE)) * Math.tan(rad(declination(day)))
  const hours = (24 / Math.PI) * Math.acos(Math.max(-1, Math.min(1, x)))
  const whole = Math.floor(hours)
  return `${whole} sa ${String(Math.round((hours - whole) * 60)).padStart(2, '0')} dk`
}

const dateFormat = new Intl.DateTimeFormat('tr-TR', { day: 'numeric', month: 'long', timeZone: 'UTC' })

export function SeasonSim() {
  const [day, setDay] = useState(171)

  const phi = rad(180 + (360 * (day - 171)) / 365)
  const ex = CX + RX * Math.cos(phi)
  const ey = CY - RY * Math.sin(phi)
  const away = (Math.atan2(ey - CY, ex - CX) * 180) / Math.PI
  const axisX = Math.sin(rad(TILT)) * 26
  const axisY = Math.cos(rad(TILT)) * 26
  const north = seasonNorth(day)
  const delta = declination(day)
  const latitudeText = `${Math.abs(delta).toLocaleString('tr-TR', { maximumFractionDigits: 1 })}° ${delta >= 0 ? 'K' : 'G'}`

  return (
    <SimFrame
      title="Mevsimlerin oluşumu"
      hint="Dünya yörüngede ilerlerken ekseni hep aynı yöne bakar. Tarihi değiştirip Kuzey Yarım Küre’nin Güneş’e göre durumuna bak."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface-2">
        <svg
          viewBox="0 0 360 215"
          role="img"
          aria-label={`Tarih ${dateFormat.format(Date.UTC(2021, 0, day + 1))}. Kuzey Yarım Küre’de ${north}.`}
          className="block w-full"
        >
          <ellipse cx={CX} cy={CY} rx={RX} ry={RY} className="fill-none stroke-line-strong" strokeWidth={1.5} strokeDasharray="4 4" />
          <circle cx={CX} cy={CY} r={18} className="fill-marker" />
          <g className="fill-muted text-[11px]" textAnchor="middle">
            <text x={CX} y={44}>
              21 Mart
            </text>
            <text x={45} y={160}>
              21 Haziran
            </text>
            <text x={315} y={160}>
              21 Aralık
            </text>
            <text x={CX} y={203}>
              23 Eylül
            </text>
          </g>
          <g transform={`translate(${ex} ${ey})`}>
            <circle r={14} className="fill-accent-soft stroke-accent" strokeWidth={1.5} />
            <path d="M0,-14 A14 14 0 0 1 0,14 Z" transform={`rotate(${away})`} className="fill-accent" opacity={0.55} />
            <line x1={axisX} y1={-axisY} x2={-axisX} y2={axisY} className="stroke-fg" strokeWidth={2} strokeLinecap="round" />
            <text x={axisX + 6} y={-axisY + 2} className="fill-fg text-[11px] font-bold">
              K
            </text>
          </g>
        </svg>
      </div>

      <div className="mt-3 flex flex-wrap gap-2">
        {DATES.map((d) => (
          <Button
            key={d.label}
            variant={Math.abs(day - d.day) < 2 ? 'primary' : 'secondary'}
            size="sm"
            className="min-h-11"
            onClick={() => setDay(d.day)}
          >
            {d.label}
          </Button>
        ))}
      </div>

      <div className="mt-3">
        <Slider
          label="Tarih"
          value={day}
          display={dateFormat.format(Date.UTC(2021, 0, day + 1))}
          min={0}
          max={364}
          step={1}
          onChange={setDay}
        />
      </div>

      <div className="mt-3 grid grid-cols-2 gap-2 sm:grid-cols-4">
        <Stat label="Kuzey Yarım Küre" value={north} />
        <Stat label="Güney Yarım Küre" value={opposite[north]} />
        <Stat label="Işınların dik düştüğü enlem" value={latitudeText} />
        <Stat label="Gündüz süresi (39° K, yaklaşık)" value={dayLength(day)} highlight={Math.abs(delta) > 22} />
      </div>
      <p className="mt-3 text-[15px] text-muted">Mevsimleri Dünya’nın Güneş’e uzaklığı değil, eksen eğikliği oluşturur.</p>
    </SimFrame>
  )
}
