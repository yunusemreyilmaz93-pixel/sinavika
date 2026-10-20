import { ArrowRight, KeyRound } from 'lucide-react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Logo } from '@/components/ui/logo'
import { cn } from '@/lib/cn'
import { StudentCapacity } from './live-settings'
import { container, isPlainClick, Reveal, sectionLinks, useSignedIn, type SectionLink } from './primitives'

export function ClosingCta() {
  const signedIn = useSignedIn()
  return (
    <section className="pb-20 sm:pb-28">
      <div className={container}>
        <Reveal>
          <div className="grid-paper relative overflow-hidden rounded-3xl bg-primary px-6 py-12 text-center text-primary-fg [--grid-line:color-mix(in_srgb,var(--primary-fg)_9%,transparent)] sm:px-12 sm:py-16">
            <h2 className="mx-auto max-w-2xl text-[1.85rem] leading-[1.12] font-extrabold sm:text-[2.5rem]">
              Programı sen hazırla, takibi birlikte yapın.
            </h2>
            <p className="mx-auto mt-4 max-w-xl text-[17px] leading-relaxed opacity-85">
              Başvurun onaylandıktan sonra en fazla <StudentCapacity /> öğrencin için davet kodu oluşturabilirsin. Öğrenci ve
              veliler de hiçbir ücret ödemez.
            </p>
            <div className="mt-8 flex flex-col justify-center gap-2.5 sm:flex-row">
              {signedIn ? (
                <Button asChild size="lg" variant="secondary" className="border-transparent">
                  <Link to="/app">
                    Panele git
                    <ArrowRight />
                  </Link>
                </Button>
              ) : (
                <Button asChild size="lg" variant="secondary" className="border-transparent">
                  <Link to="/ogretmen-basvurusu">
                    Öğretmen olarak başla
                    <ArrowRight />
                  </Link>
                </Button>
              )}
              <Button
                asChild
                size="lg"
                variant="ghost"
                className="text-primary-fg ring-1 ring-current/30 ring-inset hover:bg-primary-hover"
              >
                <Link to="/katil">
                  <KeyRound />
                  Davet kodum var
                </Link>
              </Button>
            </div>
          </div>
        </Reveal>
      </div>
    </section>
  )
}

export function SiteFooter({ onNavigate }: { onNavigate: (link: SectionLink) => void }) {
  const year = new Date().getFullYear()
  const linkClass = 'inline-flex min-h-11 items-center text-[15px] text-muted transition-colors hover:text-fg'

  return (
    <footer className="border-t border-line bg-surface">
      <div className={cn(container, 'grid grid-cols-2 gap-x-6 gap-y-10 py-12 lg:grid-cols-[1.4fr_1fr_1fr]')}>
        <div className="col-span-2 lg:col-span-1">
          <Logo />
          <p className="mt-4 max-w-xs text-[15px] leading-relaxed text-muted">
            LGS ve YKS'ye hazırlanan öğrenciler için koçluk uygulaması. Yolumnet ücretsiz ve reklamsızdır.
          </p>
        </div>
        <nav aria-label="Hesap">
          <p className="text-sm font-bold">Hesap</p>
          <ul className="mt-2">
            <li>
              <Link to="/giris" className={linkClass}>
                Giriş yap
              </Link>
            </li>
            <li>
              <Link to="/ogretmen-basvurusu" className={linkClass}>
                Öğretmen başvurusu
              </Link>
            </li>
            <li>
              <Link to="/katil" className={linkClass}>
                Davet koduyla katıl
              </Link>
            </li>
          </ul>
        </nav>
        <nav aria-label="Bilgi">
          <p className="text-sm font-bold">Bilgi</p>
          <ul className="mt-2">
            {sectionLinks
              .filter((l) => !l.role)
              .map((link) => (
                <li key={link.href}>
                  <a
                    href={link.href}
                    onClick={(e) => {
                      if (!isPlainClick(e)) return
                      e.preventDefault()
                      onNavigate(link)
                    }}
                    className={linkClass}
                  >
                    {link.label}
                  </a>
                </li>
              ))}
            <li>
              <Link to="/kvkk" className={linkClass}>
                KVKK aydınlatma metni
              </Link>
            </li>
          </ul>
        </nav>
      </div>
      <div className="border-t border-line">
        <div className={cn(container, 'flex flex-col gap-1 py-6 text-sm text-subtle sm:flex-row sm:justify-between')}>
          <p>&copy; {year} Yolumnet</p>
          <p>Gönüllü bir proje olarak geliştiriliyor.</p>
        </div>
      </div>
    </footer>
  )
}
