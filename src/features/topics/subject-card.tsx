import { AnimatePresence, motion } from 'motion/react'
import { BookOpen, ChevronDown, CircleCheck, RotateCcw } from 'lucide-react'
import { useId } from 'react'
import { Link } from 'react-router'
import { Badge } from '@/components/ui/badge'
import { ProgressBar } from '@/components/ui/progress'
import { useLessonIndex } from '@/features/lessons/queries'
import { cn } from '@/lib/cn'
import { subjectColor, type Subject, type Topic } from '@/lib/exam'
import { formatPercent, nextStatus, statusMeta, type TopicState } from './status'
import type { Accuracy, LessonStats } from './use-topics'

const ease = [0.22, 1, 0.36, 1] as const

type Props = {
  subject: Subject
  topics: Topic[]
  visible: Topic[]
  statusOf: (topicId: number) => TopicState
  accuracy: Record<number, Accuracy> | undefined
  lessonStats?: Map<number, LessonStats>
  open: boolean
  onToggle: () => void
  onCycle?: (topic: Topic) => void
}

export function SubjectCard({ subject, topics, visible, statusOf, accuracy, lessonStats, open, onToggle, onCycle }: Props) {
  const lessons = useLessonIndex().data
  const id = useId()
  let done = 0
  let review = 0
  for (const t of topics) {
    const s = statusOf(t.id)
    if (s === 'done') done++
    else if (s === 'review') review++
  }
  const complete = done === topics.length

  return (
    <section className="overflow-hidden rounded-2xl border border-line bg-surface shadow-card">
      <h3>
        <button
          type="button"
          id={`${id}-h`}
          aria-expanded={open}
          aria-controls={`${id}-c`}
          onClick={onToggle}
          className="flex w-full items-start gap-3 px-4 py-3.5 text-left transition-colors hover:bg-surface-2/60 focus-visible:-outline-offset-2 sm:px-5 sm:py-4"
        >
          <span
            aria-hidden
            className="mt-1.5 size-2.5 shrink-0 rounded-full"
            style={{ backgroundColor: subjectColor(subject) }}
          />
          <span className="min-w-0 flex-1">
            <span className="block font-display text-[15px] leading-snug font-bold sm:text-base">{subject.name}</span>
            <span className="mt-1 flex flex-wrap items-center gap-x-2 gap-y-1 font-sans text-sm text-muted">
              <span className={cn('tabular inline-flex items-center gap-1', complete && 'font-semibold text-primary')}>
                {complete && <CircleCheck className="size-4" aria-hidden />}
                {done}/{topics.length} konu tamam
              </span>
              {review > 0 && (
                <Badge tone="warning">
                  <RotateCcw aria-hidden />
                  {review} tekrar
                </Badge>
              )}
            </span>
            <ProgressBar value={topics.length ? done / topics.length : 0} className="mt-2.5" />
          </span>
          <ChevronDown
            aria-hidden
            className={cn('mt-0.5 size-5 shrink-0 text-muted transition-transform duration-200', open && 'rotate-180')}
          />
        </button>
      </h3>
      <AnimatePresence initial={false}>
        {open && (
          <motion.div
            id={`${id}-c`}
            role="region"
            aria-labelledby={`${id}-h`}
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.26, ease }}
            className="overflow-hidden"
          >
            <ul className="divide-y divide-line border-t border-line">
              {visible.map((topic) => (
                <TopicRow
                  key={topic.id}
                  topic={topic}
                  status={statusOf(topic.id)}
                  accuracy={accuracy?.[topic.id]}
                  lesson={lessons?.get(topic.id) === true}
                  lessonStats={lessonStats?.get(topic.id)}
                  onCycle={onCycle ? () => onCycle(topic) : undefined}
                />
              ))}
            </ul>
          </motion.div>
        )}
      </AnimatePresence>
    </section>
  )
}

function TopicRow({
  topic,
  status,
  accuracy,
  lesson,
  lessonStats,
  onCycle,
}: {
  topic: Topic
  status: TopicState
  accuracy?: Accuracy
  lesson: boolean
  lessonStats?: LessonStats
  onCycle?: () => void
}) {
  const meta = statusMeta[status]
  const Icon = meta.icon
  const icon = (
    <AnimatePresence mode="popLayout" initial={false}>
      <motion.span
        key={status}
        className={cn('grid place-items-center', meta.iconTone)}
        initial={{ scale: 0.3, opacity: 0, rotate: -60 }}
        animate={{ scale: 1, opacity: 1, rotate: 0 }}
        exit={{ scale: 0.3, opacity: 0 }}
        transition={{ type: 'spring', bounce: 0.45, duration: 0.35 }}
      >
        <Icon className="size-5" strokeWidth={2.25} aria-hidden />
      </motion.span>
    </AnimatePresence>
  )
  const box = cn('grid size-11 shrink-0 place-items-center rounded-xl border', meta.chip)

  return (
    <li className="flex items-center gap-3 px-3 py-1 sm:px-4">
      {onCycle ? (
        <button
          type="button"
          onClick={onCycle}
          title={`Sonraki durum: ${statusMeta[nextStatus(status)].label}`}
          className={cn(box, meta.hover, 'cursor-pointer touch-manipulation transition-[background-color,border-color,scale] duration-200 select-none active:scale-[0.94]')}
        >
          {icon}
          <span className="sr-only">
            {topic.name}, {meta.label}
          </span>
        </button>
      ) : (
        <div className={box}>
          {icon}
          <span className="sr-only">{meta.label}</span>
        </div>
      )}
      <div className="min-w-0 flex-1 py-1">
        <p className="text-[15px] leading-snug font-medium">{topic.name}</p>
        <p className="mt-0.5 flex flex-wrap items-center gap-x-2 text-xs text-muted">
          <span>{meta.label}</span>
          {accuracy && accuracy.total > 0 && <AccuracyTag accuracy={accuracy} />}
          {lessonStats && lessonStats.answered > 0 && (
            <span className="tabular">
              Anlatım: {lessonStats.answered} soru çözüldü, ilk denemede {lessonStats.correct} doğru
            </span>
          )}
        </p>
      </div>
      {lesson && (
        <Link
          to={`/app/konular/${topic.id}`}
          className="inline-flex min-h-11 shrink-0 items-center gap-1.5 rounded-xl bg-accent-soft px-3 text-sm font-semibold text-accent-soft-fg transition-colors hover:brightness-95"
        >
          <BookOpen className="size-4" aria-hidden />
          Anlatım
          <span className="sr-only">, {topic.name}</span>
        </Link>
      )}
    </li>
  )
}

function AccuracyTag({ accuracy }: { accuracy: Accuracy }) {
  const ratio = accuracy.correct / accuracy.total
  const label = formatPercent(ratio)
  const tone = ratio >= 0.75 ? 'text-success' : ratio >= 0.5 ? 'text-warning' : 'text-danger'
  return (
    <span
      className={cn('tabular shrink-0 text-xs font-bold', tone)}
      title={`${accuracy.total} soruda ${label} doğru`}
    >
      <span aria-hidden>{label}</span>
      <span className="sr-only">
        , {accuracy.total} soruda {label} doğru
      </span>
    </span>
  )
}
