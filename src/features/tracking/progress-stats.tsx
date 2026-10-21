import { motion } from 'motion/react'
import { BarChart3, CalendarCheck, CheckCircle2, Clock, ListChecks, Plus, RotateCw, type LucideIcon } from 'lucide-react'
import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useAuth } from '@/features/auth/session'
import { useCurriculum } from '@/lib/data'
import { formatMinutes } from '@/lib/dates'
import { subjectColor } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { ActivityCalendar } from './activity-calendar'
import { chartRows, Legend, MinutesChart, QuestionsChart } from './progress-charts'
import { QuickAddModal } from './quick-add'
import { formatCount, formatPercent, summarize, useStudyActivity, type SubjectStat } from './stats'
import { subjectName, useStudentRecord } from './subjects'

type Period = '7' | '30' | '90'
const PERIOD_KEY = 'sinavika-progress-period'
const periods: { value: Period; label: string }[] = [
  { value: '7', label: '7 gün' },
  { value: '30', label: '30 gün' },
  { value: '90', label: '90 gün' },
]

function readPeriod(): Period {
  try {
    const v = localStorage.getItem(PERIOD_KEY)
    return v === '30' || v === '90' ? v : '7'
  } catch {
    return '7'
  }
}

export function ProgressStats({ studentId }: { studentId: string }) {
  const activity = useStudyActivity(studentId)
  const { record } = useStudentRecord(studentId)
  const [period, setPeriodState] = useState<Period>(readPeriod)
  const setPeriod = (p: Period) => {
    setPeriodState(p)
    try {
      localStorage.setItem(PERIOD_KEY, p)
    } catch {
      /* depolama kapalı */
    }
  }

  if (activity.isPending) return <StatsSkeleton />
  if (activity.isError || !activity.data) {
    return (
      <Card>
        <CardBody className="flex flex-col items-center gap-3 py-10 text-center">
          <p className="font-semibold">İstatistikler yüklenemedi</p>
          <p className="text-sm text-muted">{errorMessage(activity.error)}</p>
          <Button variant="secondary" onClick={() => void activity.refetch()}>
            <RotateCw />
            Tekrar deneyin
          </Button>
        </CardBody>
      </Card>
    )
  }

  const data = activity.data
  if (data.isEmpty) return <NoActivity studentId={studentId} />

  const days = Number(period)
  const summary = summarize(data, days)
  const weekly = days > 30
  const rows = chartRows(data, summary, weekly)
  const goal = record?.daily_minutes_goal ? record.daily_minutes_goal * (weekly ? 7 : 1) : null
  const periodEmpty = summary.minutes === 0 && summary.questions === 0

  return (
    <div className="space-y-4 sm:space-y-5">
      <Segmented options={periods} value={period} onChange={setPeriod} className="sm:max-w-xs" />

      <motion.div
        key={period}
        initial={{ opacity: 0, y: 6 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.2 }}
        className="grid grid-cols-2 gap-3 lg:grid-cols-4"
      >
        <Tile icon={Clock} label="Toplam süre" value={formatMinutes(summary.minutes)} sub={`Günde ort. ${formatMinutes(Math.round(summary.minutes / days))}`} />
        <Tile icon={ListChecks} label="Çözülen soru" value={formatCount(summary.questions)} sub={`Günde ort. ${formatCount(Math.round(summary.questions / days))}`} />
        <Tile
          icon={CheckCircle2}
          label="Doğruluk"
          value={formatPercent(summary.accuracy)}
          sub={summary.questions ? `${formatCount(summary.correct)} D · ${formatCount(summary.wrong)} Y · ${formatCount(summary.blank)} B` : 'Soru kaydı yok'}
        />
        <Tile icon={CalendarCheck} label="Aktif gün" value={`${summary.activeDays} gün`} sub={`Son ${days} günde kayıt girilen gün`} />
      </motion.div>

      <div className="grid gap-4 sm:gap-5 lg:grid-cols-2">
        <Card>
          <CardHeader title={weekly ? 'Haftalık çalışma süresi' : 'Günlük çalışma süresi'} description={goal ? `Kesikli çizgi ${weekly ? 'haftalık' : 'günlük'} hedef` : undefined} />
          <CardBody className="pt-3">{periodEmpty ? <PeriodEmpty /> : <MinutesChart rows={rows} goal={goal} />}</CardBody>
        </Card>
        <Card>
          <CardHeader title={weekly ? 'Haftalık soru' : 'Günlük soru'} action={summary.questions ? <Legend /> : undefined} />
          <CardBody className="pt-3">{summary.questions ? <QuestionsChart rows={rows} /> : <PeriodEmpty />}</CardBody>
        </Card>
      </div>

      <div className="grid gap-4 sm:gap-5 lg:grid-cols-2 lg:items-start">
        <SubjectBreakdown stats={summary.bySubject} />
        <Card>
          <CardHeader title="Son 12 hafta" description="Her kare bir gün. Renk koyulaştıkça çalışma artar." />
          <CardBody className="pt-4">
            <ActivityCalendar activity={data} />
          </CardBody>
        </Card>
      </div>
    </div>
  )
}

