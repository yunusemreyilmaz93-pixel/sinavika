import { useQuery } from '@tanstack/react-query'
import { Activity, ChevronDown } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Card, CardHeader } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { formatDate, formatMinutes, formatRelative, formatTime, shiftDays, todayISO } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'
import { LoadError } from './ui'

type Role = 'teacher' | 'student' | 'parent'
type Usage = {
  active: { d1: number; d7: number; d30: number }
  by_role: { role: Role; users: number; sessions: number; seconds: number }[]
  daily: { day: string; teacher: number; student: number; parent: number }[]
  hours: { hour: number; sessions: number }[]
  pages: { role: Role; path: string; seconds: number; visits: number }[]
}

const roleLabel: Record<Role, string> = { teacher: 'Öğretmen', student: 'Öğrenci', parent: 'Veli' }
const periods = [
  { value: '7', label: 'Son 7 gün' },
  { value: '30', label: 'Son 30 gün' },
  { value: '90', label: 'Son 90 gün' },
] as const

const pageNames: Record<string, string> = {
  '/app': 'Ana sayfa',
  '/app/plan': 'Plan',
  '/app/planlayici': 'Planlayıcı',
  '/app/sablonlar': 'Şablonlar',
  '/app/ilerleme': 'İlerleme',
  '/app/denemeler': 'Denemeler',
  '/app/konular': 'Konular',
  '/app/konular/:id': 'Konu anlatımı',
  '/app/okuma': 'Okuma',
  '/app/notlar': 'Notlar',
  '/app/yanlislar': 'Yanlışlar',
  '/app/sayac': 'Sayaç',
  '/app/deneme-ekle': 'Deneme ekle',
  '/app/mesajlar': 'Mesajlar',
  '/app/duyurular': 'Duyurular',
  '/app/bildirimler': 'Bildirimler',
  '/app/ayarlar': 'Ayarlar',
  '/app/asistan': 'Asistan',
  '/app/mufredat': 'Müfredat',
  '/app/davetler': 'Davetler',
  '/app/ogrenciler/:id': 'Öğrenci sayfası',
  '/app/yonetim': 'Yönetim',
}
const pageName = (path: string) => pageNames[path] ?? path

function duration(seconds: number) {
  if (seconds < 60) return seconds ? `${seconds} sn` : '0 dk'
  return formatMinutes(Math.round(seconds / 60))
}

function useUsage(days: number) {
  return useQuery({
    queryKey: ['admin', 'usage', days],
    queryFn: async () => unwrap(await supabase.rpc('admin_usage', { p_days: days })) as unknown as Usage,
  })
}

function useUsageUsers(days: number) {
  return useQuery({
    queryKey: ['admin', 'usage-users', days],
    queryFn: async () => unwrap(await supabase.rpc('admin_usage_users', { p_days: days })),
  })
}

