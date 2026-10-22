import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const BASE = 8
const HEIGHT = 6
const PERIMETER = 24
const AREA = 24

export function SimilaritySim() {
  const [k, setK] = useState(1.5)

  const big = Math.max(1, k)
  const fs = 0.75 * big
  const left = 2.6 * big
  const w = BASE * big + left + 1
  const h = HEIGHT * big + 4.2 * big

  const tri = (s: number) => `0,0 ${BASE * s},0 0,${-HEIGHT * s}`

  return (
    <SimFrame
      title="Benzer üçgenler"
      hint="Benzerlik oranını (k) değiştir. Kenarlar k katına çıkarken alanın k² katına çıktığını gör."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg
          viewBox={`${-left} ${-(HEIGHT * big) - 0.8 * big} ${w} ${h}`}
          role="img"
          aria-label={`Kenarları 6, 8 ve 10 olan üçgen ve kenarları ${decimal.format(k)} katı olan benzeri`}
          className="block w-full"
        >
          <polygon points={tri(k)} className="fill-accent-soft stroke-accent" strokeWidth={0.12 * big} strokeLinejoin="round" />
          <polygon points={tri(1)} className="fill-primary-soft stroke-primary" strokeWidth={0.12 * big} strokeLinejoin="round" />
          <g fontSize={fs} className="fill-fg">
            <text x={BASE / 2} y={1.1 * big} textAnchor="middle" className="fill-primary">
              8
            </text>
            <text x={-0.4 * big} y={-HEIGHT / 2 + 0.25 * big} textAnchor="end" className="fill-primary">
              6
            </text>
            {k !== 1 && (
              <>
                <text x={(BASE * k) / 2} y={2.2 * big} textAnchor="middle" className="fill-accent">
                  {decimal.format(BASE * k)}
                </text>
                <text x={-0.4 * big} y={(-HEIGHT * k) / 2 + 0.25 * big} textAnchor="end" className="fill-accent">
                  {decimal.format(HEIGHT * k)}
                </text>
              </>
            )}
          </g>
        </svg>
      </div>

      <div className="mt-3">
        <Slider label="Benzerlik oranı (k)" value={k} display={decimal.format(k)} min={0.5} max={3} step={0.5} onChange={setK} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Hipotenüs: 10 yerine" value={decimal.format(10 * k)} />
        <Stat label={`Çevre: ${PERIMETER} yerine (k katı)`} value={decimal.format(PERIMETER * k)} />
        <Stat label={`Alan: ${AREA} yerine (k² katı)`} value={decimal.format(AREA * k * k)} highlight />
      </div>
    </SimFrame>
  )
}
