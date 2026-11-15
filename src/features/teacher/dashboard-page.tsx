import { NextMeetingCard } from '@/features/meetings/next-meeting'
import { Archive, ClipboardList, Clock3, ListChecks, TriangleAlert, UserPlus, UsersRound } from 'lucide-react'
import { motion } from 'motion/react'
import { useMemo } from 'react'
import { Link, useSearchParams } from 'react-router'
import { Button } from '@/components/ui/button'
import { ProgressRing } from '@/components/ui/progress'
import { StatTile, Trend } from '@/components/ui/stat'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { formatDate, formatMinutes, greeting, todayISO } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { ClassWeakTopics, TopStudents } from './dashboard-rail'
import { useCapacity } from './invites'
import { rankByAttention, useTeacherOverview } from './overview'
import { StartChecklist, useStartChecklist } from './start-checklist'
import { StudentCard } from './student-card'
import { StudyRoomCard } from '@/features/tracking/study-room-provider'

type Filter = 'aktif' | 'arsiv'

const list = { hidden: {}, show: { transition: { staggerChildren: 0.045 } } }
const card = {
  hidden: { opacity: 0, y: 10 },
  show: { opacity: 1, y: 0, transition: { duration: 0.28, ease: [0.22, 1, 0.36, 1] as const } },
}

