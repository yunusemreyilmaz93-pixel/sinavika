import { GraduationCap, Pencil } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { useExamScores, useExams, useGoals, useSaveGoal, type ExamResult, type Score } from '@/features/exams/queries'
import { useCurriculum } from '@/lib/data'
import { examLabel, formatNet, net, type Field, type Subject } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { ProgramPicker } from './program-picker'
import { useSetTargetProgram, useStudentTarget, useTargetProgram, type ProgramResult } from './queries'
import { referenceTargets, remaining, round2, scoreTypeOfField, type RefTarget } from './reference'

const number = new Intl.NumberFormat('tr-TR')
const score = new Intl.NumberFormat('tr-TR', {
  minimumFractionDigits: 2,
  maximumFractionDigits: 2,
})

export function TargetCard({ studentId, field, canEdit }: { studentId: string; field: Field | null; canEdit: boolean }) {
  const target = useStudentTarget(studentId)
  const setTarget = useSetTargetProgram(studentId)
  const [open, setOpen] = useState(false)
  const code = target.data?.target_program ?? null
  const scoreType = field ? scoreTypeOfField[field] : null

  return (
    <Card>
      <CardHeader
        title="Hedef bölüm"
        description="Kaynak: YÖK Atlas"
        action={
          canEdit && code !== null ? (
            <Button variant="ghost" size="icon" className="-mt-1 -mr-1" onClick={() => setOpen(true)} aria-label="Hedef bölümü değiştir">
              <Pencil className="text-muted" />
            </Button>
          ) : undefined
        }
      />
      <CardBody>
        {target.isPending ? (
          <Skeleton className="h-28" />
        ) : target.error ? (
          <p className="text-sm text-danger">{errorMessage(target.error)}</p>
        ) : code === null ? (
          <div className="flex flex-col items-start gap-3">
            <p className="text-sm text-muted">
              {canEdit ? 'Hedef bölüm seçildiğinde son yıllardaki taban puan ve netler burada görünür.' : 'Hedef bölüm seçilmedi.'}
            </p>
            {canEdit && (
              <Button variant="soft" className="h-11" onClick={() => setOpen(true)}>
                <GraduationCap />
                Bölüm seç
              </Button>
            )}
          </div>
        ) : (
          <TargetDetail studentId={studentId} code={code} canEdit={canEdit} />
        )}
      </CardBody>
      {canEdit && (
        <ProgramPicker
          key={String(open)}
          open={open}
          onOpenChange={setOpen}
          scoreType={scoreType}
          saving={setTarget.isPending}
          onPick={(next) =>
            setTarget.mutate(next, {
              onSuccess: () => {
                toast.success('Hedef bölüm kaydedildi')
                setOpen(false)
              },
              onError: (err) => toast.error(errorMessage(err)),
            })
          }
        />
      )}
    </Card>
  )
}

function latest(results: ProgramResult[], pick: (r: ProgramResult) => boolean) {
  return results.find(pick) // yıla göre azalan sıralı
}

