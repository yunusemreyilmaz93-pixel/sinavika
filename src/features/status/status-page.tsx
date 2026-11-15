import { useQuery } from '@tanstack/react-query'
import { ArrowLeft, CircleAlert, CircleCheck, CircleX, RefreshCw } from 'lucide-react'
import { useEffect } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Logo } from '@/components/ui/logo'
import { Skeleton } from '@/components/ui/skeleton'
import { CONTACT_EMAIL } from '@/lib/contact'
import { cn } from '@/lib/cn'

type Health = { ok: boolean; checks: Record<string, boolean>; optional: Record<string, boolean>; version: string }
type State = 'up' | 'down' | 'off'

async function loadHealth(): Promise<Health | null> {
  try {
    const res = await fetch('/api/health', { cache: 'no-store' })
    if (!res.headers.get('content-type')?.includes('json')) return null
    return (await res.json()) as Health
  } catch {
    return null
  }
}

function rows(h: Health): [string, State][] {
  const c = h.checks
  const tables = Object.entries(c).filter(([k]) => k.startsWith('table_'))
  return [
    ['Giriş ve hesaplar', c.supabase_url && c.service_key && c.table_profiles ? 'up' : 'down'],
    ['Plan, deneme ve mesaj kayıtları', tables.every(([, v]) => v) ? 'up' : 'down'],
    ['Konu anlatımları', c.curriculum ? 'up' : 'down'],
    ['Telefon bildirimleri', c.table_push_subscriptions ? 'up' : 'down'],
    ['Görüntülü görüşme', h.optional.meetings ? 'up' : 'off'],
    ['Yapay zekâ asistanı', h.optional.ai_assistant ? 'up' : 'off'],
  ]
}

const badge: Record<State, { label: string; icon: typeof CircleCheck; className: string }> = {
  up: { label: 'Çalışıyor', icon: CircleCheck, className: 'text-success' },
  down: { label: 'Sorun var', icon: CircleX, className: 'text-danger' },
  off: { label: 'Geçici olarak kapalı', icon: CircleAlert, className: 'text-warning' },
}

const time = new Intl.DateTimeFormat('tr-TR', { hour: '2-digit', minute: '2-digit', timeZone: 'Europe/Istanbul' })
const link = 'font-semibold text-accent underline-offset-4 hover:underline'

export default function StatusPage() {
  const health = useQuery({ queryKey: ['public-health'], queryFn: loadHealth, refetchInterval: 60_000, refetchOnWindowFocus: true })

  useEffect(() => {
    const previous = document.title
    document.title = 'Sistem durumu · İzlek'
    return () => {
      document.title = previous
    }
  }, [])

  const data = health.data
  const list = data ? rows(data) : []
  const down = !data || list.some(([, s]) => s === 'down')

  return (
    <div className="min-h-dvh">
      <header className="pt-safe grid-paper sticky top-0 z-30 border-b border-line bg-bg">
        <div className="mx-auto flex h-16 max-w-5xl items-center justify-between gap-3 px-4 sm:px-6">
          <Link to="/" aria-label="İzlek ana sayfa" className="-ml-1 rounded-lg p-1">
            <Logo />
          </Link>
          <Button asChild variant="ghost" className="-mr-2 px-3">
            <Link to="/">
              <ArrowLeft />
              Ana sayfa
            </Link>
          </Button>
        </div>
      </header>

      <main className="mx-auto max-w-2xl px-4 pt-8 pb-20 sm:px-6 sm:pt-14">
        <h1 className="text-[1.85rem] leading-[1.15] font-extrabold sm:text-[2.5rem]">Sistem durumu</h1>

        <section
          aria-live="polite"
          className={cn('mt-6 rounded-3xl border p-5', health.isPending ? 'border-line bg-surface' : down ? 'border-danger/30 bg-danger-soft' : 'border-line bg-primary-soft')}
        >
          {health.isPending ? (
            <Skeleton className="h-7 w-2/3" />
          ) : (
            <div className="flex items-center gap-3">
              {down ? <CircleX className="size-6 shrink-0 text-danger" /> : <CircleCheck className="size-6 shrink-0 text-success" />}
              <p className="font-display text-lg font-bold">
                {!data ? 'Sunucuya şu an ulaşılamıyor' : down ? 'Bazı bölümlerde sorun var' : 'Her şey çalışıyor'}
              </p>
            </div>
          )}
          <div className="mt-3 flex flex-wrap items-center justify-between gap-2 text-sm text-muted">
            <span>{health.dataUpdatedAt ? `Son kontrol ${time.format(health.dataUpdatedAt)}` : 'Kontrol ediliyor'}</span>
            <Button variant="ghost" size="sm" onClick={() => void health.refetch()} loading={health.isFetching} className="-mr-2">
              {!health.isFetching && <RefreshCw />}
              Yenile
            </Button>
          </div>
        </section>

        {data && (
          <ul className="mt-4 divide-y divide-line rounded-3xl border border-line bg-surface">
            {list.map(([name, state]) => {
              const b = badge[state]
              return (
                <li key={name} className="flex min-h-14 items-center justify-between gap-3 px-5 py-3">
                  <span className="font-semibold">{name}</span>
                  <span className={cn('flex shrink-0 items-center gap-1.5 text-sm font-semibold', b.className)}>
                    <b.icon className="size-4" />
                    {b.label}
                  </span>
                </li>
              )
            })}
          </ul>
        )}

        <h2 className="mt-12 text-2xl font-extrabold">Giriş yapamıyorsanız</h2>
        <div className="mt-4 space-y-4 text-[17px] leading-relaxed text-muted">
          <p>
            Öğrenci ve veliler kullanıcı adıyla, öğretmenler e-posta adresiyle giriş yapar. Kullanıcı adında Türkçe karakter ve boşluk
            yoktur.
          </p>
          <p>
            Şifrenizi unuttuysanız{' '}
            <Link to="/giris" className={link}>
              giriş sayfasındaki
            </Link>{' '}
            "Şifremi unuttum" bağlantısından istek gönderin. Öğrenci ve velinin isteği öğretmene, öğretmenin isteği yöneticiye
            bildirim olarak düşer.
          </p>
          {CONTACT_EMAIL && (
            <p>
              Yanıt alamazsanız{' '}
              <a href={`mailto:${CONTACT_EMAIL}`} className={cn(link, 'break-all')}>
                {CONTACT_EMAIL}
              </a>{' '}
              adresine yazın. Kullanıcı adınızı ve sorunu yazmanız yeterli, şifrenizi yazmayın.
            </p>
          )}
        </div>
      </main>
    </div>
  )
}
