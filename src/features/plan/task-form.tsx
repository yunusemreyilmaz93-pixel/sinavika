import { useMemo, useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Modal } from '@/components/ui/modal'
import { Skeleton } from '@/components/ui/skeleton'
import { useCurriculum } from '@/lib/data'
import { todayISO } from '@/lib/dates'
import { studentSubjects } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { useOpenSession } from './hooks'
import type { Task } from './lib'
import { usePlanStudent, useTaskActions } from './queries'
import { draftFromTask, draftValues, TaskFields, videoUrlInvalid, type TaskDraft } from './task-fields'

export type TaskFormModalProps = {
  open: boolean
  onOpenChange: (open: boolean) => void
  studentId: string
  task?: Task | null
  defaultDate?: string
  onSaved?: (task: Task) => void
}

export function TaskFormModal(props: TaskFormModalProps) {
  const session = useOpenSession(props.open)
  return <TaskFormDialog key={session} {...props} />
}

function TaskFormDialog({ open, onOpenChange, studentId, task, defaultDate, onSaved }: TaskFormModalProps) {
  const curriculum = useCurriculum()
  const student = usePlanStudent(studentId)
  const { save } = useTaskActions(studentId)
  const [draft, setDraft] = useState<TaskDraft>(() => draftFromTask(task, defaultDate ?? todayISO()))
  const [titleError, setTitleError] = useState<string | null>(null)
  const formId = `task-form-${task?.id ?? 'new'}`
  const editing = Boolean(task)

  const subjects = useMemo(
    () => (curriculum.data && student.data ? studentSubjects(curriculum.data.subjects, student.data) : []),
    [curriculum.data, student.data],
  )

  const submit = async (event: FormEvent) => {
    event.preventDefault()
    const values = draftValues(draft, curriculum.data)
    if (!values) {
      setTitleError('Başlık yazın ya da bir ders seçin')
      return
    }
    if (videoUrlInvalid(draft)) return void toast.error('YouTube bağlantısı geçersiz. Videonun adresini kopyalayıp yapıştırın')
    try {
      const saved = await save.mutateAsync({ id: task?.id, values: { ...values, due_on: draft.dueOn } })
      toast.success(editing ? 'Görev güncellendi' : 'Görev eklendi')
      onSaved?.(saved)
      onOpenChange(false)
    } catch (error) {
      toast.error(errorMessage(error))
    }
  }

  const ready = curriculum.data && student.data

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title={editing ? 'Görevi düzenle' : 'Yeni görev'}
      footer={
        <>
          <Button variant="secondary" type="button" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button type="submit" form={formId} loading={save.isPending} disabled={!ready}>
            {editing ? 'Kaydet' : 'Ekle'}
          </Button>
        </>
      }
    >
      {ready ? (
        <form id={formId} onSubmit={submit} noValidate>
          <TaskFields
            draft={draft}
            onChange={(patch) => {
              setDraft((d) => ({ ...d, ...patch }))
              setTitleError(null)
            }}
            subjects={subjects}
            curriculum={curriculum.data}
            titleError={titleError}
          />
        </form>
      ) : curriculum.error || student.error ? (
        <p className="py-6 text-center text-sm text-danger">{errorMessage(curriculum.error ?? student.error)}</p>
      ) : (
        <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
          <Skeleton className="h-11" />
          <Skeleton className="h-36" />
          <Skeleton className="h-11" />
          <Skeleton className="h-24" />
        </div>
      )}
    </Modal>
  )
}
