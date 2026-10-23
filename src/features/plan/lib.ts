import { BookOpen, BookText, CirclePlay, ListChecks, RotateCcw, Shapes, type LucideIcon } from 'lucide-react'
import { z } from 'zod'
import { daysBetween, formatDate, shiftDays, weekStartISO } from '@/lib/dates'
import type { Subject, Topic } from '@/lib/exam'
import type { Enums, Tables } from '@/lib/supabase'

export type Task = Tables<'tasks'>
export type TaskKind = Enums<'task_kind'>
export type PlanViewer = 'student' | 'teacher' | 'parent'
export type TaskValues = Pick<
  Task,
  'title' | 'kind' | 'subject_id' | 'topic_id' | 'target_questions' | 'target_minutes' | 'note' | 'video_id' | 'video_title'
>

export const weekdayShort = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz']
export const weekdayLong = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar']

export function weekdayIndex(iso: string) {
  return daysBetween(weekStartISO(iso), iso)
}

export function dayTitle(iso: string) {
  return `${formatDate(iso, 'd MMMM')} ${weekdayLong[weekdayIndex(iso)]}`
}

export function overdueLabel(iso: string, today: string) {
  const late = daysBetween(iso, today)
  if (late === 1) return 'Dün'
  return `${formatDate(iso, 'd MMM')}, ${late} gün önce`
}

export const taskKinds: { value: TaskKind; label: string; icon: LucideIcon }[] = [
  { value: 'study', label: 'Konu çalışma', icon: BookOpen },
  { value: 'questions', label: 'Soru çözme', icon: ListChecks },
  { value: 'reading', label: 'Okuma', icon: BookText },
  { value: 'video', label: 'Video', icon: CirclePlay },
  { value: 'review', label: 'Tekrar', icon: RotateCcw },
  { value: 'other', label: 'Diğer', icon: Shapes },
]

export const kindLabel = Object.fromEntries(taskKinds.map((k) => [k.value, k.label])) as Record<TaskKind, string>

export function suggestTitle(input: {
  kind: TaskKind
  subject?: Pick<Subject, 'name'> | null
  topic?: Pick<Topic, 'name'> | null
  targetQuestions?: number | null
}) {
  const base = input.topic?.name ?? input.subject?.name
  if (!base) return ''
  if (input.kind === 'questions' && input.targetQuestions) return `${base} · ${input.targetQuestions} soru`
  if (input.kind === 'other') return base
  return `${base} · ${kindLabel[input.kind]}`
}

export function targetsText(task: Pick<Task, 'target_questions' | 'target_minutes'>) {
  const parts: string[] = []
  if (task.target_questions) parts.push(`${task.target_questions} soru`)
  if (task.target_minutes) parts.push(`${task.target_minutes} dk`)
  return parts
}

export function isTeacherTask(task: Pick<Task, 'created_by' | 'student_id'>) {
  return task.created_by !== task.student_id
}

export type TaskPermissions = { canToggle: boolean; canEdit: boolean; canMove: boolean }

export function permissionsFor(viewer: PlanViewer, task: Pick<Task, 'created_by' | 'student_id'>): TaskPermissions {
  if (viewer === 'teacher') return { canToggle: true, canEdit: true, canMove: true }
  if (viewer === 'student') {
    const own = !isTeacherTask(task)
    return { canToggle: true, canEdit: own, canMove: own }
  }
  return { canToggle: false, canEdit: false, canMove: false }
}

export function sortTasks(tasks: Task[]) {
  return [...tasks].sort((a, b) => a.sort - b.sort || a.created_at.localeCompare(b.created_at) || a.id - b.id)
}

const istanbulDay = new Intl.DateTimeFormat('en-CA', {
  timeZone: 'Europe/Istanbul',
  year: 'numeric',
  month: '2-digit',
  day: '2-digit',
})

export function istanbulDate(ts: string) {
  return istanbulDay.format(new Date(ts))
}

export function weekRangeLabel(start: string) {
  const end = shiftDays(start, 6)
  const sameMonth = start.slice(0, 7) === end.slice(0, 7)
  const thisYear = String(new Date().getFullYear())
  const year = end.slice(0, 4) === thisYear ? '' : ` ${end.slice(0, 4)}`
  if (sameMonth) return `${formatDate(start, 'd')} - ${formatDate(end, 'd MMMM')}${year}`
  return `${formatDate(start, 'd MMMM')} - ${formatDate(end, 'd MMMM')}${year}`
}

export function weekRelativeLabel(start: string, current: string) {
  if (start === current) return 'Bu hafta'
  if (start === shiftDays(current, -7)) return 'Geçen hafta'
  if (start === shiftDays(current, 7)) return 'Gelecek hafta'
  return null
}

export function dayCounts(tasks: Task[]) {
  return { total: tasks.length, done: tasks.filter((t) => t.done_at).length }
}

const nullableInt = (min: number, max: number) =>
  z
    .number()
    .int()
    .min(min)
    .max(max)
    .nullish()
    .catch(null)
    .transform((v) => v ?? null)

export const templateItemSchema = z.object({
  week: z.number().int().min(0).max(11).catch(0),
  weekday: z.number().int().min(0).max(6),
  title: z.string().trim().min(1).max(140),
  kind: z.enum(['study', 'questions', 'reading', 'video', 'review', 'other']).catch('study'),
  subject_id: z.string().nullish().catch(null).transform((v) => v ?? null),
  topic_id: z.number().int().nullish().catch(null).transform((v) => v ?? null),
  target_questions: nullableInt(1, 2000),
  target_minutes: nullableInt(1, 600),
  note: z.string().max(500).nullish().catch(null).transform((v) => v || null),
})

export type TemplateItem = z.infer<typeof templateItemSchema>

export function parseTemplateItems(value: unknown): TemplateItem[] {
  if (!Array.isArray(value)) return []
  return value.flatMap((raw) => {
    const parsed = templateItemSchema.safeParse(raw)
    return parsed.success ? [parsed.data] : []
  })
}
