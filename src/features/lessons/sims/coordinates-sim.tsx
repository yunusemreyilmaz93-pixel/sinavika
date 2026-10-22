import { useRef, useState, type MouseEvent } from 'react'
import { Button } from '@/components/ui/button'
import { DUNYA_ULKELER, DUNYA_VIEW } from '../maps/world'
import { SimFrame, Slider, Stat } from './frame'

const PLACES = [
  { ad: 'İstanbul', lat: 41, lon: 29 },
  { ad: 'Erzurum', lat: 39.9, lon: 41.3 },
  { ad: 'Londra', lat: 51.5, lon: 0 },
  { ad: 'New York', lat: 40.7, lon: -74 },
  { ad: 'Tokyo', lat: 35.7, lon: 139.7 },
  { ad: 'Sidney', lat: -33.9, lon: 151.2 },
]
const TR_LON = 45

const x = (lon: number) => (lon + 180) * 2
const y = (lat: number) => (90 - lat) * 2
const wrap = (hours: number) => ((hours % 24) + 24) % 24

function clock(hours: number) {
  const total = Math.round(wrap(hours) * 60) % 1440
  return `${String(Math.floor(total / 60)).padStart(2, '0')}.${String(total % 60).padStart(2, '0')}`
}

function degree(value: number, plus: string, minus: string) {
  const v = Math.round(Math.abs(value) * 10) / 10
  return `${v.toLocaleString('tr-TR')}° ${value >= 0 ? plus : minus}`
}

