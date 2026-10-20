import { ArrowRight, RotateCw, WifiOff } from 'lucide-react'
import { useEffect, useSyncExternalStore } from 'react'
import { Outlet, ScrollRestoration, useNavigation, useRouteError } from 'react-router'
import { Button } from '@/components/ui/button'
import { LogoMark } from '@/components/ui/logo'
import { Spinner } from '@/components/ui/spinner'
import { SITE_HOST } from '@/lib/api'
import { reportError } from '@/lib/error-log'

export function RootLayout() {
  const navigation = useNavigation()
  return (
    <>
      {navigation.state === 'loading' && (
        <div className="fixed inset-x-0 top-0 z-[60] h-0.5 overflow-hidden bg-primary-soft" role="progressbar" aria-label="Sayfa yükleniyor">
          <div className="h-full w-1/3 animate-[nav-progress_1s_ease-in-out_infinite] bg-primary" />
        </div>
      )}
      <ScrollRestoration />
      <OfflineBanner />
      <MovedBanner />
      <Outlet />
    </>
  )
}

const OLD_HOSTS = ['sinavika-app.vercel.app']

function MovedBanner() {
  if (typeof window === 'undefined' || !OLD_HOSTS.includes(window.location.hostname)) return null
  const target = `https://${SITE_HOST}${window.location.pathname}${window.location.search}`
  return (
    <div role="status" className="pt-safe sticky top-0 z-[65] border-b border-accent/30 bg-accent-soft text-accent-soft-fg">
      <div className="mx-auto flex max-w-5xl flex-wrap items-center justify-center gap-x-3 gap-y-1 px-4 py-2 text-sm">
        <span className="font-semibold">Yolumnet'in adresi değişti.</span>
        <a href={target} className="inline-flex min-h-9 items-center gap-1 font-bold underline underline-offset-4">
          {SITE_HOST} adresine geç
          <ArrowRight className="size-4" />
        </a>
      </div>
    </div>
  )
}

function subscribeOnline(onChange: () => void) {
  window.addEventListener('online', onChange)
  window.addEventListener('offline', onChange)
  return () => {
    window.removeEventListener('online', onChange)
    window.removeEventListener('offline', onChange)
  }
}

function OfflineBanner() {
  const online = useSyncExternalStore(subscribeOnline, () => navigator.onLine, () => true)
  if (online) return null
  return (
    <div role="status" className="pt-safe fixed inset-x-0 top-0 z-[70] border-b border-warning/30 bg-warning-soft text-warning">
      <p className="mx-auto flex max-w-5xl items-center justify-center gap-2 px-4 py-2 text-sm font-semibold">
        <WifiOff className="size-4 shrink-0" />
        İnternet bağlantın yok. Bağlantı gelince kaldığın yerden devam edebilirsin.
      </p>
    </div>
  )
}

export function FullPageSpinner() {
  return (
    <div className="grid min-h-dvh place-items-center">
      <div className="flex flex-col items-center gap-4 text-muted">
        <LogoMark className="size-10" />
        <Spinner />
      </div>
    </div>
  )
}

export function RouteError() {
  const error = useRouteError() as Error | undefined
  const chunk = error && /dynamically imported module|Importing a module script failed|Failed to fetch/i.test(error.message)
  useEffect(() => {
    if (!chunk) reportError(error, 'route')
  }, [error, chunk])
  return (
    <div className="grid min-h-dvh place-items-center px-6">
      <div className="max-w-sm text-center">
        <LogoMark className="mx-auto size-10" />
        <h1 className="mt-5 text-2xl font-extrabold">{chunk ? 'Yeni sürüm hazır' : 'Bir şeyler ters gitti'}</h1>
        <p className="mt-2 text-muted">
          {chunk ? 'Yolumnet güncellendi. Sayfayı yenileyince devam edebilirsin.' : 'Bu hata bize otomatik olarak bildirildi. Sayfayı yenilemeyi dene. Sorun devam ederse öğretmenine haber ver.'}
        </p>
        <Button className="mt-6" onClick={() => window.location.reload()}>
          <RotateCw />
          Sayfayı yenile
        </Button>
      </div>
    </div>
  )
}
