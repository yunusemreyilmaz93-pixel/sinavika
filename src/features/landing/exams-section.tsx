import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { Card } from '@/components/ui/card'
import { subjectColor } from '@/lib/exam'
import { ExamCountdown } from './live-settings'
import { container, ease, Reveal, SectionHeading } from './primitives'

type Part = { name: string; count: number; color: string }

const lgs: Part[] = [
  { name: 'Türkçe', count: 20, color: 'coral' },
  { name: 'Matematik', count: 20, color: 'sea' },
  { name: 'Fen Bilimleri', count: 20, color: 'pine' },
  { name: 'İnkılap Tarihi', count: 10, color: 'amber' },
  { name: 'Din Kültürü', count: 10, color: 'teal' },
  { name: 'İngilizce', count: 10, color: 'violet' },
]

const tyt: Part[] = [
  { name: 'Türkçe', count: 40, color: 'coral' },
  { name: 'Temel Matematik', count: 40, color: 'sea' },
  { name: 'Fen Bilimleri', count: 20, color: 'pine' },
  { name: 'Sosyal Bilimler', count: 20, color: 'amber' },
]

export function ExamsSection() {
  return (
    <section id="sinavlar" className="scroll-mt-16 py-20 sm:py-28">
      <div className={container}>
        <SectionHeading
          eyebrow="Sınavlar"
          title="Sınavın gerçek düzeniyle"
          lead="Dersler, soru sayıları ve net hesabı LGS ve YKS'deki gibidir. Deneme sonucunu girerken soru sayısını aşamazsın, netin kendiliğinden hesaplanır."
        />

        <div className="mt-12 grid gap-4 md:grid-cols-2 md:gap-6">
          <Reveal className="h-full">
            <ExamCard
              name="LGS"
              who="8. sınıf"
              countdown={<ExamCountdown exam="LGS" />}
              rule={{ divisor: 3, text: '3 yanlış 1 doğruyu götürür.' }}
            >
              <PartsHeader title="Dersler" total={90} />
              <QuestionBar parts={lgs} />
              <PartsList parts={lgs} />
              <div className="mt-5 grid grid-cols-2 gap-2.5">
                <Session name="Sözel" detail="50 soru" note="Türkçe, inkılap tarihi, din kültürü, İngilizce" />
                <Session name="Sayısal" detail="40 soru" note="Matematik ve fen bilimleri" />
              </div>
            </ExamCard>
          </Reveal>

          <Reveal className="h-full" delay={0.08}>
            <ExamCard
              name="YKS"
              who="11, 12. sınıf ve mezun"
              countdown={<ExamCountdown exam="YKS" />}
              rule={{ divisor: 4, text: '4 yanlış 1 doğruyu götürür.' }}
            >
              <PartsHeader title="TYT" total={120} />
              <QuestionBar parts={tyt} />
              <PartsList parts={tyt} />
              <div className="mt-5 grid grid-cols-2 gap-2.5">
                <Session name="AYT" detail="Alanına göre 80 soru" note="Sayısal, eşit ağırlık, sözel" />
                <Session name="YDT" detail="80 soru" note="Yabancı dil alanı" />
              </div>
            </ExamCard>
          </Reveal>
        </div>
      </div>
    </section>
  )
}

function ExamCard({
  name,
  who,
  countdown,
  rule,
  children,
}: {
  name: string
  who: string
  countdown: ReactNode
  rule: { divisor: number; text: string }
  children: ReactNode
}) {
  return (
    <Card className="flex h-full flex-col p-5 sm:p-7">
      <div className="flex min-h-16 items-start justify-between gap-4">
        <div>
          <h3 className="text-[2.5rem] leading-none font-extrabold tracking-tight">{name}</h3>
          <p className="mt-2 text-[15px] font-semibold text-muted">{who}</p>
        </div>
        {countdown}
      </div>
      <div className="mt-7">{children}</div>
      <div className="mt-auto pt-6">
        <div className="flex flex-wrap items-baseline gap-x-3 gap-y-1 rounded-xl border border-dashed border-line-strong px-3.5 py-3">
          <span className="font-display text-[15px] font-bold whitespace-nowrap tabular">
            Net = D - Y/{rule.divisor}
          </span>
          <span className="text-sm text-muted">{rule.text}</span>
        </div>
      </div>
    </Card>
  )
}

function PartsHeader({ title, total }: { title: string; total: number }) {
  return (
    <div className="flex items-baseline justify-between gap-3">
      <p className="text-[15px] font-bold">{title}</p>
      <p className="text-sm font-semibold text-muted">
        <span className="tabular">{total}</span> soru
      </p>
    </div>
  )
}

function QuestionBar({ parts }: { parts: Part[] }) {
  return (
    <div className="mt-2.5 flex h-3 gap-0.5 overflow-hidden rounded-full" aria-hidden>
      {parts.map((p, i) => (
        <motion.span
          key={p.name}
          className="h-full origin-left first:rounded-l-full last:rounded-r-full"
          style={{ flexGrow: p.count, backgroundColor: subjectColor({ color: p.color }) }}
          initial={{ scaleX: 0 }}
          whileInView={{ scaleX: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.45, ease, delay: 0.15 + i * 0.07 }}
        />
      ))}
    </div>
  )
}

function PartsList({ parts }: { parts: Part[] }) {
  return (
    <ul className="mt-4 grid grid-cols-1 gap-x-6 gap-y-2 min-[400px]:grid-cols-2">
      {parts.map((p) => (
        <li key={p.name} className="flex items-center gap-2.5 text-[15px]">
          <span
            aria-hidden
            className="size-2.5 shrink-0 rounded-full"
            style={{ backgroundColor: subjectColor({ color: p.color }) }}
          />
          <span className="min-w-0 flex-1 truncate">{p.name}</span>
          <span className="font-semibold text-muted tabular">{p.count}</span>
        </li>
      ))}
    </ul>
  )
}

function Session({ name, detail, note }: { name: string; detail: string; note: string }) {
  return (
    <div className="rounded-xl bg-surface-2 p-3.5">
      <p className="font-display text-lg leading-none font-bold">{name}</p>
      <p className="mt-2 text-sm font-semibold">{detail}</p>
      <p className="mt-0.5 text-[13px] leading-snug text-muted">{note}</p>
    </div>
  )
}
