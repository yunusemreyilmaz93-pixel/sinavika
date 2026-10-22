import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const OBJECT_H = 5
const RANGE_X = 44
const RANGE_Y = 20

type Point = [number, number]

export function LensSim() {
  const [focal, setFocal] = useState(10)
  const [distance, setDistance] = useState(25)

  const atFocus = distance === focal
  const image = atFocus ? null : (focal * distance) / (distance - focal)
  const magnification = image === null ? 0 : -image / distance
  const imageTip: Point | null = image === null ? null : [image, -OBJECT_H * (image / distance)]
  const tip: Point = [-distance, OBJECT_H]
  const virtual = image !== null && image < 0

  const exit = (from: Point, through: Point | null, slope: number): Point[] => {
    const s = through ? (through[1] - from[1]) / (through[0] - from[0]) : slope
    return [from, [RANGE_X, from[1] + s * (RANGE_X - from[0])]]
  }
  const hitFocal = (OBJECT_H * focal) / (focal - distance)
  const rays: { path: Point[]; back?: Point[] }[] = []
  rays.push({ path: [tip, [0, OBJECT_H]] })
  rays.push({ path: [tip, [0, 0]] })
  if (Math.abs(hitFocal) < RANGE_Y * 1.4 && !atFocus) rays.push({ path: [tip, [0, hitFocal]] })
  const afterLens = [
    exit([0, OBJECT_H], imageTip, -OBJECT_H / focal),
    exit([0, 0], imageTip, -OBJECT_H / distance),
    ...(Math.abs(hitFocal) < RANGE_Y * 1.4 && !atFocus ? [exit([0, hitFocal], imageTip, 0)] : []),
  ]
  const line = (pts: Point[]) => pts.map(([x, y], i) => `${i === 0 ? 'M' : 'L'}${x},${-y}`).join(' ')

  const kind = image === null ? 'Görüntü oluşmaz' : `${virtual ? 'Sanal' : 'Gerçek'}, ${magnification > 0 ? 'düz' : 'ters'}, ${Math.abs(magnification) > 1.01 ? 'büyük' : Math.abs(magnification) < 0.99 ? 'küçük' : 'eş boyda'}`

  return (
    <SimFrame
      title="İnce kenarlı mercekte görüntü"
      hint="Cismin uzaklığını ve merceğin odak uzaklığını değiştir. Cisim odağın içine girince görüntünün sanal ve düz olduğunu gör."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox={`${-RANGE_X} ${-RANGE_Y} ${RANGE_X * 2} ${RANGE_Y * 2}`} role="img" aria-label={`Görüntü: ${kind}`} className="block w-full">
          <line x1={-RANGE_X} y1={0} x2={RANGE_X} y2={0} className="stroke-line-strong" strokeWidth={0.2} />
          <path d={`M0,${-RANGE_Y + 1} V${RANGE_Y - 1}`} className="stroke-accent" strokeWidth={0.5} fill="none" />
          <polygon points={`0,${-RANGE_Y + 0.5} -1.4,${-RANGE_Y + 3} 1.4,${-RANGE_Y + 3}`} className="fill-accent" />
          <polygon points={`0,${RANGE_Y - 0.5} -1.4,${RANGE_Y - 3} 1.4,${RANGE_Y - 3}`} className="fill-accent" />
          {[-focal, focal].map((x) => (
            <g key={x}>
              <circle cx={x} cy={0} r={0.55} className="fill-fg" />
              <text x={x} y={2.4} textAnchor="middle" fontSize={2} className="fill-muted">
                F
              </text>
            </g>
          ))}
          {rays.map((r, i) => (
            <path key={`a${i}`} d={line(r.path)} fill="none" className="stroke-warning" strokeWidth={0.25} />
          ))}
          {afterLens.map((r, i) => (
            <g key={`b${i}`}>
              <path d={line(r)} fill="none" className="stroke-warning" strokeWidth={0.25} />
              {virtual && imageTip && <path d={line([[0, r[0][1]], imageTip])} fill="none" className="stroke-warning" strokeWidth={0.2} strokeDasharray="0.8 0.8" />}
            </g>
          ))}
          <line x1={-distance} y1={0} x2={-distance} y2={-OBJECT_H} className="stroke-primary" strokeWidth={0.6} />
          <polygon points={`${-distance},${-OBJECT_H - 0.9} ${-distance - 0.7},${-OBJECT_H + 0.6} ${-distance + 0.7},${-OBJECT_H + 0.6}`} className="fill-primary" />
          {imageTip && (
            <g opacity={virtual ? 0.6 : 1}>
              <line x1={imageTip[0]} y1={0} x2={imageTip[0]} y2={-imageTip[1]} className="stroke-danger" strokeWidth={0.6} strokeDasharray={virtual ? '1 0.8' : undefined} />
              <circle cx={imageTip[0]} cy={-imageTip[1]} r={0.8} className="fill-danger" />
            </g>
          )}
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Odak uzaklığı (cm)" value={focal} display={String(focal)} min={5} max={15} step={1} onChange={setFocal} />
        <Slider label="Cismin uzaklığı (cm)" value={distance} display={String(distance)} min={3} max={40} step={1} onChange={setDistance} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="1/f = 1/dₒ + 1/dᵢ" value={image === null ? '-' : `dᵢ = ${decimal.format(image)} cm`} highlight />
        <Stat label="Büyütme (hᵢ / hₒ)" value={image === null ? '-' : decimal.format(Math.abs(magnification))} />
        <Stat label="Görüntü" value={kind} />
      </div>
    </SimFrame>
  )
}
