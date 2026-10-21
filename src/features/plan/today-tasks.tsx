import { CalendarCheck, ChevronRight, Plus, TriangleAlert } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useMemo } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { ProgressRing } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { useAuth } from '@/features/auth/session'
import { useCurriculum } from '@/lib/data'
import { shiftDays, todayISO } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { celebrate } from './celebrate'
import { istanbulDate, overdueLabel, permissionsFor, sortTasks, type PlanViewer, type Task } from './lib'
import { useTasks } from './queries'
import { useTaskDialogs } from './task-dialogs'
import { TaskRow } from './task-row'
import { LoadError } from './load-error'

export function TodayTasks({ studentId, canEdit }: { studentId: string; canEdit: boolean }) {
  const { profile } = useAuth()
  const viewer: PlanViewer = !canEdit ? 'parent' : profile?.id === studentId ? 'student' : 'teacher'
  const today = todayISO()
  const from = shiftDays(today, -14)
  const tasks = useTasks(studentId, from, today)
  const curriculum = useCurriculum()
  const dialogs = useTaskDialogs(studentId)

  const { todays, overdue } = useMemo(() => {
    const list = sortTasks(tasks.data ?? [])
    return {
      todays: list.filter((t) => t.due_on === today),
      overdue: list.filter(
        (t) => t.due_on < today && (!t.done_at || istanbulDate(t.done_at) === today),
      ),
    }
  }, [tasks.data, today])

  const visible = [...todays, ...overdue]
  const doneToday = todays.filter((t) => t.done_at).length
  const planLink = viewer === 'teacher' ? `/app/planlayici?ogrenci=${studentId}` : '/app/plan'

  const toggle = (task: Task, done: boolean) => {
    if (done && viewer !== 'parent' && visible.every((t) => t.id === task.id || t.done_at)) celebrate()
    dialogs.actions.toggle(task, done)
  }

  const row = (task: Task, dueLabel?: string) => (
    <motion.li
      key={task.id}
      initial={{ opacity: 0, y: 6 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, transition: { duration: 0.15 } }}
      transition={{ duration: 0.2 }}
    >
      <TaskRow
        task={task}
        viewer={viewer}
        subject={task.subject_id ? curriculum.data?.subjectById.get(task.subject_id) : undefined}
        permissions={permissionsFor(viewer, task)}
        dueLabel={dueLabel}
        onToggle={(done) => toggle(task, done)}
        onEdit={() => dialogs.edit(task)}
        onMove={() => dialogs.move(task)}
        onDelete={() => dialogs.remove(task)}
      />
    </motion.li>
  )

  if (tasks.error) return <LoadError message={errorMessage(tasks.error)} onRetry={() => void tasks.refetch()} />

  if (tasks.isPending) {
    return (
      <Card aria-busy="true" aria-label="Görevler yükleniyor">
        <div className="flex items-center justify-between px-4 pt-4">
          <Skeleton className="h-5 w-40" />
          <Skeleton className="size-11 rounded-full" />
        </div>
        <div className="space-y-3 p-4">
          <Skeleton className="h-12" />
          <Skeleton className="h-12" />
        </div>
      </Card>
    )
  }

  if (!visible.length) {
    return (
      <>
        <EmptyState
          icon={CalendarCheck}
          title="Bugün için görev yok"
          description={
            viewer === 'student'
              ? 'Bugün ne çalışacağını ekle, bitirince işaretle.'
              : viewer === 'teacher'
                ? 'Bugüne bir görev ekle, öğrencine bildirim gider.'
                : 'Öğretmen görev ekleyince burada görünür.'
          }
          action={
            canEdit ? (
              <Button onClick={() => dialogs.add(today)}>
                <Plus />
                Görev ekle
              </Button>
            ) : undefined
          }
        />
        {dialogs.dialogs}
      </>
    )
  }

  return (
    <Card className="overflow-hidden">
      <div className="flex items-center justify-between gap-3 px-4 pt-4 sm:px-5">
        <div className="min-w-0">
          <h3 className="text-base font-bold">Bugünün görevleri</h3>
          <Link
            to={planLink}
            className="mt-0.5 inline-flex min-h-6 items-center gap-0.5 text-sm font-semibold text-accent hover:underline"
          >
            Haftalık plan
            <ChevronRight className="size-4" aria-hidden />
          </Link>
        </div>
        <div className="flex items-center gap-1">
          {canEdit && (
            <Button variant="ghost" size="icon" aria-label="Bugüne görev ekle" onClick={() => dialogs.add(today)}>
              <Plus />
            </Button>
          )}
          {todays.length > 0 && (
            <ProgressRing value={doneToday / todays.length} size={48} stroke={5}>
              <span className="tabular text-xs font-bold" aria-label={`${doneToday}/${todays.length} tamamlandı`}>
                {doneToday}/{todays.length}
              </span>
            </ProgressRing>
          )}
        </div>
      </div>

      {todays.length > 0 ? (
        <ul className="mt-2 divide-y divide-line">
          <AnimatePresence initial={false}>{todays.map((t) => row(t))}</AnimatePresence>
        </ul>
      ) : (
        <p className="px-4 pt-3 pb-1 text-sm text-muted sm:px-5">Bugün için görev yok.</p>
      )}

      {overdue.length > 0 && (
        <div className="mt-2 border-t border-line bg-warning-soft/30">
          <h4 className="flex items-center gap-1.5 px-4 pt-3 text-sm font-bold text-warning sm:px-5">
            <TriangleAlert className="size-4" aria-hidden />
            Geciken görevler
            <span className="tabular font-semibold">({overdue.filter((t) => !t.done_at).length})</span>
          </h4>
          <ul className="divide-y divide-line">
            <AnimatePresence initial={false}>{overdue.map((t) => row(t, overdueLabel(t.due_on, today)))}</AnimatePresence>
          </ul>
        </div>
      )}
      {dialogs.dialogs}
    </Card>
  )
}
