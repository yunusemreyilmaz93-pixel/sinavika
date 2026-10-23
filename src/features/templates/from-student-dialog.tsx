import { useMutation } from '@tanstack/react-query'
import { useState } from 'react'
import { useNavigate } from 'react-router'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Field, Select } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { useProfile } from '@/features/auth/session'
import { useOpenSession } from '@/features/plan/hooks'
import { weekRangeLabel, type TemplateItem } from '@/features/plan/lib'
import { firstName, StudentChips, usePlannerStudents } from '@/features/plan/student-picker'
import { WeekNav } from '@/features/plan/week-nav'
import { daysBetween, shiftDays, weekStartISO } from '@/lib/dates'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'
import { MAX_ITEMS, MAX_WEEKS, useSaveTemplate } from './queries'

type Props = { open: boolean; onOpenChange: (open: boolean) => void; initialStudentId: string | null; initialWeek: string | null }

export function FromStudentDialog(props: Props) {
  const session = useOpenSession(props.open)
  return <Dialog key={session} {...props} />
}

function Dialog({ open, onOpenChange, initialStudentId, initialWeek }: Props) {
  const profile = useProfile()
  const students = usePlannerStudents(profile.id)
  const navigate = useNavigate()
  const save = useSaveTemplate()
  const list = students.data ?? []
  const [studentId, setStudentId] = useState<string | null>(initialStudentId)
  const [week, setWeek] = useState(initialWeek ? weekStartISO(initialWeek) : weekStartISO())
  const [count, setCount] = useState(1)
  const student = list.find((s) => s.id === studentId) ?? list[0]

  const create = useMutation({
    mutationFn: async () => {
      if (!student) throw new AppError('Öğrenci seçin')
      const end = shiftDays(week, count * 7 - 1)
      const tasks = unwrap(
        await supabase
          .from('tasks')
          .select('title, kind, subject_id, topic_id, due_on, target_questions, target_minutes, note')
          .eq('student_id', student.id)
          .gte('due_on', week)
          .lte('due_on', end)
          .order('due_on')
          .order('sort')
          .limit(MAX_ITEMS + 1),
      )
      if (!tasks.length) throw new AppError('Seçilen haftalarda görev yok')
      if (tasks.length > MAX_ITEMS) throw new AppError(`Şablona en fazla ${MAX_ITEMS} görev sığar. Daha az hafta seçin`)
      const items: TemplateItem[] = tasks.map((t) => {
        const offset = daysBetween(week, t.due_on)
        return {
          week: Math.floor(offset / 7),
          weekday: offset % 7,
          title: t.title,
          kind: t.kind === 'video' ? 'study' : t.kind,
          subject_id: t.subject_id,
          topic_id: t.topic_id,
          target_questions: t.target_questions,
          target_minutes: t.target_minutes,
          note: t.note,
        }
      })
      const range = count === 1 ? weekRangeLabel(week) : `${weekRangeLabel(week)} ve ${count - 1} hafta`
      const name = `${firstName(student.full_name)} · ${range}`.slice(0, 60)
      return save.mutateAsync({ id: null, draft: { name, description: null, track: student.track, items } })
    },
    onSuccess: (id) => {
      toast.success('Şablon oluşturuldu')
      onOpenChange(false)
      navigate(`/app/sablonlar/${id}/duzenle`)
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title="Öğrenci haftalarından şablon"
      description="Seçtiğiniz öğrencinin görevlerinden yeni bir şablon oluşturulur."
      footer={
        <>
          <Button variant="secondary" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button loading={create.isPending} disabled={!student} onClick={() => create.mutate()}>
            Şablon oluştur
          </Button>
        </>
      }
    >
      <div className="space-y-5">
        <section>
          <h3 className="mb-2 text-sm font-semibold">Öğrenci</h3>
          {list.length ? (
            <StudentChips label="Öğrenci" students={list} selected={student ? [student.id] : []} onToggle={setStudentId} />
          ) : (
            <p className="text-sm text-muted">{students.isPending ? 'Yükleniyor' : 'Henüz öğrenciniz yok'}</p>
          )}
        </section>
        <section>
          <h3 className="mb-2 text-sm font-semibold">Başlangıç haftası</h3>
          <WeekNav week={week} onChange={setWeek} size="sm" />
        </section>
        <Field label="Hafta sayısı">
          {(props) => (
            <Select {...props} value={count} onChange={(e) => setCount(Number(e.target.value))}>
              {Array.from({ length: Math.min(MAX_WEEKS, 8) }, (_, i) => i + 1).map((n) => (
                <option key={n} value={n}>
                  {n} hafta
                </option>
              ))}
            </Select>
          )}
        </Field>
      </div>
    </Modal>
  )
}