function useUserSessions(userId: string | null) {
  return useQuery({
    queryKey: ['admin', 'usage-sessions', userId],
    enabled: Boolean(userId),
    queryFn: async () => unwrap(await supabase.rpc('admin_usage_sessions', { p_user: userId! })),
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

function Bars({ values, labels, height = 96 }: { values: number[]; labels: string[]; height?: number }) {
  const max = Math.max(1, ...values)
  return (
    <div className="flex items-end gap-px sm:gap-0.5" style={{ height }} role="img" aria-label="Çubuk grafik">
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

export function UsageSection() {
  const [period, setPeriod] = useState<(typeof periods)[number]['value']>('30')
  const days = Number(period)
  const usage = useUsage(days)
  const users = useUsageUsers(days)
  const [roleFilter, setRoleFilter] = useState<'all' | Role>('all')
  const [open, setOpen] = useState<string | null>(null)

  const daily = useMemo(() => {
    const map = new Map((usage.data?.daily ?? []).map((d) => [d.day, d]))
    const out: { day: string; total: number }[] = []
    for (let i = days - 1; i >= 0; i--) {
      const day = shiftDays(todayISO(), -i)
      const d = map.get(day)
      out.push({ day, total: d ? d.teacher + d.student + d.parent : 0 })
    }
    return out
  }, [usage.data, days])

  const hours = useMemo(() => {
    const map = new Map((usage.data?.hours ?? []).map((h) => [h.hour, h.sessions]))
    return Array.from({ length: 24 }, (_, h) => map.get(h) ?? 0)
  }, [usage.data])

  if (usage.isPending || users.isPending) {
    return (
      <div className="space-y-3" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-24" />
        <Skeleton className="h-40" />
        <Skeleton className="h-64" />
      </div>
    )
  }
  if (usage.isError) return <LoadError error={usage.error} onRetry={() => void usage.refetch()} />
  if (users.isError) return <LoadError error={users.error} onRetry={() => void users.refetch()} />

  const u = usage.data
  const list = (users.data ?? []).filter((r) => roleFilter === 'all' || r.role === roleFilter)

  if (!u.active.d30 && !u.by_role.length && !(users.data ?? []).length) {
    return (
      <EmptyState
        icon={Activity}
        title="Henüz kullanım kaydı yok"
        description="Kullanıcılar giriş yapıp uygulamayı açtıkça burada görünür. Test hesapları sayılmaz."
      />
    )
  }

  return (
    <div className="space-y-5">
      <Segmented options={periods.map((p) => ({ ...p }))} value={period} onChange={setPeriod} size="sm" />

      <div className="grid grid-cols-3 gap-3">
        <Stat label="Son 24 saat" value={u.active.d1} hint="aktif kullanıcı" />
        <Stat label="Son 7 gün" value={u.active.d7} hint="aktif kullanıcı" />
        <Stat label="Son 30 gün" value={u.active.d30} hint="aktif kullanıcı" />
      </div>

      <div className="grid gap-3 sm:grid-cols-3">
        {(['teacher', 'student', 'parent'] as const).map((role) => {
          const r = u.by_role.find((x) => x.role === role)
          return (
            <Card key={role} className="p-4">
              <p className="text-sm font-semibold text-muted">{roleLabel[role]}</p>
              <p className="tabular mt-1 font-display text-2xl font-extrabold">{r?.users ?? 0} kişi</p>
              <p className="mt-0.5 text-sm text-muted">
                {r ? `${r.sessions} ziyaret, kişi başı ${duration(Math.round(r.seconds / Math.max(1, r.users)))}` : 'Kayıt yok'}
              </p>
            </Card>
          )
        })}
      </div>

      <Card>
        <CardHeader title="Günlük aktif kullanıcı" description={`${formatDate(daily[0].day, 'd MMM')} ile ${formatDate(daily[daily.length - 1].day, 'd MMM')} arası`} />
        <div className="p-4 sm:p-5">
          <Bars values={daily.map((d) => d.total)} labels={daily.map((d) => formatDate(d.day, 'd MMM'))} />
        </div>
      </Card>

      <Card>
        <CardHeader title="Saate göre ziyaret" description="Türkiye saati" />
        <div className="p-4 sm:p-5">
          <Bars values={hours} labels={hours.map((_, h) => `${String(h).padStart(2, '0')}:00`)} height={72} />
          <div className="tabular mt-1 flex justify-between text-xs text-muted">
            <span>00</span>
            <span>06</span>
            <span>12</span>
            <span>18</span>
            <span>23</span>
          </div>
        </div>
      </Card>

      <Card>
        <CardHeader title="En çok kullanılan sayfalar" description="Toplam süreye göre" />
        <ul className="divide-y divide-line px-4 pb-2 sm:px-5">
          {u.pages.slice(0, 12).map((p) => (
            <li key={`${p.role}${p.path}`} className="flex items-center justify-between gap-3 py-2.5 text-sm">
              <span className="min-w-0 truncate">
                <span className="font-semibold">{pageName(p.path)}</span>
                <span className="text-muted"> · {roleLabel[p.role]}</span>
              </span>
              <span className="tabular shrink-0 text-muted">
                {duration(p.seconds)} · {p.visits} giriş
              </span>
            </li>
          ))}
          {!u.pages.length && <li className="py-3 text-sm text-muted">Kayıt yok</li>}
        </ul>
      </Card>

      <Card>
        <CardHeader
          title="Kullanıcılar"
          description="Ziyaret, aralıksız kullanımdır. 5 dakikadan uzun ara verilirse yeni ziyaret sayılır"
        />
        <div className="px-4 pt-3 sm:px-5">
          <Segmented
            size="sm"
            options={[
              { value: 'all', label: 'Tümü' },
              { value: 'teacher', label: 'Öğretmen' },
              { value: 'student', label: 'Öğrenci' },
              { value: 'parent', label: 'Veli' },
            ]}
            value={roleFilter}
            onChange={setRoleFilter}
          />
        </div>
        {list.length ? (
          <ul className="mt-2 divide-y divide-line">
            {list.map((r) => (
              <li key={r.id}>
                <button
                  type="button"
                  aria-expanded={open === r.id}
                  onClick={() => setOpen(open === r.id ? null : r.id)}
                  className="flex min-h-14 w-full items-center gap-3 px-4 py-2 text-left sm:px-5"
                >
                  <span className="min-w-0 flex-1">
                    <span className="block truncate font-semibold">{r.full_name}</span>
                    <span className="block text-sm text-muted">
                      {roleLabel[r.role]} · son görülme {formatRelative(r.last_seen_at)}
                    </span>
                  </span>
                  <span className="tabular shrink-0 text-right text-sm">
                    <span className="block font-semibold">{r.sessions} ziyaret</span>
                    <span className="block text-muted">
                      {duration(r.seconds)}, ort. {duration(r.avg_seconds)}
                    </span>
                  </span>
                  <ChevronDown className={cn('size-4 shrink-0 text-muted transition-transform', open === r.id && 'rotate-180')} aria-hidden />
                </button>
                {open === r.id && <UserSessions userId={r.id} />}
              </li>
            ))}
          </ul>
        ) : (
          <p className="px-4 py-4 text-sm text-muted sm:px-5">Bu dönemde kayıt yok</p>
        )}
      </Card>
    </div>
  )
}

function UserSessions({ userId }: { userId: string }) {
  const sessions = useUserSessions(userId)
  if (sessions.isPending) return <Skeleton className="mx-4 mb-3 h-24 sm:mx-5" />
  if (sessions.isError) return <div className="px-4 pb-3 sm:px-5"><LoadError error={sessions.error} onRetry={() => void sessions.refetch()} /></div>
  return (
    <ul className="mx-4 mb-3 divide-y divide-line rounded-xl bg-surface-2/60 text-sm sm:mx-5">
      {sessions.data.map((s) => (
        <li key={s.started_at} className="flex items-center justify-between gap-3 px-3 py-2">
          <span className="tabular">
            {formatDate(s.started_at.slice(0, 10), 'd MMM')} {formatTime(s.started_at)}
          </span>
          <span className="min-w-0 flex-1 truncate text-muted">{s.last_path ? pageName(s.last_path) : ''}</span>
          <span className="tabular shrink-0 font-semibold">{duration(s.seconds)}</span>
        </li>
      ))}
    </ul>
  )
}
