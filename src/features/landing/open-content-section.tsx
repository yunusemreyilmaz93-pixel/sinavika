import { ArrowRight, BookOpenText, Calculator, CalendarDays, GraduationCap, type LucideIcon } from 'lucide-react'
import { container, Reveal, SectionHeading } from './primitives'

export const openLinks: { href: string; title: string; text: string; icon: LucideIcon }[] = [
  { href: '/konu-anlatimi', title: 'Konu anlatımları', text: 'LGS, TYT ve YDT konularını üye olmadan okuyabilirsiniz.', icon: BookOpenText },
  { href: '/calisma-programlari', title: 'Çalışma programları', text: 'Hazır haftalık programları gün gün inceleyin.', icon: CalendarDays },
  { href: '/araclar/net-hesaplama', title: 'Net hesaplama', text: 'Doğru ve yanlış sayınızdan netinizi hesaplayın.', icon: Calculator },
  { href: '/yks-bolumleri', title: 'YKS bölümleri', text: 'Bölümlerin kontenjanını ve başarı sıralarını görün.', icon: GraduationCap },
]

export function OpenContentSection() {
  return (
    <section id="acik-icerik" className="scroll-mt-16 py-16 sm:py-24">
      <div className={container}>
        <SectionHeading
          center
          eyebrow="Üye olmadan"
          title={<>Giriş yapmadan <span className="marker">okuyabilirsiniz</span></>}
          lead="Anlatımlar, programlar ve araçlar herkese açıktır. İlerleme kaydı ve mini testler hesapla çalışır."
        />
        <Reveal className="mt-10 grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          {openLinks.map(({ href, title, text, icon: Icon }) => (
            <a
              key={href}
              href={href}
              className="group flex min-h-11 flex-col rounded-2xl border border-line bg-surface p-5 transition-colors hover:border-line-strong"
            >
              <Icon className="size-6 text-primary" aria-hidden />
              <span className="mt-3 font-display text-lg font-bold">{title}</span>
              <span className="mt-1 text-[15px] text-muted">{text}</span>
              <span className="mt-4 inline-flex items-center gap-1 text-sm font-semibold text-accent">
                Açın
                <ArrowRight className="size-4 transition-transform group-hover:translate-x-0.5 motion-reduce:transition-none" aria-hidden />
              </span>
            </a>
          ))}
        </Reveal>
      </div>
    </section>
  )
}
