import { ArrowRight, Gauge } from 'lucide-react'
import { Link } from 'react-router'
import { Badge } from '@/components/ui/badge'
import { Card } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { examDateFor, useCurriculum, useSettings } from '@/lib/data'
import { todayISO } from '@/lib/dates'
import { studentSubjects, type Field, type Track } from '@/lib/exam'
import { computePace, type Pace } from './pace'
import { useTopicProgress } from './use-topics'

const one = new Intl.NumberFormat('tr-TR', { maximumFractionDigits: 1 })

const stateMeta: Record<Exclude<Pace['state'], 'past'>, { label: string; tone: 'primary' | 'warning' | 'neutral' }> = {
  done: { label: 'Konular tamam', tone: 'primary' },
  ahead: { label: 'Yetişiyor', tone: 'primary' },
  behind: { label: 'Geride', tone: 'warning' },
  stalled: { label: 'İlerleme yok', tone: 'warning' },
}

function headline(p: Pace) {
  if (p.state === 'done') return 'Tüm konular tamam olarak işaretli'
  if (p.state === 'ahead') return 'Bu hızla konular sınavdan önce biter'
  if (p.state === 'behind') return `Bu hızla konular sınavdan ${p.lateDays} gün sonra biter`
  return 'Son 4 haftada tamamlanan konu yok'
}

export function PaceCard({
  studentId,
  student,
  compact = false,
  topicsHref,
  className,
}: {
  studentId: string
  student: { track: Track; field: Field | null }
  compact?: boolean
  topicsHref?: string
  className?: string
}) {
  const curriculum = useCurriculum()
  const progress = useTopicProgress(studentId)
  const settings = useSettings()
  const exam = examDateFor(settings.data, student.track)

  if (curriculum.isPending || progress.isPending || settings.isPending) {
    return <Skeleton className={cn(compact ? 'h-28' : 'h-64', 'rounded-2xl', className)} />
  }
  if (!curriculum.data || !progress.data || !exam) return null

  const subjects = studentSubjects(curriculum.data.subjects, student)
    .map((s) => ({ id: s.id, name: s.name, topicIds: (curriculum.data.topicsBySubject.get(s.id) ?? []).map((t) => t.id) }))
    .filter((s) => s.topicIds.length > 0)
  const pace = computePace({ subjects, progress: progress.data, today: todayISO(), examDate: exam.date })
  if (pace.state === 'past' || pace.total === 0) return null

  const meta = stateMeta[pace.state]
  const share = pace.total ? pace.done / pace.total : 0

  return (
    <Card className={cn('p-4 sm:p-5', className)}>
      <div className="flex items-start gap-3">
        <span
          className={cn(
            'grid size-10 shrink-0 place-items-center rounded-xl',
            meta.tone === 'warning' ? 'bg-warning-soft text-warning' : 'bg-primary-soft text-primary-soft-fg',
          )}
          aria-hidden
        >
          <Gauge className="size-5" />
        </span>
        <div className="min-w-0 flex-1">
          <div className="flex flex-wrap items-center gap-x-2 gap-y-1">
            <h3 className="text-base font-bold">Konu temposu</h3>
            <Badge tone={meta.tone}>{meta.label}</Badge>
          </div>
          <p className="mt-0.5 text-sm text-muted">{headline(pace)}</p>
        </div>
      </div>

      <div className="mt-4">
        <div className="mb-1.5 flex items-baseline justify-between gap-3 text-sm">
          <span className="text-muted">
            <span className="tabular font-semibold text-fg">{pace.done}</span>/{pace.total} konu tamam
          </span>
          <span className="tabular text-muted">{pace.remaining} kaldı</span>
        </div>
        <div className="h-2 overflow-hidden rounded-full bg-surface-2">
          <div className="h-full rounded-full bg-primary transition-[width] duration-300" style={{ width: `${share * 100}%` }} />
        </div>
      </div>

      {pace.state !== 'done' && (
        <dl className="mt-4 grid grid-cols-2 gap-3">
          <div className="rounded-xl bg-surface-2 px-3 py-2.5">
            <dt className="text-xs text-muted">Son 4 hafta</dt>
            <dd className="mt-0.5 text-sm font-semibold">
              Haftada <span className="tabular">{one.format(pace.weeklyRate)}</span> konu
            </dd>
          </div>
          <div className={cn('rounded-xl px-3 py-2.5', pace.state === 'ahead' ? 'bg-surface-2' : 'bg-warning-soft')}>
            <dt className="text-xs text-muted">Yetişmesi için</dt>
            <dd className="mt-0.5 text-sm font-semibold">
              Haftada <span className="tabular">{one.format(Math.ceil(pace.required * 10) / 10)}</span> konu
            </dd>
          </div>
        </dl>
      )}

      {!compact && pace.subjects.length > 0 && (
        <ul className="mt-4 space-y-2.5" aria-label="Derslere göre kalan konular">
          {pace.subjects.map((s) => (
            <li key={s.id} className="flex items-center gap-3 text-sm">
              <span className="w-28 shrink-0 truncate font-semibold sm:w-56">{s.name}</span>
              <span className="h-1.5 flex-1 overflow-hidden rounded-full bg-surface-2">
                <span className="block h-full rounded-full bg-primary" style={{ width: `${(s.done / s.total) * 100}%` }} />
              </span>
              <span className="tabular w-20 shrink-0 text-right text-muted">{s.remaining} konu</span>
            </li>
          ))}
        </ul>
      )}

      {compact && topicsHref && (
        <Link to={topicsHref} className="mt-3 inline-flex min-h-11 items-center gap-1 text-sm font-semibold text-accent hover:underline">
          Konulara gidin
          <ArrowRight className="size-4" aria-hidden />
        </Link>
      )}
    </Card>
  )
}
