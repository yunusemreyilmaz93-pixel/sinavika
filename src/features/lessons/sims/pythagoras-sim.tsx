import { useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

type Point = [number, number]

const poly = (points: Point[]) => points.map(([x, y]) => `${x},${-y}`).join(' ')

export function PythagorasSim() {
  const [a, setA] = useState(3)
  const [b, setB] = useState(4)

  const sum = a * a + b * b
  const c = Math.sqrt(sum)
  const whole = Number.isInteger(c)
  const legSquareA: Point[] = [
    [0, 0],
    [a, 0],
    [a, -a],
    [0, -a],
  ]
  const legSquareB: Point[] = [
    [0, 0],
    [0, b],
    [-b, b],
    [-b, 0],
  ]
  const size = Math.max(a + 2 * b, 2 * a + b) + 2
  const k = size / 32
  const hypSquare: Point[] = [
    [a, 0],
    [0, b],
    [b, a + b],
    [a + b, a],
  ]

  return (
    <SimFrame
      title="Pisagor bağıntısı"
      hint="Dik kenarların üzerindeki karelerin alanları toplamı, hipotenüsün üzerindeki karenin alanına eşittir."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg
          viewBox={`${-b - 1} ${-(a + b) - 1} ${size} ${size}`}
          role="img"
          aria-label={`Dik kenarları ${a} ve ${b} olan dik üçgen ve kenarları üzerindeki kareler`}
          className="block w-full"
        >
          <polygon points={poly(legSquareA)} className="fill-primary-soft stroke-primary" strokeWidth={0.12 * k} />
          <polygon points={poly(legSquareB)} className="fill-primary-soft stroke-primary" strokeWidth={0.12 * k} />
          <polygon points={poly(hypSquare)} className="fill-accent-soft stroke-accent" strokeWidth={0.12 * k} />
          <g className="stroke-primary" strokeWidth={0.05 * k} opacity={0.6}>
            {Array.from({ length: a - 1 }, (_, i) => (
              <g key={`a${i}`}>
                <line x1={i + 1} y1={0} x2={i + 1} y2={a} />
                <line x1={0} y1={i + 1} x2={a} y2={i + 1} />
              </g>
            ))}
            {Array.from({ length: b - 1 }, (_, i) => (
              <g key={`b${i}`}>
                <line x1={-(i + 1)} y1={0} x2={-(i + 1)} y2={-b} />
                <line x1={0} y1={-(i + 1)} x2={-b} y2={-(i + 1)} />
              </g>
            ))}
          </g>
          <polygon
            points={poly([
              [0, 0],
              [a, 0],
              [0, b],
            ])}
            className="fill-warning-soft stroke-fg"
            strokeWidth={0.18 * k}
            strokeLinejoin="round"
          />
          <rect x={0} y={-0.9} width={0.9} height={0.9} className="fill-none stroke-fg" strokeWidth={0.1 * k} />
          <g className="fill-fg font-bold" fontSize={1.3 * k} textAnchor="middle">
            <text x={a / 2} y={1.6}>
              a
            </text>
            <text x={-1} y={-b / 2 + 0.45}>
              b
            </text>
            <text x={a / 2 + (1.4 * b) / c} y={-b / 2 - (1.4 * a) / c + 0.45}>
              c
            </text>
          </g>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="a kenarı" value={a} display={String(a)} min={1} max={10} step={1} onChange={setA} />
        <Slider label="b kenarı" value={b} display={String(b)} min={1} max={10} step={1} onChange={setB} />
      </div>

      <div className="mt-3 grid grid-cols-2 gap-2 sm:grid-cols-4">
        <Stat label="a² (alan)" value={String(a * a)} />
        <Stat label="b² (alan)" value={String(b * b)} />
        <Stat label="a² + b² = c²" value={String(sum)} />
        <Stat label="Hipotenüs (c)" value={whole ? String(c) : `√${sum} ≈ ${decimal.format(c)}`} highlight={whole} />
      </div>
      {whole && (
        <p className="mt-3 text-[15px] font-semibold text-primary">
          Bu bir Pisagor üçlüsü: {a}, {b}, {c}
        </p>
      )}
    </SimFrame>
  )
}
