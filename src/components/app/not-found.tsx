import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { LogoMark } from '@/components/ui/logo'

export function NotFound() {
  return (
    <div className="grid-paper grid min-h-dvh place-items-center px-6">
      <div className="max-w-sm text-center">
        <LogoMark className="mx-auto size-10" />
        <p className="mt-6 font-display text-6xl font-extrabold text-primary">404</p>
        <h1 className="mt-2 text-xl font-bold">Bu sayfa bulunamadı</h1>
        <p className="mt-2 text-muted">Adres yanlış yazılmış ya da sayfa kaldırılmış olabilir.</p>
        <div className="mt-6 flex flex-col justify-center gap-2 sm:flex-row">
          <Button asChild>
            <Link to="/app">Uygulamaya git</Link>
          </Button>
          <Button asChild variant="secondary">
            <Link to="/">Ana sayfa</Link>
          </Button>
        </div>
      </div>
    </div>
  )
}
