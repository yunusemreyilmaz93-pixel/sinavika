import { useState } from 'react'
import { Confirm } from '@/components/ui/confirm'
import type { Task } from './lib'
import { MoveTaskModal } from './move-task'
import { useTaskActions } from './queries'
import { TaskFormModal } from './task-form'

type Target = { open: boolean; task: Task | null }
const closed: Target = { open: false, task: null }

export function useTaskDialogs(studentId: string) {
  const actions = useTaskActions(studentId)
  const [form, setForm] = useState<Target & { date?: string }>(closed)
  const [moving, setMoving] = useState<Target>(closed)
  const [deleting, setDeleting] = useState<Target>(closed)

  const dialogs = (
    <>
      <TaskFormModal
        open={form.open}
        onOpenChange={(open) => setForm((f) => ({ ...f, open }))}
        studentId={studentId}
        task={form.task}
        defaultDate={form.date}
      />
      <MoveTaskModal
        open={moving.open}
        onOpenChange={(open) => setMoving((m) => ({ ...m, open }))}
        task={moving.task}
        onMove={(day) => moving.task && actions.move(moving.task, day)}
      />
      <Confirm
        open={deleting.open}
        onOpenChange={(open) => setDeleting((d) => ({ ...d, open }))}
        title="Görev silinsin mi?"
        description={deleting.task?.title}
        confirmLabel="Sil"
        onConfirm={() => deleting.task && actions.remove.mutateAsync(deleting.task).catch(() => undefined)}
      />
    </>
  )

  return {
    actions,
    dialogs,
    add: (date: string) => setForm({ open: true, task: null, date }),
    edit: (task: Task) => setForm({ open: true, task }),
    move: (task: Task) => setMoving({ open: true, task }),
    remove: (task: Task) => setDeleting({ open: true, task }),
  }
}
