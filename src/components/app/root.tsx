import { RotateCw } from 'lucide-react'
import { Outlet, ScrollRestoration, useNavigation, useRouteError } from 'react-router'
import { Button } from '@/components/ui/button'
import { LogoMark } from '@/components/ui/logo'
import { Spinner } from '@/components/ui/spinner'

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
      <Outlet />
    </>
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
  return (
    <div className="grid min-h-dvh place-items-center px-6">
      <div className="max-w-sm text-center">
        <LogoMark className="mx-auto size-10" />
        <h1 className="mt-5 text-2xl font-extrabold">{chunk ? 'Yeni sürüm hazır' : 'Bir şeyler ters gitti'}</h1>
        <p className="mt-2 text-muted">
          {chunk ? 'Yolumnet güncellendi. Sayfayı yenileyince devam edebilirsin.' : 'Sayfayı yenilemeyi dene. Sorun devam ederse öğretmenine haber ver.'}
        </p>
        <Button className="mt-6" onClick={() => window.location.reload()}>
          <RotateCw />
          Sayfayı yenile
        </Button>
      </div>
    </div>
  )
}
