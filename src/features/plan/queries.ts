import { queryOptions, useMutation, useQuery, useQueryClient, type QueryClient } from '@tanstack/react-query'
import { toast } from 'sonner'
import { keys } from '@/lib/data'
import { formatDay } from '@/lib/dates'
import { AppError, errorMessage, supabase, unwrap, type Tables } from '@/lib/supabase'
import { sortTasks, type Task, type TaskValues } from './lib'

export function tasksQuery(studentId: string, from: string, to: string) {
  return queryOptions({
    queryKey: keys.tasks(studentId, from, to),
    queryFn: async (): Promise<Task[]> =>
      unwrap(
        await supabase
          .from('tasks')
          .select('*')
          .eq('student_id', studentId)
          .gte('due_on', from)
          .lte('due_on', to)
          .order('sort')
          .order('created_at')
          .order('id'),
      ),
  })
}

export function useTasks(studentId: string, from: string, to: string) {
  return useQuery(tasksQuery(studentId, from, to))
}

export type PlanStudent = Pick<Tables<'students'>, 'id' | 'track' | 'grade' | 'field'>

export function usePlanStudent(studentId: string) {
  return useQuery({
    queryKey: [...keys.student(studentId), 'plan'],
    staleTime: 5 * 60_000,
    queryFn: async (): Promise<PlanStudent> =>
      unwrap(await supabase.from('students').select('id, track, grade, field').eq('id', studentId).single()),
  })
}

const isoDate = /^\d{4}-\d{2}-\d{2}$/

function isTaskList(data: unknown): data is Task[] {
  return Array.isArray(data) && data.every((t) => t && typeof t === 'object' && 'id' in t && 'due_on' in t)
}

function writeTask(qc: QueryClient, studentId: string, next: Task) {
  for (const [key, data] of qc.getQueriesData({ queryKey: ['tasks', studentId] })) {
    if (!isTaskList(data)) continue
    const [, , from, to] = key as unknown[]
    const ranged = typeof from === 'string' && typeof to === 'string' && isoDate.test(from) && isoDate.test(to)
    const present = data.some((t) => t.id === next.id)
    const belongs = ranged ? next.due_on >= from && next.due_on <= to : present
    if (!present && !belongs) continue
    const rest = data.filter((t) => t.id !== next.id)
    qc.setQueryData(key, belongs ? sortTasks([...rest, next]) : rest)
  }
}

function dropTask(qc: QueryClient, studentId: string, id: number) {
  for (const [key, data] of qc.getQueriesData({ queryKey: ['tasks', studentId] })) {
    if (isTaskList(data) && data.some((t) => t.id === id)) qc.setQueryData(key, data.filter((t) => t.id !== id))
  }
}

export function invalidateTasks(qc: QueryClient, studentIds: string[]) {
  return Promise.all([
    ...studentIds.map((id) => qc.invalidateQueries({ queryKey: ['tasks', id] })),
    qc.invalidateQueries({ queryKey: keys.overview }),
  ])
}

type Patch = Partial<Pick<Task, 'done_at' | 'due_on'>>

async function updateTask(id: number, patch: Partial<TaskValues & Pick<Task, 'done_at' | 'due_on'>>) {
  const rows = unwrap(await supabase.from('tasks').update(patch).eq('id', id).select())
  if (!rows.length) throw new AppError('Bu görevi değiştirme yetkin yok')
  return rows[0]
}

export function useTaskActions(studentId: string) {
  const qc = useQueryClient()

  const patch = useMutation({
    mutationFn: ({ task, patch }: { task: Task; patch: Patch; silent?: boolean }) => updateTask(task.id, patch),
    onMutate: async ({ task, patch }) => {
      await qc.cancelQueries({ queryKey: ['tasks', studentId] })
      writeTask(qc, studentId, { ...task, ...patch })
      return { task }
    },
    onError: (error, _vars, context) => {
      if (context) writeTask(qc, studentId, context.task)
      toast.error(errorMessage(error))
    },
    onSuccess: (_row, { patch, silent }) => {
      if (patch.due_on && !silent) toast.success(`Görev taşındı: ${formatDay(patch.due_on)}`)
    },
    onSettled: () => invalidateTasks(qc, [studentId]),
  })

  const save = useMutation({
    mutationFn: async ({ id, values }: { id?: number; values: TaskValues & { due_on: string } }) => {
      if (id) return updateTask(id, values)
      return unwrap(await supabase.from('tasks').insert({ ...values, student_id: studentId }).select().single())
    },
    onSuccess: (row) => {
      writeTask(qc, studentId, row)
      void invalidateTasks(qc, [studentId])
    },
  })

  const remove = useMutation({
    mutationFn: async (task: Task) => {
      const rows = unwrap(await supabase.from('tasks').delete().eq('id', task.id).select('id'))
      if (!rows.length) throw new AppError('Bu görevi silme yetkin yok')
    },
    onSuccess: (_data, task) => {
      dropTask(qc, studentId, task.id)
      toast.success('Görev silindi')
      void invalidateTasks(qc, [studentId])
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  return {
    toggle: (task: Task, done: boolean) =>
      patch.mutate({ task, patch: { done_at: done ? new Date().toISOString() : null } }),
    move: (task: Task, dueOn: string, silent = false) => {
      if (dueOn !== task.due_on) patch.mutate({ task, patch: { due_on: dueOn }, silent })
    },
    save,
    remove,
  }
}
