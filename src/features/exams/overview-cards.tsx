import { ChartColumn, Flame, Target, Trophy } from 'lucide-react'
import { motion } from 'motion/react'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { StatTile, Trend } from '@/components/ui/stat'
import { SubjectIcon } from '@/components/ui/subject-icon'
import { cn } from '@/lib/cn'
import { formatDate } from '@/lib/dates'
import { examLabel, formatNet, subjectColor, type ExamKind, type Subject } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
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

// Sınav türünün özet sayıları: son net, hedef, ortalama ve en iyi deneme
export function ExamStats({ exams, target }: { exams: ExamResult[]; target: number | null }) {
  const [last, previous] = exams
  if (!last) return null
  const average = round2(exams.reduce((n, e) => n + e.net, 0) / exams.length)
  const best = exams.reduce((a, b) => (b.net > a.net ? b : a))
  const change = previous ? round2(last.net - previous.net) : null
  const left = target != null ? round2(target - last.net) : null
  return (
    <div className="grid grid-cols-2 gap-2.5 lg:grid-cols-4">
      <StatTile
        icon={<Trophy />}
        hue="violet"
        label="Son net"
        value={formatNet(last.net)}
        aside={
          change != null && change !== 0 ? <Trend up={change > 0}>{formatNet(Math.abs(change))}</Trend> : formatDate(last.taken_on, 'd MMM')
        }
        className="bg-surface border border-line"
      />
      <StatTile
        icon={<Target />}
        hue="coral"
        label="Hedef"
        value={target != null ? formatNet(target) : '-'}
        aside={left == null ? undefined : left > 0 ? `${formatNet(left)} kaldı` : 'Ulaşıldı'}
        className="bg-surface border border-line"
      />
      <StatTile
        icon={<ChartColumn />}
        hue="sea"
        label="Ortalama"
        value={formatNet(average)}
        aside={`${exams.length} deneme`}
        className="bg-surface border border-line"
      />
      <StatTile
        icon={<Flame />}
        hue="amber"
        label="En iyi"
        value={formatNet(best.net)}
        aside={formatDate(best.taken_on, 'd MMM')}
        className="bg-surface border border-line"
      />
    </div>
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
      <CardHeader
        title="Ders ortalaması"
        description={examCount > 1 ? `Son ${examCount} denemenin ortalama neti` : 'Son denemenin netleri'}
      />
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
                  <div className="flex items-center justify-between gap-3 text-sm">
                    <span className="flex min-w-0 items-center gap-2.5 font-semibold">
                      <SubjectIcon subject={row.subject} size="sm" />
                      <span className="truncate">{row.subject?.name ?? row.subject_id}</span>
                    </span>
                    <span className="tabular shrink-0 text-muted">
                      <span className="font-display text-base font-bold text-fg">{formatNet(row.average)}</span> / {total}
                    </span>
                  </div>
                  <div className="mt-1.5 ml-[2.375rem] h-2 overflow-hidden rounded-full bg-surface-2" aria-hidden>
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
      <div className="grid grid-cols-2 gap-2.5 lg:grid-cols-4">
        {[0, 1, 2, 3].map((i) => (
          <Skeleton key={i} className="h-28 rounded-2xl" />
        ))}
      </div>
      <div className="grid gap-4 xl:grid-cols-[minmax(0,1fr)_22rem]">
        <Skeleton className="h-72 rounded-3xl" />
        <Skeleton className="h-72 rounded-3xl" />
      </div>
    </div>
  )
}

export function examDateLabel(exam: Pick<ExamResult, 'kind' | 'taken_on'>) {
  return `${examLabel[exam.kind]} · ${formatDate(exam.taken_on, 'd MMMM yyyy')}`
}
