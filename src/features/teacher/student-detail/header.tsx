import { ArrowLeft, Clock3, MessageCircle, Target, UsersRound } from 'lucide-react'
import { Link } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { StatStrip, Trend } from '@/components/ui/stat'
import { threadLink } from '@/features/messages/lib'
import { WeeklyReportButton } from '@/features/report/weekly-report-button'
import { cn } from '@/lib/cn'
import { formatMinutes, formatRelative } from '@/lib/dates'
import { formatNet, studentLabel } from '@/lib/exam'
import type { OverviewRow, RiskSignals } from '../overview'
import { RiskBadge } from '../student-card'
import type { StudentDetail } from './queries'

export function StudentHeader({
  student,
  signals,
  parentCount,
  row,
}: {
  student: StudentDetail
  signals: RiskSignals | null
  parentCount: number
  row?: OverviewRow
}) {
  const archived = Boolean(student.archived_at)

  return (
    <header className="mb-5 sm:mb-6">
      <Link to="/app" className="mb-3 inline-flex min-h-11 items-center gap-1.5 text-sm font-semibold text-muted hover:text-fg sm:min-h-0">
        <ArrowLeft className="size-4" aria-hidden />
        Öğrenciler
      </Link>

      <section className="rounded-3xl border border-line bg-surface p-4 sm:p-6">
      <div className="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
        <div className="flex min-w-0 items-start gap-3 sm:gap-4">
          <Avatar name={student.full_name} userId={student.id} className={cn('size-14 text-lg sm:size-16', archived && 'grayscale')} />
          <div className="min-w-0 flex-1">
            <div className="flex flex-wrap items-center gap-x-2 gap-y-1">
              <h1 className="min-w-0 text-2xl leading-tight font-extrabold break-words sm:text-3xl">{student.full_name}</h1>
              {archived ? <Badge className="py-1">Arşivde</Badge> : signals && <RiskBadge level={signals.level} />}
            </div>
            <p className="mt-0.5 text-sm text-muted">
              {studentLabel(student)}
              {student.username && <span className="break-all"> · @{student.username}</span>}
            </p>
            <p className="mt-1 flex flex-wrap items-center gap-x-3 gap-y-1 text-xs text-muted">
              <span className="inline-flex items-center gap-1">
                <Clock3 className="size-3.5" aria-hidden />
                {student.last_seen_at ? `Son görülme ${formatRelative(student.last_seen_at)}` : 'Henüz giriş yapmadı'}
              </span>
              {student.target && (
                <span className="inline-flex min-w-0 items-center gap-1">
                  <Target className="size-3.5 shrink-0" aria-hidden />
                  <span className="truncate">{student.target}</span>
                </span>
              )}
            </p>
          </div>
        </div>

        <div className="grid grid-cols-2 gap-2 sm:flex sm:shrink-0 sm:flex-wrap">
          <WeeklyReportButton student={{ ...student, name: student.full_name }} viewer="teacher" className="px-3 sm:px-4" />
          <Button variant="secondary" className="px-3 sm:px-4" asChild>
            <Link to={threadLink(student.id, 'student')}>
              <MessageCircle />
              Mesaj
            </Link>
          </Button>
          {parentCount > 0 && (
            <Button variant="secondary" className="col-span-2 sm:col-span-1" asChild>
              <Link to={threadLink(student.id, 'parent')}>
                <UsersRound />
                Velilere mesaj
              </Link>
            </Button>
          )}
        </div>
      </div>
      {row && !archived && <DetailStats row={row} />}
      </section>

      {!archived && signals && signals.reasons.length > 0 && (
        <ul className="mt-4 flex flex-wrap gap-1.5" aria-label="Dikkat sebepleri">
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
    </header>
  )
}

function DetailStats({ row }: { row: OverviewRow }) {
  const prev = row.minutes_prev_7d ?? 0
  const delta = prev ? Math.round(((row.minutes_7d - prev) / prev) * 100) : null
  const netDelta = row.last_net != null && row.prev_net != null ? Math.round((row.last_net - row.prev_net) * 100) / 100 : null
  return (
    <StatStrip
      className="mt-5"
      caption="Son 7 gün"
      items={[
        { label: 'Çalışma', value: formatMinutes(row.minutes_7d), aside: delta != null ? <Trend up={delta >= 0}>%{Math.abs(delta)}</Trend> : undefined },
        { label: 'Soru', value: row.questions_7d.toLocaleString('tr-TR') },
        {
          label: row.tasks_overdue ? `Görev, ${row.tasks_overdue} gecikmiş` : 'Görev',
          value: `${row.tasks_week_done}/${row.tasks_week}`,
          tone: row.tasks_overdue ? 'warning' : undefined,
        },
        {
          label: row.last_exam_kind ? `Son ${row.last_exam_kind}` : 'Son deneme',
          value: row.last_net != null ? formatNet(row.last_net) : '-',
          aside: netDelta ? <Trend up={netDelta > 0}>{formatNet(Math.abs(netDelta))}</Trend> : undefined,
        },
      ]}
    />
  )
}
