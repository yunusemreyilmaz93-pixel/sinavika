import { ArrowRight, Backpack, Clock3, GraduationCap, Inbox, Timer, Users, type LucideIcon } from 'lucide-react'
import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useSettings } from '@/lib/data'
import { useAdminOverview } from './queries'
import { SystemHealthCard } from './system-health'
import { CountUp, LoadError } from './ui'

const list = { show: { transition: { staggerChildren: 0.05 } } }
const item = { hidden: { opacity: 0, y: 8 }, show: { opacity: 1, y: 0, transition: { duration: 0.25 } } }

function Tile({
  icon: Icon,
  label,
  value,
  suffix,
  children,
  className,
}: {
  icon: LucideIcon
  label: string
  value: number
  suffix?: ReactNode
  children?: ReactNode
  className?: string
}) {
  return (
    <motion.div variants={item} className={className}>
      <Card className="flex h-full flex-col p-4 sm:p-5">
        <p className="flex items-center gap-2 text-sm font-semibold text-muted">
          <Icon className="size-4 shrink-0" />
          {label}
        </p>
        <p className="tabular mt-2 font-display text-3xl font-extrabold sm:text-4xl">
          <CountUp value={value} />
          {suffix}
        </p>
        {children && <div className="mt-auto pt-3">{children}</div>}
      </Card>
    </motion.div>
  )
}

export function OverviewSection({ onNavigate }: { onNavigate: (section: 'basvurular' | 'ayarlar') => void }) {
  const overview = useAdminOverview()
  const settings = useSettings()

  if (overview.isPending) {
    return (
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 sm:gap-4" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="col-span-2 h-36" />
        <Skeleton className="h-36" />
        <Skeleton className="h-32" />
        <Skeleton className="h-32" />
        <Skeleton className="h-32" />
      </div>
    )
  }
  if (overview.isError || !overview.data) return <LoadError error={overview.error} onRetry={() => void overview.refetch()} />

  const o = overview.data
  const capacity = settings.data?.teacherCapacity ?? 0
  const free = Math.max(0, capacity - o.teachers_active)

  return (
    <div className="space-y-4">
      <motion.div variants={list} initial="hidden" animate="show" className="grid grid-cols-2 gap-3 sm:grid-cols-3 sm:gap-4">
        <Tile
          icon={GraduationCap}
          label="Aktif öğretmen"
          value={o.teachers_active}
          suffix={capacity ? <span className="text-xl text-subtle sm:text-2xl"> / {capacity}</span> : null}
          className="col-span-2"
        >
          {capacity > 0 && (
            <>
              <ProgressBar value={o.teachers_active / capacity} tone={free === 0 ? 'warning' : 'primary'} />
              <p className="mt-2 text-sm text-muted">{free === 0 ? 'Öğretmen kontenjanı dolu' : `${free} yer boş`}</p>
            </>
          )}
        </Tile>
        <Tile icon={Inbox} label="Bekleyen başvuru" value={o.teachers_pending}>
          {o.teachers_pending > 0 ? (
            <Button variant="link" className="h-11" onClick={() => onNavigate('basvurular')}>
              İncele
              <ArrowRight />
            </Button>
          ) : (
            <p className="text-sm text-muted">Hepsi incelendi</p>
          )}
        </Tile>
        <Tile icon={Backpack} label="Aktif öğrenci" value={o.students_active} />
        <Tile icon={Users} label="Veli" value={o.parents} />
        <Tile icon={Timer} label="Çalışma kaydı" value={o.sessions_7d}>
          <p className="text-sm text-muted">Son 7 gün</p>
        </Tile>
      </motion.div>

      {settings.data && (
        <Card className="flex items-center gap-3 p-4">
          <div className={cn('grid size-10 shrink-0 place-items-center rounded-xl', settings.data.applicationsOpen ? 'bg-primary-soft text-primary-soft-fg' : 'bg-warning-soft text-warning')}>
            <Clock3 className="size-5" />
          </div>
          <div className="min-w-0 flex-1">
            <p className="font-semibold">Öğretmen başvuruları</p>
            <p className="text-sm text-muted">
              {settings.data.applicationsOpen ? 'Yeni öğretmenler başvuru formunu doldurabilir.' : 'Başvuru formu şu an kapalı.'}
            </p>
          </div>
          <Badge tone={settings.data.applicationsOpen ? 'primary' : 'warning'} className="hidden sm:inline-flex">
            {settings.data.applicationsOpen ? 'Açık' : 'Kapalı'}
          </Badge>
          <Button variant="secondary" onClick={() => onNavigate('ayarlar')}>
            Değiştir
          </Button>
        </Card>
      )}

      <SystemHealthCard />
    </div>
  )
}
