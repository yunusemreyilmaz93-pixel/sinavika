import { CalendarClock } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { Card } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { examDateFor, useSettings } from '@/lib/data'
import { daysBetween, formatDate, todayISO } from '@/lib/dates'
import { trackLabel, type Track } from '@/lib/exam'

export function ExamCountdown({ track, className }: { track: Track; className?: string }) {
  const settings = useSettings()
  const exam = examDateFor(settings.data, track)
  const name = trackLabel[track]

  if (settings.isPending) return <Skeleton className={cn('h-[104px] rounded-2xl', className)} />
  if (!exam) return null

  const days = daysBetween(todayISO(), exam.date)

  return (
    <Card className={cn('grid-paper flex items-center gap-4 overflow-hidden p-4 sm:p-5', className)}>
      <span className="grid size-12 shrink-0 place-items-center rounded-2xl bg-accent-soft text-accent-soft-fg" aria-hidden>
        <CalendarClock className="size-6" />
      </span>
      <div className="min-w-0 flex-1">
        {days > 0 ? (
          <p className="font-display text-2xl leading-tight font-extrabold sm:text-[28px]">
            {name}'ye <span className="tabular">{days}</span> gün
          </p>
        ) : days === 0 ? (
          <p className="font-display text-2xl leading-tight font-extrabold">{name} bugün</p>
        ) : (
          <p className="font-display text-xl leading-tight font-bold">{name} tarihi geçti</p>
        )}
        <p className="mt-1 flex flex-wrap items-center gap-x-2 gap-y-1 text-sm text-muted">
          <span>{formatDate(exam.date, 'd MMMM yyyy EEEE')}</span>
          {!exam.official && (
            <Badge tone="neutral" title="Resmi tarih açıklanınca güncellenir">
              tahmini
            </Badge>
          )}
        </p>
      </div>
    </Card>
  )
}
