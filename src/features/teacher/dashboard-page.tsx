import { Archive, ArrowRight, ClipboardList, Clock3, ListChecks, TriangleAlert, UserPlus } from 'lucide-react'
import { motion } from 'motion/react'
import { useMemo, type ReactNode } from 'react'
import { Link, useSearchParams } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { formatDate, greeting, todayISO } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { CapacityMeter } from './capacity-meter'
import { useCapacity } from './invites'
import { rankByAttention, useTeacherOverview } from './overview'
import { StartChecklist, useStartChecklist } from './start-checklist'
import { Duration, StudentCard } from './student-card'

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
      <header className="mb-6 flex flex-wrap items-end justify-between gap-4 sm:mb-8">
        <div className="min-w-0">
          <p className="text-sm font-semibold text-muted">{formatDate(today, 'd MMMM EEEE')}</p>
          <h1 className="mt-0.5 text-2xl font-extrabold sm:text-3xl">
            {greeting()}, {firstName}
          </h1>
        </div>
        <div className="flex w-full gap-2 sm:w-auto">
          <Button variant="secondary" className="flex-1 sm:flex-none" asChild>
            <Link to="/app/davetler?yeni=1">
              <UserPlus />
              Öğrenci davet edin
            </Link>
          </Button>
          <Button className="flex-1 sm:flex-none" asChild>
            <Link to="/app/planlayici">
              <ClipboardList />
              Planlayıcı
            </Link>
          </Button>
        </div>
      </header>

      {start.visible && <StartChecklist steps={start.steps} onDismiss={start.dismiss} />}

      <div className={cn('mb-8 grid gap-3 sm:gap-4', !noStudents && 'lg:grid-cols-[minmax(0,1fr)_300px]')}>
        {!noStudents && (
          <Card className="grid grid-cols-3 divide-x divide-line">
            <Stat icon={<Clock3 />} label="Çalışma" note="son 7 gün" loading={overview.isPending}>
              <Duration minutes={totals.minutes} unitClass="text-[0.55em] font-semibold text-muted" />
            </Stat>
            <Stat icon={<ListChecks />} label="Soru" note="son 7 gün" loading={overview.isPending}>
              <span className="tabular">{totals.questions.toLocaleString('tr-TR')}</span>
            </Stat>
            <Stat
              icon={<TriangleAlert />}
              label="Dikkat"
              note={totals.attention ? 'öğrenci izlemede' : 'herkes yolunda'}
              loading={overview.isPending}
              tone={totals.attention ? 'warning' : 'default'}
            >
              <span className="tabular">{totals.attention}</span>
            </Stat>
          </Card>
        )}
        <Card className="flex flex-col justify-center gap-3 p-4 sm:p-5">
          {capacity.ready ? (
            <CapacityMeter used={capacity.used} capacity={capacity.capacity} pending={capacity.pending} />
          ) : (
            <div className="space-y-2.5" aria-hidden>
              <Skeleton className="h-7 w-32" />
              <Skeleton className="h-2.5 w-full" />
            </div>
          )}
          <Link
            to="/app/davetler"
            className="inline-flex min-h-11 items-center gap-1 self-start text-sm font-semibold text-accent hover:underline sm:min-h-0"
          >
            Davetleri yönetin
            <ArrowRight className="size-4" />
          </Link>
        </Card>
      </div>

      {overview.isPending ? (
        <CardsSkeleton />
      ) : overview.isError ? (
        <div role="alert" className="flex flex-col items-start gap-3 rounded-2xl border border-line bg-surface p-5 sm:flex-row sm:items-center">
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
              className="grid gap-3 sm:grid-cols-2 sm:gap-4 lg:grid-cols-3"
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
  )
}

function Stat({
  icon,
  label,
  note,
  loading,
  tone = 'default',
  children,
}: {
  icon: ReactNode
  label: string
  note: string
  loading: boolean
  tone?: 'default' | 'warning'
  children: ReactNode
}) {
  return (
    <div className="flex min-w-0 flex-col justify-center px-3 py-3.5 sm:px-5 sm:py-4">
      <p className={cn('flex items-center gap-1.5 text-xs font-semibold [&_svg]:size-3.5', tone === 'warning' ? 'text-warning' : 'text-muted')}>
        {icon}
        {label}
      </p>
      {loading ? (
        <Skeleton className="mt-1.5 h-7 w-16" />
      ) : (
        <p className={cn('mt-1 font-display text-xl leading-tight font-bold sm:text-2xl', tone === 'warning' && 'text-warning')}>{children}</p>
      )}
      <p className="mt-0.5 truncate text-[11px] text-muted sm:text-xs">{note}</p>
    </div>
  )
}

function CardsSkeleton() {
  return (
    <div className="grid gap-3 sm:grid-cols-2 sm:gap-4 lg:grid-cols-3" aria-busy="true" aria-label="Yükleniyor">
      {Array.from({ length: 6 }, (_, i) => (
        <Skeleton key={i} className="h-[248px] rounded-2xl" />
      ))}
    </div>
  )
}