function Tile({
  icon: Icon,
  label,
  value,
  sub,
}: {
  icon: LucideIcon
  label: string
  value: string
  sub: string
}) {
  return (
    <Card className="p-4">
      <p className="flex items-center gap-1.5 text-[13px] font-semibold text-muted">
        <Icon className="size-4 shrink-0" />
        {label}
      </p>
      <p className="tabular mt-2 font-display text-2xl leading-tight font-extrabold sm:text-[28px]">
        {value}
      </p>
      <p className="mt-1 text-xs leading-snug text-muted">{sub}</p>
    </Card>
  )
}

function PeriodEmpty() {
  return (
    <div className="grid-paper grid h-52 place-items-center rounded-xl text-center text-sm text-muted sm:h-56">
      Bu dönemde kayıt yok
    </div>
  )
}

function SubjectBreakdown({ stats }: { stats: SubjectStat[] }) {
  const curriculum = useCurriculum()
  const [metric, setMetric] = useState<'questions' | 'minutes'>('questions')
  const rows = stats
    .filter((s) => (metric === 'questions' ? s.questions > 0 : s.minutes > 0))
    .sort((a, b) => (metric === 'questions' ? b.questions - a.questions : b.minutes - a.minutes))
  const max = Math.max(1, ...rows.map((s) => (metric === 'questions' ? s.questions : s.minutes)))

  return (
    <Card>
      <CardHeader
        title="Derslere göre"
        action={
          <Segmented
            size="sm"
            options={[
              { value: 'questions', label: 'Soru' },
              { value: 'minutes', label: 'Süre' },
            ]}
            value={metric}
            onChange={setMetric}
            className="w-32 shrink-0"
          />
        }
      />
      <CardBody className="pt-4">
        {rows.length === 0 ? (
          <p className="grid-paper rounded-xl py-8 text-center text-sm text-muted">Bu dönemde {metric === 'questions' ? 'soru' : 'süre'} kaydı yok</p>
        ) : (
          <ul className="space-y-3.5">
            {rows.map((s, i) => {
              const subject = curriculum.data?.subjectById.get(s.subjectId)
              const color = subjectColor(subject)
              const value = metric === 'questions' ? s.questions : s.minutes
              return (
                <li key={s.subjectId}>
                  <div className="flex items-baseline justify-between gap-3 text-sm">
                    <span className="flex min-w-0 items-center gap-2 font-semibold">
                      <span aria-hidden className="size-2.5 shrink-0 rounded-full" style={{ backgroundColor: color }} />
                      <span className="truncate">{subjectName(subject, { exam: true })}</span>
                    </span>
                    <span className="tabular shrink-0 text-muted">
                      {metric === 'questions' ? (
                        <>
                          <span className="font-semibold text-fg">{formatCount(s.questions)}</span> soru · {formatPercent(s.accuracy)}
                        </>
                      ) : (
                        <span className="font-semibold text-fg">{formatMinutes(s.minutes)}</span>
                      )}
                    </span>
                  </div>
                  <div className="mt-1.5 h-2.5 overflow-hidden rounded-full bg-surface-2">
                    <motion.div
                      className="relative h-full overflow-hidden rounded-full"
                      style={{ backgroundColor: color, opacity: metric === 'questions' ? 0.35 : 1 }}
                      initial={{ width: 0 }}
                      animate={{ width: `${(value / max) * 100}%` }}
                      transition={{ duration: 0.4, delay: Math.min(i, 8) * 0.03, ease: [0.22, 1, 0.36, 1] }}
                    />
                    {metric === 'questions' && (
                      <motion.div
                        className="-mt-2.5 h-full rounded-full"
                        style={{ backgroundColor: color }}
                        initial={{ width: 0 }}
                        animate={{ width: `${(s.correct / max) * 100}%` }}
                        transition={{ duration: 0.4, delay: Math.min(i, 8) * 0.03, ease: [0.22, 1, 0.36, 1] }}
                      />
                    )}
                  </div>
                </li>
              )
            })}
          </ul>
        )}
        {metric === 'questions' && rows.length > 0 && (
          <p className="mt-4 text-xs text-muted">Koyu kısım doğru cevapları, açık kısım yanlış ve boşları gösterir.</p>
        )}
      </CardBody>
    </Card>
  )
}

function NoActivity({ studentId }: { studentId: string }) {
  const { profile } = useAuth()
  const [open, setOpen] = useState(false)
  const self = profile?.role === 'student' && profile.id === studentId
  return (
    <>
      <EmptyState
        icon={BarChart3}
        title="Henüz kayıt yok"
        description={
          self
            ? 'Çözdüğün soruları ve çalışma süreni kaydettikçe grafiklerin burada oluşur.'
            : 'Öğrenci soru ve çalışma kaydı girdikçe istatistikler burada görünür.'
        }
        action={
          self ? (
            <Button onClick={() => setOpen(true)}>
              <Plus />
              İlk kaydını ekle
            </Button>
          ) : undefined
        }
      />
      {self && <QuickAddModal open={open} onOpenChange={setOpen} />}
    </>
  )
}

function StatsSkeleton() {
  return (
    <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
      <Skeleton className="h-11 sm:max-w-xs" />
      <div className="grid grid-cols-2 gap-3 lg:grid-cols-4">
        {[0, 1, 2, 3].map((i) => (
          <Skeleton key={i} className="h-[118px] rounded-2xl" />
        ))}
      </div>
      <div className="grid gap-4 lg:grid-cols-2">
        <Skeleton className="h-72 rounded-2xl" />
        <Skeleton className="h-72 rounded-2xl" />
      </div>
    </div>
  )
}
