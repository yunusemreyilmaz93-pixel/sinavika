import { ArrowRight } from 'lucide-react'
import { motion } from 'motion/react'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { formatDate, formatDay } from '@/lib/dates'
import { examLabel, formatNet, subjectColor, type ExamKind, type Subject } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { Delta } from './delta'
import { OpenExam, type ExamOpener } from './exam-list'
import type { ExamResult, Score } from './queries'
import { round2, subjectAverages } from './stats'

export function CountTiles({ correct, wrong, blank, className }: { correct: number; wrong: number; blank: number; className?: string }) {
  const tiles = [
    { label: 'Doğru', value: correct, tone: 'text-success' },
    { label: 'Yanlış', value: wrong, tone: 'text-danger' },
    { label: 'Boş', value: blank, tone: 'text-muted' },
  ]
  return (
    <dl className={cn('grid grid-cols-3 gap-2', className)}>
      {tiles.map((t) => (
        <div key={t.label} className="rounded-xl bg-surface-2 px-3 py-2">
          <dt className="text-xs font-semibold text-muted">{t.label}</dt>
          <dd className={cn('tabular font-display text-xl font-bold', t.tone)}>{t.value}</dd>
        </div>
      ))}
    </dl>
  )
}

export function GoalLine({ current, target, label }: { current: number; target: number; label?: string }) {
  const left = round2(target - current)
  return (
    <div>
      <div className="flex items-baseline justify-between gap-2 text-sm">
        <span className="font-semibold">{label ?? `Hedef ${formatNet(target)} net`}</span>
        {left > 0 ? (
          <span className="tabular text-muted">{formatNet(left)} net kaldı</span>
        ) : (
          <span className="marker font-semibold">Hedefe ulaşıldı</span>
        )}
      </div>
      <ProgressBar value={target ? current / target : 0} className="mt-2" />
    </div>
  )
}

export function LastExamCard({
  last,
  previous,
  target,
  opener,
  className,
}: {
  last: ExamResult
  previous?: ExamResult
  target: number | null
  opener: ExamOpener
  className?: string
}) {
  return (
    <Card className={cn('flex flex-col', className)}>
      <CardHeader title="Son deneme" description={`${formatDay(last.taken_on)} · ${last.title}`} />
      <CardBody className="flex flex-1 flex-col gap-4">
        <div className="flex flex-wrap items-end justify-between gap-x-3 gap-y-1">
          <motion.p
            key={last.id}
            initial={{ opacity: 0, y: 6 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.25 }}
            className="tabular font-display text-5xl leading-none font-extrabold tracking-tight"
          >
            {formatNet(last.net)}
            <span className="ml-1.5 text-base font-semibold text-muted">net</span>
          </motion.p>
          {previous ? (
            <p className="text-right text-sm">
              <Delta value={last.net - previous.net} className="text-base" />
              <span className="block text-xs text-muted">öncekine göre</span>
            </p>
          ) : (
            <p className="text-sm text-muted">İlk {examLabel[last.kind]} denemesi</p>
          )}
        </div>
        <CountTiles correct={last.correct} wrong={last.wrong} blank={last.blank} />
        {target != null && <GoalLine current={last.net} target={target} />}
        <OpenExam
          exam={last}
          opener={opener}
          className="mt-auto inline-flex h-11 items-center gap-1.5 self-start rounded-lg text-sm font-semibold text-accent hover:underline"
        >
          Ders ders sonuçlar
          <ArrowRight className="size-4" />
        </OpenExam>
      </CardBody>
    </Card>
  )
}

export function SubjectAverages({
  kind,
  scores,
  loading,
  error,
  examCount,
  subjectById,
  className,
}: {
  kind: ExamKind
  scores: Score[] | undefined
  loading: boolean
  error: unknown
  examCount: number
  subjectById: Map<string, Subject>
  className?: string
}) {
  const rows = scores ? subjectAverages(scores, kind, subjectById) : []
  return (
    <Card className={cn('min-w-0', className)}>
      <CardHeader title="Ders ortalaması" description={examCount > 1 ? `Son ${examCount} denemenin ortalama neti` : 'Son denemenin netleri'} />
      <CardBody>
        {loading ? (
          <div className="space-y-4" aria-busy="true">
            {Array.from({ length: 5 }, (_, i) => (
              <Skeleton key={i} className="h-8" />
            ))}
          </div>
        ) : error ? (
          <p className="text-sm text-danger">{errorMessage(error)}</p>
        ) : rows.length === 0 ? (
          <p className="text-sm text-muted">Bu denemelerde ders sonucu girilmemiş.</p>
        ) : (
          <ul className="space-y-3.5">
            {rows.map((row) => {
              const total = row.subject?.question_count ?? 0
              const ratio = total ? Math.max(0, row.average) / total : 0
              return (
                <li key={row.subject_id}>
                  <div className="flex items-baseline justify-between gap-3 text-sm">
                    <span className="truncate font-semibold">{row.subject?.name ?? row.subject_id}</span>
                    <span className="tabular shrink-0 text-muted">
                      <span className="font-display text-base font-bold text-fg">{formatNet(row.average)}</span> / {total}
                    </span>
                  </div>
                  <div className="mt-1.5 h-2 overflow-hidden rounded-full bg-surface-2" aria-hidden>
                    <motion.div
                      className="h-full rounded-full"
                      style={{ backgroundColor: subjectColor(row.subject) }}
                      initial={{ width: 0 }}
                      animate={{ width: `${Math.min(1, ratio) * 100}%` }}
                      transition={{ duration: 0.4, ease: [0.22, 1, 0.36, 1] }}
                    />
                  </div>
                </li>
              )
            })}
          </ul>
        )}
      </CardBody>
    </Card>
  )
}

export function OverviewSkeleton() {
  return (
    <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
      <Skeleton className="h-11 w-full sm:w-64" />
      <div className="grid gap-4 lg:grid-cols-3">
        <Skeleton className="h-72" />
        <Skeleton className="h-72 lg:col-span-2" />
      </div>
      <div className="grid gap-4 lg:grid-cols-3">
        <Skeleton className="h-64" />
        <Skeleton className="h-64 lg:col-span-2" />
      </div>
    </div>
  )
}

export function examDateLabel(exam: Pick<ExamResult, 'kind' | 'taken_on'>) {
  return `${examLabel[exam.kind]} · ${formatDate(exam.taken_on, 'd MMMM yyyy')}`
}
