import { CalendarPlus } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { useProfile } from '@/features/auth/session'
import { useCurriculum } from '@/lib/data'
import { shiftDays, todayISO } from '@/lib/dates'
import { formatNet, subjectColor, type ExamKind } from '@/lib/exam'
import { planFromExam } from './exam-plan'
import { ExamPlanDialog } from './exam-plan-dialog'
import { lossOf } from './loss'
import type { Score } from './queries'
import { useExamMisses } from './topic-misses'

export function LossAnalysis({ examId, studentId, kind, scores, canAssign, assignLabel }: { examId: number; studentId: string; kind: ExamKind; scores: Score[]; canAssign: boolean; assignLabel: string }) {
  const curriculum = useCurriculum()
  const misses = useExamMisses(examId)
  const forTeacher = useProfile().role === 'teacher'
  const [planning, setPlanning] = useState(false)
  const subjectById = curriculum.data?.subjectById
  const topicById = curriculum.data?.topicById

  const loss = useMemo(() => lossOf(scores, kind, (id) => subjectById?.get(id)?.question_count), [scores, kind, subjectById])
  const suggestions = useMemo(
    () =>
      [...(misses.data ?? [])]
        .sort((a, b) => b.misses - a.misses)
        .slice(0, 3)
        .flatMap((m) => {
          const topic = topicById?.get(m.topic_id)
          return topic ? [{ topic, misses: m.misses }] : []
        }),
    [misses.data, topicById],
  )

  if (!subjectById || loss.total <= 0) return null
  const top = loss.rows[0]?.total || 1

  const drafts = planFromExam({
    topics: (misses.data ?? []).flatMap((m) => {
      const topic = topicById?.get(m.topic_id)
      return topic ? [{ id: topic.id, name: topic.name, subjectId: topic.subject_id, misses: m.misses }] : []
    }),
    subjects: loss.rows.map((r) => ({ id: r.subject_id, name: subjectById.get(r.subject_id)?.name ?? r.subject_id, loss: r.total })),
    start: shiftDays(todayISO(), 1),
  })

  return (
    <Card>
      <CardHeader title="Net kaybı" description="Mükemmel netten uzaklık ve kaybın nerede olduğu" />
      <CardBody className="space-y-4">
        <div className="flex flex-wrap items-end justify-between gap-x-6 gap-y-2">
          <p className="tabular font-display text-4xl leading-none font-extrabold">{formatNet(loss.total)}</p>
          <p className="text-sm text-muted">
            Yanlışlardan <span className="tabular font-semibold text-fg">{formatNet(loss.wrongLoss)}</span>, boşlardan{' '}
            <span className="tabular font-semibold text-fg">{formatNet(loss.blankLoss)}</span> net
          </p>
        </div>
        <ul className="space-y-3">
          {loss.rows
            .filter((r) => r.total > 0)
            .map((r) => {
              const subject = subjectById.get(r.subject_id)
              return (
                <li key={r.subject_id}>
                  <div className="flex items-baseline justify-between gap-3 text-sm">
                    <span className="flex min-w-0 items-center gap-2 font-semibold">
                      <span className="size-2.5 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(subject) }} aria-hidden />
                      <span className="truncate">{subject?.name ?? r.subject_id}</span>
                    </span>
                    <span className="tabular shrink-0 text-muted">
                      <span className="font-semibold text-fg">{formatNet(r.total)}</span> net
                    </span>
                  </div>
                  <ProgressBar value={r.total / top} tone="warning" className="mt-1.5 h-1.5" />
                </li>
              )
            })}
        </ul>

        <div className="border-t border-line pt-4">
          {suggestions.length > 0 ? (
            <>
              <p className="text-sm font-semibold">En çok takılınan konular</p>
              <ul className="mt-2 space-y-1.5 text-[15px]">
                {suggestions.map(({ topic, misses: count }) => (
                  <li key={topic.id} className="flex justify-between gap-3">
                    <span className="min-w-0 break-words">{topic.name}</span>
                    <span className="tabular shrink-0 text-muted">{count} kaçırma</span>
                  </li>
                ))}
              </ul>
            </>
          ) : (
            <p className="text-sm text-muted">Aşağıdan takılınan konular işaretlenirse plan konu konu çıkar, işaretlenmezse en çok net kaybedilen derslerden çıkar.</p>
          )}
          {canAssign && drafts.length > 0 && (
            <Button className="mt-3 min-h-11" onClick={() => setPlanning(true)}>
              <CalendarPlus />
              {assignLabel}
            </Button>
          )}
        </div>
      </CardBody>
      {planning && <ExamPlanDialog open onOpenChange={setPlanning} studentId={studentId} drafts={drafts} forTeacher={forTeacher} />}
    </Card>
  )
}
