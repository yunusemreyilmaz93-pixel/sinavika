import { ArrowRight, ChevronRight, Menu as MenuIcon, Moon, Sun, X } from 'lucide-react'
import { Dialog } from 'radix-ui'
import { useEffect, useRef, useState, useSyncExternalStore } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Logo } from '@/components/ui/logo'
import { cn } from '@/lib/cn'
import { useTheme } from '@/lib/theme'
import { container, isPlainClick, sectionLinks, useSignedIn, type SectionLink } from './primitives'

const darkQuery = '(prefers-color-scheme: dark)'

function subscribeSystemTheme(onChange: () => void) {
  const query = window.matchMedia(darkQuery)
  query.addEventListener('change', onChange)
  return () => query.removeEventListener('change', onChange)
}

function ThemeToggle({ className }: { className?: string }) {
  const [choice, setChoice] = useTheme()
  const systemDark = useSyncExternalStore(
    subscribeSystemTheme,
    () => window.matchMedia(darkQuery).matches,
    () => false,
  )
  const dark = choice === 'system' ? systemDark : choice === 'dark'
  return (
    <Button
      variant="ghost"
      size="icon"
      className={className}
      aria-label={dark ? 'Açık temaya geç' : 'Koyu temaya geç'}
      onClick={() => setChoice(dark ? 'light' : 'dark')}
    >
      {dark ? <Sun className="!size-5" /> : <Moon className="!size-5" />}
    </Button>
  )
}

export function SiteHeader({ onNavigate }: { onNavigate: (link: SectionLink) => void }) {
  const signedIn = useSignedIn()
  const [scrolled, setScrolled] = useState(() => typeof window !== 'undefined' && window.scrollY > 8)
  const [open, setOpen] = useState(false)
  const pending = useRef<SectionLink | null>(null)

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 8)
    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  useEffect(() => {
    const wide = window.matchMedia('(min-width: 1024px)')
    const onChange = () => wide.matches && setOpen(false)
    wide.addEventListener('change', onChange)
    return () => wide.removeEventListener('change', onChange)
  }, [])

  return (
    <header
      className={cn(
        'pt-safe sticky top-0 z-40 border-b transition-[background-color,border-color] duration-200',
        scrolled || open ? 'border-line bg-bg' : 'border-transparent',
      )}
    >
      <div className={cn(container, 'flex h-16 items-center gap-2')}>
        <Link to="/" aria-label="Yolumnet ana sayfa" className="-ml-1 shrink-0 rounded-lg p-1">
          <Logo />
        </Link>

        <nav aria-label="Bölümler" className="ml-6 hidden lg:block">
          <ul className="flex items-center gap-0.5">
            {sectionLinks.map((link) => (
              <li key={link.href}>
                <a
                  href={link.href}
                  onClick={(e) => {
                    if (!isPlainClick(e)) return
                    e.preventDefault()
                    onNavigate(link)
                  }}
                  className="inline-flex h-10 items-center rounded-lg px-3 text-[15px] font-semibold text-muted transition-colors hover:bg-surface-2 hover:text-fg"
                >
                  {link.label}
                </a>
              </li>
            ))}
          </ul>
        </nav>

        <div className="ml-auto flex items-center gap-1 sm:gap-2">
          <ThemeToggle />
          {signedIn ? (
            <Button asChild className="px-3 sm:px-4">
              <Link to="/app">
                Panele gidin
                <ArrowRight className="hidden min-[400px]:block" />
              </Link>
            </Button>
          ) : (
            <>
              <Button asChild variant="ghost" className="px-3 sm:px-4">
                <Link to="/giris">Giriş yap</Link>
              </Button>
              <Button asChild className="hidden sm:inline-flex">
                <Link to="/ogretmen-basvurusu">Öğretmen olarak başlayın</Link>
              </Button>
            </>
          )}

          <Dialog.Root open={open} onOpenChange={setOpen}>
            <Dialog.Trigger asChild>
              <Button variant="ghost" size="icon" className="-mr-2 lg:hidden" aria-label="Menüyü aç">
                <MenuIcon className="!size-6" />
              </Button>
            </Dialog.Trigger>
            <Dialog.Portal>
              <Dialog.Overlay className="fixed inset-0 z-50 bg-black/30 data-[state=closed]:animate-fade-out data-[state=open]:animate-fade-in" />
              <Dialog.Content
                aria-describedby={undefined}
                onCloseAutoFocus={(e) => {
                  const link = pending.current
                  if (!link) return
                  e.preventDefault()
                  pending.current = null
                  onNavigate(link)
                }}
                className="pt-safe fixed inset-x-0 top-0 z-50 max-h-dvh overflow-y-auto rounded-b-3xl border-b border-line bg-surface shadow-pop outline-none data-[state=closed]:animate-[landing-panel-out_160ms_ease-in] data-[state=open]:animate-[landing-panel-in_260ms_cubic-bezier(0.22,1,0.36,1)]"
              >
                <Dialog.Title className="sr-only">Menü</Dialog.Title>
                <div className={cn(container, 'flex h-16 items-center')}>
                  <Logo />
                  <ThemeToggle className="ml-auto" />
                  <Dialog.Close asChild>
                    <Button variant="ghost" size="icon" className="-mr-2" aria-label="Menüyü kapat">
                      <X className="!size-6" />
                    </Button>
                  </Dialog.Close>
                </div>
                <nav aria-label="Bölümler" className={container}>
                  <ul className="divide-y divide-line border-y border-line">
                    {sectionLinks.map((link) => (
                      <li key={link.href}>
                        <a
                          href={link.href}
                          onClick={(e) => {
                            if (!isPlainClick(e)) return
                            e.preventDefault()
                            pending.current = link
                            setOpen(false)
                          }}
                          className="flex h-13 items-center justify-between text-[17px] font-semibold"
                        >
                          {link.label}
                          <ChevronRight className="size-5 text-subtle" />
                        </a>
                      </li>
                    ))}
                  </ul>
                </nav>
                <div className={cn(container, 'grid gap-2 pt-5 pb-6')}>
                  {signedIn ? (
                    <Button asChild size="lg">
                      <Link to="/app">
                        Panele gidin
                        <ArrowRight />
                      </Link>
                    </Button>
                  ) : (
                    <>
                      <Button asChild size="lg">
                        <Link to="/ogretmen-basvurusu">Öğretmen olarak başlayın</Link>
                      </Button>
                      <div className="grid grid-cols-2 gap-2">
                        <Button asChild size="lg" variant="secondary" className="px-3">
                          <Link to="/giris">Giriş yap</Link>
                        </Button>
                        <Button asChild size="lg" variant="secondary" className="px-3">
                          <Link to="/katil">Davet kodum var</Link>
                        </Button>
                      </div>
                    </>
                  )}
                </div>
              </Dialog.Content>
            </Dialog.Portal>
          </Dialog.Root>
        </div>
      </div>
    </header>
  )
}
