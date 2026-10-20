import { useState, type ReactNode } from 'react'
import { cn } from '@/lib/cn'
import { formatDate, formatDay, formatMinutes, shiftDays, weekStartISO } from '@/lib/dates'
import { formatCount, type StudyActivity } from './stats'

const WEEKS = 12
const levels = ['bg-surface-2', 'bg-primary/25', 'bg-primary/45', 'bg-primary/70', 'bg-primary']
const dayLabels = ['Pzt', '', 'Çar', '', 'Cum', '', '']

function describe(activity: StudyActivity, iso: string) {
  const d = activity.byDay.get(iso)
  const parts: string[] = []
  if (d?.minutes) parts.push(formatMinutes(d.minutes))
  if (d?.questions) parts.push(`${formatCount(d.questions)} soru`)
  return parts.length ? parts.join(', ') : 'Kayıt yok'
}

export function ActivityCalendar({ activity }: { activity: StudyActivity }) {
  const { today } = activity
  const [selected, setSelected] = useState(today)
  const start = shiftDays(weekStartISO(today), -7 * (WEEKS - 1))
  const weeks = Array.from({ length: WEEKS }, (_, w) => Array.from({ length: 7 }, (_, d) => shiftDays(start, w * 7 + d)))

  let max = 0
  for (const week of weeks)
    for (const iso of week) {
      const d = activity.byDay.get(iso)
      if (d) max = Math.max(max, d.minutes + d.questions)
    }
  const level = (iso: string) => {
    const d = activity.byDay.get(iso)
    const score = d ? d.minutes + d.questions : 0
    return score && max ? Math.min(4, Math.max(1, Math.ceil((score / max) * 4))) : 0
  }

  return (
    <div className="mx-auto w-full max-w-[440px]">
      <div className="grid grid-cols-[1.75rem_repeat(12,minmax(0,1fr))] gap-[3px] sm:gap-1">
        <span />
        {weeks.map((week, i) => {
          const month = week[0].slice(0, 7)
          const show = i === 0 || month !== weeks[i - 1][0].slice(0, 7)
          return (
            <span key={week[0]} className="h-4 overflow-visible text-[10px] leading-4 font-semibold whitespace-nowrap text-muted">
              {show ? formatDate(week[0], 'MMM') : ''}
            </span>
          )
        })}
        {dayLabels.map((label, d) => (
          <Row key={d} label={label}>
            {weeks.map((week) => {
              const iso = week[d]
              if (iso > today) return <span key={iso} aria-hidden className="aspect-square" />
              const info = `${formatDate(iso, 'd MMMM EEEE')}: ${describe(activity, iso)}`
              return (
                <button
                  key={iso}
                  type="button"
                  title={info}
                  aria-label={info}
                  aria-pressed={iso === selected}
                  onClick={() => setSelected(iso)}
                  className={cn(
                    'aspect-square rounded-[4px] transition-[box-shadow] duration-150 outline-offset-1',
                    levels[level(iso)],
                    iso === selected && 'ring-2 ring-fg/70 ring-offset-1 ring-offset-surface',
                    iso === today && iso !== selected && 'ring-1 ring-line-strong',
                  )}
                />
              )
            })}
          </Row>
        ))}
      </div>
      <div className="mt-3 flex flex-wrap items-center justify-between gap-x-4 gap-y-2 text-xs text-muted">
        <p aria-live="polite">
          <span className="font-semibold text-fg">{formatDay(selected)}</span> · {describe(activity, selected)}
        </p>
        <span className="inline-flex items-center gap-1" aria-hidden>
          Az
          {levels.map((c) => (
            <span key={c} className={cn('size-3 rounded-[3px]', c)} />
          ))}
          Çok
        </span>
      </div>
    </div>
  )
}

function Row({ label, children }: { label: string; children: ReactNode }) {
  return (
    <>
      <span className="self-center text-[10px] leading-none font-semibold text-muted">{label}</span>
      {children}
    </>
  )
}
