import type { ReactNode } from 'react'
import { cn } from '@/lib/cn'

const R = 92
const C = 2 * Math.PI * R
const ticks = Array.from({ length: 60 }, (_, i) => i)

export function formatClock(ms: number) {
  const total = Math.max(0, Math.ceil(ms / 1000))
  const h = Math.floor(total / 3600)
  const m = Math.floor((total % 3600) / 60)
  const s = total % 60
  const pad = (n: number) => String(n).padStart(2, '0')
  return h ? `${h}:${pad(m)}:${pad(s)}` : `${pad(m)}:${pad(s)}`
}

export function TimerRing({
  progress,
  remaining,
  tone = 'primary',
  dim,
  className,
  children,
}: {
  progress: number
  remaining: number
  tone?: 'primary' | 'accent'
  dim?: boolean
  className?: string
  children?: ReactNode
}) {
  const value = Math.max(0, Math.min(1, progress))
  const clock = formatClock(remaining)
  return (
    <div className={cn('relative mx-auto aspect-square w-full', className)}>
      <svg viewBox="0 0 200 200" className="size-full -rotate-90" aria-hidden>
        {ticks.map((i) => {
          const a = (i / 60) * 2 * Math.PI
          const long = i % 5 === 0
          const r1 = 99
          const r2 = long ? 95 : 97
          return (
            <line
              key={i}
              x1={100 + r1 * Math.cos(a)}
              y1={100 + r1 * Math.sin(a)}
              x2={100 + r2 * Math.cos(a)}
              y2={100 + r2 * Math.sin(a)}
              stroke="var(--line-strong)"
              strokeWidth={long ? 1 : 0.6}
            />
          )
        })}
        <circle cx="100" cy="100" r={R} fill="none" stroke="var(--surface-2)" strokeWidth="8" />
        <circle
          cx="100"
          cy="100"
          r={R}
          fill="none"
          stroke={tone === 'primary' ? 'var(--primary)' : 'var(--accent)'}
          strokeWidth="8"
          strokeLinecap="round"
          strokeDasharray={C}
          strokeDashoffset={C * (1 - value)}
          opacity={dim ? 0.45 : 1}
          style={{ transition: 'stroke-dashoffset 300ms linear, opacity 200ms ease' }}
        />
      </svg>
      <div className="absolute inset-0 flex flex-col items-center justify-center text-center">
        <span
          role="timer"
          aria-live="off"
          className={cn(
            'tabular font-display leading-none font-extrabold tracking-tight transition-opacity',
            clock.length > 5 ? 'text-[clamp(2.5rem,12vw,3.75rem)]' : 'text-[clamp(3.5rem,17vw,5.25rem)]',
            dim && 'opacity-60',
          )}
        >
          {clock}
        </span>
        {children}
      </div>
    </div>
  )
}
