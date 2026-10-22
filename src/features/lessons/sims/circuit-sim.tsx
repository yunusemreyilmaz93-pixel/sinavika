import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

type Mode = 'seri' | 'paralel'

function Resistor({ x, y, label }: { x: number; y: number; label: string }) {
  return (
    <g>
      <rect x={x - 14} y={y - 7} width={28} height={14} rx={2} className="fill-surface stroke-fg" strokeWidth={1.5} />
      <text x={x} y={y + 3.5} textAnchor="middle" fontSize={9} fontWeight={700} className="fill-fg">
        {label}
      </text>
    </g>
  )
}

export function CircuitSim() {
  const [mode, setMode] = useState<Mode>('seri')
  const [volt, setVolt] = useState(12)
  const [r1, setR1] = useState(3)
  const [r2, setR2] = useState(6)

  const series = mode === 'seri'
  const req = series ? r1 + r2 : (r1 * r2) / (r1 + r2)
  const total = volt / req
  const i1 = series ? total : volt / r1
  const i2 = series ? total : volt / r2
  const v1 = series ? i1 * r1 : volt
  const v2 = series ? i2 * r2 : volt
  const power = volt * total

  return (
    <SimFrame
      title="Seri ve paralel devre"
      hint="Bağlama biçimini ve direnç değerlerini değiştir. Seride akım, paralelde gerilim ortaktır."
    >
      <div className="mt-4 flex flex-wrap gap-2">
        <Button variant={series ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('seri')}>
          Seri
        </Button>
        <Button variant={!series ? 'primary' : 'secondary'} size="sm" className="min-h-11" onClick={() => setMode('paralel')}>
          Paralel
        </Button>
      </div>

      <div className="mx-auto mt-3 max-w-sm overflow-hidden rounded-xl border border-line bg-surface">
        <svg viewBox="0 0 240 110" role="img" aria-label={series ? 'Seri bağlı iki direnç' : 'Paralel bağlı iki direnç'} className="block w-full">
          <g className="stroke-fg" strokeWidth={1.5} fill="none" strokeLinecap="round" strokeLinejoin="round">
            {series ? (
              <path d="M30,20 H94 M122,20 H174 M202,20 H210 V90 H30 V58 M30,50 V20" />
            ) : (
              <path d="M30,28 H94 M122,28 H210 M30,82 H94 M122,82 H210 M210,28 V82 M30,28 V50 M30,58 V82" />
            )}
          </g>
          <g>
            <line x1={22} y1={50} x2={38} y2={50} className="stroke-fg" strokeWidth={2.4} />
            <line x1={26} y1={58} x2={34} y2={58} className="stroke-fg" strokeWidth={1.4} />
            <text x={44} y={58} fontSize={9} fontWeight={700} className="fill-fg">
              {volt} V
            </text>
          </g>
          {series ? (
            <>
              <Resistor x={108} y={20} label={`${r1} Ω`} />
              <Resistor x={188} y={20} label={`${r2} Ω`} />
            </>
          ) : (
            <>
              <Resistor x={108} y={28} label={`${r1} Ω`} />
              <Resistor x={108} y={82} label={`${r2} Ω`} />
            </>
          )}
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-3">
        <Slider label="Gerilim (V)" value={volt} display={String(volt)} min={3} max={24} step={3} onChange={setVolt} />
        <Slider label="R₁ (Ω)" value={r1} display={String(r1)} min={1} max={12} step={1} onChange={setR1} />
        <Slider label="R₂ (Ω)" value={r2} display={String(r2)} min={1} max={12} step={1} onChange={setR2} />
      </div>

      <div className="mt-3 grid grid-cols-2 gap-2 sm:grid-cols-3">
        <Stat label="Eşdeğer direnç" value={`${decimal.format(req)} Ω`} highlight />
        <Stat label="Toplam akım" value={`${decimal.format(total)} A`} />
        <Stat label="Toplam güç" value={`${decimal.format(power)} W`} />
        <Stat label="R₁: akım, gerilim" value={`${decimal.format(i1)} A, ${decimal.format(v1)} V`} />
        <Stat label="R₂: akım, gerilim" value={`${decimal.format(i2)} A, ${decimal.format(v2)} V`} />
      </div>
    </SimFrame>
  )
}
