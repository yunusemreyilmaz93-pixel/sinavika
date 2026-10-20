import { CircleCheck, Clock3, Link2, UserRoundCheck } from 'lucide-react'
import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { Card } from '@/components/ui/card'
import { container, ease, Reveal, SectionHeading } from './primitives'

const sampleCode = 'K7MP2XQ9'

export function HowItWorks() {
  return (
    <section id="nasil-calisir" className="scroll-mt-16 py-20 sm:py-28">
      <div className={container}>
        <SectionHeading
          eyebrow="Nasıl çalışır"
          title="Üç adımda başlarsınız"
          lead="Öğrenci ve veliler kendi başlarına kayıt olmaz, öğretmenin verdiği kodla katılır. Böylece hangi öğrencinin hangi öğretmene bağlı olduğu baştan bellidir."
        />
        <ol className="mt-12 grid gap-4 lg:grid-cols-3 lg:gap-6">
          <Step n={1} delay={0} title="Öğretmen başvurur" text="Kısa bir form doldurursun. Başvurun onaylanınca hesabın açılır.">
            <div className="space-y-2">
              <StatusRow icon={<Clock3 className="size-4 text-warning" />} text="Başvuru inceleniyor" muted />
              <StatusRow icon={<CircleCheck className="size-4 text-primary" />} text="Hesabın açıldı" />
            </div>
          </Step>
          <Step
            n={2}
            delay={0.08}
            title="Davet kodu verir"
            text="Her öğrencin için 8 karakterlik bir kod oluşturursun. Kod 14 gün geçerlidir."
          >
            <div className="flex justify-center gap-1" aria-label={`Örnek davet kodu ${sampleCode}`} role="img">
              {sampleCode.split('').map((ch, i) => (
                <motion.span
                  key={i}
                  aria-hidden
                  initial={{ opacity: 0, y: 6 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true }}
                  transition={{ duration: 0.25, ease, delay: 0.3 + i * 0.06 }}
                  className="grid h-9 w-7 place-items-center lg:w-6 xl:w-7 rounded-md border border-line-strong bg-surface font-display text-lg font-bold"
                >
                  {ch}
                </motion.span>
              ))}
            </div>
          </Step>
          <Step
            n={3}
            delay={0.16}
            title="Öğrenci katılır, velisini ekler"
            text="Öğrenci kodu girip kendi kullanıcı adını ve şifresini belirler. Ardından velisi için ayrı bir kod oluşturur."
          >
            <div className="space-y-2">
              <StatusRow icon={<UserRoundCheck className="size-4 text-primary" />} text="elif.kaya katıldı" />
              <StatusRow icon={<Link2 className="size-4 text-accent" />} text="Velisi bağlandı" />
            </div>
          </Step>
        </ol>
      </div>
    </section>
  )
}

function Step({
  n,
  title,
  text,
  delay,
  children,
}: {
  n: number
  title: string
  text: string
  delay: number
  children: ReactNode
}) {
  return (
    <li>
      <Reveal delay={delay} className="h-full">
        <Card className="flex h-full flex-col p-5 sm:p-6">
          <div className="flex items-center gap-3">
            <span className="grid size-9 shrink-0 place-items-center rounded-full bg-primary font-display text-base font-extrabold text-primary-fg">
              {n}
            </span>
            <h3 className="text-lg leading-snug font-bold">{title}</h3>
          </div>
          <p className="mt-3 text-[15px] leading-relaxed text-muted">{text}</p>
          <div className="mt-auto pt-5">
            <div className="grid-paper flex min-h-28 flex-col justify-center rounded-xl border border-line bg-bg px-3 py-4">
              {children}
            </div>
          </div>
        </Card>
      </Reveal>
    </li>
  )
}

function StatusRow({ icon, text, muted }: { icon: ReactNode; text: string; muted?: boolean }) {
  return (
    <div className="mx-auto flex w-full max-w-60 items-center gap-2 rounded-lg border border-line bg-surface px-3 py-2 text-sm font-semibold">
      {icon}
      <span className={muted ? 'text-muted' : undefined}>{text}</span>
    </div>
  )
}
