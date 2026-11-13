import { useQuery } from '@tanstack/react-query'
import { Check } from 'lucide-react'
import { useEffect, useRef } from 'react'
import { Avatar } from '@/components/ui/avatar'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { studentLabel } from '@/lib/exam'
import { supabase, unwrap } from '@/lib/supabase'
import type { PlanStudent, WeekSummary } from './queries'

export type PlannerStudent = PlanStudent & { full_name: string }

export function usePlannerStudents(teacherId: string) {
  return useQuery({
    queryKey: ['plan', 'students', teacherId],
    queryFn: async (): Promise<PlannerStudent[]> => {
      const students = unwrap(
        await supabase
          .from('students')
          .select('id, track, grade, field')
          .eq('teacher_id', teacherId)
          .is('archived_at', null),
      )
      if (!students.length) return []
      const names = unwrap(
        await supabase
          .from('profiles')
          .select('id, full_name')
          .in(
            'id',
            students.map((s) => s.id),
          ),
      )
      const nameById = new Map(names.map((n) => [n.id, n.full_name]))
      return students
        .map((s) => ({ ...s, full_name: nameById.get(s.id) ?? 'Öğrenci' }))
        .sort((a, b) => a.full_name.localeCompare(b.full_name, 'tr'))
    },
  })
}

export function firstName(name: string) {
  return name.trim().split(/\s+/)[0] ?? name
}

export function StudentChips({
  students,
  selected,
  onToggle,
  multiple = false,
  label,
  className,
}: {
  students: PlannerStudent[]
  selected: string[]
  onToggle: (id: string) => void
  multiple?: boolean
  label: string
  className?: string
}) {
  const firsts = students.map((s) => firstName(s.full_name))
  const shortName = (s: PlannerStudent, i: number) =>
    firsts.filter((f) => f === firsts[i]).length > 1 ? s.full_name : firsts[i]
  return (
    <div
      role={multiple ? 'group' : 'radiogroup'}
      aria-label={label}
      className={cn('scrollbar-none -mx-1 flex gap-2 overflow-x-auto p-1', multiple && 'flex-wrap overflow-visible', className)}
    >
      {students.map((s, i) => {
        const active = selected.includes(s.id)
        return (
          <button
            key={s.id}
            type="button"
            role={multiple ? 'checkbox' : 'radio'}
            aria-checked={active}
            onClick={() => onToggle(s.id)}
            className={cn(
              'flex h-11 shrink-0 items-center gap-2 rounded-full border py-1 pr-4 pl-1 text-sm font-semibold transition-colors',
              active
                ? 'border-primary bg-primary-soft text-primary-soft-fg'
                : 'border-line bg-surface text-fg hover:border-line-strong',
            )}
          >
            {multiple && active ? (
              <span className="grid size-8 place-items-center rounded-full bg-primary text-primary-fg">
                <Check className="size-4" strokeWidth={3} aria-hidden />
              </span>
            ) : (
              <Avatar name={s.full_name} userId={s.id} className="size-8 text-xs" />
            )}
            {multiple ? s.full_name : shortName(s, i)}
          </button>
        )
      })}
    </div>
  )
}

// Planlayıcıda öğrenci seçimi: her kartta öğrencinin o haftaki ilerlemesi görünür, planı olmayan öğrenci hemen fark edilir
export function StudentRail({
  students,
  selected,
  onSelect,
  summary,
}: {
  students: PlannerStudent[]
  selected: string
  onSelect: (id: string) => void
  summary?: WeekSummary
}) {
  const ref = useRef<HTMLDivElement>(null)

  // Telefonda kartlar yana kayar, seçili öğrenci görünür alana gelir
  useEffect(() => {
    const rail = ref.current
    const card = rail?.querySelector<HTMLElement>('[aria-checked="true"]')
    if (!rail || !card || rail.scrollWidth <= rail.clientWidth) return
    rail.scrollTo({ left: card.offsetLeft - rail.offsetLeft - 16 })
  }, [selected])

  return (
    <div
      ref={ref}
      role="radiogroup"
      aria-label="Öğrenci seç"
      className="scrollbar-none -mx-4 flex snap-x gap-2 overflow-x-auto px-4 py-1 sm:mx-0 sm:grid sm:grid-cols-[repeat(auto-fill,minmax(11rem,1fr))] sm:overflow-visible sm:px-0"
    >
      {students.map((s) => {
        const active = s.id === selected
        const week = summary?.get(s.id)
        return (
          <button
            key={s.id}
            type="button"
            role="radio"
            aria-checked={active}
            onClick={() => onSelect(s.id)}
            className={cn(
              'flex w-48 shrink-0 snap-start items-center gap-3 rounded-2xl border p-3 text-left transition-colors duration-150 sm:w-auto',
              active ? 'border-primary bg-primary-soft' : 'border-line bg-surface hover:border-line-strong',
            )}
          >
            <Avatar name={s.full_name} userId={s.id} className="size-10 text-sm" />
            <span className="min-w-0 flex-1">
              <span className={cn('block truncate text-sm font-bold', active && 'text-primary-soft-fg')}>{s.full_name}</span>
              <span className="block truncate text-xs text-muted">{studentLabel(s)}</span>
              <WeekMeter week={week} />
            </span>
          </button>
        )
      })}
    </div>
  )
}

function WeekMeter({ week }: { week?: { total: number; done: number } }) {
  if (!week) return <Skeleton className="mt-2 h-1.5 w-full" />
  if (!week.total) return <span className="mt-1 block text-xs font-semibold text-warning">Bu hafta plan yok</span>
  const complete = week.done === week.total
  return (
    <span className="mt-1.5 flex items-center gap-2" aria-label={`Bu hafta ${week.done}/${week.total} görev tamamlandı`}>
      <span className="h-1.5 flex-1 overflow-hidden rounded-full bg-line">
        <span
          className={cn('block h-full rounded-full transition-[width] duration-300', complete ? 'bg-success' : 'bg-primary')}
          style={{ width: `${(week.done / week.total) * 100}%` }}
        />
      </span>
      <span className={cn('tabular text-xs font-semibold', complete ? 'text-success' : 'text-muted')}>
        {week.done}/{week.total}
      </span>
    </span>
  )
}
