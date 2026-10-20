import { ArrowRight, Trophy } from 'lucide-react'
import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { Link } from 'react-router'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { Delta } from '@/features/exams/delta'
import { GoalLine } from '@/features/exams/overview-cards'
import { useExams, useGoals, type ExamResult } from '@/features/exams/queries'
import { cn } from '@/lib/cn'
import { formatDate, formatDay } from '@/lib/dates'
import { examLabel, formatNet } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'

type More = { label: string; href: string } | { label: string; onClick: () => void }

const TREND = 8

export function LastExamSummary({
  studentId,
  more,
  empty,
  className,
}: {
  studentId: string
  more?: More
  empty?: { description: string; action?: ReactNode }
  className?: string
}) {
  const exams = useExams(studentId)
  const goals = useGoals(studentId)

  if (exams.isPending) {
    return (
      <Card className={className} aria-busy="true" aria-label="Son deneme yükleniyor">
        <CardBody className="space-y-4">
          <Skeleton className="h-5 w-32" />
          <Skeleton className="h-12 w-40" />
          <Skeleton className="h-16" />
        </CardBody>
      </Card>
    )
  }

  if (exams.isError) {
    return (
      <Card className={className}>
        <CardHeader title="Son deneme" />
        <CardBody className="flex flex-wrap items-center justify-between gap-3">
          <p className="text-sm text-danger">{errorMessage(exams.error)}</p>
          <button
            type="button"
            onClick={() => void exams.refetch()}
            className="inline-flex h-11 items-center text-sm font-semibold text-accent hover:underline"
          >
            Tekrar dene
          </button>
        </CardBody>
      </Card>
    )
  }

  const all = exams.data
  const last = all[0]

  if (!last) {
    return (
      <Card className={cn('flex flex-col', className)}>
        <CardHeader title="Son deneme" />
        <CardBody className="flex flex-1 flex-col items-start gap-3">
          <div className="flex items-center gap-3">
            <span className="grid size-11 shrink-0 place-items-center rounded-xl bg-surface-2 text-muted" aria-hidden>
              <Trophy className="size-5" />
            </span>
            <p className="text-sm text-muted">{empty?.description ?? 'Henüz deneme eklenmedi.'}</p>
          </div>
          {empty?.action}
        </CardBody>
      </Card>
    )
  }

  const sameKind = all.filter((e) => e.kind === last.kind)
  const previous = sameKind[1]
  const trend = sameKind.slice(0, TREND).reverse()
  const target = goals.data?.find((g) => g.kind === last.kind)?.target_net ?? null

  return (
    <Card className={cn('flex flex-col', className)}>
      <CardHeader
        title="Son deneme"
        description={`${examLabel[last.kind]} · ${formatDay(last.taken_on)} · ${last.title}`}
        className="[&_p]:truncate"
      />
      <CardBody className="flex flex-1 flex-col gap-4">
        <div className="flex items-end justify-between gap-4">
          <div className="min-w-0">
            <p className="tabular font-display text-4xl leading-none font-extrabold tracking-tight">
              {formatNet(last.net)}
              <span className="ml-1.5 text-base font-semibold text-muted">net</span>
            </p>
            <p className="mt-2 text-sm">
              {previous ? (
                <>
                  <Delta value={last.net - previous.net} />
                  <span className="text-muted"> öncekine göre</span>
                </>
              ) : (
                <span className="text-muted">İlk {examLabel[last.kind]} denemesi</span>
              )}
            </p>
          </div>
          {trend.length > 1 && <NetBars exams={trend} />}
        </div>

        <p className="tabular text-sm text-muted">
          <span className="font-semibold text-success">{last.correct} D</span>
          {' · '}
          <span className="font-semibold text-danger">{last.wrong} Y</span>
          {' · '}
          <span className="font-semibold">{last.blank} B</span>
        </p>

        {target != null && <GoalLine current={last.net} target={target} />}

        {more && <MoreLink more={more} />}
      </CardBody>
    </Card>
  )
}

function NetBars({ exams }: { exams: ExamResult[] }) {
  const max = Math.max(1, ...exams.map((e) => e.net))
  const summary = exams.map((e) => `${formatDate(e.taken_on, 'd MMM')}: ${formatNet(e.net)}`).join(', ')
  return (
    <div className="flex h-14 shrink-0 items-end gap-1" role="img" aria-label={`Son ${exams.length} denemenin neti. ${summary}`}>
      {exams.map((e, i) => {
        const latest = i === exams.length - 1
        return (
          <motion.span
            key={e.id}
            className={cn('w-2.5 origin-bottom rounded-full sm:w-3', latest ? 'bg-primary' : 'bg-primary/30')}
            style={{ height: `${Math.max(8, (Math.max(0, e.net) / max) * 100)}%` }}
            initial={{ scaleY: 0 }}
            animate={{ scaleY: 1 }}
            transition={{ duration: 0.3, delay: i * 0.03, ease: [0.22, 1, 0.36, 1] }}
          />
        )
      })}
    </div>
  )
}

function MoreLink({ more }: { more: More }) {
  const className = 'mt-auto inline-flex h-11 items-center gap-1.5 self-start text-sm font-semibold text-accent hover:underline'
  const content = (
    <>
      {more.label}
      <ArrowRight className="size-4" aria-hidden />
    </>
  )
  if ('href' in more) {
    return (
      <Link to={more.href} className={className}>
        {content}
      </Link>
    )
  }
  return (
    <button type="button" onClick={more.onClick} className={className}>
      {content}
    </button>
  )
}
