import { useId, useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const LIMIT = 8

function equation(m: number, n: number) {
  const x = m === 0 ? '' : m === 1 ? 'x' : m === -1 ? '-x' : `${decimal.format(m)}x`
  if (m === 0) return `y = ${decimal.format(n)}`
  if (n === 0) return `y = ${x}`
  return `y = ${x} ${n > 0 ? '+' : '-'} ${decimal.format(Math.abs(n))}`
}

export function LineSim() {
  const clip = useId()
  const [m, setM] = useState(2)
  const [n, setN] = useState(-2)

  const xIntercept = m === 0 ? null : -n / m
  const range = Array.from({ length: LIMIT * 2 + 1 }, (_, i) => i - LIMIT)
  const direction = m > 0 ? 'Yukarı doğru artan' : m < 0 ? 'Aşağı doğru azalan' : 'Yatay'
  const xText = m === 0 ? (n === 0 ? 'x ekseni ile çakışık' : 'x eksenini kesmez') : `(${decimal.format(xIntercept!)}, 0)`

  return (
    <SimFrame
      title="Doğrusal denklemin grafiği"
      hint="Eğimi ve y eksenini kestiği noktayı değiştirip doğrunun nasıl döndüğünü ve kaydığını gözle."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg
          viewBox={`${-LIMIT - 1} ${-LIMIT - 1} ${LIMIT * 2 + 2} ${LIMIT * 2 + 2}`}
          role="img"
          aria-label={`${equation(m, n)} doğrusunun grafiği`}
          className="block w-full"
        >
          <clipPath id={clip}>
            <rect x={-LIMIT} y={-LIMIT} width={LIMIT * 2} height={LIMIT * 2} />
          </clipPath>
          {range.map((i) => (
            <g key={i} className="stroke-line" strokeWidth={0.05}>
              <line x1={i} y1={-LIMIT} x2={i} y2={LIMIT} />
              <line x1={-LIMIT} y1={i} x2={LIMIT} y2={i} />
            </g>
          ))}
          <line x1={-LIMIT} y1={0} x2={LIMIT} y2={0} className="stroke-fg" strokeWidth={0.12} />
          <line x1={0} y1={-LIMIT} x2={0} y2={LIMIT} className="stroke-fg" strokeWidth={0.12} />
          <g className="fill-muted" fontSize={0.8} textAnchor="middle">
            {[-6, -4, -2, 2, 4, 6].map((v) => (
              <g key={v}>
                <text x={v} y={1.1}>
                  {v}
                </text>
                <text x={-0.55} y={-v + 0.28}>
                  {v}
                </text>
              </g>
            ))}
          </g>
          <g clipPath={`url(#${clip})`}>
            <line
              x1={-LIMIT}
              y1={-(m * -LIMIT + n)}
              x2={LIMIT}
              y2={-(m * LIMIT + n)}
              className="stroke-primary"
              strokeWidth={0.22}
              strokeLinecap="round"
            />
          </g>
          {Math.abs(n) <= LIMIT && <circle cx={0} cy={-n} r={0.32} className="fill-accent" />}
          {xIntercept !== null && Math.abs(xIntercept) <= LIMIT && <circle cx={xIntercept} cy={0} r={0.32} className="fill-warning" />}
        </svg>
      </div>

      <p className="mt-3 text-center font-display text-xl font-bold">{equation(m, n)}</p>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Eğim (m)" value={m} display={decimal.format(m)} min={-4} max={4} step={0.5} onChange={setM} />
        <Slider label="y eksenini kestiği nokta (n)" value={n} display={decimal.format(n)} min={-6} max={6} step={1} onChange={setN} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Doğrunun yönü" value={direction} />
        <Stat label="y eksenini kestiği nokta" value={`(0, ${decimal.format(n)})`} />
        <Stat label="x eksenini kestiği nokta" value={xText} />
      </div>
    </SimFrame>
  )
}
