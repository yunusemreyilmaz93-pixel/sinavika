import {
  DndContext,
  DragOverlay,
  MouseSensor,
  TouchSensor,
  pointerWithin,
  rectIntersection,
  useDraggable,
  useDroppable,
  useSensor,
  useSensors,
  type Announcements,
  type CollisionDetection,
  type DragEndEvent,
  type DragStartEvent,
} from '@dnd-kit/core'
import { Plus } from 'lucide-react'
import { useState, type ComponentProps } from 'react'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { formatDate } from '@/lib/dates'
import { dayCounts, weekdayIndex, weekdayLong, weekdayShort, type Task } from './lib'
import { TaskRow } from './task-row'

type RowProps = Omit<ComponentProps<typeof TaskRow>, 'compact' | 'dragging' | 'rootRef' | 'dragProps'>

const collision: CollisionDetection = (args) => {
  const hits = pointerWithin(args)
  return hits.length ? hits : rectIntersection(args)
}

function dayName(id: unknown) {
  return typeof id === 'string' ? `${weekdayLong[weekdayIndex(id)]}, ${formatDate(id, 'd MMMM')}` : ''
}

function taskTitle(data: unknown) {
  return (data as { task?: Task } | undefined)?.task?.title ?? 'Görev'
}

const announcements: Announcements = {
  onDragStart: ({ active }) => `${taskTitle(active.data.current)} taşınıyor`,
  onDragOver: ({ active, over }) =>
    over ? `${taskTitle(active.data.current)}, ${dayName(over.id)} üzerinde` : `${taskTitle(active.data.current)} bir günün üzerinde değil`,
  onDragEnd: ({ active, over }) =>
    over ? `${taskTitle(active.data.current)} ${dayName(over.id)} gününe taşındı` : 'Taşıma bırakıldı',
  onDragCancel: () => 'Taşıma iptal edildi',
}

export function WeekBoard({
  days,
  byDay,
  today,
  loading,
  canAdd,
  onAdd,
  rowProps,
  onMove,
}: {
  days: string[]
  byDay: Map<string, Task[]>
  today: string
  loading: boolean
  canAdd: boolean
  onAdd: (day: string) => void
  rowProps: (task: Task) => RowProps
  onMove: (task: Task, day: string) => void
}) {
  const sensors = useSensors(
    useSensor(MouseSensor, { activationConstraint: { distance: 6 } }),
    useSensor(TouchSensor, { activationConstraint: { delay: 250, tolerance: 8 } }),
  )
  const [active, setActive] = useState<Task | null>(null)

  const start = (event: DragStartEvent) => setActive((event.active.data.current as { task: Task }).task)
  const end = (event: DragEndEvent) => {
    setActive(null)
    const task = (event.active.data.current as { task: Task } | undefined)?.task
    const day = event.over?.id
    if (task && typeof day === 'string') onMove(task, day)
  }

  return (
    <DndContext
      sensors={sensors}
      collisionDetection={collision}
      onDragStart={start}
      onDragEnd={end}
      onDragCancel={() => setActive(null)}
      accessibility={{ announcements }}
    >
      <div className="grid grid-cols-7 gap-1.5">
        {days.map((day, i) => (
          <DayColumn
            key={day}
            day={day}
            index={i}
            tasks={byDay.get(day) ?? []}
            today={today}
            loading={loading}
            canAdd={canAdd}
            onAdd={onAdd}
            rowProps={rowProps}
          />
        ))}
      </div>
      <DragOverlay dropAnimation={null}>
        {active ? <TaskRow {...rowProps(active)} compact className="rotate-1 cursor-grabbing shadow-pop" /> : null}
      </DragOverlay>
    </DndContext>
  )
}

function DayColumn({
  day,
  index,
  tasks,
  today,
  loading,
  canAdd,
  onAdd,
  rowProps,
}: {
  day: string
  index: number
  tasks: Task[]
  today: string
  loading: boolean
  canAdd: boolean
  onAdd: (day: string) => void
  rowProps: (task: Task) => RowProps
}) {
  const { setNodeRef, isOver } = useDroppable({ id: day })
  const { total, done } = dayCounts(tasks)
  const isToday = day === today
  const past = day < today

  return (
    <section
      ref={setNodeRef}
      aria-label={`${weekdayLong[index]}, ${formatDate(day, 'd MMMM')}`}
      className={cn(
        'flex min-h-72 min-w-0 flex-col rounded-2xl border transition-colors duration-150',
        isToday ? 'border-primary/50 bg-primary-soft/40' : 'border-line bg-surface-2/50',
        isOver && 'border-accent bg-accent-soft/60',
      )}
    >
      <header className="px-2.5 pt-2.5 pb-2">
        <div className="flex items-center justify-between gap-1">
          <span className={cn('text-xs font-bold tracking-wide uppercase', isToday ? 'text-primary' : 'text-muted')}>
            {weekdayShort[index]}
          </span>
          {total > 0 && (
            <span className={cn('tabular text-xs font-semibold', done === total ? 'text-success' : 'text-muted')}>
              {done}/{total}
            </span>
          )}
        </div>
        <p className={cn('font-display text-xl leading-tight font-bold tabular', past && !isToday && 'text-muted')}>
          {formatDate(day, 'd')}
          {isToday && <span className="ml-1.5 align-middle font-sans text-xs font-semibold text-primary">Bugün</span>}
        </p>
        <ProgressBar value={total ? done / total : 0} className={cn('mt-2 h-1', !total && 'opacity-0')} />
      </header>
      <div className="flex flex-1 flex-col gap-1.5 px-1.5 pb-1.5">
        {loading ? (
          <>
            <Skeleton className="h-16" />
            <Skeleton className="h-16" />
          </>
        ) : (
          tasks.map((task) => <DraggableTask key={task.id} {...rowProps(task)} />)
        )}
        {!loading && !tasks.length && !canAdd && <p className="py-6 text-center text-xs text-subtle">Görev yok</p>}
        {canAdd && (
          <button
            type="button"
            onClick={() => onAdd(day)}
            aria-label={`${weekdayLong[index]} için görev ekle`}
            className="mt-auto flex h-9 items-center justify-center gap-1 rounded-lg text-[13px] font-semibold text-muted transition-colors hover:bg-surface hover:text-fg"
          >
            <Plus className="size-4" aria-hidden />
            Ekle
          </button>
        )}
      </div>
    </section>
  )
}

function DraggableTask(props: RowProps) {
  const { task, permissions } = props
  const { setNodeRef, listeners, isDragging } = useDraggable({
    id: task.id,
    data: { task },
    disabled: !permissions.canMove,
  })
  return (
    <TaskRow
      {...props}
      compact
      dragging={isDragging}
      rootRef={setNodeRef}
      dragProps={permissions.canMove ? listeners : undefined}
    />
  )
}