function TargetDetail({ studentId, code, canEdit }: { studentId: string; code: number; canEdit: boolean }) {
  const detail = useTargetProgram(code)
  const exams = useExams(studentId)
  const goals = useGoals(studentId)
  const saveGoal = useSaveGoal(studentId)
  const curriculum = useCurriculum()
  const setTarget = useSetTargetProgram(studentId)

  const withNets = detail.data ? latest(detail.data.results, (r) => !!r.nets) : undefined
  const refs = detail.data && withNets ? referenceTargets(detail.data.program.score_type, withNets.nets) : []
  const lastIds = refs.flatMap((ref) => exams.data?.find((e) => e.kind === ref.kind)?.id ?? [])
  const scores = useExamScores(studentId, lastIds)

  if (detail.isPending) return <Skeleton className="h-28" />
  if (detail.error) return <p className="text-sm text-danger">{errorMessage(detail.error)}</p>

  const { program, results } = detail.data
  const current = latest(results, (r) => r.min_score != null)

  const apply = async (ref: RefTarget) => {
    try {
      await saveGoal.mutateAsync({ kind: ref.kind, target: ref.total })
      toast.success(`${examLabel[ref.kind]} hedefi ${formatNet(ref.total)} net olarak kaydedildi`)
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <div className="space-y-4">
      <div>
        <p className="font-display text-lg leading-tight font-bold">{program.name}</p>
        <p className="mt-0.5 text-sm text-muted">
          {program.university.short_name}
          {program.university.city ? `, ${program.university.city}` : ''} · {program.score_type}
          {program.scholarship ? ` · ${program.scholarship}` : ''}
        </p>
      </div>

      {current && (
        <dl className="grid grid-cols-2 gap-2 sm:grid-cols-4">
          <Stat label={`${current.year} taban puan`} value={current.min_score != null ? score.format(current.min_score) : '-'} />
          <Stat label="Başarı sırası" value={current.rank != null ? number.format(current.rank) : '-'} />
          <Stat label="Yerleşen" value={current.placed != null ? number.format(current.placed) : '-'} />
          <Stat label="Kontenjan" value={current.quota != null ? number.format(current.quota) : '-'} />
        </dl>
      )}

      {refs.length > 0 && withNets && (
        <div>
          <p className="text-xs font-bold tracking-wide text-muted uppercase">{withNets.year} son yerleşen adayın netleri</p>
          {current && current.year > withNets.year && (
            <p className="mt-1 text-sm text-muted">
              {current.year} netleri henüz açıklanmadı, {withNets.year} gösteriliyor.
            </p>
          )}
          <ul className="mt-2 grid gap-2 lg:grid-cols-2">
            {refs.map((ref) => {
              const last = exams.data?.find((e) => e.kind === ref.kind)
              const gap = remaining(ref.total, last?.net)
              const saved = goals.data?.find((g) => g.kind === ref.kind)?.target_net
              return (
                <li key={ref.kind} className="flex flex-col gap-2 rounded-xl border border-line p-3">
                  <div className="flex items-baseline justify-between gap-2">
                    <span className="text-xs font-bold tracking-wide text-muted uppercase">{examLabel[ref.kind]} toplam</span>
                    <span className="tabular font-display text-xl font-bold">{formatNet(ref.total)}</span>
                  </div>
                  {ref.parts.length > 1 && <PartTable ref_={ref} last={last} scores={scores.data} subjects={curriculum.data?.subjects} />}
                  <p className="tabular text-sm text-muted">
                    {last
                      ? gap === 0
                        ? `Son deneme ${formatNet(last.net)}, hedefin üstünde`
                        : `Son deneme ${formatNet(last.net)}, kalan ${formatNet(gap)} net`
                      : 'Henüz deneme yok'}
                  </p>
                  {canEdit && saved !== ref.total && (
                    <Button variant="soft" size="sm" className="h-11" disabled={saveGoal.isPending} onClick={() => apply(ref)}>
                      Toplamı net hedefi yap
                    </Button>
                  )}
                </li>
              )
            })}
          </ul>
        </div>
      )}

      {canEdit && (
        <Button
          variant="ghost"
          size="sm"
          className="h-11 text-danger"
          disabled={setTarget.isPending}
          onClick={() =>
            setTarget.mutate(null, {
              onError: (e) => toast.error(errorMessage(e)),
            })
          }
        >
          Hedefi kaldır
        </Button>
      )}
    </div>
  )
}

// Dersin son denemedeki neti, o derslerin hiçbiri girilmemişse null
function partNet(scores: Score[] | undefined, subjects: Subject[] | undefined, examId: number, kind: ExamResult['kind'], names: string[]) {
  const ids = new Set(subjects?.filter((s) => s.exam === kind && names.includes(s.name)).map((s) => s.id))
  const rows = scores?.filter((x) => x.mock_exam_id === examId && ids.has(x.subject_id)) ?? []
  return rows.length ? round2(rows.reduce((sum, x) => sum + net(x.correct, x.wrong, kind), 0)) : null
}

function PartTable({ ref_, last, scores, subjects }: { ref_: RefTarget; last?: ExamResult; scores?: Score[]; subjects?: Subject[] }) {
  const showLast = last && scores
  return (
    <table className="tabular w-full text-sm">
      <thead>
        <tr className="text-xs text-muted">
          <th className="py-1 text-left font-semibold">Ders</th>
          <th className="py-1 text-right font-semibold">Hedef</th>
          {showLast && <th className="py-1 text-right font-semibold">Son deneme</th>}
        </tr>
      </thead>
      <tbody className="divide-y divide-line">
        {ref_.parts.map((part) => {
          const mine = showLast ? partNet(scores, subjects, last.id, ref_.kind, part.subjects) : null
          return (
            <tr key={part.label}>
              <td className="py-1.5">{part.label}</td>
              <td className="py-1.5 text-right font-semibold">{formatNet(part.value)}</td>
              {showLast && (
                <td className={`py-1.5 text-right ${mine !== null && mine < part.value ? 'text-muted' : 'font-semibold text-success'}`}>
                  {mine === null ? '-' : formatNet(mine)}
                </td>
              )}
            </tr>
          )
        })}
      </tbody>
    </table>
  )
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-xl bg-surface-2/60 px-3 py-2">
      <dt className="text-xs text-muted">{label}</dt>
      <dd className="tabular font-display text-lg font-bold">{value}</dd>
    </div>
  )
}
