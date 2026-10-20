import { ChevronRight, Plus } from 'lucide-react'
import { motion } from 'motion/react'
import { useState, type ReactNode } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card, CardHeader } from '@/components/ui/card'
import { cn } from '@/lib/cn'
import { formatDate } from '@/lib/dates'
import { examLabel, formatNet, type ExamKind } from '@/lib/exam'
import { Delta } from './delta'
import type { ExamResult } from './queries'

export type ExamOpener = { href?: (examId: number) => string; onOpen?: (exam: ExamResult) => void }

export function OpenExam({
  exam,
  opener,
  className,
  label,
  children,
}: {
  exam: ExamResult
  opener: ExamOpener
  className?: string
  label?: string
  children: ReactNode
}) {
  if (opener.href) {
    return (
      <Link to={opener.href(exam.id)} className={className} aria-label={label}>
        {children}
      </Link>
    )
  }
  return (
    <button type="button" onClick={() => opener.onOpen?.(exam)} className={cn('w-full text-left', className)} aria-label={label}>
      {children}
    </button>
  )
}

const PAGE = 8

export function ExamList({
  kind,
  exams,
  opener,
  addHref,
  className,
}: {
  kind: ExamKind
  exams: ExamResult[]
  opener: ExamOpener
  addHref?: string
  className?: string
}) {
  const [expanded, setExpanded] = useState(false)
  const visible = expanded ? exams : exams.slice(0, PAGE)

  return (
    <Card className={cn('min-w-0', className)}>
      <CardHeader
        title="Denemeler"
        description={`${exams.length} ${examLabel[kind]} denemesi`}
        action={
          addHref && (
            <Button asChild variant="soft" size="sm" className="-mt-0.5 h-11 sm:h-9">
              <Link to={addHref}>
                <Plus />
                Ekle
              </Link>
            </Button>
          )
        }
      />
      <ul className="mt-2 divide-y divide-line px-1.5 pb-1.5 sm:px-2.5">
        {visible.map((exam, i) => {
          const older = exams[i + 1]
          return (
            <motion.li
              key={exam.id}
              initial={{ opacity: 0, y: 6 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.22, delay: Math.min(i, 8) * 0.03 }}
            >
              <OpenExam
                exam={exam}
                opener={opener}
                className="flex min-h-16 items-center gap-3 rounded-xl px-2.5 py-2.5 transition-colors hover:bg-surface-2 focus-visible:bg-surface-2"
                label={`${exam.title}, ${formatDate(exam.taken_on, 'd MMMM yyyy')}, ${formatNet(exam.net)} net`}
              >
                <span className="flex w-10 shrink-0 flex-col items-center leading-none" aria-hidden>
                  <span className="tabular font-display text-lg font-bold">{formatDate(exam.taken_on, 'd')}</span>
                  <span className="mt-1 text-[11px] font-semibold text-muted uppercase">{formatDate(exam.taken_on, 'MMM')}</span>
                </span>
                <span className="min-w-0 flex-1" aria-hidden>
                  <span className="block truncate font-semibold">{exam.title}</span>
                  <span className="tabular mt-0.5 block text-xs text-muted">
                    D {exam.correct} · Y {exam.wrong} · B {exam.blank}
                  </span>
                </span>
                <span className="flex shrink-0 flex-col items-end" aria-hidden>
                  <span className="tabular font-display text-lg leading-tight font-bold">{formatNet(exam.net)}</span>
                  {older ? <Delta value={exam.net - older.net} className="text-xs" /> : <span className="text-xs text-subtle">ilk</span>}
                </span>
                <ChevronRight className="size-4 shrink-0 text-subtle" aria-hidden />
              </OpenExam>
            </motion.li>
          )
        })}
      </ul>
      {exams.length > PAGE && (
        <div className="border-t border-line p-1.5">
          <Button variant="ghost" className="w-full text-muted" onClick={() => setExpanded((v) => !v)}>
            {expanded ? 'Daha az göster' : `Tümünü göster (${exams.length})`}
          </Button>
        </div>
      )}
    </Card>
  )
}
