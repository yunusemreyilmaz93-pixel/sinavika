import { useQueryClient } from '@tanstack/react-query'
import { useMemo, useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Modal } from '@/components/ui/modal'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { formatDate, todayISO, weekDays, weekStartISO } from '@/lib/dates'
import { studentSubjects, type Subject } from '@/lib/exam'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { useOpenSession } from './hooks'
import { weekdayShort } from './lib'
import { invalidateTasks } from './queries'
import { StudentChips, type PlannerStudent } from './student-picker'
import { draftFromTask, draftValues, TaskFields, videoUrlInvalid, type TaskDraft } from './task-fields'
import { WeekNav } from './week-nav'

type Props = {
  open: boolean
  onOpenChange: (open: boolean) => void
  students: PlannerStudent[]
  initialStudentId?: string
  initialWeek: string
}

// Birden fazla öğrenci seçiliyse yalnızca hepsinin dersleri, hiç seçilmediyse tüm dersler listelenir
function commonSubjects(all: Subject[], students: PlannerStudent[], ids: string[]) {
  const chosen = students.filter((s) => ids.includes(s.id))
  const lists = (chosen.length ? chosen : students).map((s) => studentSubjects(all, s))
  const kept = chosen.length ? lists.reduce((a, l) => a.filter((x) => l.some((y) => y.id === x.id))) : lists.flat()
  const order = ['LGS', 'TYT', 'AYT', 'YDT']
  return [...new Map(kept.map((s) => [s.id, s])).values()].sort(
    (a, b) => order.indexOf(a.exam) - order.indexOf(b.exam) || a.sort - b.sort,
  )
}

export function BulkTaskModal(props: Props) {
  const session = useOpenSession(props.open)
  return <BulkTaskDialog key={session} {...props} />
}

