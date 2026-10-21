import { motion } from 'motion/react'
import { ArrowRight, Check, ChevronDown, CirclePlay, ExternalLink, Lightbulb, Link2, X } from 'lucide-react'
import { useCallback, useState, type ReactNode } from 'react'
import { watchUrl } from '@/features/video/youtube'
import { cn } from '@/lib/cn'
import { useLessonProgress } from './progress'
import { TrackedPlayer } from './youtube-player'

export function Connect({ children }: { children: ReactNode }) {
  return (
    <aside className="flex gap-3 rounded-2xl border border-accent/25 bg-accent-soft p-4 text-accent-soft-fg">
      <Link2 className="mt-0.5 size-5 shrink-0" aria-hidden />
      <div className="min-w-0 space-y-2 [&_strong]:!text-accent-soft-fg">
        <p className="font-semibold">Bağlantıyı kur</p>
        {children}
      </div>
    </aside>
  )
}

export function Tip({ children, title }: { children: ReactNode; title?: string }) {
  return (
    <aside className="flex gap-3 rounded-2xl border border-marker/60 bg-marker/25 p-4 text-fg">
      <Lightbulb className="mt-0.5 size-5 shrink-0 text-warning" aria-hidden />
      <div className="min-w-0 space-y-2">
        {title && <p className="font-semibold">{title}</p>}
        {children}
      </div>
    </aside>
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

export type ScaleEvent = { year: number; label: string; detail?: string }

export function YearScale({ title, events }: { title: string; events: ScaleEvent[] }) {
  const from = Math.min(...events.map((e) => e.year))
  const to = Math.max(...events.map((e) => e.year))
  const span = Math.max(to - from, 1)
  return (
    <figure className="rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <figcaption className="text-sm font-semibold text-muted">{title}</figcaption>
      <div className="relative mt-16 mb-14 h-1.5 rounded-full bg-surface-2" role="img" aria-label={events.map((e) => `${e.year} ${e.label}`).join(', ')}>
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

const eraTones = [
  { dot: 'bg-warning', band: 'bg-warning-soft', text: 'text-warning' },
  { dot: 'bg-accent', band: 'bg-accent-soft', text: 'text-accent-soft-fg' },
  { dot: 'bg-primary', band: 'bg-primary-soft', text: 'text-primary-soft-fg' },
  { dot: 'bg-danger', band: 'bg-danger-soft', text: 'text-danger' },
]

export function LifeTimeline({
  title,
  eras,
  events,
}: {
  title: string
  eras: { label: string; from: number; to: number }[]
  events: ScaleEvent[]
}) {
  const [active, setActive] = useState(Math.max(events.length - 1, 0))
  const from = Math.min(...events.map((e) => e.year), ...eras.map((e) => e.from))
  const to = Math.max(...events.map((e) => e.year), ...eras.map((e) => e.to))
  const span = Math.max(to - from, 1)
  const pos = (year: number) => ((year - from) / span) * 100
  const eraIndex = (year: number) => {
    let found = 0
    eras.forEach((era, i) => {
      if (year >= era.from) found = i
    })
    return found
  }
  const toneOf = (year: number) => eraTones[eraIndex(year) % eraTones.length]
  const current = events[active]
  const ticks = [...new Set([from, ...eras.map((e) => e.from), to])]

  return (
    <figure className="rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <div className="flex flex-wrap items-baseline justify-between gap-2">
        <figcaption className="font-display text-lg font-bold">{title}</figcaption>
        <span className="text-sm text-muted tabular">
          {from} ile {to} arası · {events.length} olay
        </span>
      </div>

      {eras.length > 0 && (
        <div className="mt-4 flex flex-wrap gap-x-4 gap-y-1.5 text-sm">
          {eras.map((era, i) => (
            <span key={era.label} className="inline-flex items-center gap-1.5">
              <span className={cn('size-2.5 rounded-full', eraTones[i % eraTones.length].dot)} />
              {era.label}
              <span className="text-subtle tabular">({era.to - era.from} yıl)</span>
            </span>
          ))}
        </div>
      )}

      <div className="relative mt-5 hidden h-28 sm:block" role="group" aria-label="Zaman çizelgesi">
        <div className="absolute inset-x-0 top-10 flex h-3 overflow-hidden rounded-full bg-surface-2">
          {eras.map((era, i) => (
            <div key={era.label} className={cn('h-full', eraTones[i % eraTones.length].band)} style={{ width: `${((era.to - era.from) / span) * 100}%` }} />
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
                toneOf(e.year).dot,
                active === i && 'scale-150 ring-4 ring-fg/10',
              )}
            />
          </button>
        ))}
        {ticks.map((y) => (
          <span key={y} className="absolute top-16 -translate-x-1/2 text-xs text-subtle tabular" style={{ left: `${pos(y)}%` }}>
            {y}
          </span>
        ))}
      </div>

      {current && (
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
      )}

      <ol className="mt-5 space-y-3 sm:hidden">
        {events.map((e) => (
          <li key={`${e.year}-${e.label}`} className="flex gap-3 pl-1">
            <span className={cn('mt-1.5 size-3 shrink-0 rounded-full', toneOf(e.year).dot)} />
            <div className="min-w-0">
              <p className="text-sm">
                <span className="font-display font-bold tabular">{e.year}</span>{' '}
                {eras.length > 0 && <span className={cn('text-xs font-semibold', toneOf(e.year).text)}>{eras[eraIndex(e.year)]?.label}</span>}
              </p>
              <p className="font-semibold leading-snug">{e.label}</p>
              {e.detail && <p className="text-sm text-muted">{e.detail}</p>}
            </div>
          </li>
        ))}
      </ol>
    </figure>
  )
}

export function Question({
  number,
  passage,
  stem,
  options,
  answer,
  solution,
  onAnswer,
  onWrong,
}: {
  number: number
  passage?: ReactNode
  stem: ReactNode
  options: ReactNode[]
  answer: number
  solution: ReactNode
  onAnswer?: (correct: boolean) => void
  onWrong?: ReactNode
}) {
  const [picked, setPicked] = useState<number | null>(null)
  const done = picked != null
  const letters = ['A', 'B', 'C', 'D', 'E']

  return (
    <article className="rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <p className="text-sm font-semibold text-muted">Örnek soru {number}</p>
      {passage && (
        <blockquote className="mt-3 border-l-4 border-line-strong pl-4 text-[15px] leading-relaxed text-fg/90 italic">{passage}</blockquote>
      )}
      <p className={cn('font-medium', passage ? 'mt-4' : 'mt-3')}>{stem}</p>
      <ul className="mt-3 space-y-2">
        {options.map((option, i) => {
          const correct = i === answer
          const chosen = picked === i
          return (
            <li key={i}>
              <button
                type="button"
                disabled={done}
                onClick={() => {
                  setPicked(i)
                  onAnswer?.(i === answer)
                }}
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
                {done && chosen && !correct && <X className="size-5 shrink-0" aria-label="Seçilen cevap" />}
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
          {picked !== answer && onWrong}
          <button type="button" onClick={() => setPicked(null)} className="text-sm font-semibold text-accent hover:underline">
            Tekrar deneyin
          </button>
        </motion.div>
      ) : (
        <p className="mt-3 text-sm text-muted">Bir seçeneğe dokununca çözüm açılır.</p>
      )}
    </article>
  )
}

export function SelfCheck({ items }: { items: { question: ReactNode; answer: ReactNode }[] }) {
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
          <li key={i} className="overflow-hidden rounded-2xl border border-line bg-surface">
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
              <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                className="border-t border-line bg-surface-2 px-4 py-3 pl-11 text-[15px] leading-relaxed"
              >
                {item.answer}
              </motion.div>
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

export function Figure({ src, alt, caption, credit }: { src: string; alt: string; caption: ReactNode; credit?: string }) {
  return (
    <figure className="overflow-hidden rounded-2xl border border-line bg-surface">
      <div className="grid place-items-center bg-surface-2">
        <img src={src} alt={alt} loading="lazy" decoding="async" className="max-h-[30rem] w-auto max-w-full object-contain" />
      </div>
      {(caption || credit) && (
        <figcaption className="px-4 py-3 text-sm leading-snug">
          {caption && <span className="text-fg">{caption}</span>}
          {credit && <span className="mt-1 block text-xs text-subtle">{credit}</span>}
        </figcaption>
      )}
    </figure>
  )
}

export function Video({ id, title, channel, label = 'Video' }: { id: string; title: string; channel: string; label?: string }) {
  const [playing, setPlaying] = useState(false)
  const [plain, setPlain] = useState(false)
  const tracked = useLessonProgress() !== null && !plain
  const fallback = useCallback(() => setPlain(true), [])
  return (
    <figure className="overflow-hidden rounded-2xl border border-line bg-surface">
      <div className="relative aspect-video bg-black">
        {playing && tracked ? (
          <TrackedPlayer id={id} onFallback={fallback} />
        ) : playing ? (
          <iframe
            src={`https://www.youtube-nocookie.com/embed/${id}?autoplay=1&rel=0`}
            title={title}
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
            allowFullScreen
            className="absolute inset-0 size-full"
          />
        ) : (
          <button type="button" onClick={() => setPlaying(true)} className="group absolute inset-0" aria-label={`${title} videosunu oynat`}>
            <img src={`https://i.ytimg.com/vi/${id}/hqdefault.jpg`} alt="" loading="lazy" className="size-full object-cover opacity-90 transition-opacity group-hover:opacity-100" />
            <span className="absolute inset-0 grid place-items-center">
              <span className="grid size-16 place-items-center rounded-full bg-black/60 text-white transition-transform group-hover:scale-110">
                <CirclePlay className="size-9" />
              </span>
            </span>
          </button>
        )}
      </div>
      <figcaption className="flex items-start justify-between gap-3 px-4 py-3">
        <span className="min-w-0 text-sm leading-snug">
          <span className="text-xs font-semibold text-muted">{label}</span>
          <span className="block font-semibold text-fg">{title}</span>
          <span className="block text-xs text-subtle">{channel}</span>
        </span>
        <a
          href={watchUrl(id)}
          target="_blank"
          rel="noreferrer"
          className="grid size-10 shrink-0 place-items-center rounded-lg text-muted hover:bg-surface-2"
          aria-label="YouTube'da aç"
        >
          <ExternalLink className="size-4" />
        </a>
      </figcaption>
    </figure>
  )
}

export function Hit({ children }: { children: ReactNode }) {
  return <strong className="underline decoration-primary decoration-2 underline-offset-4">{children}</strong>
}

export function Ek({ children }: { children: ReactNode }) {
  return <span className="rounded-md bg-accent-soft px-1.5 py-0.5 text-[0.92em] font-semibold whitespace-nowrap text-accent-soft-fg">{children}</span>
}

export function Formula({ items }: { items: { root: string; suffix: string; result: string; kind: string; tone: 'primary' | 'accent' | 'warning' }[] }) {
  const tones = {
    primary: 'bg-primary-soft text-primary-soft-fg',
    accent: 'bg-accent-soft text-accent-soft-fg',
    warning: 'bg-warning-soft text-warning',
  }
  return (
    <ul className="grid gap-3 sm:grid-cols-3">
      {items.map((item, i) => (
        <motion.li
          key={item.result}
          initial={{ opacity: 0, y: 8 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: '-40px' }}
          transition={{ duration: 0.3, delay: i * 0.08 }}
          className="rounded-2xl border border-line bg-surface p-4"
        >
          <p className="flex flex-wrap items-center gap-1.5 font-display text-lg font-bold">
            <span>{item.root}</span>
            <span className="text-subtle">+</span>
            <span className="rounded-md bg-surface-2 px-1.5 text-accent">{item.suffix}</span>
            <span className="text-subtle">=</span>
            <span>{item.result}</span>
          </p>
          <p className={cn('mt-3 inline-flex rounded-full px-2.5 py-1 text-sm font-semibold', tones[item.tone])}>{item.kind}</p>
        </motion.li>
      ))}
    </ul>
  )
}

export type LabWord = { text: string; kind?: 'isim' | 'sifat' | 'zarf' | 'yuklem'; note?: string }

const labKinds = {
  isim: { label: 'İsim-fiil', chip: 'bg-primary-soft text-primary-soft-fg border-primary/30' },
  sifat: { label: 'Sıfat-fiil', chip: 'bg-accent-soft text-accent-soft-fg border-accent/30' },
  zarf: { label: 'Zarf-fiil', chip: 'bg-warning-soft text-warning border-warning/30' },
  yuklem: { label: 'Yüklem', chip: 'bg-surface-2 text-fg border-line-strong' },
}

export function SentenceLab({ sentences }: { sentences: LabWord[][] }) {
  const [picked, setPicked] = useState<{ s: number; w: number } | null>(null)
  const word = picked ? sentences[picked.s][picked.w] : null
  return (
    <div className="space-y-3 rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <p className="text-sm text-muted">Renkli sözcüklere dokununca türü ve cümledeki görevi görünür.</p>
      <ul className="space-y-3">
        {sentences.map((sentence, s) => (
          <li key={s} className="flex flex-wrap gap-x-1.5 gap-y-1 text-[17px] leading-relaxed">
            {sentence.map((w, i) => {
              const kind = w.kind ? labKinds[w.kind] : null
              const active = picked?.s === s && picked.w === i
              return kind ? (
                <button
                  key={i}
                  type="button"
                  onClick={() => setPicked(active ? null : { s, w: i })}
                  aria-pressed={active}
                  className={cn(
                    'min-h-11 rounded-lg border px-2 font-semibold transition-[transform,box-shadow] active:scale-95',
                    kind.chip,
                    active && 'ring-2 ring-fg/20',
                  )}
                >
                  {w.text}
                </button>
              ) : (
                <span key={i} className="inline-flex min-h-11 items-center">
                  {w.text}
                </span>
              )
            })}
          </li>
        ))}
      </ul>
      <div className="flex flex-wrap gap-2 text-xs font-semibold">
        {(Object.keys(labKinds) as (keyof typeof labKinds)[]).map((k) => (
          <span key={k} className={cn('rounded-full border px-2.5 py-1', labKinds[k].chip)}>
            {labKinds[k].label}
          </span>
        ))}
      </div>
      <div className="min-h-16 rounded-xl bg-surface-2 px-4 py-3 text-[15px] leading-relaxed" aria-live="polite">
        {word?.kind ? (
          <motion.p key={`${picked?.s}-${picked?.w}`} initial={{ opacity: 0, y: 3 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.18 }}>
            <strong>{word.text}:</strong> {labKinds[word.kind].label}. {word.note}
          </motion.p>
        ) : (
          <span className="text-muted">Bir sözcük seçilmedi.</span>
        )}
      </div>
    </div>
  )
}
