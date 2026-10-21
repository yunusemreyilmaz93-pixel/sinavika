import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { SimFrame, Slider, Stat, decimal } from './frame'

const PIVOT_X = 180
const PIVOT_Y = 125
const UNIT = 28

export function LeverSim() {
  const [load, setLoad] = useState(40)
  const [loadArm, setLoadArm] = useState(2)
  const [forceArm, setForceArm] = useState(4)
  const [force, setForce] = useState(20)

  const loadMoment = load * loadArm
  const forceMoment = force * forceArm
  const balanced = Math.abs(loadMoment - forceMoment) < 0.01
  const strongest = Math.max(loadMoment, forceMoment, 1)
  const angle = (15 * (forceMoment - loadMoment)) / strongest
  const needed = loadMoment / forceArm
  const size = 18 + load / 5

  return (
    <SimFrame
      title="Kaldıraç dengesi"
      hint="Kuvvet ve yükü uygulama noktalarını değiştir. Denge için kuvvet × kuvvet kolu, yük × yük koluna eşit olmalı."
    >
      <div className="mt-4 overflow-hidden rounded-xl border border-line bg-surface-2">
        <svg
          viewBox="0 0 360 190"
          role="img"
          aria-label={
            balanced ? 'Kaldıraç dengede' : forceMoment > loadMoment ? 'Kaldıraç kuvvet tarafına eğik' : 'Kaldıraç yük tarafına eğik'
          }
          className="block w-full"
        >
          <polygon
            points={`${PIVOT_X},${PIVOT_Y} ${PIVOT_X - 18},${PIVOT_Y + 40} ${PIVOT_X + 18},${PIVOT_Y + 40}`}
            className="fill-line-strong"
          />
          <line x1={20} y1={PIVOT_Y + 40} x2={340} y2={PIVOT_Y + 40} className="stroke-line-strong" strokeWidth={2} />
          <g
            style={{ transform: `rotate(${angle}deg)`, transformOrigin: `${PIVOT_X}px ${PIVOT_Y}px` }}
            className="transition-transform duration-300 motion-reduce:transition-none"
          >
            <line
              x1={PIVOT_X - 5 * UNIT - 10}
              y1={PIVOT_Y}
              x2={PIVOT_X + 5 * UNIT + 10}
              y2={PIVOT_Y}
              className="stroke-fg"
              strokeWidth={5}
              strokeLinecap="round"
            />
            {Array.from({ length: 11 }, (_, i) => (
              <line
                key={i}
                x1={PIVOT_X + (i - 5) * UNIT}
                y1={PIVOT_Y - 4}
                x2={PIVOT_X + (i - 5) * UNIT}
                y2={PIVOT_Y + 4}
                className="stroke-surface"
                strokeWidth={1.5}
              />
            ))}
            <rect
              x={PIVOT_X - loadArm * UNIT - size / 2}
              y={PIVOT_Y - 2.5 - size}
              width={size}
              height={size}
              rx={3}
              className="fill-primary"
            />
            <text
              x={PIVOT_X - loadArm * UNIT}
              y={PIVOT_Y - 2.5 - size / 2 + 4}
              textAnchor="middle"
              className="fill-primary-fg text-[11px] font-bold"
            >
              {load}
            </text>
            <g transform={`translate(${PIVOT_X + forceArm * UNIT} 0)`}>
              <line x1={0} y1={PIVOT_Y - 52} x2={0} y2={PIVOT_Y - 8} className="stroke-accent" strokeWidth={3} strokeLinecap="round" />
              <polygon points={`0,${PIVOT_Y - 3} -6,${PIVOT_Y - 14} 6,${PIVOT_Y - 14}`} className="fill-accent" />
              <text x={0} y={PIVOT_Y - 58} textAnchor="middle" className="fill-accent text-[11px] font-bold">
                {decimal.format(force)}
              </text>
            </g>
          </g>
          <text x={PIVOT_X} y={PIVOT_Y + 58} textAnchor="middle" className="fill-muted text-[11px]">
            dayanak noktası
          </text>
        </svg>
      </div>

      <div className="mt-3 grid gap-4 sm:grid-cols-2">
        <Slider label="Yük (N)" value={load} display={String(load)} min={10} max={100} step={10} onChange={setLoad} />
        <Slider label="Yük kolu" value={loadArm} display={String(loadArm)} min={1} max={5} step={1} onChange={setLoadArm} />
        <Slider label="Kuvvet (N)" value={force} display={decimal.format(force)} min={0} max={500} step={1} onChange={setForce} />
        <Slider label="Kuvvet kolu" value={forceArm} display={String(forceArm)} min={1} max={5} step={1} onChange={setForceArm} />
      </div>

      <div className="mt-3 grid gap-2 sm:grid-cols-3">
        <Stat label="Yük × yük kolu" value={`${load} × ${loadArm} = ${loadMoment}`} />
        <Stat label="Kuvvet × kuvvet kolu" value={`${decimal.format(force)} × ${forceArm} = ${decimal.format(forceMoment)}`} />
        <Stat
          label="Durum"
          value={balanced ? 'Denge' : forceMoment > loadMoment ? 'Kuvvet tarafı ağır' : 'Yük tarafı ağır'}
          highlight={balanced}
        />
      </div>
      <div className="mt-3 flex flex-wrap items-center gap-3">
        <Button variant="secondary" size="sm" className="min-h-11" onClick={() => setForce(needed)}>
          Dengeleyen kuvveti bul
        </Button>
        <p className="text-sm text-muted">
          Gereken kuvvet: <span className="tabular font-semibold text-fg">{decimal.format(needed)} N</span>
        </p>
      </div>
    </SimFrame>
  )
}