function BulkTaskDialog({ open, onOpenChange, students, initialStudentId, initialWeek }: Props) {
  const qc = useQueryClient()
  const curriculum = useCurriculum()
  const today = todayISO()
  const [studentIds, setStudentIds] = useState<string[]>(() => (initialStudentId ? [initialStudentId] : []))
  const [week, setWeek] = useState(initialWeek)
  const [dates, setDates] = useState<string[]>(() => (weekDays(initialWeek).includes(today) ? [today] : []))
  const [draft, setDraft] = useState<TaskDraft>(() => draftFromTask(null, today))
  const [error, setError] = useState<string | null>(null)
  const [titleError, setTitleError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const days = weekDays(week)

  const subjects = useMemo(
    () => (curriculum.data ? commonSubjects(curriculum.data.subjects, students, studentIds) : []),
    [curriculum.data, students, studentIds],
  )

  const changeStudents = (next: string[]) => {
    setStudentIds(next)
    setError(null)
    if (draft.subjectId && curriculum.data && !commonSubjects(curriculum.data.subjects, students, next).some((s) => s.id === draft.subjectId)) {
      setDraft((d) => ({ ...d, subjectId: '', topicId: '' }))
    }
  }

  const toggle = <T,>(list: T[], value: T) => (list.includes(value) ? list.filter((v) => v !== value) : [...list, value])
  const count = studentIds.length * dates.length

  const submit = async (event: FormEvent) => {
    event.preventDefault()
    const values = draftValues(draft, curriculum.data)
    if (!values) return setTitleError('Başlık yazın ya da bir ders seçin')
    if (videoUrlInvalid(draft)) return void toast.error('YouTube bağlantısı geçersiz. Videonun adresini kopyalayıp yapıştırın')
    if (!studentIds.length) return setError('En az bir öğrenci seçin')
    if (!dates.length) return setError('En az bir gün seçin')
    setBusy(true)
    try {
      const rows = studentIds.flatMap((student_id) => [...dates].sort().map((due_on) => ({ ...values, student_id, due_on })))
      unwrap(await supabase.from('tasks').insert(rows))
      await invalidateTasks(qc, studentIds)
      toast.success(`${rows.length} görev eklendi`)
      onOpenChange(false)
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setBusy(false)
    }
  }

  const weekdays = days.slice(0, 5)
  const allWeekdays = weekdays.every((d) => dates.includes(d)) && dates.length === 5

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title="Toplu görev"
      description="Aynı görevi birden fazla öğrenciye ve güne ekleyin."
      size="lg"
      footer={
        <>
          <Button variant="secondary" type="button" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button type="submit" form="bulk-task-form" loading={busy} disabled={!curriculum.data || !count}>
            {count ? `${count} görev ekle` : 'Görev ekle'}
          </Button>
        </>
      }
    >
      <form id="bulk-task-form" onSubmit={submit} noValidate className="space-y-6">
        <section>
          <div className="mb-2 flex items-center justify-between gap-3">
            <h3 className="text-sm font-semibold">Öğrenciler</h3>
            <button
              type="button"
              className="-my-2 h-11 px-1 text-sm font-semibold text-accent"
              onClick={() => changeStudents(studentIds.length === students.length ? [] : students.map((s) => s.id))}
            >
              {studentIds.length === students.length ? 'Hiçbiri' : 'Tümü'}
            </button>
          </div>
          <StudentChips
            multiple
            label="Öğrenciler"
            students={students}
            selected={studentIds}
            onToggle={(id) => changeStudents(toggle(studentIds, id))}
          />
          {studentIds.length > 1 && !subjects.length && (
            <p className="mt-2 text-sm text-muted">Seçili öğrencilerin ortak dersi yok. Ders eklemek için aynı sınav türündeki öğrencileri seçin.</p>
          )}
        </section>

        <section className="space-y-3">
          <div className="flex items-center justify-between gap-3">
            <h3 className="text-sm font-semibold">Günler</h3>
            <button
              type="button"
              className="-my-2 h-11 px-1 text-sm font-semibold text-accent"
              onClick={() => {
                setDates(allWeekdays ? [] : weekdays)
                setError(null)
              }}
            >
              {allWeekdays ? 'Temizle' : 'Hafta içi'}
            </button>
          </div>
          <WeekNav
            week={week}
            size="sm"
            onChange={(next) => {
              setWeek(next)
              setDates([])
            }}
          />
          <div role="group" aria-label="Günler" className="grid grid-cols-7 gap-0.5 sm:gap-1.5">
            {days.map((day, i) => {
              const active = dates.includes(day)
              return (
                <button
                  key={day}
                  type="button"
                  role="checkbox"
                  aria-checked={active}
                  aria-label={formatDate(day, 'd MMMM EEEE')}
                  onClick={() => {
                    setDates((list) => toggle(list, day))
                    setError(null)
                  }}
                  className={cn(
                    'flex h-14 min-w-0 flex-col items-center justify-center rounded-xl border text-xs font-semibold transition-colors',
                    active
                      ? 'border-primary bg-primary text-primary-fg'
                      : 'border-line bg-surface text-muted hover:border-line-strong',
                    !active && day === today && 'border-primary/50 text-primary',
                  )}
                >
                  <span>{weekdayShort[i]}</span>
                  <span className="font-display text-base leading-tight font-bold tabular">{formatDate(day, 'd')}</span>
                </button>
              )
            })}
          </div>
          {weekStartISO(today) > week && (
            <p className="text-sm text-warning">Geçmiş bir hafta seçildi.</p>
          )}
        </section>

        {error && (
          <p role="alert" className="text-sm font-medium text-danger">
            {error}
          </p>
        )}

        <section className="border-t border-line pt-5">
          <TaskFields
            draft={draft}
            onChange={(patch) => {
              setDraft((d) => ({ ...d, ...patch }))
              setTitleError(null)
            }}
            subjects={subjects}
            curriculum={curriculum.data}
            showDate={false}
            titleError={titleError}
          />
        </section>
      </form>
    </Modal>
  )
}