export default function DashboardPage() {
  const profile = useProfile()
  const overview = useTeacherOverview()
  const capacity = useCapacity()
  const [params, setParams] = useSearchParams()
  const filter: Filter = params.get('liste') === 'arsiv' ? 'arsiv' : 'aktif'
  const today = todayISO()

  const { active, archived } = useMemo(() => {
    const ranked = rankByAttention(overview.data ?? [], today)
    return { active: ranked.filter((s) => !s.archived_at), archived: ranked.filter((s) => s.archived_at) }
  }, [overview.data, today])

  const totals = useMemo(
    () => ({
      minutes: active.reduce((sum, s) => sum + s.minutes_7d, 0),
      questions: active.reduce((sum, s) => sum + s.questions_7d, 0),
      attention: active.filter((s) => s.signals.level !== 'ok').length,
      minutesDelta: (() => {
        const prev = active.reduce((sum, s) => sum + (s.minutes_prev_7d ?? 0), 0)
        const now = active.reduce((sum, s) => sum + s.minutes_7d, 0)
        return prev ? Math.round(((now - prev) / prev) * 100) : null
      })(),
    }),
    [active],
  )

  const firstName = profile.full_name.trim().split(/\s+/)[0]
  const shown = filter === 'arsiv' ? archived : active
  const noStudents = overview.isSuccess && active.length === 0 && archived.length === 0
  const start = useStartChecklist(overview.data, capacity.pending)

  const setFilter = (next: Filter) => setParams(next === 'arsiv' ? { liste: 'arsiv' } : {}, { replace: true })

  return (
    <div>
      <section className="mb-4 rounded-3xl border border-line bg-surface p-4 sm:mb-5 sm:p-6">
        <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <div className="min-w-0">
            <p className="text-sm text-muted">{formatDate(today, 'd MMMM EEEE')}</p>
            <h1 className="text-[1.65rem] leading-tight font-extrabold sm:text-3xl">
              {greeting()}, {firstName}
            </h1>
            {!noStudents && overview.isSuccess && (
              <p className="mt-1 text-[15px] text-muted">
                {totals.attention ? `Bu hafta ${totals.attention} öğrencinize bakmanız gerekiyor.` : 'Bu hafta herkes yolunda görünüyor.'}
              </p>
            )}
          </div>
          <div className="flex w-full gap-2 sm:w-auto">
            <Button variant="secondary" className="flex-1 sm:flex-none" asChild>
              <Link to="/app/davetler?yeni=1">
                <UserPlus />
                Davet edin
              </Link>
            </Button>
            <Button className="flex-1 sm:flex-none" asChild>
              <Link to="/app/planlayici">
                <ClipboardList />
                Planlayıcı
              </Link>
            </Button>
          </div>
        </div>
        {!noStudents && (
          <div className="mt-5 grid grid-cols-2 gap-2.5 lg:grid-cols-4">
            {overview.isPending || !capacity.ready ? (
              [0, 1, 2, 3].map((i) => <Skeleton key={i} className="h-28 rounded-2xl" />)
            ) : (
              <>
                <Link to="/app/davetler" className="rounded-2xl transition-colors hover:bg-surface-2">
                  <StatTile
                    icon={<UsersRound />}
                    hue="pine"
                    label="Aktif öğrenci"
                    value={
                      <>
                        {capacity.used}
                        <span className="text-base text-muted">/{capacity.capacity}</span>
                      </>
                    }
                    aside={<ProgressRing value={capacity.capacity ? capacity.used / capacity.capacity : 0} size={30} stroke={4} />}
                  />
                </Link>
                <StatTile
                  icon={<Clock3 />}
                  hue="sea"
                  label="Çalışma, 7 gün"
                  value={formatMinutes(totals.minutes)}
                  aside={
                    totals.minutesDelta != null ? <Trend up={totals.minutesDelta >= 0}>%{Math.abs(totals.minutesDelta)}</Trend> : undefined
                  }
                />
                <StatTile icon={<ListChecks />} hue="violet" label="Soru, 7 gün" value={totals.questions.toLocaleString('tr-TR')} />
                <StatTile
                  icon={<TriangleAlert />}
                  hue="orange"
                  label="Dikkat isteyen"
                  value={totals.attention}
                  aside={totals.attention ? 'öğrenci' : 'herkes yolunda'}
                />
              </>
            )}
          </div>
        )}
      </section>

      {start.visible && <StartChecklist steps={start.steps} onDismiss={start.dismiss} />}

      <div className="grid gap-4 sm:gap-5 xl:grid-cols-[minmax(0,1fr)_22rem] xl:items-start">
        <div className="min-w-0">
          {overview.isPending ? (
            <CardsSkeleton />
          ) : overview.isError ? (
            <div
              role="alert"
              className="flex flex-col items-start gap-3 rounded-2xl border border-line bg-surface p-5 sm:flex-row sm:items-center"
            >
              <p className="flex-1 text-sm text-danger">{errorMessage(overview.error)}</p>
              <Button variant="secondary" size="sm" onClick={() => void overview.refetch()}>
                Tekrar deneyin
              </Button>
            </div>
          ) : noStudents && start.visible ? null : noStudents ? (
            <EmptyState
              icon={UserPlus}
              className="py-14 sm:py-20 [&_h3]:text-xl"
              title="Henüz öğrenciniz yok"
              description={
                capacity.pending
                  ? `${capacity.pending} davet katılım bekliyor. Öğrenciniz kodu girdiğinde burada görünür.`
                  : 'Davet kodu oluşturup öğrencinize gönderin. Katıldığında çalışmasını, görevlerini ve denemelerini buradan takip edersiniz.'
              }
              action={
                <Button size="lg" asChild>
                  <Link to="/app/davetler?yeni=1">
                    <UserPlus />
                    İlk öğrencinizi davet edin
                  </Link>
                </Button>
              }
            />
          ) : (
            <section aria-labelledby="students-title">
              <div className="mb-4 flex flex-wrap items-center justify-between gap-3">
                <h2 id="students-title" className="text-lg font-bold">
                  Öğrenciler <span className="tabular text-sm font-semibold text-muted">{shown.length}</span>
                </h2>
                <Segmented
                  size="sm"
                  className="w-full sm:w-56"
                  value={filter}
                  onChange={setFilter}
                  options={[
                    { value: 'aktif', label: `Aktif ${active.length}` },
                    { value: 'arsiv', label: `Arşiv ${archived.length}` },
                  ]}
                />
              </div>

              {shown.length ? (
                <motion.ul
                  key={filter}
                  variants={list}
                  initial="hidden"
                  animate="show"
                  className="grid gap-3 sm:grid-cols-2 sm:gap-4 2xl:grid-cols-3"
                >
                  {shown.map((student) => (
                    <motion.li key={student.id} variants={card} className="min-w-0">
                      <StudentCard student={student} />
                    </motion.li>
                  ))}
                </motion.ul>
              ) : filter === 'arsiv' ? (
                <EmptyState
                  icon={Archive}
                  title="Arşiv boş"
                  description="Öğrenci sayfasından arşive aldığınız öğrenciler burada durur. Arşivdeki öğrenci kontenjana sayılmaz."
                  action={
                    <Button variant="secondary" onClick={() => setFilter('aktif')}>
                      Aktif öğrencilere dön
                    </Button>
                  }
                />
              ) : (
                <EmptyState
                  icon={UserPlus}
                  title="Aktif öğrenciniz yok"
                  description="Yeni bir öğrenci davet edebilir ya da arşivdeki bir öğrenciyi geri alabilirsiniz."
                  action={
                    <Button asChild>
                      <Link to="/app/davetler?yeni=1">
                        <UserPlus />
                        Öğrenci davet edin
                      </Link>
                    </Button>
                  }
                />
              )}
            </section>
          )}
        </div>
        {!noStudents && (
          <aside className="space-y-4 sm:space-y-5">
            <NextMeetingCard nameOf={(m) => active.find((s) => s.id === m.student_id)?.full_name ?? 'Öğrenci'} />
            <StudyRoomCard forTeacher />
            <ClassWeakTopics students={active} />
            <TopStudents students={active} />
          </aside>
        )}
      </div>
    </div>
  )
}

function CardsSkeleton() {
  return (
    <div className="grid gap-3 sm:grid-cols-2 sm:gap-4 2xl:grid-cols-3" aria-busy="true" aria-label="Yükleniyor">
      {Array.from({ length: 6 }, (_, i) => (
        <Skeleton key={i} className="h-[248px] rounded-2xl" />
      ))}
    </div>
  )
}
