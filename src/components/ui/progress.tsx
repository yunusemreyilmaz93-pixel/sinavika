import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { cn } from '@/lib/cn'

export function ProgressRing({
  value,
  size = 64,
  stroke = 7,
  className,
  children,
  tone = 'primary',
}: {
  value: number
  size?: number
  stroke?: number
  className?: string
  children?: ReactNode
  tone?: 'primary' | 'accent' | 'marker'
}) {
  const r = (size - stroke) / 2
  const c = 2 * Math.PI * r
  const clamped = Math.max(0, Math.min(1, value))
  const color = { primary: 'var(--primary)', accent: 'var(--accent)', marker: 'var(--marker)' }[tone]
  return (
    <div className={cn('relative inline-grid place-items-center', className)} style={{ width: size, height: size }}>
      <svg width={size} height={size} className="-rotate-90" aria-hidden>
        <circle cx={size / 2} cy={size / 2} r={r} fill="none" stroke="var(--surface-2)" strokeWidth={stroke} />
        <motion.circle
          cx={size / 2}
          cy={size / 2}
          r={r}
          fill="none"
          stroke={color}
          strokeWidth={stroke}
          strokeLinecap="round"
          strokeDasharray={c}
          initial={{ strokeDashoffset: c }}
          animate={{ strokeDashoffset: c * (1 - clamped) }}
          transition={{ duration: 0.9, ease: [0.22, 1, 0.36, 1] }}
        />
      </svg>
      {children && <div className="absolute inset-0 grid place-items-center">{children}</div>}
    </div>
  )
}

export function ProgressBar({ value, className, tone = 'primary' }: { value: number; className?: string; tone?: 'primary' | 'accent' | 'warning' | 'danger' }) {
  const clamped = Math.max(0, Math.min(1, value))
  const bg = { primary: 'bg-primary', accent: 'bg-accent', warning: 'bg-warning', danger: 'bg-danger' }[tone]
  return (
    <div className={cn('h-2 overflow-hidden rounded-full bg-surface-2', className)} role="progressbar" aria-valuemin={0} aria-valuemax={100} aria-valuenow={Math.round(clamped * 100)}>
      <motion.div
        className={cn('h-full rounded-full', bg)}
        initial={{ width: 0 }}
        animate={{ width: `${clamped * 100}%` }}
        transition={{ duration: 0.7, ease: [0.22, 1, 0.36, 1] }}
      />
    </div>
  )
}
