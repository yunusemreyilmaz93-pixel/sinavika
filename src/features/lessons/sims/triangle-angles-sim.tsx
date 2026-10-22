import { useState } from 'react'
import { SimFrame, Slider, Stat } from './frame'

const rad = (deg: number) => (deg * Math.PI) / 180

export function TriangleAnglesSim() {
  const [a, setA] = useState(55)
  const [b, setB] = useState(65)

  const c = 180 - a - b
  const bMax = 170 - a

  const base = Math.sin(rad(c))
  const P = [0, 0]
  const Q = [base, 0]
  const R = [Math.sin(rad(b)) * Math.cos(rad(a)), -Math.sin(rad(b)) * Math.sin(rad(a))]
  const ext = [base + 0.45, 0]
  const minX = Math.min(P[0], R[0]) - 0.25
  const maxX = Math.max(ext[0], R[0]) + 0.25
  const minY = Math.min(R[1], 0) - 0.25
  const width = maxX - minX
  const height = 0.25 - minY
  const arcR = 0.17
  const pt = (center: number[], from: number, to: number): string => {
    const [x1, y1] = [center[0] + arcR * Math.cos(rad(from)), center[1] - arcR * Math.sin(rad(from))]
    const [x2, y2] = [center[0] + arcR * Math.cos(rad(to)), center[1] - arcR * Math.sin(rad(to))]
    return `M${x1},${y1} A${arcR},${arcR} 0 0 0 ${x2},${y2}`
  }
  const label = (center: number[], deg: number, text: string, cls: string) => (
    <text
      x={center[0] + 0.33 * Math.cos(rad(deg))}
      y={center[1] - 0.33 * Math.sin(rad(deg)) + 0.05}
      textAnchor="middle"
      fontSize={0.12}
      fontWeight={700}
      className={cls}
    >
      {text}
    </text>
  )
  const dirR = (Math.atan2(-(R[1] - Q[1]), R[0] - Q[0]) * 180) / Math.PI

  return (
    <SimFrame
      title="Üçgenin iç ve dış açıları"
      hint="İki iç açıyı değiştir. Üçüncü açı 180°'ye tamamlar, dış açı ise komşu olmayan iki iç açının toplamına eşittir."
    >
      <div className="mx-auto mt-4 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg
          viewBox={`${minX} ${minY - 0.1} ${width} ${height + 0.1}`}
          role="img"
          aria-label={`İç açılar ${a}, ${b} ve ${c} derece`}
          className="block w-full"
        >
          <polygon points={`${P[0]},${P[1]} ${Q[0]},${Q[1]} ${R[0]},${R[1]}`} className="fill-primary-soft stroke-primary" strokeWidth={0.02} strokeLinejoin="round" />
          <line x1={Q[0]} y1={Q[1]} x2={ext[0]} y2={ext[1]} className="stroke-warning" strokeWidth={0.02} strokeDasharray="0.05 0.04" />
          <path d={pt(P, 0, a)} fill="none" className="stroke-primary" strokeWidth={0.02} />
          <path d={pt(Q, 180 - b, 180)} fill="none" className="stroke-primary" strokeWidth={0.02} />
          <path d={pt(R, 180 + a, 360 - b)} fill="none" className="stroke-primary" strokeWidth={0.02} />
          <path d={pt(Q, 0, dirR)} fill="none" className="stroke-warning" strokeWidth={0.025} />
          {label(P, a / 2, `${a}°`, 'fill-primary')}
          {label(Q, 180 - b / 2, `${b}°`, 'fill-primary')}
          {label(R, 270 + (a - b) / 2, `${c}°`, 'fill-primary')}
          <text x={Q[0] + 0.38} y={Q[1] - 0.12} fontSize={0.12} fontWeight={700} textAnchor="middle" className="fill-warning">
            {a + c}°
          </text>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="1. iç açı" value={a} display={`${a}°`} min={20} max={120} step={5} onChange={(v) => { setA(v); if (b > 170 - v) setB(170 - v) }} />
        <Slider label="2. iç açı" value={Math.min(b, bMax)} display={`${b}°`} min={20} max={bMax} step={5} onChange={setB} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="3. iç açı (180° - toplam)" value={`${c}°`} />
        <Stat label="İç açılar toplamı" value={`${a + b + c}°`} />
        <Stat label="Dış açı (180° - 2. iç açı)" value={`${180 - b}°`} highlight />
      </div>
    </SimFrame>
  )
}
