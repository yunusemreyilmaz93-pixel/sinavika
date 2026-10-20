import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { ArrowLeft, LayoutTemplate, Trash2 } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Input } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Skeleton } from '@/components/ui/skeleton'
import { keys } from '@/lib/data'
import { daysBetween, shiftDays } from '@/lib/dates'
import { AppError, errorMessage, supabase, unwrap, type Tables } from '@/lib/supabase'
import { useOpenSession } from './hooks'
import { parseTemplateItems, weekRangeLabel, type TemplateItem } from './lib'
import { LoadError } from './load-error'
import { invalidateTasks, useTasks } from './queries'
import { firstName, StudentChips, type PlannerStudent } from './student-picker'
import { WeekNav } from './week-nav'

type Template = Tables<'plan_templates'> & { parsed: TemplateItem[] }

type Props = {
  open: boolean
  onOpenChange: (open: boolean) => void
  students: PlannerStudent[]
  student: PlannerStudent
  week: string
}

function useTemplates() {
  return useQuery({
    queryKey: keys.templates,
    queryFn: async (): Promise<Template[]> =>
      unwrap(await supabase.from('plan_templates').select('*').order('created_at', { ascending: false })).map((t) => ({
        ...t,
        parsed: parseTemplateItems(t.items),
      })),
  })
}

export function TemplatesModal(props: Props) {
  const session = useOpenSession(props.open)
  return <TemplatesDialog key={session} {...props} />
}

function TemplatesDialog({ open, onOpenChange, students, student, week }: Props) {
  const [applying, setApplying] = useState<Template | null>(null)
  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title={applying ? applying.name : 'Şablonlar'}
      description={applying ? 'Şablondaki görevleri seçtiğin haftaya ekle.' : 'Bir haftayı kaydet, sonra başka öğrencilere ya da haftalara uygula.'}
      size="lg"
    >
      {applying ? (
        <ApplyTemplate
          template={applying}
          students={students}
          initialStudentId={student.id}
          initialWeek={week}
          onBack={() => setApplying(null)}
          onDone={() => onOpenChange(false)}
        />
      ) : (
        <div className="space-y-6">
          <SaveWeek student={student} week={week} />
          <TemplateList onApply={setApplying} />
        </div>
      )}
    </Modal>
  )
}

