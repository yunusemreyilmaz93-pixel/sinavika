import { ListPlus } from 'lucide-react'
import { useMemo } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { useTaskActions } from '@/features/plan/queries'
import { useCurriculum } from '@/lib/data'
import { shiftDays, todayISO } from '@/lib/dates'
import { formatNet, subjectColor, type ExamKind } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { lossOf } from './loss'
import type { Score } from './queries'
import { useExamMisses } from './topic-misses'

const QUESTIONS_PER_TASK = 20

export function LossAnalysis({ examId, studentId, kind, scores, canAssign, assignLabel }: { examId: number; studentId: string; kind: ExamKind; scores: Score[]; canAssign: boolean; assignLabel: string }) {
  const curriculum = useCurriculum()
  const misses = useExamMisses(examId)
  const { save } = useTaskActions(studentId)
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

  const assign = async () => {
    try {
      const today = todayISO()
      for (const [i, { topic }] of suggestions.entries()) {
        await save.mutateAsync({
          values: {
            title: `${topic.name} ${QUESTIONS_PER_TASK} soru`,
            kind: 'questions',
            subject_id: topic.subject_id,
            topic_id: topic.id,
            target_questions: QUESTIONS_PER_TASK,
            target_minutes: null,
            note: null,
            video_id: null,
            video_title: null,
            due_on: shiftDays(today, i + 1),
          },
        })
      }
      toast.success(`${suggestions.length} görev eklendi`)
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

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

        {suggestions.length > 0 ? (
          <div className="border-t border-line pt-4">
            <p className="text-sm font-semibold">En çok takılınan konular için öneri</p>
            <ul className="mt-2 space-y-1.5 text-[15px]">
              {suggestions.map(({ topic, misses: count }) => (
                <li key={topic.id} className="flex justify-between gap-3">
                  <span className="min-w-0 break-words">
                    {topic.name} {QUESTIONS_PER_TASK} soru
                  </span>
                  <span className="tabular shrink-0 text-muted">{count} kaçırma</span>
                </li>
              ))}
            </ul>
            {canAssign && (
              <Button className="mt-3 min-h-11" onClick={assign} loading={save.isPending}>
                <ListPlus />
                {assignLabel}
              </Button>
            )}
          </div>
        ) : (
          <p className="border-t border-line pt-4 text-sm text-muted">Aşağıdan takılınan konular işaretlenince çalışma önerisi burada çıkar.</p>
        )}
      </CardBody>
    </Card>
  )
}
