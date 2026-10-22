import { useState } from 'react'
import { SimFrame, Slider, Stat } from './frame'

const gcd = (a: number, b: number): number => (b === 0 ? a : gcd(b, a % b))

export function GcdSim() {
  const [a, setA] = useState(24)
  const [b, setB] = useState(36)

  const g = gcd(a, b)
  const l = (a * b) / g
  const cols = a / g
  const rows = b / g

  return (
    <SimFrame
      title="EBOB ve EKOK"
      hint="Dikdörtgen biçimli bir zemini artık kalmadan döşeyen en büyük karenin kenarı EBOB'dur."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface p-2">
        <svg viewBox={`-1 -1 ${a + 2} ${b + 2}`} role="img" aria-label={`${a} × ${b} zemin, kenarı ${g} olan ${cols * rows} kare`} className="block w-full">
          <rect x={0} y={0} width={a} height={b} className="fill-primary-soft" />
          <g className="stroke-primary" strokeWidth={Math.max(a, b) / 150} fill="none">
            {Array.from({ length: cols + 1 }, (_, i) => (
              <line key={`c${i}`} x1={i * g} y1={0} x2={i * g} y2={b} />
            ))}
            {Array.from({ length: rows + 1 }, (_, i) => (
              <line key={`r${i}`} x1={0} y1={i * g} x2={a} y2={i * g} />
            ))}
          </g>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Genişlik" value={a} display={String(a)} min={2} max={36} step={1} onChange={setA} />
        <Slider label="Uzunluk" value={b} display={String(b)} min={2} max={36} step={1} onChange={setB} />
      </div>

      <div className="mt-3 grid grid-cols-2 gap-2 sm:grid-cols-4">
        <Stat label="EBOB (kare kenarı)" value={String(g)} highlight />
        <Stat label="EKOK" value={String(l)} />
        <Stat label="Gereken kare sayısı" value={`${cols} × ${rows} = ${cols * rows}`} />
        <Stat label="EBOB × EKOK" value={`${g * l} = ${a} × ${b}`} />
      </div>
    </SimFrame>
  )
}
