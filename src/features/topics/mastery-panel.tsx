import { BookOpen } from 'lucide-react'
import { useMemo } from 'react'
import { Link } from 'react-router'
import { Card } from '@/components/ui/card'
import { useLessonIndex } from '@/features/lessons/queries'
import { useWrongQuestions } from '@/features/wrong/lib'
import { cn } from '@/lib/cn'
import { daysBetween, todayISO } from '@/lib/dates'
import type { Subject, Topic } from '@/lib/exam'
import { levelLabel, masteryOf, type Mastery, type MasteryLevel } from './mastery'
import type { TopicState } from './status'
import type { Accuracy } from './use-topics'

type Row = { topic_id: number; status: TopicState; updated_at: string }

const order: MasteryLevel[] = ['mastered', 'solid', 'learning', 'review', 'none']
const swatch: Record<MasteryLevel, string> = {
  mastered: 'bg-primary',
  solid: 'bg-primary/55',
  learning: 'bg-accent',
  review: 'bg-warning',
  none: 'bg-line-strong',
}

export function MasteryPanel({
  studentId,
  groups,
  progress,
  accuracy,
}: {
  studentId: string
  groups: { subject: Subject; topics: Topic[] }[]
  progress: Row[]
  accuracy: Record<number, Accuracy> | undefined
}) {
  const wrong = useWrongQuestions(studentId)
  const lessons = useLessonIndex().data

  const { counts, priorities } = useMemo(() => {
    const today = todayISO()
    const byTopic = new Map(progress.map((r) => [r.topic_id, r]))
    const wrongBy = new Map<number, { open: number; due: number }>()
    for (const w of wrong.data ?? []) {
      if (!w.topic_id || w.learned_at) continue
      const entry = wrongBy.get(w.topic_id) ?? { open: 0, due: 0 }
      entry.open++
      if (w.next_review_on <= today) entry.due++
      wrongBy.set(w.topic_id, entry)
    }
    const counts: Record<MasteryLevel, number> = { mastered: 0, solid: 0, learning: 0, review: 0, none: 0 }
    const priorities: { topic: Topic; subject: Subject; mastery: Mastery }[] = []
    for (const g of groups) {
      for (const topic of g.topics) {
        const row = byTopic.get(topic.id)
        const acc = accuracy?.[topic.id]
        const w = wrongBy.get(topic.id)
        const mastery = masteryOf({
          status: row?.status ?? 'none',
          correct: acc?.correct ?? 0,
          total: acc?.total ?? 0,
          openWrong: w?.open ?? 0,
          dueWrong: w?.due ?? 0,
          daysSinceUpdate: row ? daysBetween(row.updated_at.slice(0, 10), today) : null,
        })
        counts[mastery.level]++
        if (mastery.priority > 0) priorities.push({ topic, subject: g.subject, mastery })
      }
    }
    priorities.sort((a, b) => b.mastery.priority - a.mastery.priority)
    return { counts, priorities: priorities.slice(0, 5) }
  }, [groups, progress, accuracy, wrong.data])

  const total = order.reduce((sum, level) => sum + counts[level], 0)
  if (!total) return null

  return (
    <Card className="space-y-4 p-4 sm:p-5">
      <section aria-label="Hakimiyet haritası">
        <h2 className="font-display text-lg font-bold">Hakimiyet haritası</h2>
        <div className="mt-3 flex h-3 overflow-hidden rounded-full bg-surface-2" role="img" aria-label={order.map((l) => `${levelLabel[l]} ${counts[l]}`).join(', ')}>
          {order.map((level) =>
            counts[level] ? <span key={level} className={swatch[level]} style={{ width: `${(counts[level] / total) * 100}%` }} /> : null,
          )}
        </div>
        <ul className="mt-3 flex flex-wrap gap-x-4 gap-y-1.5 text-sm">
          {order.map((level) => (
            <li key={level} className="inline-flex items-center gap-1.5 text-muted">
              <span className={cn('size-2.5 rounded-full', swatch[level])} aria-hidden />
              {levelLabel[level]}
              <span className="tabular font-semibold text-fg">{counts[level]}</span>
            </li>
          ))}
        </ul>
        <p className="mt-2 text-xs text-subtle">Hakim: Tamam işaretli, en az 10 soruda %75 üstü doğruluk, bekleyen yanlış yok.</p>
      </section>

      {priorities.length > 0 && (
        <section aria-label="Öncelikli konular" className="border-t border-line pt-4">
          <h3 className="font-display text-base font-bold">Öncelikli konular</h3>
          <ul className="mt-2 divide-y divide-line">
            {priorities.map(({ topic, subject, mastery }) => (
              <li key={topic.id} className="flex items-center justify-between gap-3 py-2.5">
                <div className="min-w-0">
                  <p className="text-[15px] font-semibold break-words">{topic.name}</p>
                  <p className="text-sm text-muted">
                    {subject.short} · {mastery.reasons.join(', ')}
                  </p>
                </div>
                {lessons?.get(topic.id) === true && (
                  <Link
                    to={`/app/konular/${topic.id}`}
                    className="inline-flex min-h-11 shrink-0 items-center gap-1.5 rounded-xl bg-accent-soft px-3 text-sm font-semibold text-accent-soft-fg"
                  >
                    <BookOpen className="size-4" aria-hidden />
                    Anlatım
                  </Link>
                )}
              </li>
            ))}
          </ul>
        </section>
      )}
    </Card>
  )
}
