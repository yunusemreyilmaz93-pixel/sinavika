import { RotateCw, SearchX, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { formatDate } from '@/lib/dates'
import { formatNet, net, subjectColor, type Subject } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { Delta } from './delta'
import { CountTiles } from './overview-cards'
import { useDeleteExam, useExamDetail, type ExamDetailData, type Score } from './queries'
import { accuracy, bySubjectOrder, round2 } from './stats'
import { SubjectNetChart } from './subject-net-chart'
import { ExamTopicMisses } from './topic-misses'

type Row = Score & { subject?: Subject; net: number; accuracy: number | null; diff: number | null }

function totals(scores: Score[]) {
  return scores.reduce(
    (acc, s) => ({ correct: acc.correct + s.correct, wrong: acc.wrong + s.wrong, blank: acc.blank + s.blank }),
    { correct: 0, wrong: 0, blank: 0 },
  )
}

function buildRows(data: ExamDetailData, subjectById: Map<string, Subject>): Row[] {
  const kind = data.exam.kind
  const prev = new Map(data.previous?.scores.map((s) => [s.subject_id, net(s.correct, s.wrong, kind)]))
  return [...data.scores].sort(bySubjectOrder(subjectById)).map((s) => {
    const value = net(s.correct, s.wrong, kind)
    const before = prev.get(s.subject_id)
    return {
      ...s,
      subject: subjectById.get(s.subject_id),
      net: value,
      accuracy: accuracy(s.correct, s.wrong),
      diff: before == null ? null : round2(value - before),
    }
  })
}

export function ExamDetail({ examId, canEdit, onDeleted }: { examId: number; canEdit: boolean; onDeleted?: () => void }) {
  const detail = useExamDetail(examId)
  const curriculum = useCurriculum()
  const remove = useDeleteExam()
  const [confirming, setConfirming] = useState(false)

  if (detail.isPending || curriculum.isPending) return <DetailSkeleton />

  if (detail.isError || curriculum.isError) {
    return (
      <div className="flex flex-col items-start gap-3 py-2">
        <p className="text-sm text-danger">{errorMessage(detail.error ?? curriculum.error)}</p>
        <Button variant="secondary" size="sm" className="h-11" onClick={() => (detail.isError ? detail.refetch() : curriculum.refetch())}>
          <RotateCw />
          Tekrar dene
        </Button>
      </div>
    )
  }

  const data = detail.data
  if (!data) {
    return <EmptyState icon={SearchX} title="Deneme bulunamadı" description="Silinmiş olabilir ya da bu denemeyi görme iznin yok." />
  }

  const { exam, previous } = data
  const kind = exam.kind
  const rows = buildRows(data, curriculum.data.subjectById)
  const sum = totals(data.scores)
  const totalNet = net(sum.correct, sum.wrong, kind)
  const prevSum = previous ? totals(previous.scores) : null
  const prevNet = prevSum ? net(prevSum.correct, prevSum.wrong, kind) : null
  const totalAccuracy = accuracy(sum.correct, sum.wrong)
  const hasDiff = rows.some((r) => r.diff != null)

  return (
    <div className="@container space-y-4">
      <div className="grid gap-4 @3xl:grid-cols-[minmax(0,2fr)_minmax(0,3fr)]">
        <Card>
          <CardBody className="space-y-4">
            <div className="flex flex-wrap items-end justify-between gap-x-3 gap-y-1">
              <div>
                <p className="text-sm font-semibold text-muted">Toplam net</p>
                <p className="tabular font-display text-5xl leading-none font-extrabold tracking-tight">{formatNet(totalNet)}</p>
              </div>
              {prevNet != null && (
                <p className="text-right text-sm">
                  <Delta value={totalNet - prevNet} className="text-base" />
                  <span className="block text-xs text-muted">öncekine göre</span>
                </p>
              )}
            </div>
            <CountTiles correct={sum.correct} wrong={sum.wrong} blank={sum.blank} />
            <p className="text-sm text-muted">
              {previous ? (
                <>
                  Önceki deneme: <span className="font-semibold text-fg">{previous.title}</span>, {formatDate(previous.taken_on, 'd MMMM')},{' '}
                  <span className="tabular">{formatNet(prevNet)} net</span>
                </>
              ) : (
                'Karşılaştırılacak önceki deneme yok.'
              )}
            </p>
          </CardBody>
        </Card>

        <Card className="min-w-0">
          <CardHeader title="Ders netleri" />
          <CardBody className="pt-3">
            {rows.length ? (
              <SubjectNetChart
                rows={rows.map((r) => ({ id: r.subject_id, name: r.subject?.short ?? r.subject_id, net: r.net, color: subjectColor(r.subject) }))}
              />
            ) : (
              <p className="text-sm text-muted">Bu denemede ders sonucu yok.</p>
            )}
          </CardBody>
        </Card>
      </div>

      {rows.length > 0 && (
        <Card className="min-w-0 overflow-hidden">
          <table className="tabular w-full text-sm">
            <caption className="sr-only">Ders bazında sonuçlar</caption>
            <thead>
              <tr className="border-b border-line text-xs font-semibold text-muted">
                <th scope="col" className="py-3 pr-2 pl-4 text-left font-semibold">Ders</th>
                <th scope="col" className="w-9 px-1 text-right font-semibold" title="Doğru">D</th>
                <th scope="col" className="w-9 px-1 text-right font-semibold" title="Yanlış">Y</th>
                <th scope="col" className="w-9 px-1 text-right font-semibold" title="Boş">B</th>
                <th scope="col" className="w-14 px-1 text-right font-semibold">Net</th>
                <th scope="col" className="hidden w-20 px-1 text-right font-semibold @md:table-cell">Doğruluk</th>
                {hasDiff && (
                  <th scope="col" className="w-16 pr-4 pl-1 text-right font-semibold" title="Önceki denemeye göre">Fark</th>
                )}
                {!hasDiff && <th scope="col" className="w-2 pr-2" aria-hidden />}
              </tr>
            </thead>
            <tbody className="divide-y divide-line">
              {rows.map((r) => (
                <tr key={r.subject_id}>
                  <th scope="row" className="py-2.5 pr-2 pl-4 text-left font-normal">
                    <span className="flex items-center gap-2">
                      <span className="size-2.5 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(r.subject) }} aria-hidden />
                      <span className="min-w-0">
                        <span className="block truncate font-semibold @md:hidden">{r.subject?.short ?? r.subject_id}</span>
                        <span className="hidden truncate font-semibold @md:block">{r.subject?.name ?? r.subject_id}</span>
                        <span className="block text-xs whitespace-nowrap text-muted @md:hidden">
                          {r.accuracy == null ? 'Cevap yok' : `%${r.accuracy} doğruluk`}
                        </span>
                      </span>
                    </span>
                  </th>
                  <td className="px-1 text-right text-success">{r.correct}</td>
                  <td className="px-1 text-right text-danger">{r.wrong}</td>
                  <td className="px-1 text-right text-muted">{r.blank}</td>
                  <td className="px-1 text-right font-display text-base font-bold">{formatNet(r.net)}</td>
                  <td className="hidden px-1 text-right text-muted @md:table-cell">{r.accuracy == null ? '-' : `%${r.accuracy}`}</td>
                  {hasDiff ? (
                    <td className="pr-4 pl-1 text-right text-xs">{r.diff == null ? <span className="text-subtle">-</span> : <Delta value={r.diff} />}</td>
                  ) : (
                    <td aria-hidden />
                  )}
                </tr>
              ))}
            </tbody>
            <tfoot>
              <tr className="border-t border-line-strong bg-surface-2/60 font-semibold">
                <th scope="row" className="py-3 pr-2 pl-4 text-left">Toplam</th>
                <td className="px-1 text-right">{sum.correct}</td>
                <td className="px-1 text-right">{sum.wrong}</td>
                <td className="px-1 text-right">{sum.blank}</td>
                <td className="px-1 text-right font-display text-base font-bold">{formatNet(totalNet)}</td>
                <td className="hidden px-1 text-right text-muted @md:table-cell">{totalAccuracy == null ? '-' : `%${totalAccuracy}`}</td>
                {hasDiff ? (
                  <td className="pr-4 pl-1 text-right text-xs">{prevNet != null && <Delta value={totalNet - prevNet} />}</td>
                ) : (
                  <td aria-hidden />
                )}
              </tr>
            </tfoot>
          </table>
        </Card>
      )}

      <ExamTopicMisses examId={exam.id} scores={data.scores} canEdit={canEdit} />

      {canEdit && (
        <div className={cn('flex', rows.length ? 'justify-end' : 'justify-start')}>
          <Button variant="ghost" className="text-danger hover:bg-danger-soft" onClick={() => setConfirming(true)}>
            <Trash2 />
            Denemeyi sil
          </Button>
        </div>
      )}

      <Confirm
        open={confirming}
        onOpenChange={setConfirming}
        title="Deneme silinsin mi?"
        description={`${exam.title} ve ders sonuçları kalıcı olarak silinir.`}
        confirmLabel="Sil"
        onConfirm={async () => {
          try {
            await remove.mutateAsync({ examId: exam.id, studentId: exam.student_id })
            toast.success('Deneme silindi')
            onDeleted?.()
          } catch (err) {
            toast.error(errorMessage(err))
          }
        }}
      />
    </div>
  )
}

function DetailSkeleton() {
  return (
    <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
      <Skeleton className="h-52" />
      <Skeleton className="h-72" />
    </div>
  )
}
