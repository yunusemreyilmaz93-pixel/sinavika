import { CalendarDays } from 'lucide-react'
import type { ButtonHTMLAttributes, ReactNode } from 'react'
import { Select } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import type { Curriculum } from '@/lib/data'
import { formatDate, shiftDays, todayISO } from '@/lib/dates'
import { subjectColor, type Subject } from '@/lib/exam'

export function chipClass(selected: boolean) {
  return cn(
    'relative inline-flex h-11 shrink-0 items-center gap-2 rounded-xl border px-3.5 text-sm font-semibold whitespace-nowrap transition-[background-color,border-color,color,transform] duration-150 select-none active:scale-[0.97]',
    selected ? 'border-primary bg-primary-soft text-primary-soft-fg' : 'border-line bg-surface text-fg hover:border-line-strong',
  )
}

export function ChoiceChip({
  selected,
  className,
  children,
  ...props
}: ButtonHTMLAttributes<HTMLButtonElement> & { selected: boolean }) {
  return (
    <button type="button" role="radio" aria-checked={selected} className={cn(chipClass(selected), className)} {...props}>
      {children}
    </button>
  )
}

export function Group({ label, hint, children, className }: { label: string; hint?: ReactNode; children: ReactNode; className?: string }) {
  return (
    <div className={cn('flex flex-col gap-2', className)}>
      <div className="flex items-baseline justify-between gap-3">
        <span className="text-sm font-semibold">{label}</span>
        {hint && <span className="text-xs text-muted">{hint}</span>}
      </div>
      {children}
    </div>
  )
}

export function SubjectPicker({
  subjects,
  value,
  onChange,
  multiExam,
  bleed = '-mx-5 px-5 scroll-px-5',
}: {
  subjects: Subject[]
  value: string | null
  onChange: (id: string) => void
  multiExam: boolean
  bleed?: string
}) {
  return (
    <Group label="Ders">
      <div
        role="radiogroup"
        aria-label="Ders"
        className={cn('scrollbar-none flex snap-x gap-2 overflow-x-auto pb-0.5 sm:mx-0 sm:flex-wrap sm:overflow-visible sm:px-0', bleed)}
      >
        {subjects.map((s) => (
          <ChoiceChip key={s.id} selected={s.id === value} onClick={() => onChange(s.id)} className="snap-start">
            <span aria-hidden className="size-2.5 rounded-full" style={{ backgroundColor: subjectColor(s) }} />
            {s.short}
            {multiExam && <span className="text-[11px] font-bold opacity-60">{s.exam}</span>}
          </ChoiceChip>
        ))}
      </div>
    </Group>
  )
}

export function TopicSelect({
  curriculum,
  subjectId,
  value,
  onChange,
}: {
  curriculum: Curriculum | undefined
  subjectId: string | null
  value: number | null
  onChange: (id: number | null) => void
}) {
  const topics = (subjectId && curriculum?.topicsBySubject.get(subjectId)) || []
  return (
    <label className="flex flex-col gap-2">
      <span className="flex items-baseline justify-between gap-3">
        <span className="text-sm font-semibold">Konu</span>
        <span className="text-xs text-muted">İsteğe bağlı</span>
      </span>
      <Select
        value={value ?? ''}
        disabled={!subjectId || topics.length === 0}
        onChange={(e) => onChange(e.target.value ? Number(e.target.value) : null)}
      >
        <option value="">{subjectId ? 'Konu seçilmedi' : 'Önce ders seç'}</option>
        {topics.map((t) => (
          <option key={t.id} value={t.id}>
            {t.name}
          </option>
        ))}
      </Select>
    </label>
  )
}

export function DatePicker({ value, onChange }: { value: string; onChange: (iso: string) => void }) {
  const today = todayISO()
  const yesterday = shiftDays(today, -1)
  const other = value !== today && value !== yesterday
  return (
    <Group label="Tarih">
      <div className="grid grid-cols-3 gap-2">
        <ChoiceChip selected={value === today} onClick={() => onChange(today)} className="justify-center">
          Bugün
        </ChoiceChip>
        <ChoiceChip selected={value === yesterday} onClick={() => onChange(yesterday)} className="justify-center">
          Dün
        </ChoiceChip>
        <label
          className={cn(
            chipClass(other),
            'cursor-pointer justify-center px-2 focus-within:ring-3 focus-within:ring-accent/25',
          )}
        >
          <CalendarDays className="size-4 shrink-0" />
          <span className="truncate">{other ? formatDate(value, 'd MMM') : 'Diğer'}</span>
          <input
            type="date"
            aria-label="Başka bir gün seç"
            value={value}
            max={today}
            min={shiftDays(today, -365)}
            onChange={(e) => {
              if (e.target.value && e.target.value <= today) onChange(e.target.value)
            }}
            onClick={(e) => {
              try {
                e.currentTarget.showPicker?.()
              } catch {
                /* tarayıcı izin vermezse yerel davranış kalır */
              }
            }}
            className="absolute inset-0 size-full cursor-pointer opacity-0"
          />
        </label>
      </div>
    </Group>
  )
}

export function FormSkeleton() {
  return (
    <div className="space-y-5" aria-busy="true" aria-label="Yükleniyor">
      <div className="flex gap-2 overflow-hidden">
        <Skeleton className="h-11 w-24 shrink-0" />
        <Skeleton className="h-11 w-20 shrink-0" />
        <Skeleton className="h-11 w-24 shrink-0" />
        <Skeleton className="h-11 w-16 shrink-0" />
      </div>
      <Skeleton className="h-11" />
      <Skeleton className="h-36" />
      <Skeleton className="h-12" />
    </div>
  )
}
