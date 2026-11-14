import { BookOpen, Check, CirclePlay, ListChecks, Target, Timer, Trophy } from 'lucide-react'
import type { ReactNode } from 'react'
import { Link } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { MiniBars, StatTile, Trend } from '@/components/ui/stat'
import { useTasks } from '@/features/plan/queries'
import { accuracyOf, emptyDay, useStudyActivity, type StudyActivity } from '@/features/tracking/stats'
import { cn } from '@/lib/cn'
import { examDateFor, useCurriculum, useSettings } from '@/lib/data'
import { daysBetween, formatDate, formatMinutes, greeting, shiftDays, todayISO, weekDays, weekStartISO } from '@/lib/dates'
import { studentLabel, subjectColor, trackLabel, type Field, type Track } from '@/lib/exam'
import { StreakChip } from './milestones-card'

type HeroStudent = { id: string; track: Track; grade: number; field: Field | null; daily_minutes_goal: number }

function range(activity: StudyActivity, from: string, to: string) {
  const total = emptyDay()
  for (let d = from; d <= to; d = shiftDays(d, 1)) {
    const s = activity.byDay.get(d)
    if (!s) continue
    total.minutes += s.minutes
    total.questions += s.questions
    total.correct += s.correct
    total.wrong += s.wrong
  }
  return { ...total, accuracy: accuracyOf(total.correct, total.questions) }
}

const percent = (v: number | null) => (v == null ? '-' : `%${Math.round(v * 100)}`)

// Öğrencinin Bugün sayfası ve velinin özet sayfası için karşılama kartı. Son 7 gün, önceki 7 günle karşılaştırılır
export function StudentHero({ student, name, mode, onAddQuestions }: { student: HeroStudent; name: string; mode: 'student' | 'parent'; onAddQuestions?: () => void }) {
  const today = todayISO()
  const activity = useStudyActivity(student.id)
  const settings = useSettings()
  const weekStart = weekStartISO(today)
  const tasks = useTasks(student.id, weekStart, shiftDays(weekStart, 6))
  const exam = examDateFor(settings.data, student.track)
  const daysLeft = exam ? daysBetween(today, exam.date) : null
  const firstName = name.trim().split(/\s+/)[0]

  const last = activity.data ? range(activity.data, shiftDays(today, -6), today) : null
  const prev = activity.data ? range(activity.data, shiftDays(today, -13), shiftDays(today, -7)) : null
  const qDelta = last && prev && prev.questions ? Math.round(((last.questions - prev.questions) / prev.questions) * 100) : null
  const accDelta = last?.accuracy != null && prev?.accuracy != null ? Math.round((last.accuracy - prev.accuracy) * 100) : null
  const done = tasks.data?.filter((t) => t.done_at).length ?? 0
  const total = tasks.data?.length ?? 0
  const goal = student.daily_minutes_goal

  return (
    <section className="rounded-3xl border border-line bg-surface p-4 sm:p-6">
      <div className="flex flex-col gap-5 sm:flex-row sm:items-start sm:justify-between">
        <div className="flex min-w-0 items-center gap-4">
          <Avatar name={name} userId={student.id} className="size-14 shrink-0 text-lg sm:size-16" />
          <div className="min-w-0">
            <p className="text-sm text-muted">{formatDate(today, 'd MMMM EEEE')}</p>
            <h1 className="text-[1.65rem] leading-tight font-extrabold sm:text-3xl">{mode === 'student' ? `${greeting()}, ${firstName}` : `${firstName}'in haftası`}</h1>
            <div className="mt-2 flex flex-wrap items-center gap-1.5">
              <Badge>{studentLabel(student)}</Badge>
              <StreakChip studentId={student.id} />
            </div>
          </div>
        </div>
        {exam && daysLeft != null && daysLeft >= 0 && (
          <div className="flex items-center gap-3 rounded-2xl bg-primary-soft px-4 py-3 text-primary-soft-fg sm:flex-col sm:items-end sm:gap-0 sm:px-5">
            <p className="tabular font-display text-4xl leading-none font-extrabold">{daysLeft === 0 ? 'Bugün' : daysLeft}</p>
            <p className="text-sm font-semibold">
              {daysLeft === 0 ? trackLabel[student.track] : 'gün kaldı'} <span className="font-normal opacity-80">· {trackLabel[student.track]}, {formatDate(exam.date, 'd MMMM')}{exam.official ? '' : ', tahmini'}</span>
            </p>
          </div>
        )}
      </div>

      {activity.isPending ? (
        <div className="mt-5 grid grid-cols-2 gap-2.5 lg:grid-cols-4">{[0, 1, 2, 3].map((i) => <Skeleton key={i} className="h-28 rounded-2xl" />)}</div>
      ) : (
        <div className="mt-5 grid grid-cols-2 gap-2.5 lg:grid-cols-4">
          <StatTile
            icon={<Timer />}
            hue="pine"
            label="Bugün çalışma"
            value={formatMinutes(activity.data?.todayMinutes ?? 0)}
            aside={goal ? `Hedef ${formatMinutes(goal)}` : undefined}
          />
          <StatTile
            icon={<ListChecks />}
            hue="sea"
            label="Soru, son 7 gün"
            value={last?.questions ?? 0}
            aside={qDelta != null ? <Trend up={qDelta >= 0}>%{Math.abs(qDelta)}</Trend> : undefined}
          />
          <StatTile
            icon={<Target />}
            hue="violet"
            label="Doğruluk, son 7 gün"
            value={percent(last?.accuracy ?? null)}
            aside={accDelta ? <Trend up={accDelta > 0}>{Math.abs(accDelta)} puan</Trend> : undefined}
          />
          <StatTile icon={<Check />} hue="amber" label="Haftanın görevleri" value={`${done}/${total}`} aside={total ? `${total - done} kaldı` : undefined} />
        </div>
      )}

      {mode === 'student' && (
        <div className="-mx-4 mt-4 flex gap-2 overflow-x-auto px-4 pb-1 sm:mx-0 sm:px-0">
          <Button asChild className="shrink-0">
            <Link to="/app/sayac">
              <CirclePlay />
              Sayacı başlat
            </Link>
          </Button>
          <Button variant="secondary" className="shrink-0" onClick={onAddQuestions}>
            <ListChecks />
            Soru ekle
          </Button>
          <Button variant="secondary" className="shrink-0" asChild>
            <Link to="/app/deneme-ekle">
              <Trophy />
              Deneme ekle
            </Link>
          </Button>
          <Button variant="secondary" className="shrink-0" asChild>
            <Link to="/app/konular">
              <BookOpen />
              Konu anlatımı
            </Link>
          </Button>
        </div>
      )}
    </section>
  )
}

