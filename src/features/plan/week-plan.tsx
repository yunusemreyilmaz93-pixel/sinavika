import { useQueryClient } from '@tanstack/react-query'
import { Check, CalendarPlus, Plus } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useEffect, useId, useMemo, useRef, useState } from 'react'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { formatDate, formatDay, shiftDays, todayISO, weekDays, weekStartISO } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { celebrate } from './celebrate'
import { useMediaQuery } from './hooks'
import {
  dayCounts,
  dayTitle,
  permissionsFor,
  sortTasks,
  weekdayIndex,
  weekdayLong,
  weekdayShort,
  type PlanViewer,
  type Task,
} from './lib'
import { tasksQuery, useTasks } from './queries'
import { LoadError } from './load-error'
import { useTaskDialogs } from './task-dialogs'
import { TaskRow } from './task-row'
import { WeekBoard } from './week-board'
import { WeekNav } from './week-nav'

export type WeekPlanProps = {
  studentId: string
  viewer: PlanViewer
  week?: string
  onWeekChange?: (week: string) => void
}

export function WeekPlan({ studentId, viewer, week: controlledWeek, onWeekChange }: WeekPlanProps) {
  const today = todayISO()
  const currentWeek = weekStartISO(today)
  const [ownWeek, setOwnWeek] = useState(currentWeek)
  const week = controlledWeek ?? ownWeek
  const days = useMemo(() => weekDays(week), [week])
  const [picked, setPicked] = useState(today)
  const selected = days[weekdayIndex(picked)]
  const desktop = useMediaQuery('(min-width: 80rem)')
  const qc = useQueryClient()
  const tasks = useTasks(studentId, week, days[6])
  const curriculum = useCurriculum()
  const dialogs = useTaskDialogs(studentId)
  const canAdd = viewer !== 'parent'

  useEffect(() => {
    for (const offset of [-7, 7]) {
      const start = shiftDays(week, offset)
      void qc.prefetchQuery(tasksQuery(studentId, start, shiftDays(start, 6)))
    }
  }, [qc, studentId, week])

  const byDay = useMemo(() => {
    const map = new Map<string, Task[]>(days.map((d) => [d, []]))
    for (const task of sortTasks(tasks.data ?? [])) map.get(task.due_on)?.push(task)
    return map
  }, [days, tasks.data])

  const totals = dayCounts(tasks.data ?? [])
  const loading = tasks.isPending

  const changeWeek = (next: string) => {
    setOwnWeek(next)
    onWeekChange?.(next)
    if (next === currentWeek) setPicked(today)
  }

  const toggle = (task: Task, done: boolean) => {
    if (done && viewer === 'student' && task.due_on === today) {
      const list = byDay.get(today) ?? []
      if (list.every((t) => t.id === task.id || t.done_at)) celebrate()
    }
    dialogs.actions.toggle(task, done)
  }

  const rowProps = (task: Task) => ({
    task,
    viewer,
    subject: task.subject_id ? curriculum.data?.subjectById.get(task.subject_id) : undefined,
    permissions: permissionsFor(viewer, task),
    onToggle: (done: boolean) => toggle(task, done),
    onEdit: () => dialogs.edit(task),
    onMove: () => dialogs.move(task),
    onDelete: () => dialogs.remove(task),
  })

  return (
    <section className="space-y-4" aria-label="Haftalık plan">
      <div className="space-y-3">
        <WeekNav week={week} onChange={changeWeek} />
        <div className="flex items-center gap-3" aria-live="polite">
          <ProgressBar value={totals.total ? totals.done / totals.total : 0} className="flex-1" />
          <div className="tabular shrink-0 text-sm text-muted">
            {loading ? (
              <Skeleton className="h-4 w-24" />
            ) : totals.total ? (
              <>
                <span className="font-semibold text-fg">
                  {totals.done}/{totals.total}
                </span>{' '}
                tamamlandı
              </>
            ) : (
              'Bu hafta görev yok'
            )}
          </div>
        </div>
      </div>

      {tasks.error ? (
        <LoadError message={errorMessage(tasks.error)} onRetry={() => void tasks.refetch()} />
      ) : desktop ? (
        <WeekBoard
          days={days}
          byDay={byDay}
          today={today}
          loading={loading}
          canAdd={canAdd}
          onAdd={dialogs.add}
          rowProps={rowProps}
          onMove={(task, day) => dialogs.actions.move(task, day, true)}
        />
      ) : (
        <>
          <DayStrip days={days} selected={selected} onSelect={setPicked} byDay={byDay} today={today} loading={loading} />
          <DayPanel
            day={selected}
            today={today}
            tasks={byDay.get(selected) ?? []}
            loading={loading}
            viewer={viewer}
            onAdd={dialogs.add}
            rowProps={rowProps}
          />
        </>
      )}
      {dialogs.dialogs}
    </section>
  )
}