function SaveWeek({ student, week }: { student: PlannerStudent; week: string }) {
  const qc = useQueryClient()
  const end = shiftDays(week, 6)
  const tasks = useTasks(student.id, week, end)
  const [name, setName] = useState(`${firstName(student.full_name)} · ${weekRangeLabel(week)}`.slice(0, 60))
  const count = tasks.data?.length ?? 0

  const save = useMutation({
    mutationFn: async () => {
      const list = tasks.data ?? []
      if (!list.length) throw new AppError('Bu haftada kaydedilecek görev yok')
      if (list.length > 100) throw new AppError('Şablona en fazla 100 görev sığar')
      const items: TemplateItem[] = list.map((t) => ({
        weekday: daysBetween(week, t.due_on),
        title: t.title,
        kind: t.kind,
        subject_id: t.subject_id,
        topic_id: t.topic_id,
        target_questions: t.target_questions,
        target_minutes: t.target_minutes,
        note: t.note,
      }))
      unwrap(await supabase.from('plan_templates').insert({ name: name.trim(), items }))
    },
    onSuccess: () => {
      toast.success('Şablon kaydedildi')
      return qc.invalidateQueries({ queryKey: keys.templates })
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  const submit = (event: FormEvent) => {
    event.preventDefault()
    if (name.trim()) save.mutate()
  }

  return (
    <form onSubmit={submit} className="rounded-2xl border border-line bg-surface-2/50 p-4">
      <h3 className="text-sm font-bold">Bu haftayı şablon yap</h3>
      <p className="mt-0.5 text-sm text-muted">
        {student.full_name}, {weekRangeLabel(week)}:{' '}
        {tasks.isPending ? 'yükleniyor' : count ? `${count} görev` : 'görev yok'}
      </p>
      <div className="mt-3 flex flex-col gap-2 sm:flex-row sm:items-end">
        <Field label="Şablon adı" className="flex-1">
          {(props) => <Input {...props} value={name} maxLength={60} onChange={(e) => setName(e.target.value)} />}
        </Field>
        <Button type="submit" loading={save.isPending} disabled={!count || !name.trim()}>
          Kaydet
        </Button>
      </div>
    </form>
  )
}

function TemplateList({ onApply }: { onApply: (template: Template) => void }) {
  const qc = useQueryClient()
  const templates = useTemplates()
  const [deleting, setDeleting] = useState<{ open: boolean; template: Template | null }>({ open: false, template: null })

  const remove = async (template: Template) => {
    try {
      unwrap(await supabase.from('plan_templates').delete().eq('id', template.id))
      toast.success('Şablon silindi')
      await qc.invalidateQueries({ queryKey: keys.templates })
    } catch (error) {
      toast.error(errorMessage(error))
    }
  }

  return (
    <section>
      <h3 className="mb-2 text-sm font-bold">Kayıtlı şablonlar</h3>
      {templates.isPending ? (
        <div className="space-y-2">
          <Skeleton className="h-16" />
          <Skeleton className="h-16" />
        </div>
      ) : templates.error ? (
        <LoadError message={errorMessage(templates.error)} onRetry={() => void templates.refetch()} />
      ) : !templates.data.length ? (
        <EmptyState
          icon={LayoutTemplate}
          title="Henüz şablon yok"
          description="Planı hazır bir haftayı yukarıdan şablon olarak kaydet."
        />
      ) : (
        <ul className="divide-y divide-line rounded-2xl border border-line">
          {templates.data.map((t) => {
            const dayCount = new Set(t.parsed.map((i) => i.weekday)).size
            return (
              <li key={t.id} className="flex items-center gap-2 py-2 pr-2 pl-4">
                <div className="min-w-0 flex-1">
                  <p className="truncate font-semibold">{t.name}</p>
                  <p className="text-sm text-muted">
                    {t.parsed.length} görev, {dayCount} gün
                  </p>
                </div>
                <Button variant="soft" size="md" disabled={!t.parsed.length} onClick={() => onApply(t)}>
                  Uygula
                </Button>
                <Button
                  variant="ghost"
                  size="icon"
                  aria-label={`${t.name} şablonunu sil`}
                  onClick={() => setDeleting({ open: true, template: t })}
                >
                  <Trash2 className="text-muted" />
                </Button>
              </li>
            )
          })}
        </ul>
      )}
      <Confirm
        open={deleting.open}
        onOpenChange={(open) => setDeleting((d) => ({ ...d, open }))}
        title="Şablon silinsin mi?"
        description={deleting.template ? `${deleting.template.name}. Daha önce eklenen görevler silinmez.` : undefined}
        confirmLabel="Sil"
        onConfirm={() => deleting.template && remove(deleting.template)}
      />
    </section>
  )
}

function ApplyTemplate({
  template,
  students,
  initialStudentId,
  initialWeek,
  onBack,
  onDone,
}: {
  template: Template
  students: PlannerStudent[]
  initialStudentId: string
  initialWeek: string
  onBack: () => void
  onDone: () => void
}) {
  const qc = useQueryClient()
  const [studentIds, setStudentIds] = useState([initialStudentId])
  const [week, setWeek] = useState(initialWeek)
  const total = template.parsed.length * studentIds.length

  const apply = useMutation({
    mutationFn: async () => {
      const rows = studentIds.flatMap((student_id) =>
        template.parsed.map(({ weekday, ...item }) => ({ ...item, student_id, due_on: shiftDays(week, weekday) })),
      )
      unwrap(await supabase.from('tasks').insert(rows))
      return rows.length
    },
    onSuccess: async (count) => {
      await invalidateTasks(qc, studentIds)
      toast.success(`${count} görev eklendi`)
      onDone()
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  return (
    <div className="space-y-6">
      <Button variant="ghost" size="sm" className="-ml-2" onClick={onBack}>
        <ArrowLeft />
        Şablonlar
      </Button>
      <section>
        <h3 className="mb-2 text-sm font-semibold">Öğrenciler</h3>
        <StudentChips
          multiple
          label="Öğrenciler"
          students={students}
          selected={studentIds}
          onToggle={(id) => setStudentIds((list) => (list.includes(id) ? list.filter((v) => v !== id) : [...list, id]))}
        />
      </section>
      <section>
        <h3 className="mb-2 text-sm font-semibold">Hafta</h3>
        <WeekNav week={week} onChange={setWeek} size="sm" />
      </section>
      <div className="flex flex-col gap-3 border-t border-line pt-4 sm:flex-row sm:items-center sm:justify-between">
        <p className="text-sm text-muted">
          {studentIds.length
            ? `${studentIds.length} öğrenciye ${template.parsed.length} görev, toplam ${total}`
            : 'En az bir öğrenci seç'}
        </p>
        <Button loading={apply.isPending} disabled={!studentIds.length} onClick={() => apply.mutate()}>
          {total ? `${total} görev ekle` : 'Uygula'}
        </Button>
      </div>
    </div>
  )
}
