import { ChevronLeft, ChevronRight } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/cn'
import { daysBetween, shiftDays, weekStartISO } from '@/lib/dates'
import { weekRangeLabel, weekRelativeLabel } from './lib'

export function WeekNav({
  week,
  onChange,
  size = 'md',
  className,
}: {
  week: string
  onChange: (week: string) => void
  size?: 'sm' | 'md'
  className?: string
}) {
  const current = weekStartISO()
  const offset = Math.round(daysBetween(current, week) / 7)
  const relative =
    weekRelativeLabel(week, current) ?? (offset > 0 ? `${offset} hafta sonra` : `${-offset} hafta önce`)

  return (
    <div className={cn('flex items-center gap-2', className)}>
      <div className="min-w-0 flex-1" aria-live="polite">
        <p className={cn('truncate font-display font-bold tabular', size === 'md' ? 'text-lg sm:text-xl' : 'text-base')}>
          {weekRangeLabel(week)}
        </p>
        <p className={cn('text-sm', offset === 0 ? 'font-semibold text-primary' : 'text-muted')}>{relative}</p>
      </div>
      <div className="flex items-center gap-1.5">
        {offset !== 0 && (
          <Button variant="secondary" size={size === 'md' ? 'md' : 'sm'} className="h-11" onClick={() => onChange(current)}>
            Bu hafta
          </Button>
        )}
        <Button variant="secondary" size="icon" aria-label="Önceki hafta" onClick={() => onChange(shiftDays(week, -7))}>
          <ChevronLeft />
        </Button>
        <Button variant="secondary" size="icon" aria-label="Sonraki hafta" onClick={() => onChange(shiftDays(week, 7))}>
          <ChevronRight />
        </Button>
      </div>
    </div>
  )
}
