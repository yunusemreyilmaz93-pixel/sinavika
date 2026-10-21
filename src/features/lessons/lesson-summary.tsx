import { useQuery } from '@tanstack/react-query'
import { Circle, CircleCheck, ListChecks, RotateCcw } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { useTaskActions } from '@/features/plan/queries'
import type { Task } from '@/features/plan/lib'
import { useSetTopicStatus, useTopicProgress } from '@/features/topics/use-topics'
import { cn } from '@/lib/cn'
import { formatDay } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'
import { useLessonTrack } from './answers'
import { useTopicCompletion, type Completion } from './progress'

function useOpenTopicTasks(studentId: string | undefined, topicId: number | undefined) {
  return useQuery({
    queryKey: ['tasks', studentId, 'topic', topicId],
    enabled: Boolean(studentId && topicId),
    queryFn: async (): Promise<Task[]> =>
      unwrap(await supabase.from('tasks').select('*').eq('student_id', studentId!).eq('topic_id', topicId!).is('done_at', null).order('due_on').limit(5)),
  })
}

type Criterion = { key: string; label: string; detail: string; value: number; ok: boolean }

function criteriaOf(c: Completion): Criterion[] {
  const list: Criterion[] = [{ key: 'reading', label: 'Okuma', detail: `%${c.reading_pct}`, value: c.reading_pct / 100, ok: c.reading_ok }]
  if (c.video_count > 0) {
    list.push({ key: 'video', label: 'Video', detail: `%${c.video_pct}, en az %70`, value: Math.min(1, c.video_pct / 70), ok: c.video_ok })
  }
  if (c.test_total > 0) {
    const need = Math.ceil(0.75 * c.test_total)
    list.push({
      key: 'test',
      label: 'Mini test',
      detail: c.test_answered < c.test_total ? `${c.test_answered}/${c.test_total} soru çözüldü` : `${c.test_now}/${c.test_total} doğru, en az ${need}`,
      value: c.test_answered < c.test_total ? c.test_answered / c.test_total / 2 : 0.5 + Math.min(1, c.test_now / need) / 2,
      ok: c.test_ok,
    })
  }
  return list
}

export function LessonSummary() {
  const track = useLessonTrack()
  const studentId = track?.studentId ?? ''
  const progress = useTopicProgress(studentId)
  const setStatus = useSetTopicStatus(studentId)
  const tasks = useOpenTopicTasks(track?.studentId, track?.topicId)
  const completion = useTopicCompletion(studentId, track?.topicId ?? 0)
  const { toggle } = useTaskActions(studentId)
  if (!track) return null

  const row = completion.data
  const current = progress.data?.find((r) => r.topic_id === track.topicId)?.status
  const openTasks = tasks.data ?? []
  const criteria = row ? criteriaOf(row) : []
  const testDone = row !== null && row !== undefined && row.test_total > 0 && row.test_answered >= row.test_total
  const needsReview = testDone && !row.test_ok

  return (
    <Card className="mt-10 space-y-4 p-4 sm:p-5">
      <section aria-label="Konu durumu">
        <h2 className="font-display text-lg font-bold">Konuyu bitirdin mi?</h2>
        <p className="mt-1 text-[15px] text-muted">
          {current === 'done' ? 'Bu konu Tamam olarak işaretli.' : current === 'review' ? 'Bu konu Tekrar lazım olarak işaretli.' : 'Bu konu şu an Çalışıyorum durumunda.'}
        </p>
        {criteria.length > 0 && (
          <ul className="mt-3 space-y-3" aria-label="Tamamlama ölçütleri">
            {criteria.map((c) => (
              <li key={c.key}>
                <div className="flex items-center gap-2 text-[15px]">
                  {c.ok ? <CircleCheck className="size-5 shrink-0 text-primary" aria-hidden /> : <Circle className="size-5 shrink-0 text-subtle" aria-hidden />}
                  <span className="font-semibold">{c.label}</span>
                  <span className={cn('tabular ml-auto text-sm', c.ok ? 'text-primary' : 'text-muted')}>{c.detail}</span>
                </div>
                <ProgressBar value={c.value} tone={c.ok ? 'primary' : 'accent'} className="mt-1.5" />
              </li>
            ))}
          </ul>
        )}
        {row && row.test_answered > 0 && (
          <p className="mt-3 text-[15px]">
            İlk denemede <strong>{row.test_first}</strong> / {row.test_total} doğru yaptın.
            {needsReview ? ' Bu konuyu biraz daha tekrar etmek iyi olur.' : ''}
          </p>
        )}
        <div className="mt-3 flex flex-wrap gap-2">
          {current !== 'done' && (
            <Button className="min-h-11" disabled={!row?.complete} onClick={() => setStatus.mutate({ topicId: track.topicId, status: 'done' })}>
              <CircleCheck />
              Konuyu bitirdim
            </Button>
          )}
          {current !== 'review' && (
            <Button variant={needsReview ? 'primary' : 'secondary'} className="min-h-11" onClick={() => setStatus.mutate({ topicId: track.topicId, status: 'review' })}>
              <RotateCcw />
              Tekrar lazım
            </Button>
          )}
        </div>
      </section>

      {openTasks.length > 0 && (
        <section aria-label="Bu konudaki görevlerin" className="border-t border-line pt-4">
          <h2 className="flex items-center gap-2 font-display text-lg font-bold">
            <ListChecks className="size-5 text-primary" aria-hidden />
            Bu konudaki görevlerin
          </h2>
          <ul className="mt-2 divide-y divide-line">
            {openTasks.map((task) => (
              <li key={task.id} className="flex items-center justify-between gap-3 py-2">
                <div className="min-w-0">
                  <p className="text-[15px] font-semibold break-words">{task.title}</p>
                  <p className="text-sm text-muted">{formatDay(task.due_on)}</p>
                </div>
                <Button variant="secondary" size="sm" className="min-h-11 shrink-0" onClick={() => toggle(task, true)}>
                  Tamamla
                </Button>
              </li>
            ))}
          </ul>
        </section>
      )}
    </Card>
  )
}
