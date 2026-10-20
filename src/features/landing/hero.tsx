import { ArrowRight, KeyRound } from 'lucide-react'
import { motion, useReducedMotion } from 'motion/react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/cn'
import { HeroPreview } from './hero-preview'
import { container, useSignedIn } from './primitives'

export function Hero() {
  const signedIn = useSignedIn()
  const reduce = useReducedMotion()

  return (
    <section
      className={cn(
        container,
        'grid gap-12 pt-8 pb-8 sm:pt-14 sm:pb-12 lg:grid-cols-[1.08fr_1fr] lg:gap-8 lg:pt-16 lg:pb-20',
      )}
    >
      <div className="max-w-xl lg:pt-14">
        <p className="inline-flex items-center gap-2 rounded-full border border-line bg-surface px-3 py-1.5 text-[13px] font-semibold text-muted shadow-card">
          <span aria-hidden className="size-1.5 rounded-full bg-primary" />
          LGS ve YKS için ücretsiz koçluk
        </p>
        <h1 className="mt-5 text-[2rem] leading-[1.06] font-extrabold min-[400px]:text-[2.35rem] sm:text-[3.25rem] lg:text-[3.5rem] xl:text-[3.85rem]">
          <span className="block">Öğretmen planlar,</span>
          <span className="block">
            öğrenci{' '}
            <motion.span
              className="marker"
              initial={reduce ? false : { backgroundSize: '0% 100%' }}
              animate={{ backgroundSize: '100% 100%' }}
              transition={{ delay: 0.35, duration: 0.6, ease: [0.65, 0, 0.35, 1] }}
            >
              çalışır
            </motion.span>
            ,
          </span>
          <span className="block">veli takip eder.</span>
        </h1>
        <p className="mt-5 max-w-lg text-[17px] leading-relaxed text-muted sm:text-lg">
          LGS ve YKS'ye hazırlanan öğrenciler için ücretsiz koçluk uygulaması. Haftalık program, soru takibi ve deneme analizi
          tek yerde.
        </p>
        <div className="mt-8 flex flex-col gap-2.5 sm:flex-row">
          {signedIn ? (
            <Button asChild size="lg">
              <Link to="/app">
                Panele git
                <ArrowRight />
              </Link>
            </Button>
          ) : (
            <Button asChild size="lg">
              <Link to="/ogretmen-basvurusu">
                Öğretmen olarak başla
                <ArrowRight />
              </Link>
            </Button>
          )}
          <Button asChild size="lg" variant="secondary">
            <Link to="/katil">
              <KeyRound />
              Davet kodum var
            </Link>
          </Button>
        </div>
        <p className="mt-4 text-sm text-subtle">Öğrenci ve veliler, öğretmenlerinden aldıkları kodla katılır.</p>
      </div>

      <HeroPreview />
    </section>
  )
}
