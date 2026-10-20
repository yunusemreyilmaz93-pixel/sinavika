import { motion } from 'motion/react'
import { cn } from '@/lib/cn'

const MAX_SEGMENTS = 20

export function CapacityMeter({
  used,
  capacity,
  pending = 0,
  className,
}: {
  used: number
  capacity: number
  pending?: number
  className?: string
}) {
  const total = Math.max(1, capacity)
  const count = Math.min(total, MAX_SEGMENTS)
  const scale = count / total
  const filled = Math.min(count, Math.round(used * scale))
  const waiting = Math.min(filled, Math.round(Math.min(pending, used) * scale))
  const free = Math.max(0, capacity - used)
  const full = free === 0

  return (
    <div className={cn('min-w-0', className)}>
      <div className="flex items-baseline justify-between gap-3">
        <p className="tabular">
          <span className="font-display text-2xl font-bold">{used}</span>
          <span className="font-semibold text-muted">/{capacity} öğrenci</span>
        </p>
        <p className={cn('text-sm font-semibold', full ? 'text-warning' : 'text-muted')}>
          {full ? 'Kontenjan dolu' : `${free} yer boş`}
        </p>
      </div>
      <div
        role="meter"
        aria-label="Öğrenci kontenjanı"
        aria-valuemin={0}
        aria-valuemax={capacity}
        aria-valuenow={Math.min(used, capacity)}
        aria-valuetext={`${used}/${capacity} öğrenci`}
        className="mt-2 flex gap-1"
      >
        {Array.from({ length: count }, (_, i) => {
          const state = i < filled - waiting ? 'active' : i < filled ? 'pending' : 'empty'
          return (
            <span key={i} className="h-2.5 flex-1 overflow-hidden rounded-full bg-surface-2">
              {state !== 'empty' && (
                <motion.span
                  className={cn('block h-full origin-left rounded-full', state === 'active' ? 'bg-primary' : 'bg-primary/35')}
                  initial={{ scaleX: 0 }}
                  animate={{ scaleX: 1 }}
                  transition={{ duration: 0.2, delay: i * 0.025, ease: 'easeOut' }}
                />
              )}
            </span>
          )
        })}
      </div>
      {pending > 0 && (
        <p className="mt-2 flex items-center gap-1.5 text-xs text-muted">
          <span className="inline-block h-2 w-3 rounded-full bg-primary/35" aria-hidden />
          {pending} davet katılım bekliyor
        </p>
      )}
    </div>
  )
}
