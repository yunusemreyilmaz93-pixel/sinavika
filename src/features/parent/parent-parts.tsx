import { useQuery } from '@tanstack/react-query'
import { ArrowRight, CheckCircle2, Clock, ListChecks, MessageCircle, NotebookPen, RotateCw, Sun, type LucideIcon } from 'lucide-react'
import type { ReactNode } from 'react'
import { Link } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { threadLink } from '@/features/messages/lib'
import { useNotes } from '@/features/notes/lib'
import { NoteCard } from '@/features/notes/note-card'
import { useTasks } from '@/features/plan/queries'
import { Duration } from '@/features/teacher/student-card'
import { formatCount, isActive, useStudyActivity } from '@/features/tracking/stats'
import { cn } from '@/lib/cn'
import { shiftDays, todayISO, weekDays, weekStartISO } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'

export function WeekSummary({ studentId, className }: { studentId: string; className?: string }) {
  const today = todayISO()
  const start = weekStartISO(today)
  const activity = useStudyActivity(studentId)
  const tasks = useTasks(studentId, start, shiftDays(start, 6))

  const error = activity.error ?? tasks.error
  const loading = activity.isPending || tasks.isPending

  const elapsed = weekDays(start).filter((d) => d <= today)
  const activeDays = activity.data ? elapsed.filter((d) => isActive(activity.data!.byDay.get(d))).length : 0
  const taskList = tasks.data ?? []
  const done = taskList.filter((t) => t.done_at).length
  const ratio = taskList.length ? done / taskList.length : 0

  return (
    <Card className={className}>
      <CardHeader title="Bu hafta" description="Pazartesiden bugüne" />
      <CardBody>
        {loading ? (
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-4" aria-busy="true" aria-label="Yükleniyor">
            {[0, 1, 2, 3].map((i) => (
              <Skeleton key={i} className="h-20" />
            ))}
          </div>
        ) : error ? (
          <div className="flex flex-wrap items-center justify-between gap-3" role="alert">
            <p className="text-sm text-danger">{errorMessage(error)}</p>
            <Button
              variant="secondary"
              size="sm"
              onClick={() => {
                void activity.refetch()
                void tasks.refetch()
              }}
            >
              <RotateCw />
              Tekrar deneyin
            </Button>
          </div>
        ) : (
          <dl className="grid grid-cols-2 gap-3 sm:grid-cols-4">
            <Tile icon={Clock} label="Çalışma">
              <Duration minutes={activity.data?.weekMinutes ?? 0} unitClass="text-[0.6em] font-semibold text-muted" />
            </Tile>
            <Tile icon={ListChecks} label="Soru">
              <span className="tabular">{formatCount(activity.data?.weekQuestions ?? 0)}</span>
            </Tile>
            <Tile icon={Sun} label="Aktif gün">
              <span className="tabular">
                {activeDays}
                <span className="text-[0.6em] font-semibold text-muted">/{elapsed.length}</span>
              </span>
            </Tile>
            <Tile icon={CheckCircle2} label="Görevler" footer={taskList.length ? <ProgressBar value={ratio} className="mt-2 h-1.5" /> : undefined}>
              {taskList.length ? (
                <span className="tabular">
                  %{Math.round(ratio * 100)}
                  <span className="ml-1 text-[0.6em] font-semibold text-muted">
                    {done}/{taskList.length}
                  </span>
                </span>
              ) : (
                <span className="text-base font-semibold text-muted">Görev yok</span>
              )}
            </Tile>
          </dl>
        )}
      </CardBody>
    </Card>
  )
}

function Tile({ icon: Icon, label, footer, children }: { icon: LucideIcon; label: string; footer?: ReactNode; children: ReactNode }) {
  return (
    <div className="min-w-0 rounded-xl bg-surface-2/70 px-3 py-2.5">
      <dt className="flex items-center gap-1.5 text-xs font-semibold text-muted">
        <Icon className="size-3.5 shrink-0" aria-hidden />
        {label}
      </dt>
      <dd className="mt-1 font-display text-2xl leading-tight font-bold">{children}</dd>
      {footer}
    </div>
  )
}

export function TeacherContact({ studentId, teacherId, className }: { studentId: string; teacherId: string; className?: string }) {
  const teacher = useQuery({
    queryKey: ['profile-name', teacherId],
    staleTime: 10 * 60 * 1000,
    queryFn: async () => unwrap(await supabase.from('profiles').select('full_name').eq('id', teacherId).maybeSingle()),
  })
  const name = teacher.data?.full_name

  return (
    <Card className={cn('flex items-center gap-3 p-4 sm:p-5', className)}>
      {name ? <Avatar name={name} userId={teacherId} /> : <Skeleton className="size-10 shrink-0 rounded-full" />}
      <div className="min-w-0 flex-1">
        <p className="text-xs font-semibold text-muted">Öğretmen</p>
        {teacher.isPending ? (
          <Skeleton className="mt-1 h-5 w-32" />
        ) : (
          <p className="truncate font-bold">{name ?? 'Öğretmen'}</p>
        )}
      </div>
      <Button asChild className="shrink-0">
        <Link to={threadLink(studentId, 'parent')}>
          <MessageCircle />
          Mesaj yaz
        </Link>
      </Button>
    </Card>
  )
}

export function SharedNote({ studentId, className }: { studentId: string; className?: string }) {
  const notes = useNotes(studentId)
  const latest = notes.data?.[0]

  return (
    <section className={className} aria-labelledby="shared-note-title">
      <div className="mb-2 flex items-center justify-between gap-3">
        <h2 id="shared-note-title" className="text-base font-bold">
          Öğretmenin son notu
        </h2>
        {latest && (
          <Link to="/app/notlar" className="inline-flex h-11 items-center gap-1 text-sm font-semibold text-accent hover:underline">
            Tüm notlar
            <ArrowRight className="size-4" aria-hidden />
          </Link>
        )}
      </div>
      {notes.isPending ? (
        <Skeleton className="h-32 rounded-2xl" />
      ) : notes.isError ? (
        <Card className="flex flex-wrap items-center justify-between gap-3 p-4" role="alert">
          <p className="text-sm text-danger">{errorMessage(notes.error)}</p>
          <Button variant="secondary" size="sm" onClick={() => void notes.refetch()}>
            <RotateCw />
            Tekrar deneyin
          </Button>
        </Card>
      ) : latest ? (
        <NoteCard note={latest} />
      ) : (
        <Card className="flex items-center gap-3 p-4">
          <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-surface-2 text-muted" aria-hidden>
            <NotebookPen className="size-5" />
          </span>
          <p className="text-sm text-muted">Öğretmen velilerle bir not paylaştığında burada görünür.</p>
        </Card>
      )}
    </section>
  )
}
