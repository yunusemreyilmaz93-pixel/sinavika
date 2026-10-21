import { useQuery } from '@tanstack/react-query'
import { CircleCheck, ListChecks, RotateCcw } from 'lucide-react'
import { useMemo } from 'react'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { useTaskActions } from '@/features/plan/queries'
import type { Task } from '@/features/plan/lib'
import { useSetTopicStatus, useTopicProgress } from '@/features/topics/use-topics'
import { formatDay } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'
import { questionKey, useLessonTrack } from './answers'
import { parseBlocks, parseQuestion, plainText } from './markdown/parse'

function useOpenTopicTasks(studentId: string | undefined, topicId: number | undefined) {
  return useQuery({
    queryKey: ['tasks', studentId, 'topic', topicId],
    enabled: Boolean(studentId && topicId),
    queryFn: async (): Promise<Task[]> =>
      unwrap(await supabase.from('tasks').select('*').eq('student_id', studentId!).eq('topic_id', topicId!).is('done_at', null).order('due_on').limit(5)),
  })
}

export function LessonSummary({ source }: { source: string }) {
  const track = useLessonTrack()
  const studentId = track?.studentId ?? ''
  const progress = useTopicProgress(studentId)
  const setStatus = useSetTopicStatus(studentId)
  const tasks = useOpenTopicTasks(track?.studentId, track?.topicId)
  const { toggle } = useTaskActions(studentId)

  const keys = useMemo(
    () =>
      parseBlocks(source)
        .filter((b) => b.type === 'box' && b.name === 'soru')
        .map((b) => {
          const q = parseQuestion(b.type === 'box' ? b.text : '')
          return questionKey(plainText(q.stem), q.options.map(plainText))
        }),
    [source],
  )
  if (!track) return null

  const answered = keys.filter((k) => track.answers.has(k))
  const correct = answered.filter((k) => track.answers.get(k)?.first_correct).length
  const complete = keys.length > 0 && answered.length === keys.length
  const good = complete && correct / keys.length >= 0.75
  const current = progress.data?.find((r) => r.topic_id === track.topicId)?.status
  const openTasks = tasks.data ?? []

  if (!keys.length && !openTasks.length) return null

  return (
    <Card className="mt-10 space-y-4 p-4 sm:p-5">
      {keys.length > 0 && (
        <section aria-label="Mini test">
          <div className="flex items-baseline justify-between gap-3">
            <h2 className="font-display text-lg font-bold">Mini test</h2>
            <p className="tabular text-sm font-semibold text-muted">
              {answered.length}/{keys.length} soru çözüldü
            </p>
          </div>
          <ProgressBar value={answered.length / keys.length} className="mt-2" />
          {complete ? (
            <div className="mt-3 space-y-3">
              <p className="text-[15px]">
                İlk denemede <strong>{correct}</strong> / {keys.length} doğru yaptın.{' '}
                {good ? 'Konuyu iyi anlamışsın.' : 'Bu konuyu biraz daha tekrar etmek iyi olur.'}
              </p>
              {current !== (good ? 'done' : 'review') && (
                <Button
                  variant={good ? 'primary' : 'secondary'}
                  onClick={() => setStatus.mutate({ topicId: track.topicId, status: good ? 'done' : 'review' })}
                  className="min-h-11"
                >
                  {good ? <CircleCheck /> : <RotateCcw />}
                  {good ? 'Konuyu Tamam işaretle' : 'Tekrar lazım olarak işaretle'}
                </Button>
              )}
            </div>
          ) : (
            <p className="mt-3 text-sm text-muted">Anlatımdaki soruları çözdükçe sonucun konu durumuna yansıtılır.</p>
          )}
        </section>
      )}

      {openTasks.length > 0 && (
        <section aria-label="Bu konudaki görevlerin" className={keys.length > 0 ? 'border-t border-line pt-4' : ''}>
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
