import { useQuery } from '@tanstack/react-query'
import { Check } from 'lucide-react'
import { Avatar } from '@/components/ui/avatar'
import { cn } from '@/lib/cn'
import { supabase, unwrap } from '@/lib/supabase'
import type { PlanStudent } from './queries'

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
