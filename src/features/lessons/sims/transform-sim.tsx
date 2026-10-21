import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider } from './frame'

type Point = [number, number]
type Kind = 'otele' | 'xekseni' | 'yekseni' | 'yx' | 'd90' | 'd180' | 'd270'

const LIMIT = 8
const SHAPE: Point[] = [
  [1, 1],
  [4, 1],
  [2, 3],
]
const NAMES = ['A', 'B', 'C']

const KINDS: { id: Kind; label: string }[] = [
  { id: 'otele', label: 'Öteleme' },
  { id: 'xekseni', label: 'x eksenine yansıma' },
  { id: 'yekseni', label: 'y eksenine yansıma' },
  { id: 'yx', label: 'y = x doğrusuna yansıma' },
  { id: 'd90', label: '90° dönme' },
  { id: 'd180', label: '180° dönme' },
  { id: 'd270', label: '270° dönme' },
]

const RULE: Record<Kind, string> = {
  otele: '',
  xekseni: '(x, y) → (x, -y)',
  yekseni: '(x, y) → (-x, y)',
  yx: '(x, y) → (y, x)',
  d90: '(x, y) → (-y, x)',
  d180: '(x, y) → (-x, -y)',
  d270: '(x, y) → (y, -x)',
}

function apply(kind: Kind, [x, y]: Point, dx: number, dy: number): Point {
  switch (kind) {
    case 'otele':
      return [x + dx, y + dy]
    case 'xekseni':
      return [x, -y]
    case 'yekseni':
      return [-x, y]
    case 'yx':
      return [y, x]
    case 'd90':
      return [-y, x]
    case 'd180':
      return [-x, -y]
    case 'd270':
      return [y, -x]
  }
}

const poly = (points: Point[]) => points.map(([x, y]) => `${x},${-y}`).join(' ')
const fmt = ([x, y]: Point) => `(${x}, ${y})`

export function TransformSim() {
  const [kind, setKind] = useState<Kind>('otele')
  const [dx, setDx] = useState(3)
  const [dy, setDy] = useState(-2)

  const image = SHAPE.map((p) => apply(kind, p, dx, dy))
  const range = Array.from({ length: LIMIT * 2 + 1 }, (_, i) => i - LIMIT)
  const rule = kind === 'otele' ? `(x, y) → (x ${dx < 0 ? '-' : '+'} ${Math.abs(dx)}, y ${dy < 0 ? '-' : '+'} ${Math.abs(dy)})` : RULE[kind]

  return (
    <SimFrame
      title="Dönüşüm geometrisi"
      hint="Bir dönüşüm seç ve ABC üçgeninin A’B’C’ görüntüsünün nereye gittiğine bak. Şeklin boyutu ve biçimi değişmez."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        {KINDS.map((k) => (
          <Button key={k.id} variant={kind === k.id ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setKind(k.id)}>
            {k.label}
          </Button>
        ))}
      </div>

      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg
          viewBox={`${-LIMIT - 1} ${-LIMIT - 1} ${LIMIT * 2 + 2} ${LIMIT * 2 + 2}`}
          role="img"
          aria-label={`ABC üçgeni ve ${KINDS.find((k) => k.id === kind)?.label} sonrası görüntüsü`}
          className="block w-full"
        >
          {range.map((i) => (
            <g key={i} className="stroke-line" strokeWidth={0.05}>
              <line x1={i} y1={-LIMIT} x2={i} y2={LIMIT} />
              <line x1={-LIMIT} y1={i} x2={LIMIT} y2={i} />
            </g>
          ))}
          <line x1={-LIMIT} y1={0} x2={LIMIT} y2={0} className="stroke-fg" strokeWidth={0.12} />
          <line x1={0} y1={-LIMIT} x2={0} y2={LIMIT} className="stroke-fg" strokeWidth={0.12} />
          {kind === 'yx' && (
            <line x1={-LIMIT} y1={LIMIT} x2={LIMIT} y2={-LIMIT} className="stroke-warning" strokeWidth={0.12} strokeDasharray="0.4 0.3" />
          )}
          <polygon points={poly(SHAPE)} className="fill-primary-soft stroke-primary" strokeWidth={0.15} strokeLinejoin="round" />
          <polygon
            points={poly(image)}
            className="fill-accent-soft stroke-accent"
            strokeWidth={0.15}
            strokeLinejoin="round"
            opacity={0.9}
          />
          <g fontSize={1} fontWeight={700} textAnchor="middle">
            {SHAPE.map(([x, y], i) => (
              <text key={NAMES[i]} x={x} y={-y - 0.5} className="fill-primary">
                {NAMES[i]}
              </text>
            ))}
            {image.map(([x, y], i) => (
              <text key={NAMES[i]} x={x} y={-y - 0.5} className="fill-accent">
                {NAMES[i]}’
              </text>
            ))}
          </g>
        </svg>
      </div>

      {kind === 'otele' && (
        <div className="mt-3 grid gap-4 sm:grid-cols-2">
          <Slider label="Yatay kaydırma" value={dx} display={String(dx)} min={-4} max={4} step={1} onChange={setDx} />
          <Slider label="Dikey kaydırma" value={dy} display={String(dy)} min={-4} max={4} step={1} onChange={setDy} />
        </div>
      )}

      <div className="mt-3 rounded-xl bg-surface-2 p-3 text-[15px]">
        <p className="font-semibold">{rule}</p>
        <p className="tabular mt-1 text-muted">
          {SHAPE.map((p, i) => `${NAMES[i]}${fmt(p)} → ${NAMES[i]}’${fmt(image[i])}`).join('  ·  ')}
        </p>
      </div>
    </SimFrame>
  )
}
