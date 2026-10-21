import { ArrowRight, BookOpen } from 'lucide-react'
import { Link } from 'react-router'
import { Card } from '@/components/ui/card'
import { useTopicProgress } from '@/features/topics/use-topics'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { studentSubjects, type Field, type Track } from '@/lib/exam'
import { useLessonIndex } from './queries'

const labels = { learning: 'Devam et', review: 'Tekrar et', none: 'Çalışmaya başla' } as const

export function NextLesson({ studentId, student, className }: { studentId: string; student: { track: Track; field: Field | null }; className?: string }) {
  const curriculum = useCurriculum().data
  const lessons = useLessonIndex().data
  const progress = useTopicProgress(studentId).data

  if (!curriculum || !lessons || !progress) return null

  const status = new Map(progress.map((row) => [row.topic_id, row.status]))
  const available = studentSubjects(curriculum.subjects, student).flatMap((subject) =>
    (curriculum.topicsBySubject.get(subject.id) ?? []).filter((t) => lessons.get(t.id) === true).map((topic) => ({ topic, subject })),
  )
  const pick =
    available.find((a) => status.get(a.topic.id) === 'learning') ??
    available.find((a) => status.get(a.topic.id) === 'review') ??
    available.find((a) => !status.has(a.topic.id))
  if (!pick) return null

  const state = status.get(pick.topic.id) ?? 'none'
  const label = labels[state === 'done' ? 'none' : state]

  return (
    <Card className={cn('p-4 sm:p-5', className)}>
      <div className="flex items-center gap-3">
        <span className="grid size-11 shrink-0 place-items-center rounded-xl bg-accent-soft text-accent-soft-fg">
          <BookOpen className="size-5" aria-hidden />
        </span>
        <div className="min-w-0 flex-1">
          <p className="text-sm text-muted">Sıradaki anlatım</p>
          <p className="font-display text-base leading-snug font-bold">{pick.topic.name}</p>
          <p className="text-sm text-muted">{pick.subject.name}</p>
        </div>
      </div>
      <Link
        to={`/app/konular/${pick.topic.id}`}
        className="mt-3 inline-flex min-h-11 w-full items-center justify-center gap-2 rounded-xl bg-primary px-4 text-[15px] font-semibold text-primary-fg shadow-card transition-colors hover:bg-primary-hover"
      >
        {label}
        <ArrowRight className="size-4" aria-hidden />
      </Link>
    </Card>
  )
}
