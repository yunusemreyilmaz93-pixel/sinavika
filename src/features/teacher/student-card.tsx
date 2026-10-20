import { ArrowDownRight, ArrowUpRight, CircleCheck, Clock3, Eye, Minus, TriangleAlert, UserRoundX, UsersRound } from 'lucide-react'
import { Link } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { ProgressBar } from '@/components/ui/progress'
import { cn } from '@/lib/cn'
import { formatRelative } from '@/lib/dates'
import { formatNet, studentLabel } from '@/lib/exam'
import type { RankedStudent, RiskLevel } from './overview'

const levels: Record<RiskLevel, { label: string; tone: 'primary' | 'warning' | 'danger'; icon: typeof Eye }> = {
  ok: { label: 'İyi', tone: 'primary', icon: CircleCheck },
  watch: { label: 'İzle', tone: 'warning', icon: Eye },
  risk: { label: 'Risk', tone: 'danger', icon: TriangleAlert },
}

export function RiskBadge({ level }: { level: RiskLevel }) {
  const { label, tone, icon: Icon } = levels[level]
  return (
    <Badge tone={tone} className="py-1">
      <Icon aria-hidden />
      {label}
    </Badge>
  )
}

export function Duration({ minutes, unitClass = 'text-[0.6em] font-semibold text-muted' }: { minutes: number; unitClass?: string }) {
  const h = Math.floor(minutes / 60)
  const m = Math.round(minutes % 60)
  return (
    <span className="tabular whitespace-nowrap">
      {h > 0 && (
        <>
          {h}
          <span className={unitClass}> sa</span>
        </>
      )}
      {(m > 0 || h === 0) && (
        <>
          {h > 0 && ' '}
          {m}
          <span className={unitClass}> dk</span>
        </>
      )}
    </span>
  )
}

function NetChange({ last, prev }: { last: number | null; prev: number | null }) {
  if (last == null || prev == null) return null
  const diff = Math.round((last - prev) * 100) / 100
  if (diff === 0) {
    return (
      <span className="inline-flex items-center gap-0.5 text-xs font-semibold text-muted">
        <Minus className="size-3.5" aria-hidden />
        <span className="sr-only">Değişmedi</span>
      </span>
    )
  }
  const up = diff > 0
  const Icon = up ? ArrowUpRight : ArrowDownRight
  return (
    <span className={cn('tabular inline-flex items-center gap-0.5 text-xs font-bold', up ? 'text-success' : 'text-danger')}>
      <Icon className="size-3.5" aria-hidden />
      <span className="sr-only">{up ? 'Arttı' : 'Düştü'}</span>
      {formatNet(Math.abs(diff))}
    </span>
  )
}

export function StudentCard({ student }: { student: RankedStudent }) {
  const { signals } = student
  const archived = Boolean(student.archived_at)
  const ratio = student.tasks_week ? student.tasks_week_done / student.tasks_week : 0
  const hasParent = student.parent_count > 0

  return (
    <Link
      to={`/app/ogrenciler/${student.id}`}
      className={cn(
        'group flex h-full flex-col rounded-2xl border bg-surface p-4 shadow-card transition-[border-color,transform] duration-150 hover:border-line-strong active:scale-[0.99]',
        !archived && signals.level === 'risk' ? 'border-danger/35' : !archived && signals.level === 'watch' ? 'border-warning/35' : 'border-line',
      )}
    >
      <div className="flex items-start gap-3">
        <Avatar name={student.full_name} className={cn(archived && 'grayscale')} />
        <div className="min-w-0 flex-1">
          <p className="truncate font-bold group-hover:underline group-hover:decoration-line-strong group-hover:underline-offset-4">
            {student.full_name}
          </p>
          <p className="truncate text-sm text-muted">{studentLabel(student)}</p>
        </div>
        {archived ? <Badge className="py-1">Arşivde</Badge> : <RiskBadge level={signals.level} />}
      </div>

      {!archived && signals.reasons.length > 0 && (
        <ul className="mt-3 flex flex-wrap gap-1.5" aria-label="Dikkat sebepleri">
          {signals.reasons.map((reason) => (
            <li
              key={reason}
              className={cn(
                'rounded-lg px-2 py-1 text-xs font-semibold',
                signals.level === 'risk' ? 'bg-danger-soft text-danger' : 'bg-warning-soft text-warning',
              )}
            >
              {reason}
            </li>
          ))}
        </ul>
      )}

      <dl className="mt-4 grid grid-cols-3 gap-2 rounded-xl bg-surface-2/60 px-3 py-2.5">
        <div className="min-w-0">
          <dt className="text-[11px] font-semibold text-muted">7 gün</dt>
          <dd className="font-display text-lg leading-tight font-bold">
            <Duration minutes={student.minutes_7d} />
          </dd>
        </div>
        <div className="min-w-0">
          <dt className="text-[11px] font-semibold text-muted">Soru</dt>
          <dd className="tabular font-display text-lg leading-tight font-bold">{student.questions_7d.toLocaleString('tr-TR')}</dd>
        </div>
        <div className="min-w-0">
          <dt className="truncate text-[11px] font-semibold text-muted">{student.last_exam_kind ? `${student.last_exam_kind} neti` : 'Deneme'}</dt>
          <dd className="flex flex-wrap items-baseline gap-x-1">
            <span className="tabular font-display text-lg leading-tight font-bold">
              {student.last_net == null ? <span className="text-subtle">-</span> : formatNet(student.last_net)}
            </span>
            <NetChange last={student.last_net} prev={student.prev_net} />
          </dd>
        </div>
      </dl>

      <div className="mt-4">
        <div className="mb-1.5 flex items-baseline justify-between gap-2 text-xs">
          <span className="font-semibold text-muted">Bu haftanın görevleri</span>
          <span className="tabular font-bold">
            {student.tasks_week ? `${student.tasks_week_done}/${student.tasks_week}` : 'Görev yok'}
          </span>
        </div>
        <ProgressBar value={ratio} tone={ratio >= 0.5 || !student.tasks_week ? 'primary' : 'warning'} />
      </div>

      <div className="mt-auto flex items-center justify-between gap-2 pt-4 text-xs text-muted">
        <span className="flex min-w-0 items-center gap-1.5">
          <Clock3 className="size-3.5 shrink-0" aria-hidden />
          <span className="truncate">{student.last_seen_at ? `Son görülme ${formatRelative(student.last_seen_at)}` : 'Henüz giriş yapmadı'}</span>
        </span>
        <span className={cn('flex shrink-0 items-center gap-1', hasParent ? 'text-primary' : 'text-subtle')}>
          {hasParent ? <UsersRound className="size-3.5" aria-hidden /> : <UserRoundX className="size-3.5" aria-hidden />}
          {hasParent ? 'Veli bağlı' : 'Veli yok'}
        </span>
      </div>
    </Link>
  )
}
