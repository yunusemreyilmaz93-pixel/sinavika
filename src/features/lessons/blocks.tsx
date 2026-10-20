import { motion } from 'motion/react'
import { ArrowRight, Check, ChevronDown, Lightbulb, Link2, X } from 'lucide-react'
import { useState, type ReactNode } from 'react'
import { cn } from '@/lib/cn'

export function Section({ id, number, title, children }: { id: string; number?: number; title: string; children: ReactNode }) {
  return (
    <section id={id} className="scroll-mt-24">
      <h2 className="flex items-baseline gap-3 text-xl font-extrabold sm:text-2xl">
        {number != null && <span className="font-display text-primary tabular">{number}.</span>}
        {title}
      </h2>
      <div className="mt-4 space-y-4 text-[16px] leading-relaxed text-fg/90 [&_strong]:font-semibold [&_strong]:text-fg">
        {children}
      </div>
    </section>
  )
}

export function Lead({ title, children }: { title: string; children: ReactNode }) {
  return (
    <p>
      <strong>{title}</strong> {children}
    </p>
  )
}

export function Connect({ children }: { children: ReactNode }) {
  return (
    <aside className="flex gap-3 rounded-2xl border border-accent/25 bg-accent-soft p-4 text-accent-soft-fg">
      <Link2 className="mt-0.5 size-5 shrink-0" aria-hidden />
      <p>
        <strong className="!text-accent-soft-fg">Bağlantıyı kur:</strong> {children}
      </p>
    </aside>
  )
}

export function Tip({ children }: { children: ReactNode }) {
  return (
    <aside className="flex gap-3 rounded-2xl border border-marker/60 bg-marker/25 p-4 text-fg">
      <Lightbulb className="mt-0.5 size-5 shrink-0 text-warning" aria-hidden />
      <p>{children}</p>
    </aside>
  )
}

