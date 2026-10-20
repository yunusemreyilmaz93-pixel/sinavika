import { Check } from 'lucide-react'
import { useState } from 'react'
import { Modal } from '@/components/ui/modal'
import { cn } from '@/lib/cn'
import { formatDate, shiftDays, todayISO, weekDays, weekStartISO } from '@/lib/dates'
import { weekdayLong, type Task } from './lib'
import { WeekNav } from './week-nav'

export function MoveTaskModal({
  open,
  onOpenChange,
  task,
  onMove,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  task: Task | null
  onMove: (dueOn: string) => void
}) {
  return (
    <Modal open={open} onOpenChange={onOpenChange} title="Görevi taşı" description={task?.title} size="sm">
      {task && (
        <MoveBody
          key={task.id}
          task={task}
          onPick={(day) => {
            onMove(day)
            onOpenChange(false)
          }}
        />
      )}
    </Modal>
  )
}

function MoveBody({ task, onPick }: { task: Task; onPick: (dueOn: string) => void }) {
  const today = todayISO()
  const [week, setWeek] = useState(() => weekStartISO(task.due_on))
  return (
    <div className="space-y-3">
      <WeekNav week={week} onChange={setWeek} size="sm" />
      <ul className="space-y-1">
        {weekDays(week).map((day, i) => {
          const current = day === task.due_on
          return (
            <li key={day}>
              <button
                type="button"
                disabled={current}
                onClick={() => onPick(day)}
                className={cn(
                  'flex h-12 w-full items-center justify-between gap-3 rounded-xl px-3 text-left text-[15px] transition-colors',
                  current ? 'bg-primary-soft text-primary-soft-fg' : 'hover:bg-surface-2 active:bg-surface-2',
                )}
              >
                <span className="flex items-baseline gap-2">
                  <span className="font-semibold">{weekdayLong[i]}</span>
                  <span className="text-sm text-muted">{formatDate(day, 'd MMMM')}</span>
                </span>
                {current ? (
                  <span className="inline-flex items-center gap-1 text-xs font-semibold">
                    <Check className="size-3.5" aria-hidden />
                    Şu an
                  </span>
                ) : day === today ? (
                  <span className="text-xs font-semibold text-primary">Bugün</span>
                ) : day === shiftDays(today, 1) ? (
                  <span className="text-xs font-semibold text-muted">Yarın</span>
                ) : null}
              </button>
            </li>
          )
        })}
      </ul>
    </div>
  )
}
