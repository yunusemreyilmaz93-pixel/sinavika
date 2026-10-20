import { ArrowLeft, Clock3, MessageCircle, Target, UsersRound } from 'lucide-react'
import { Link } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { threadLink } from '@/features/messages/lib'
import { cn } from '@/lib/cn'
import { formatRelative } from '@/lib/dates'
import { studentLabel } from '@/lib/exam'
import type { RiskSignals } from '../overview'
import { RiskBadge } from '../student-card'
import type { StudentDetail } from './queries'

export function StudentHeader({
  student,
  signals,
  parentCount,
}: {
  student: StudentDetail
  signals: RiskSignals | null
  parentCount: number
}) {
  const archived = Boolean(student.archived_at)

  return (
    <header className="mb-5 sm:mb-6">
      <Link to="/app" className="mb-3 inline-flex min-h-11 items-center gap-1.5 text-sm font-semibold text-muted hover:text-fg sm:min-h-0">
        <ArrowLeft className="size-4" aria-hidden />
        Öğrenciler
      </Link>

      <div className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div className="flex min-w-0 items-start gap-3 sm:gap-4">
          <Avatar name={student.full_name} className={cn('size-14 text-lg', archived && 'grayscale')} />
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

        <div className="flex gap-2 sm:shrink-0">
          <Button variant="secondary" className="flex-1 sm:flex-none" asChild>
            <Link to={threadLink(student.id, 'student')}>
              <MessageCircle />
              Öğrenciye yaz
            </Link>
          </Button>
          {parentCount > 0 && (
            <Button variant="secondary" className="flex-1 sm:flex-none" asChild>
              <Link to={threadLink(student.id, 'parent')}>
                <UsersRound />
                Velilere yaz
              </Link>
            </Button>
          )}
        </div>
      </div>

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
