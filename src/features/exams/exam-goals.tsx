import { Pencil, Target } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Field, Input } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Skeleton } from '@/components/ui/skeleton'
import { useCurriculum } from '@/lib/data'
import { examKindsFor, examLabel, formatNet, type ExamKind, type Field as YksField, type Track } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { GoalLine } from './overview-cards'
import { useExams, useGoals, useSaveGoal, type ExamResult } from './queries'
import { examMax, round2 } from './stats'

type Props = { studentId: string; student: { track: Track; field: YksField | null }; canEdit: boolean }

export function ExamGoals({ studentId, student, canEdit }: Props) {
  const goals = useGoals(studentId)
  const exams = useExams(studentId)
  const curriculum = useCurriculum()
  const [editing, setEditing] = useState<ExamKind | null>(null)
  const [open, setOpen] = useState(false)
  const [session, setSession] = useState(0)
  const kinds = examKindsFor(student)

  const loading = goals.isPending || exams.isPending || curriculum.isPending
  const error = goals.error ?? exams.error ?? curriculum.error

  return (
    <Card>
      <CardHeader title="Net hedefleri" description="Son denemedeki nete göre" />
      <CardBody>
        {loading ? (
          <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3" aria-busy="true">
            {kinds.map((k) => (
              <Skeleton key={k} className="h-28" />
            ))}
          </div>
        ) : error ? (
          <p className="text-sm text-danger">{errorMessage(error)}</p>
        ) : (
          <ul className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {kinds.map((kind) => (
              <GoalItem
                key={kind}
                kind={kind}
                target={goals.data?.find((g) => g.kind === kind)?.target_net ?? null}
                last={exams.data?.find((e) => e.kind === kind)}
                canEdit={canEdit}
                onEdit={() => {
                  setEditing(kind)
                  setSession((n) => n + 1)
                  setOpen(true)
                }}
              />
            ))}
          </ul>
        )}
      </CardBody>
      {canEdit && editing && curriculum.data && (
        <GoalForm
          key={session}
          open={open}
          onOpenChange={setOpen}
          studentId={studentId}
          kind={editing}
          current={goals.data?.find((g) => g.kind === editing)?.target_net ?? null}
          last={exams.data?.find((e) => e.kind === editing)}
          max={examMax(curriculum.data.subjects, editing, student.field)}
        />
      )}
    </Card>
  )
}

function GoalItem({
  kind,
  target,
  last,
  canEdit,
  onEdit,
}: {
  kind: ExamKind
  target: number | null
  last?: ExamResult
  canEdit: boolean
  onEdit: () => void
}) {
  return (
    <li className="flex flex-col gap-3 rounded-xl border border-line p-3.5">
      <div className="flex items-start justify-between gap-2">
        <div className="min-w-0">
          <p className="text-xs font-bold tracking-wide text-muted uppercase">{examLabel[kind]}</p>
          <p className="tabular mt-0.5 font-display text-2xl leading-tight font-bold">
            {target != null ? (
              <>
                {formatNet(target)} <span className="text-sm font-semibold text-muted">net hedef</span>
              </>
            ) : (
              <span className="text-base font-semibold text-muted">Hedef yok</span>
            )}
          </p>
        </div>
        {canEdit && (
          <Button
            variant={target != null ? 'ghost' : 'soft'}
            size={target != null ? 'icon' : 'sm'}
            className={target != null ? '-mt-1 -mr-1' : 'h-11'}
            onClick={onEdit}
            aria-label={target != null ? `${examLabel[kind]} hedefini değiştir` : undefined}
          >
            {target != null ? (
              <Pencil className="text-muted" />
            ) : (
              <>
                <Target />
                Hedef koy
              </>
            )}
          </Button>
        )}
      </div>
      {target != null && last ? (
        <GoalLine current={last.net} target={target} label={`Son deneme ${formatNet(last.net)}`} />
      ) : target != null ? (
        <p className="text-sm text-muted">İlk {examLabel[kind]} denemesinden sonra hedefe kalan net görünür.</p>
      ) : last ? (
        <p className="tabular text-sm text-muted">Son deneme {formatNet(last.net)} net</p>
      ) : (
        <p className="text-sm text-muted">Henüz {examLabel[kind]} denemesi yok.</p>
      )}
    </li>
  )
}

function parseNet(text: string) {
  const value = Number(text.trim().replace(',', '.'))
  return text.trim() && Number.isFinite(value) ? round2(value) : null
}

function GoalForm({
  open,
  onOpenChange,
  studentId,
  kind,
  current,
  last,
  max,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  studentId: string
  kind: ExamKind
  current: number | null
  last?: ExamResult
  max: number
}) {
  const save = useSaveGoal(studentId)
  const [text, setText] = useState(current != null ? formatNet(current) : '')
  const [error, setError] = useState<string | null>(null)

  const submit = async (target: number | null) => {
    try {
      await save.mutateAsync({ kind, target })
      toast.success(target == null ? 'Hedef kaldırıldı' : 'Hedef kaydedildi')
      onOpenChange(false)
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title={`${examLabel[kind]} net hedefi`}
      description={last ? `Son deneme ${formatNet(last.net)} net` : `En fazla ${max} net`}
      size="sm"
      footer={
        <>
          {current != null && (
            <Button variant="ghost" className="text-danger" disabled={save.isPending} onClick={() => submit(null)}>
              Kaldır
            </Button>
          )}
          <Button type="submit" form="goal-form" loading={save.isPending}>
            Kaydet
          </Button>
        </>
      }
    >
      <form
        id="goal-form"
        onSubmit={(e) => {
          e.preventDefault()
          const value = parseNet(text)
          if (value == null || value <= 0) return setError('Bir net değeri yaz')
          if (value > max) return setError(`${examLabel[kind]} için en fazla ${max} net olabilir`)
          setError(null)
          void submit(value)
        }}
      >
        <Field label="Hedef net" hint={`0 ile ${max} arasında, örneğin 85,5`} error={error}>
          {(props) => (
            <Input
              {...props}
              autoFocus
              inputMode="decimal"
              enterKeyHint="done"
              autoComplete="off"
              value={text}
              onChange={(e) => {
                setText(e.target.value.replace(/[^\d.,]/g, '').slice(0, 6))
                setError(null)
              }}
              className="tabular font-display text-lg font-bold"
            />
          )}
        </Field>
      </form>
    </Modal>
  )
}
