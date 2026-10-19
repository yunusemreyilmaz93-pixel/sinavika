import { Minus, Plus } from 'lucide-react'
import { cn } from '@/lib/cn'

type Props = {
  value: number
  onChange: (value: number) => void
  min?: number
  max?: number
  step?: number
  label: string
  tone?: 'default' | 'success' | 'danger' | 'muted'
  className?: string
}

const tones = {
  default: 'text-fg',
  success: 'text-success',
  danger: 'text-danger',
  muted: 'text-muted',
}

export function Stepper({ value, onChange, min = 0, max = 999, step = 1, label, tone = 'default', className }: Props) {
  const set = (next: number) => onChange(Math.min(max, Math.max(min, Number.isFinite(next) ? next : min)))
  return (
    <div className={cn('flex flex-col items-center gap-1.5', className)}>
      <span className="text-xs font-semibold tracking-wide text-muted uppercase">{label}</span>
      <div className="flex items-center rounded-xl border border-line bg-surface">
        <button
          type="button"
          aria-label={`${label} azalt`}
          onClick={() => set(value - step)}
          className="grid size-11 place-items-center rounded-l-xl text-muted transition-colors hover:bg-surface-2 active:scale-95"
        >
          <Minus className="size-4" />
        </button>
        <input
          inputMode="numeric"
          aria-label={label}
          value={value}
          onChange={(e) => set(parseInt(e.target.value.replace(/\D/g, '') || '0', 10))}
          onFocus={(e) => e.target.select()}
          className={cn('tabular w-12 bg-transparent text-center font-display text-lg font-bold outline-none', tones[tone])}
        />
        <button
          type="button"
          aria-label={`${label} artır`}
          onClick={() => set(value + step)}
          className="grid size-11 place-items-center rounded-r-xl text-muted transition-colors hover:bg-surface-2 active:scale-95"
        >
          <Plus className="size-4" />
        </button>
      </div>
    </div>
  )
}
