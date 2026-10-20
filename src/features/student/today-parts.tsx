import { Flame, ListChecks, RotateCw, Timer, Trophy, type LucideIcon } from 'lucide-react'
import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { ProgressBar, ProgressRing } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { Duration } from '@/features/teacher/student-card'
import { formatCount, useStudyActivity } from '@/features/tracking/stats'
import { cn } from '@/lib/cn'
import { formatMinutes } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'

type Goals = { daily_minutes_goal: number; weekly_questions_goal: number }

export function TodayProgress({ studentId, goals, className }: { studentId: string; goals: Goals; className?: string }) {
  const activity = useStudyActivity(studentId)

  if (activity.isPending) {
    return (
      <Card className={cn('flex items-center gap-5 p-4 sm:p-5', className)} aria-busy="true" aria-label="Bugünün özeti yükleniyor">
        <Skeleton className="size-32 shrink-0 rounded-full" />
        <div className="flex-1 space-y-4">
          <Skeleton className="h-12" />
          <Skeleton className="h-12" />
        </div>
      </Card>
    )
  }

  if (activity.isError || !activity.data) {
    return (
      <Card className={cn('flex flex-wrap items-center justify-between gap-3 p-4 sm:p-5', className)} role="alert">
        <p className="text-sm text-danger">{errorMessage(activity.error)}</p>
        <Button variant="secondary" size="sm" onClick={() => void activity.refetch()}>
          <RotateCw />
          Tekrar dene
        </Button>
      </Card>
    )
  }

  const { todayMinutes, weekQuestions, streak } = activity.data
  const daily = goals.daily_minutes_goal
  const weekly = goals.weekly_questions_goal
  const dailyRatio = daily ? todayMinutes / daily : 0
  const reached = daily > 0 && todayMinutes >= daily

  return (
    <Card className={cn('flex items-center gap-4 p-4 sm:gap-6 sm:p-5', className)}>
      <ProgressRing value={dailyRatio} size={128} stroke={11} className="shrink-0">
        <div className="text-center">
          <p className="font-display text-2xl leading-none font-extrabold">
            <Duration minutes={todayMinutes} unitClass="text-[0.55em] font-semibold text-muted" />
          </p>
          <p className="mt-1 text-xs font-semibold text-muted">{daily ? `hedef ${formatMinutes(daily)}` : 'bugün'}</p>
        </div>
      </ProgressRing>
      <span className="sr-only">
        {daily ? `Bugün ${formatMinutes(todayMinutes)} çalıştın, günlük hedef ${formatMinutes(daily)}.` : `Bugün ${formatMinutes(todayMinutes)} çalıştın.`}
      </span>

      <div className="min-w-0 flex-1 space-y-4">
        <div>
          <p className="text-xs font-semibold text-muted">Günlük hedef</p>
          <p className="mt-0.5 text-sm font-semibold">
            {!daily ? 'Hedef yok' : reached ? <span className="marker">Tamamlandı</span> : `${formatMinutes(daily - todayMinutes)} kaldı`}
          </p>
        </div>

        <div>
          <div className="flex items-baseline justify-between gap-2">
            <p className="text-xs font-semibold text-muted">Bu hafta soru</p>
            <p className="tabular text-sm font-bold">
              {formatCount(weekQuestions)}
              {weekly > 0 && <span className="font-semibold text-muted">/{formatCount(weekly)}</span>}
            </p>
          </div>
          {weekly > 0 && <ProgressBar value={weekQuestions / weekly} tone="accent" className="mt-1.5" />}
        </div>

        <p className="flex items-center gap-1.5 text-sm font-semibold">
          <Flame className={cn('size-5 shrink-0', streak > 0 ? 'text-warning' : 'text-subtle')} aria-hidden />
          {streak > 0 ? (
            <span>
              <span className="marker tabular font-display text-lg font-extrabold">{streak} gün</span> seri
            </span>
          ) : (
            <span className="text-muted">Bugün kayıt ekle, seri başlasın</span>
          )}
        </p>
      </div>
    </Card>
  )
}

export function QuickActions({ timerRunning, onAddQuestions, className }: { timerRunning: boolean; onAddQuestions: () => void; className?: string }) {
  return (
    <div className={cn('grid grid-cols-3 gap-2 sm:gap-3', className)}>
      <Action to="/app/sayac" icon={Timer} tone="bg-primary-soft text-primary-soft-fg" live={timerRunning}>
        {timerRunning ? 'Sayaca dön' : 'Sayacı başlat'}
      </Action>
      <Action onClick={onAddQuestions} icon={ListChecks} tone="bg-accent-soft text-accent-soft-fg">
        Soru ekle
      </Action>
      <Action to="/app/deneme-ekle" icon={Trophy} tone="bg-warning-soft text-warning">
        Deneme ekle
      </Action>
    </div>
  )
}

function Action({
  to,
  onClick,
  icon: Icon,
  tone,
  live,
  children,
}: {
  to?: string
  onClick?: () => void
  icon: LucideIcon
  tone: string
  live?: boolean
  children: ReactNode
}) {
  const className =
    'flex min-h-24 flex-col items-center justify-center gap-2 rounded-2xl border border-line bg-surface px-2 py-3 text-center shadow-card transition-[border-color,transform] duration-150 hover:border-line-strong active:scale-[0.97]'
  const content = (
    <>
      <span className={cn('relative grid size-10 place-items-center rounded-xl', tone)} aria-hidden>
        <Icon className="size-5" />
        {live && <span className="absolute -top-0.5 -right-0.5 size-3 animate-pulse rounded-full motion-reduce:animate-none border-2 border-surface bg-primary" />}
      </span>
      <span className="text-[13px] leading-tight font-bold sm:text-sm">{children}</span>
    </>
  )
  if (to) {
    return (
      <Link to={to} className={className}>
        {content}
      </Link>
    )
  }
  return (
    <button type="button" onClick={onClick} className={className}>
      {content}
    </button>
  )
}

export function Reveal({ index, className, children }: { index: number; className?: string; children: ReactNode }) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 10 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.28, delay: index * 0.05, ease: [0.22, 1, 0.36, 1] }}
      className={cn('min-w-0', className)}
    >
      {children}
    </motion.div>
  )
}
