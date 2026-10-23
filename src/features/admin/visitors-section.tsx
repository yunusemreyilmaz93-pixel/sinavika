import { useQuery } from '@tanstack/react-query'
import { Globe } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Card, CardHeader } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { formatDate, shiftDays, todayISO } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'
import { LoadError } from './ui'

type Row = { name: string; visitors?: number; views?: number; total?: number }
type Stats = {
  today: number
  daily: { day: string; visitors: number; views: number }[]
  sources: Row[]
  devices: Row[]
  countries: Row[]
  landings: Row[]
  pages: Row[]
  events: Row[]
  members: { teacher_applications: number; teachers_approved: number; students_joined: number; parents_joined: number }
}

const periods = [
  { value: '7', label: 'Son 7 gün' },
  { value: '30', label: 'Son 30 gün' },
  { value: '60', label: 'Son 60 gün' },
] as const

const numberFormat = new Intl.NumberFormat('tr-TR')

function useStats(days: number) {
  return useQuery({
    queryKey: ['admin', 'site-stats', days],
    queryFn: async () => unwrap(await supabase.rpc('admin_site_stats', { p_days: days })) as unknown as Stats,
  })
}

function Stat({ label, value, hint }: { label: string; value: string | number; hint?: string }) {
  return (
    <Card className="p-4">
      <p className="text-sm font-semibold text-muted">{label}</p>
      <p className="tabular mt-1 font-display text-3xl font-extrabold">{value}</p>
      {hint && <p className="mt-0.5 text-sm text-muted">{hint}</p>}
    </Card>
  )
}

function Bars({ values, labels }: { values: number[]; labels: string[] }) {
  const max = Math.max(1, ...values)
  return (
    <div className="flex h-24 items-end gap-px sm:gap-0.5" role="img" aria-label="Günlük ziyaretçi grafiği">
      {values.map((v, i) => (
        <div
          key={i}
          title={`${labels[i]}: ${v}`}
          className="min-w-0 flex-1 rounded-t-sm bg-primary/80"
          style={{ height: `${Math.max(v ? 4 : 1, (v / max) * 100)}%`, opacity: v ? 1 : 0.2 }}
        />
      ))}
    </div>
  )
}

function List({ title, rows, unit = 'visitors', format }: { title: string; rows: Row[]; unit?: 'visitors' | 'views'; format?: (name: string) => string }) {
  const total = rows.reduce((sum, r) => sum + (r[unit] ?? 0), 0)
  return (
    <Card>
      <CardHeader title={title} />
      <ul className="divide-y divide-line px-4 pb-2 sm:px-5">
        {rows.map((r) => {
          const value = r[unit] ?? 0
          return (
            <li key={r.name} className="flex items-center justify-between gap-3 py-2.5 text-sm">
              <span className="min-w-0 truncate font-semibold">{format ? format(r.name) : r.name}</span>
              <span className="tabular shrink-0 text-muted">
                {numberFormat.format(value)}
                {total > 0 && ` · %${Math.round((value / total) * 100)}`}
              </span>
            </li>
          )
        })}
        {!rows.length && <li className="py-3 text-sm text-muted">Kayıt yok</li>}
      </ul>
    </Card>
  )
}

const country = new Intl.DisplayNames(['tr'], { type: 'region' })
const countryName = (code: string) => {
  try {
    return code === '?' ? 'Bilinmiyor' : country.of(code) ?? code
  } catch {
    return code
  }
}

export function VisitorsSection() {
  const [period, setPeriod] = useState<(typeof periods)[number]['value']>('30')
  const days = Number(period)
  const stats = useStats(days)

  const daily = useMemo(() => {
    const map = new Map((stats.data?.daily ?? []).map((d) => [d.day, d]))
    return Array.from({ length: days }, (_, i) => {
      const day = shiftDays(todayISO(), -(days - 1 - i))
      return { day, visitors: map.get(day)?.visitors ?? 0, views: map.get(day)?.views ?? 0 }
    })
  }, [stats.data, days])

  if (stats.isPending) {
    return (
      <div className="space-y-3" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-24" />
        <Skeleton className="h-40" />
      </div>
    )
  }
  if (stats.isError) return <LoadError error={stats.error} onRetry={() => void stats.refetch()} />

  const s = stats.data
  const sum = (key: 'visitors' | 'views', n: number) => daily.slice(-n).reduce((a, d) => a + d[key], 0)
  const hasData = daily.some((d) => d.views > 0)
  if (!hasData) {
    return (
      <EmptyState
        icon={Globe}
        title="Henüz ziyaretçi kaydı yok"
        description="Siteye üye olmadan giren ziyaretçiler burada görünür. Kayıtlar bu özellik yayına girdiği andan itibaren birikir."
      />
    )
  }
  const pageViews = s.pages.find((p) => p.name === '/ogretmen-basvurusu')?.views ?? 0
  const submitted = s.events.find((e) => e.name === 'basvuru-gonderildi')?.total ?? 0
  const joined = s.events.find((e) => e.name === 'davetle-katildi')?.total ?? 0

  return (
    <div className="space-y-5">
      <Segmented options={periods.map((p) => ({ ...p }))} value={period} onChange={setPeriod} size="sm" />

      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
        <Stat label="Bugün" value={numberFormat.format(s.today)} hint="ziyaretçi" />
        <Stat label="Son 7 gün" value={numberFormat.format(sum('visitors', 7))} hint={`${numberFormat.format(sum('views', 7))} görüntüleme`} />
        <Stat label="Son 30 gün" value={numberFormat.format(sum('visitors', Math.min(30, days)))} hint={`${numberFormat.format(sum('views', Math.min(30, days)))} görüntüleme`} />
        <Stat label="Günlük ortalama" value={numberFormat.format(Math.round(sum('visitors', days) / days))} hint="ziyaretçi" />
      </div>
      <p className="text-sm text-muted">
        Çerez kullanılmadığı için bir kişi her gün yeniden sayılır. Haftalık ve aylık değerler günlük tekil ziyaretçilerin toplamıdır.
      </p>

      <Card>
        <CardHeader title="Günlük ziyaretçi" description={`${formatDate(daily[0].day, 'd MMM')} ile ${formatDate(daily[daily.length - 1].day, 'd MMM')} arası`} />
        <div className="p-4 sm:p-5">
          <Bars values={daily.map((d) => d.visitors)} labels={daily.map((d) => formatDate(d.day, 'd MMM'))} />
        </div>
      </Card>

      <Card>
        <CardHeader title="Başvuru hunisi" description="Seçili dönem" />
        <ul className="divide-y divide-line px-4 pb-2 sm:px-5">
          {[
            ['Ziyaretçi', sum('visitors', days)],
            ['Öğretmen başvuru formunu açtı', pageViews],
            ['Başvuru gönderildi', submitted],
            ['Öğretmen onaylandı', s.members.teachers_approved],
            ['Davet koduyla katılan', joined],
          ].map(([label, value]) => (
            <li key={label} className="flex items-center justify-between gap-3 py-2.5 text-sm">
              <span className="font-semibold">{label}</span>
              <span className="tabular text-muted">{numberFormat.format(Number(value))}</span>
            </li>
          ))}
        </ul>
      </Card>

      <div className="grid gap-4 lg:grid-cols-2">
        <List title="Nereden geliyorlar" rows={s.sources} />
        <List title="İlk açılan sayfa" rows={s.landings} />
        <List title="En çok görüntülenen sayfalar" rows={s.pages} unit="views" />
        <List title="Cihaz" rows={s.devices} />
        <List title="Ülke" rows={s.countries} format={countryName} />
      </div>
    </div>
  )
}
