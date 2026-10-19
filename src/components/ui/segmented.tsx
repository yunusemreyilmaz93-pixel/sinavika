import { motion } from 'motion/react'
import { useId } from 'react'
import { cn } from '@/lib/cn'

type Option<T extends string> = { value: T; label: string; badge?: number }

export function Segmented<T extends string>({
  options,
  value,
  onChange,
  className,
  size = 'md',
}: {
  options: Option<T>[]
  value: T
  onChange: (value: T) => void
  className?: string
  size?: 'sm' | 'md'
}) {
  const id = useId()
  return (
    <div role="tablist" className={cn('scrollbar-none flex gap-1 overflow-x-auto rounded-xl bg-surface-2 p-1', className)}>
      {options.map((o) => {
        const active = o.value === value
        return (
          <button
            key={o.value}
            role="tab"
            type="button"
            aria-selected={active}
            onClick={() => onChange(o.value)}
            className={cn(
              'relative flex flex-1 shrink-0 items-center justify-center gap-1.5 rounded-lg px-3 font-semibold whitespace-nowrap transition-colors',
              size === 'sm' ? 'h-8 text-[13px]' : 'h-9 text-sm',
              active ? 'text-fg' : 'text-muted hover:text-fg',
            )}
          >
            {active && (
              <motion.span
                layoutId={`seg-${id}`}
                className="absolute inset-0 rounded-lg bg-surface shadow-card"
                transition={{ type: 'spring', bounce: 0.15, duration: 0.35 }}
              />
            )}
            <span className="relative">{o.label}</span>
            {o.badge ? (
              <span className="relative rounded-full bg-accent px-1.5 text-[11px] leading-4 text-white">{o.badge}</span>
            ) : null}
          </button>
        )
      })}
    </div>
  )
}