export function DataTable({ head, rows, emphasizeFirst = true }: { head: string[]; rows: ReactNode[][]; emphasizeFirst?: boolean }) {
  return (
    <div className="overflow-hidden rounded-2xl border border-line">
      <table className="hidden w-full text-left text-[15px] sm:table">
        <thead className="bg-surface-2 text-sm text-muted">
          <tr>
            {head.map((h) => (
              <th key={h} scope="col" className="px-4 py-3 font-semibold">
                {h}
              </th>
            ))}
          </tr>
        </thead>
        <tbody className="divide-y divide-line bg-surface">
          {rows.map((row, i) => (
            <tr key={i} className="align-top">
              {row.map((cell, j) => (
                <td key={j} className={cn('px-4 py-3 leading-relaxed', j === 0 && emphasizeFirst && 'font-semibold text-fg')}>
                  {cell}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
      <dl className="divide-y divide-line bg-surface sm:hidden">
        {rows.map((row, i) => (
          <div key={i} className="px-4 py-3">
            <dt className="font-semibold text-fg">{row[0]}</dt>
            {row.slice(1).map((cell, j) => (
              <dd key={j} className="mt-1 text-[15px] leading-relaxed">
                {row.length > 2 && <span className="text-sm text-muted">{head[j + 1]}: </span>}
                {cell}
              </dd>
            ))}
          </div>
        ))}
      </dl>
    </div>
  )
}

export function CauseEffect({ items }: { items: { cause: string; effect: ReactNode }[] }) {
  return (
    <ol className="space-y-3" aria-label="Avrupa'daki gelişmeler ve Osmanlı'ya etkileri">
      {items.map((item, i) => (
        <motion.li
          key={item.cause}
          initial={{ opacity: 0, y: 8 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: '-40px' }}
          transition={{ duration: 0.3, delay: i * 0.06 }}
          className="grid items-stretch gap-2 sm:grid-cols-[minmax(0,13rem)_auto_1fr] sm:gap-3"
        >
          <div className="flex items-center rounded-xl bg-primary-soft px-4 py-3 font-semibold text-primary-soft-fg">{item.cause}</div>
          <div className="flex items-center justify-center text-subtle" aria-hidden>
            <ArrowRight className="size-5 rotate-90 sm:rotate-0" />
          </div>
          <div className="rounded-xl border border-line bg-surface px-4 py-3 text-[15px] leading-relaxed">{item.effect}</div>
        </motion.li>
      ))}
    </ol>
  )
}

export type ScaleEvent = { year: number; label: string; detail?: string; group?: string }

export function YearScale({ title, from, to, events }: { title: string; from: number; to: number; events: ScaleEvent[] }) {
  const span = to - from
  return (
    <figure className="rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <figcaption className="text-sm font-semibold text-muted">{title}</figcaption>
      <div className="relative mt-8 mb-14 h-1.5 rounded-full bg-surface-2" role="img" aria-label={events.map((e) => `${e.year} ${e.label}`).join(', ')}>
        <motion.div
          className="absolute inset-y-0 left-0 rounded-full bg-primary"
          initial={{ width: 0 }}
          whileInView={{ width: '100%' }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, ease: [0.22, 1, 0.36, 1] }}
        />
        {events.map((e, i) => {
          const left = ((e.year - from) / span) * 100
          return (
            <div key={e.year} className="absolute top-1/2" style={{ left: `${left}%` }}>
              <span className="absolute size-3.5 -translate-x-1/2 -translate-y-1/2 rounded-full border-2 border-surface bg-primary" />
              <span
                className={cn(
                  'absolute w-24 text-xs leading-tight sm:w-32 sm:text-sm',
                  i % 2 === 0 ? 'top-4' : 'bottom-4',
                  i === 0 ? 'left-0 text-left' : i === events.length - 1 ? 'right-0 text-right' : '-translate-x-1/2 text-center',
                )}
              >
                <span className="block font-display font-bold text-fg tabular">{e.year}</span>
                <span className="text-muted">{e.label}</span>
              </span>
            </div>
          )
        })}
      </div>
    </figure>
  )
}

const groupStyle: Record<string, { dot: string; band: string; text: string }> = {
  Çocukluk: { dot: 'bg-warning', band: 'bg-warning-soft', text: 'text-warning' },
  'Okul yılları': { dot: 'bg-accent', band: 'bg-accent-soft', text: 'text-accent-soft-fg' },
  'Görev ve cephe': { dot: 'bg-primary', band: 'bg-primary-soft', text: 'text-primary-soft-fg' },
}

export function LifeTimeline({
  from,
  to,
  eras,
  events,
}: {
  from: number
  to: number
  eras: { label: string; from: number; to: number }[]
  events: ScaleEvent[]
}) {
  const [active, setActive] = useState(events.length - 1)
  const span = to - from
  const pos = (year: number) => ((year - from) / span) * 100
  const current = events[active]

  return (
    <figure className="rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <figcaption className="font-display text-lg font-bold">Mustafa Kemal'in hayatı</figcaption>
        <span className="text-sm text-muted tabular">
          {from} ile {to} arası · {events.length} olay
        </span>
      </div>

      <div className="mt-4 flex flex-wrap gap-x-4 gap-y-1.5 text-sm">
        {eras.map((era) => (
          <span key={era.label} className="inline-flex items-center gap-1.5">
            <span className={cn('size-2.5 rounded-full', groupStyle[era.label]?.dot)} />
            {era.label}
            <span className="text-subtle tabular">({era.to - era.from} yıl)</span>
          </span>
        ))}
      </div>

      <div className="relative mt-5 hidden h-28 sm:block" role="group" aria-label="Zaman çizelgesi">
        <div className="absolute inset-x-0 top-10 flex h-3 overflow-hidden rounded-full">
          {eras.map((era) => (
            <div key={era.label} className={cn('h-full', groupStyle[era.label]?.band)} style={{ width: `${((era.to - era.from) / span) * 100}%` }} />
          ))}
        </div>
        {events.map((e, i) => (
          <button
            key={`${e.year}-${e.label}`}
            type="button"
            onClick={() => setActive(i)}
            aria-pressed={active === i}
            aria-label={`${e.year}, ${e.label}`}
            className="group absolute top-10 grid size-11 -translate-x-1/2 -translate-y-[0.95rem] place-items-center"
            style={{ left: `${pos(e.year)}%` }}
          >
            <span
              className={cn(
                'size-4 rounded-full border-2 border-surface transition-transform duration-200 group-hover:scale-125',
                groupStyle[e.group ?? '']?.dot,
                active === i && 'scale-150 ring-4 ring-fg/10',
              )}
            />
          </button>
        ))}
        {[from, 1893, 1905, to].map((y) => (
          <span key={y} className="absolute top-16 -translate-x-1/2 text-xs text-subtle tabular" style={{ left: `${pos(y)}%` }}>
            {y}
          </span>
        ))}
      </div>

      <motion.div
        key={active}
        initial={{ opacity: 0, y: 4 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.2 }}
        className="mt-2 hidden rounded-xl bg-surface-2 px-4 py-3 sm:block"
        aria-live="polite"
      >
        <p className="font-display text-xl font-bold tabular">{current.year}</p>
        <p className="font-semibold">{current.label}</p>
        {current.detail && <p className="mt-0.5 text-[15px] text-muted">{current.detail}</p>}
      </motion.div>

      <ol className="mt-5 space-y-0 sm:hidden">
        {events.map((e, i) => {
          const gap = i === 0 ? 0 : e.year - events[i - 1].year
          return (
            <li key={`${e.year}-${e.label}`} className="relative flex gap-3 pl-1" style={{ paddingTop: i === 0 ? 0 : Math.min(8 + gap * 4, 40) }}>
              <div className="flex flex-col items-center">
                <span className={cn('mt-1.5 size-3 shrink-0 rounded-full', groupStyle[e.group ?? '']?.dot)} />
              </div>
              <div className="min-w-0 pb-1">
                <p className="text-sm">
                  <span className="font-display font-bold tabular">{e.year}</span>{' '}
                  <span className={cn('text-xs font-semibold', groupStyle[e.group ?? '']?.text)}>{e.group}</span>
                </p>
                <p className="font-semibold leading-snug">{e.label}</p>
                {e.detail && <p className="text-sm text-muted">{e.detail}</p>}
              </div>
            </li>
          )
        })}
      </ol>
    </figure>
  )
}

export function TraitTable({ rows }: { rows: { event: string; traits: string[] }[] }) {
  return (
    <ul className="divide-y divide-line overflow-hidden rounded-2xl border border-line bg-surface">
      {rows.map((row) => (
        <li key={row.event} className="flex flex-col gap-2 px-4 py-3 sm:flex-row sm:items-center sm:justify-between sm:gap-4">
          <span className="font-semibold">{row.event}</span>
          <span className="flex flex-wrap gap-1.5 sm:justify-end">
            {row.traits.map((t) => (
              <span key={t} className="rounded-full bg-primary-soft px-2.5 py-1 text-sm font-semibold text-primary-soft-fg">
                {t}
              </span>
            ))}
          </span>
        </li>
      ))}
    </ul>
  )
}

export function Question({
  number,
  passage,
  stem,
  options,
  answer,
  solution,
}: {
  number: number
  passage: ReactNode
  stem: ReactNode
  options: string[]
  answer: number
  solution: ReactNode
}) {
  const [picked, setPicked] = useState<number | null>(null)
  const done = picked != null
  const letters = ['A', 'B', 'C', 'D', 'E']

  return (
    <article className="rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <p className="text-sm font-semibold text-muted">Örnek soru {number}</p>
      <blockquote className="mt-3 border-l-4 border-line-strong pl-4 text-[15px] leading-relaxed text-fg/90 italic">{passage}</blockquote>
      <p className="mt-4 font-medium">{stem}</p>
      <ul className="mt-3 space-y-2">
        {options.map((option, i) => {
          const correct = i === answer
          const chosen = picked === i
          return (
            <li key={option}>
              <button
                type="button"
                disabled={done}
                onClick={() => setPicked(i)}
                className={cn(
                  'flex min-h-12 w-full items-center gap-3 rounded-xl border px-3 py-2.5 text-left text-[15px] transition-colors',
                  !done && 'border-line hover:border-line-strong hover:bg-surface-2',
                  done && correct && 'border-success bg-primary-soft text-primary-soft-fg',
                  done && chosen && !correct && 'border-danger bg-danger-soft text-danger',
                  done && !correct && !chosen && 'border-line opacity-60',
                )}
              >
                <span className="grid size-7 shrink-0 place-items-center rounded-lg bg-surface-2 font-display text-sm font-bold">{letters[i]}</span>
                <span className="min-w-0 flex-1">{option}</span>
                {done && correct && <Check className="size-5 shrink-0" aria-label="Doğru cevap" />}
                {done && chosen && !correct && <X className="size-5 shrink-0" aria-label="Senin cevabın" />}
              </button>
            </li>
          )
        })}
      </ul>
      {done ? (
        <motion.div initial={{ opacity: 0, y: 6 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.25 }} className="mt-4 space-y-3">
          <p className={cn('font-semibold', picked === answer ? 'text-success' : 'text-danger')}>
            {picked === answer ? 'Doğru.' : `Cevap ${letters[answer]} olacaktı.`}
          </p>
          <div className="rounded-xl bg-surface-2 p-4 text-[15px] leading-relaxed">{solution}</div>
          <button type="button" onClick={() => setPicked(null)} className="text-sm font-semibold text-accent hover:underline">
            Tekrar dene
          </button>
        </motion.div>
      ) : (
        <p className="mt-3 text-sm text-muted">Bir seçeneğe dokununca çözüm açılır.</p>
      )}
    </article>
  )
}

export function SelfCheck({ items }: { items: { question: string; answer: string }[] }) {
  const [open, setOpen] = useState<Set<number>>(new Set())
  const toggle = (i: number) =>
    setOpen((prev) => {
      const next = new Set(prev)
      if (next.has(i)) next.delete(i)
      else next.add(i)
      return next
    })
  const all = open.size === items.length

  return (
    <div className="space-y-3">
      <ol className="space-y-2">
        {items.map((item, i) => (
          <li key={item.question} className="overflow-hidden rounded-2xl border border-line bg-surface">
            <button
              type="button"
              onClick={() => toggle(i)}
              aria-expanded={open.has(i)}
              className="flex min-h-12 w-full items-start gap-3 px-4 py-3 text-left"
            >
              <span className="font-display font-bold text-primary tabular">{i + 1}.</span>
              <span className="min-w-0 flex-1 font-medium leading-relaxed">{item.question}</span>
              <ChevronDown className={cn('mt-1 size-4 shrink-0 text-muted transition-transform', open.has(i) && 'rotate-180')} />
            </button>
            {open.has(i) && (
              <motion.p
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                className="border-t border-line bg-surface-2 px-4 py-3 pl-11 text-[15px] leading-relaxed"
              >
                {item.answer}
              </motion.p>
            )}
          </li>
        ))}
      </ol>
      <button
        type="button"
        onClick={() => setOpen(all ? new Set() : new Set(items.map((_, i) => i)))}
        className="text-sm font-semibold text-accent hover:underline"
      >
        {all ? 'Cevapları gizle' : 'Cevap anahtarının tamamını göster'}
      </button>
    </div>
  )
}
