import { AnimatePresence, motion } from 'motion/react'
import { BookOpen, ChevronDown, CircleCheck, RotateCcw } from 'lucide-react'
import { useId } from 'react'
import { Link } from 'react-router'
import { Badge } from '@/components/ui/badge'
import { ProgressBar } from '@/components/ui/progress'
import { lessonFor } from '@/features/lessons/registry'
import { cn } from '@/lib/cn'
import { subjectColor, type Subject, type Topic } from '@/lib/exam'
import { formatPercent, nextStatus, statusMeta, type TopicState } from './status'
import type { Accuracy } from './use-topics'

const ease = [0.22, 1, 0.36, 1] as const

type Props = {
  subject: Subject
  topics: Topic[]
  visible: Topic[]
  statusOf: (topicId: number) => TopicState
  accuracy: Record<number, Accuracy> | undefined
  open: boolean
  onToggle: () => void
  onCycle?: (topic: Topic) => void
}

export function SubjectCard({ subject, topics, visible, statusOf, accuracy, open, onToggle, onCycle }: Props) {
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
            <ul className="flex flex-wrap gap-2 border-t border-line px-4 py-3.5 sm:px-5 sm:py-4">
              {visible.map((topic) => (
                <li key={topic.id} className="flex max-w-full items-stretch gap-1">
                  <TopicChip
                    name={topic.name}
                    status={statusOf(topic.id)}
                    accuracy={accuracy?.[topic.id]}
                    onCycle={onCycle ? () => onCycle(topic) : undefined}
                  />
                  {lessonFor(topic) && (
                    <Link
                      to={`/app/konular/${topic.id}`}
                      className="inline-flex min-h-11 items-center gap-1.5 rounded-xl bg-accent-soft px-3 text-sm font-semibold text-accent-soft-fg transition-colors hover:brightness-95"
                    >
                      <BookOpen className="size-4" aria-hidden />
                      Konu anlatımı
                    </Link>
                  )}
                </li>
              ))}
            </ul>
          </motion.div>
        )}
      </AnimatePresence>
    </section>
  )
}

function TopicChip({
  name,
  status,
  accuracy,
  onCycle,
}: {
  name: string
  status: TopicState
  accuracy?: Accuracy
  onCycle?: () => void
}) {
  const meta = statusMeta[status]
  const Icon = meta.icon
  const base = cn(
    'inline-flex min-h-11 max-w-full items-center gap-2 rounded-xl border px-3 py-2 text-left text-sm leading-snug font-medium',
    meta.chip,
  )
  const content = (
    <>
      <span className="relative grid size-4 shrink-0 place-items-center">
        <AnimatePresence mode="popLayout" initial={false}>
          <motion.span
            key={status}
            className={cn('grid place-items-center', meta.iconTone)}
            initial={{ scale: 0.3, opacity: 0, rotate: -60 }}
            animate={{ scale: 1, opacity: 1, rotate: 0 }}
            exit={{ scale: 0.3, opacity: 0 }}
            transition={{ type: 'spring', bounce: 0.45, duration: 0.35 }}
          >
            <Icon className="size-4" strokeWidth={2.25} aria-hidden />
          </motion.span>
        </AnimatePresence>
      </span>
      <span className="min-w-0">{name}</span>
      <span className="sr-only">, {meta.label}</span>
      {accuracy && accuracy.total > 0 && <AccuracyTag accuracy={accuracy} />}
    </>
  )

  if (!onCycle) return <div className={base}>{content}</div>

  return (
    <button
      type="button"
      onClick={onCycle}
      title={`Sonraki durum: ${statusMeta[nextStatus(status)].label}`}
      className={cn(
        base,
        meta.hover,
        'cursor-pointer touch-manipulation transition-[background-color,border-color,color,scale] duration-200 select-none active:scale-[0.96]',
      )}
    >
      {content}
    </button>
  )
}

function AccuracyTag({ accuracy }: { accuracy: Accuracy }) {
  const ratio = accuracy.correct / accuracy.total
  const label = formatPercent(ratio)
  const tone = ratio >= 0.75 ? 'text-success' : ratio >= 0.5 ? 'text-warning' : 'text-danger'
  return (
    <span
      className={cn('tabular shrink-0 border-l border-current/20 pl-2 text-xs font-bold', tone)}
      title={`${accuracy.total} soruda ${label} doğru`}
    >
      <span aria-hidden>{label}</span>
      <span className="sr-only">
        , {accuracy.total} soruda {label} doğru
      </span>
    </span>
  )
}