export function CoordinatesSim() {
  const [lat, setLat] = useState(41)
  const [lon, setLon] = useState(29)
  const [greenwich, setGreenwich] = useState(12)
  const svg = useRef<SVGSVGElement>(null)

  const pick = (e: MouseEvent<SVGSVGElement>) => {
    const box = svg.current?.getBoundingClientRect()
    if (!box) return
    setLon(Math.round((((e.clientX - box.left) / box.width) * 360 - 180) * 10) / 10)
    setLat(Math.round((90 - ((e.clientY - box.top) / box.height) * 180) * 10) / 10)
  }

  const local = greenwich + lon / 15
  const diffMinutes = Math.round((lon - TR_LON) * 4)
  const diffText =
    diffMinutes === 0
      ? 'Fark yok'
      : `${Math.floor(Math.abs(diffMinutes) / 60)} sa ${Math.abs(diffMinutes) % 60} dk ${diffMinutes > 0 ? 'ileri' : 'geri'}`

  // Güneş öğle vaktinde bu boylamın üstündedir, gece yarısı da tam karşısındadır
  const sunLon = ((-(greenwich - 12) * 15 + 540) % 360) - 180
  const night = ((sunLon + 180 + 540) % 360) - 180
  const left = night - 90
  const bands = left < -180 ? [[-180, night + 90], [left + 360, 180]] : night + 90 > 180 ? [[left, 180], [-180, night + 90 - 360]] : [[left, night + 90]]

  return (
    <SimFrame
      title="Enlem, boylam ve yerel saat"
      hint="Haritaya dokunarak ya da kaydırıcılarla bir nokta seç. Boylam değiştikçe yerel saatin nasıl değiştiğine bak. Gece gölgesi ekinoks günü için çizilmiştir."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface">
        <svg
          ref={svg}
          viewBox={`0 0 ${DUNYA_VIEW.width} ${DUNYA_VIEW.height}`}
          role="img"
          aria-label={`Seçili nokta ${degree(lat, 'K', 'G')}, ${degree(lon, 'D', 'B')}. Yerel saat ${clock(local)}.`}
          className="block w-full cursor-crosshair touch-manipulation"
          onClick={pick}
        >
          <rect width={DUNYA_VIEW.width} height={DUNYA_VIEW.height} className="fill-accent-soft" />
          {DUNYA_ULKELER.map((c) => (
            <path key={c.ad} d={c.d} className="fill-primary/30 stroke-line-strong" strokeWidth={0.3} />
          ))}
          {bands.map(([a, b]) => (
            <rect key={a} x={x(a)} y={0} width={(b - a) * 2} height={DUNYA_VIEW.height} className="fill-fg opacity-20" />
          ))}
          {[-150, -120, -90, -60, -30, 30, 60, 90, 120, 150].map((v) => (
            <line key={`m${v}`} x1={x(v)} x2={x(v)} y1={0} y2={DUNYA_VIEW.height} className="stroke-line-strong" strokeWidth={0.4} />
          ))}
          {[-60, -30, 30, 60].map((v) => (
            <line key={`p${v}`} x1={0} x2={DUNYA_VIEW.width} y1={y(v)} y2={y(v)} className="stroke-line-strong" strokeWidth={0.4} />
          ))}
          {[23.44, -23.44].map((v) => (
            <line key={`d${v}`} x1={0} x2={DUNYA_VIEW.width} y1={y(v)} y2={y(v)} className="stroke-warning" strokeWidth={0.6} strokeDasharray="4 3" />
          ))}
          <line x1={0} x2={DUNYA_VIEW.width} y1={y(0)} y2={y(0)} className="stroke-fg" strokeWidth={0.8} />
          <line x1={x(0)} x2={x(0)} y1={0} y2={DUNYA_VIEW.height} className="stroke-fg" strokeWidth={0.8} />
          <line x1={x(TR_LON)} x2={x(TR_LON)} y1={0} y2={DUNYA_VIEW.height} className="stroke-primary" strokeWidth={0.8} strokeDasharray="3 3" />
          <g className="fill-fg text-[15px] font-semibold" textAnchor="middle">
            <text x={x(0) + 14} y={14}>
              0°
            </text>
            <text x={x(TR_LON) + 24} y={DUNYA_VIEW.height - 5} className="fill-primary">
              45° D
            </text>
            {[-120, -60, 120].map((v) => (
              <text key={v} x={x(v)} y={DUNYA_VIEW.height - 5}>
                {Math.abs(v)}° {v < 0 ? 'B' : 'D'}
              </text>
            ))}
          </g>
          <g className="fill-fg text-[15px] font-semibold">
            {[60, 30, -30, -60].map((v) => (
              <text key={v} x={4} y={y(v) - 4}>
                {Math.abs(v)}° {v > 0 ? 'K' : 'G'}
              </text>
            ))}
          </g>
          <g className="pointer-events-none">
            <line x1={x(lon)} x2={x(lon)} y1={0} y2={DUNYA_VIEW.height} className="stroke-danger" strokeWidth={1} />
            <line x1={0} x2={DUNYA_VIEW.width} y1={y(lat)} y2={y(lat)} className="stroke-danger" strokeWidth={1} />
            <circle cx={x(lon)} cy={y(lat)} r={5} className="fill-danger stroke-surface" strokeWidth={1.5} />
          </g>
        </svg>
      </div>
      <p className="mt-1 text-xs text-muted">Kesikli sarı çizgiler dönenceleri, yeşil çizgi Türkiye’nin ortak saat meridyenini (45° D) gösterir.</p>

      <div className="mt-3 flex flex-wrap gap-2">
        {PLACES.map((p) => (
          <Button
            key={p.ad}
            variant={p.lat === lat && p.lon === lon ? 'primary' : 'secondary'}
            size="sm"
            className="min-h-11"
            onClick={() => {
              setLat(p.lat)
              setLon(p.lon)
            }}
          >
            {p.ad}
          </Button>
        ))}
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Enlem" value={lat} display={degree(lat, 'K', 'G')} min={-90} max={90} step={0.5} onChange={setLat} />
        <Slider label="Boylam" value={lon} display={degree(lon, 'D', 'B')} min={-180} max={180} step={0.5} onChange={setLon} />
        <Slider label="Greenwich’te saat" value={greenwich} display={clock(greenwich)} min={0} max={23} step={1} onChange={setGreenwich} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Yarım küre" value={`${lat >= 0 ? 'Kuzey' : 'Güney'} ve ${lon >= 0 ? 'Doğu' : 'Batı'}`} />
        <Stat label="Yerel saat (1° = 4 dakika)" value={clock(local)} highlight />
        <Stat label="Türkiye ortak saatine göre" value={diffText} />
      </div>
    </SimFrame>
  )
}