const dayLabel = (iso: string) => formatDate(iso, 'EEE')

// Bu haftanın gün gün çalışma süresi ve derslere göre doğruluk
export function WeekCard({ studentId, goalMinutes, className, footer }: { studentId: string; goalMinutes: number; className?: string; footer?: ReactNode }) {
  const activity = useStudyActivity(studentId)
  const curriculum = useCurriculum()
  const today = todayISO()
  const days = weekDays(weekStartISO(today))
  if (activity.isPending) return <Skeleton className={cn('h-80 rounded-3xl', className)} />
  const data = activity.data
  if (!data) return null
  const minutes = days.map((d) => data.byDay.get(d)?.minutes ?? 0)
  const total = minutes.reduce((a, b) => a + b, 0)
  const weekSubjects = subjectsSince(data, days[0])
    .filter((s) => s.questions > 0)
    .sort((a, b) => b.questions - a.questions)
    .slice(0, 4)

  return (
    <Card className={className}>
      <CardHeader title="Bu hafta" action={<span className="tabular text-sm font-semibold text-muted">{formatMinutes(total)}</span>} />
      <div className="px-4 pb-4 sm:px-5 sm:pb-5">
        <div className="mt-3 h-36">
          <MiniBars values={minutes} goal={goalMinutes || undefined} highlight={days.indexOf(today)} label={`Bu hafta günlük çalışma süresi, toplam ${formatMinutes(total)}`} />
        </div>
        <div className="mt-2 flex gap-[3px]">
          {days.map((d) => (
            <p key={d} className={cn('flex-1 text-center text-xs font-semibold', d === today ? 'text-fg' : 'text-muted')}>
              {dayLabel(d)}
            </p>
          ))}
        </div>
        {weekSubjects.length > 0 && (
          <div className="mt-5 space-y-3 border-t border-line pt-4">
            {weekSubjects.map((s) => {
              const subject = curriculum.data?.subjectById.get(s.subjectId)
              const color = subjectColor(subject)
              return (
                <div key={s.subjectId} className="grid grid-cols-[minmax(0,8rem)_1fr_2.75rem] items-center gap-3 text-sm">
                  <span className="flex min-w-0 items-center gap-2 font-semibold">
                    <span className="size-2 shrink-0 rounded-full" style={{ backgroundColor: color }} />
                    <span className="truncate">{subject?.short ?? subject?.name ?? 'Ders'}</span>
                  </span>
                  <span className="h-2 rounded-full bg-surface-2">
                    <span className="block h-2 rounded-full" style={{ width: `${Math.round((s.accuracy ?? 0) * 100)}%`, backgroundColor: color }} />
                  </span>
                  <span className="tabular text-right font-semibold">{percent(s.accuracy)}</span>
                </div>
              )
            })}
          </div>
        )}
        {footer}
      </div>
    </Card>
  )
}

function subjectsSince(activity: StudyActivity, from: string) {
  const map = new Map<string, { subjectId: string; questions: number; correct: number; wrong: number; accuracy: number | null }>()
  for (const l of activity.logs) {
    if (l.solved_on < from) continue
    const row = map.get(l.subject_id) ?? { subjectId: l.subject_id, questions: 0, correct: 0, wrong: 0, accuracy: null }
    row.questions += l.correct + l.wrong + l.blank
    row.correct += l.correct
    row.wrong += l.wrong
    map.set(l.subject_id, row)
  }
  for (const r of map.values()) r.accuracy = accuracyOf(r.correct, r.questions)
  return [...map.values()]
}