function DayStrip({
  days,
  selected,
  onSelect,
  byDay,
  today,
  loading,
}: {
  days: string[]
  selected: string
  onSelect: (day: string) => void
  byDay: Map<string, Task[]>
  today: string
  loading: boolean
}) {
  const id = useId()
  const ref = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const strip = ref.current
    const button = strip?.querySelector<HTMLElement>('[aria-selected="true"]')
    if (!strip || !button || strip.scrollWidth <= strip.clientWidth) return
    strip.scrollTo({ left: button.offsetLeft - (strip.clientWidth - button.offsetWidth) / 2, behavior: 'smooth' })
  }, [selected])

  return (
    <div ref={ref} role="tablist" aria-label="Günler" className="scrollbar-none -mx-1 flex gap-0.5 overflow-x-auto p-1">
      {days.map((day, i) => {
        const { total, done } = dayCounts(byDay.get(day) ?? [])
        const active = day === selected
        const isToday = day === today
        const status = total ? `${done}/${total} tamamlandı` : 'görev yok'
        return (
          <button
            key={day}
            type="button"
            role="tab"
            aria-selected={active}
            aria-label={`${weekdayLong[i]} ${formatDate(day, 'd MMMM')}${isToday ? ', bugün' : ''}, ${status}`}
            onClick={() => onSelect(day)}
            className={cn(
              'relative flex h-[4.5rem] min-w-11 flex-1 flex-col items-center justify-center gap-0.5 rounded-2xl transition-colors',
              active ? 'text-primary-fg' : 'hover:bg-surface-2',
              !active && isToday && 'text-primary ring-1 ring-primary/40 ring-inset',
            )}
          >
            {active && (
              <motion.span
                layoutId={`day-${id}`}
                className="absolute inset-0 rounded-2xl bg-primary shadow-card"
                transition={{ type: 'spring', bounce: 0.15, duration: 0.35 }}
              />
            )}
            <span className={cn('relative text-[11px] font-bold tracking-wide uppercase', !active && !isToday && 'text-muted')}>
              {weekdayShort[i]}
            </span>
            <span className="relative font-display text-lg leading-none font-bold tabular">{formatDate(day, 'd')}</span>
            <span
              className={cn(
                'relative flex h-4 items-center text-[11px] font-semibold tabular',
                active ? 'text-primary-fg/85' : total && done === total ? 'text-success' : 'text-muted',
              )}
            >
              {loading ? (
                <span className="h-1 w-5 rounded-full bg-line" />
              ) : !total ? (
                <span className={cn('size-1 rounded-full', active ? 'bg-primary-fg/50' : 'bg-line-strong')} />
              ) : done === total ? (
                <Check className="size-3.5" strokeWidth={3} aria-hidden />
              ) : (
                `${done}/${total}`
              )}
            </span>
          </button>
        )
      })}
    </div>
  )
}

function DayPanel({
  day,
  today,
  tasks,
  loading,
  viewer,
  onAdd,
  rowProps,
}: {
  day: string
  today: string
  tasks: Task[]
  loading: boolean
  viewer: PlanViewer
  onAdd: (day: string) => void
  rowProps: (task: Task) => Parameters<typeof TaskRow>[0]
}) {
  const { total, done } = dayCounts(tasks)
  const relative = formatDay(day)
  const named = relative === 'Bugün' || relative === 'Dün' || relative === 'Yarın'
  const canAdd = viewer !== 'parent'

  return (
    <div role="tabpanel" aria-label={dayTitle(day)}>
      <div className="mb-3 flex min-h-11 items-center justify-between gap-3">
        <div className="min-w-0">
          <h2 className={cn('font-display text-lg font-bold', day === today && 'text-primary')}>
            {named ? relative : dayTitle(day)}
          </h2>
          <p className="text-sm text-muted">
            {named && <>{dayTitle(day)} · </>}
            {loading ? 'Yükleniyor' : total ? `${done}/${total} tamamlandı` : 'Görev yok'}
          </p>
        </div>
        {canAdd && total > 0 && (
          <Button variant="soft" onClick={() => onAdd(day)}>
            <Plus />
            Görev ekle
          </Button>
        )}
      </div>

      <motion.div key={day} initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ duration: 0.15 }}>
        {loading ? (
          <Card className="divide-y divide-line">
            {[0, 1, 2].map((i) => (
              <div key={i} className="flex items-start gap-3 px-4 py-3.5">
                <Skeleton className="size-6 rounded-lg" />
                <div className="flex-1 space-y-2">
                  <Skeleton className="h-4 w-2/3" />
                  <Skeleton className="h-3 w-1/3" />
                </div>
              </div>
            ))}
          </Card>
        ) : total === 0 ? (
          <EmptyState
            icon={CalendarPlus}
            title={canAdd ? 'Bu gün boş' : 'Bu gün için görev yok'}
            description={
              viewer === 'teacher'
                ? 'Bu güne görev ekle, öğrencine bildirim gider.'
                : viewer === 'student'
                  ? 'Kendi çalışmanı ekle, öğretmenin de görür.'
                  : 'Öğretmen görev ekleyince burada görünür.'
            }
            action={
              canAdd ? (
                <Button onClick={() => onAdd(day)}>
                  <Plus />
                  Görev ekle
                </Button>
              ) : undefined
            }
          />
        ) : (
          <Card className="overflow-hidden">
            <ul className="divide-y divide-line">
              <AnimatePresence initial={false}>
                {tasks.map((task) => (
                  <motion.li
                    key={task.id}
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1, transition: { duration: 0.15 } }}
                    exit={{ opacity: 0, transition: { duration: 0.1 } }}
                  >
                    <TaskRow {...rowProps(task)} />
                  </motion.li>
                ))}
              </AnimatePresence>
            </ul>
          </Card>
        )}
      </motion.div>
    </div>
  )
}
