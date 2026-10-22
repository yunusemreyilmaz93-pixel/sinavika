import { useId, useState } from 'react'
import { SimFrame, Slider, Stat, decimal } from './frame'

const LIMIT = 8

function equation(a: number, b: number, c: number) {
  const terms: [number, string][] = [
    [a, 'x²'],
    [b, 'x'],
    [c, ''],
  ]
  let out = ''
  for (const [k, s] of terms) {
    if (k === 0) continue
    const mag = Math.abs(k)
    const body = s && mag === 1 ? s : `${decimal.format(mag)}${s}`
    out += out ? ` ${k < 0 ? '-' : '+'} ${body}` : `${k < 0 ? '-' : ''}${body}`
  }
  return `y = ${out || '0'}`
}

export function ParabolaSim() {
  const clip = useId()
  const [a, setA] = useState(1)
  const [b, setB] = useState(-2)
  const [c, setC] = useState(-3)

  const f = (x: number) => a * x * x + b * x + c
  const delta = b * b - 4 * a * c
  const roots = a === 0 || delta < 0 ? [] : delta === 0 ? [-b / (2 * a)] : [(-b - Math.sqrt(delta)) / (2 * a), (-b + Math.sqrt(delta)) / (2 * a)].sort((p, q) => p - q)
  const vertexX = a === 0 ? null : -b / (2 * a)
  const vertexY = vertexX === null ? null : f(vertexX)
  const path = Array.from({ length: LIMIT * 20 + 1 }, (_, i) => {
    const x = -LIMIT + i / 10
    return `${i === 0 ? 'M' : 'L'}${x},${-f(x)}`
  }).join(' ')
  const range = Array.from({ length: LIMIT * 2 + 1 }, (_, i) => i - LIMIT)
  const rootText = a === 0 ? 'Denklem ikinci dereceden değil' : roots.length === 0 ? 'Gerçek kök yok' : roots.map((r) => decimal.format(r)).join(' ve ')
  const shape = a === 0 ? 'Doğru' : a > 0 ? 'Kollar yukarı' : 'Kollar aşağı'

  return (
    <SimFrame
      title="Parabolün katsayıları"
      hint="a, b ve c değerlerini değiştir. Kökler, tepe noktası ve diskriminant grafikle birlikte değişir."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg
          viewBox={`${-LIMIT - 1} ${-LIMIT - 1} ${LIMIT * 2 + 2} ${LIMIT * 2 + 2}`}
          role="img"
          aria-label={`${equation(a, b, c)} fonksiyonunun grafiği`}
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
            <path d={path} fill="none" className="stroke-primary" strokeWidth={0.22} strokeLinejoin="round" />
            {vertexX !== null && vertexY !== null && Math.abs(vertexX) <= LIMIT && Math.abs(vertexY) <= LIMIT && (
              <circle cx={vertexX} cy={-vertexY} r={0.34} className="fill-accent" />
            )}
            {roots.map((r) => (
              <circle key={r} cx={r} cy={0} r={0.34} className="fill-warning" />
            ))}
          </g>
        </svg>
      </div>

      <p className="mt-3 text-center font-display text-xl font-bold">{equation(a, b, c)}</p>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="a" value={a} display={decimal.format(a)} min={-3} max={3} step={0.5} onChange={setA} />
        <Slider label="b" value={b} display={decimal.format(b)} min={-6} max={6} step={1} onChange={setB} />
        <Slider label="c" value={c} display={decimal.format(c)} min={-6} max={6} step={1} onChange={setC} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-2">
        <Stat label="Diskriminant (b² - 4ac)" value={decimal.format(delta)} />
        <Stat label="Kökler" value={rootText} highlight />
        <Stat label="Tepe noktası" value={vertexX === null || vertexY === null ? '-' : `(${decimal.format(vertexX)}, ${decimal.format(vertexY)})`} />
        <Stat label="Biçim" value={shape} />
      </div>
    </SimFrame>
  )
}
