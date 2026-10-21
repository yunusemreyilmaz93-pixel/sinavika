import { Check, CornerRightDown, TrendingUp } from 'lucide-react'
import { animate, motion, useInView, useMotionValue, useReducedMotion, useTransform } from 'motion/react'
import { useEffect, useRef, useState } from 'react'
import { Badge } from '@/components/ui/badge'
import { Card } from '@/components/ui/card'
import { ProgressRing } from '@/components/ui/progress'
import { cn } from '@/lib/cn'
import { formatNet, subjectColor } from '@/lib/exam'

const GOAL = 120

const tasks = [
  { subject: 'Matematik', color: 'sea', title: 'Üslü İfadeler', meta: '40 soru', minutes: 45 },
  { subject: 'Türkçe', color: 'coral', title: 'Paragrafta Anlam', meta: '30 dk okuma', minutes: 30 },
  { subject: 'Fen Bilimleri', color: 'pine', title: 'Basınç konu tekrarı', meta: '25 dk', minutes: 25 },
  { subject: 'İngilizce', color: 'violet', title: 'Kelime tekrarı', meta: '20 dk', minutes: 20 },
]

export function HeroPreview() {
  const ref = useRef<HTMLDivElement>(null)
  const inView = useInView(ref, { amount: 0.35 })
  const seen = useInView(ref, { amount: 0.35, once: true })
  const reduce = Boolean(useReducedMotion())

  return (
    <figure className="relative mx-auto w-full max-w-[26rem] md:max-w-none lg:mr-0 lg:ml-auto lg:max-w-[26rem]">
      <figcaption className="mb-3 flex items-center gap-1.5 text-[13px] font-semibold text-muted">
        Örnek: öğrencinin Bugün ekranı
        <CornerRightDown aria-hidden className="mt-1.5 size-4" />
      </figcaption>
      <div ref={ref} aria-hidden className="relative md:grid md:grid-cols-[1.15fr_1fr] md:items-center md:gap-4 lg:block">
        <TodayCard play={inView && !reduce} still={reduce} />
        <TrendCard
          play={inView && !reduce}
          drawn={seen}
          still={reduce}
          className="relative z-10 mt-3 md:mt-0 lg:-mt-4 lg:mr-16 lg:-ml-8 lg:shadow-pop xl:-ml-16"
        />
      </div>
    </figure>
  )
}

function useTickLoop(total: number, play: boolean) {
  const [done, setDone] = useState(0)
  useEffect(() => {
    if (!play) return
    const wait = done === 0 ? 1200 : done < total ? 1300 : 3200
    const id = window.setTimeout(() => setDone((d) => (d >= total ? 0 : d + 1)), wait)
    return () => window.clearTimeout(id)
  }, [done, total, play])
  return done
}

function TodayCard({ play, still }: { play: boolean; still: boolean }) {
  const looped = useTickLoop(tasks.length, play)
  const done = still ? 2 : looped
  const minutes = tasks.slice(0, done).reduce((sum, t) => sum + t.minutes, 0)
  const complete = done === tasks.length

  return (
    <Card className="p-4 sm:p-5">
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-[13px] font-semibold text-muted">Elif · 8. sınıf</p>
          <h3 className="mt-0.5 text-2xl font-extrabold">Bugün</h3>
        </div>
        <Badge tone="marker" className="mt-1">
          Bu hafta 5 aktif gün
        </Badge>
      </div>

      <div className="mt-4 flex items-center gap-4 rounded-xl bg-surface-2 p-3">
        <ProgressRing value={minutes / GOAL} size={64} stroke={7}>
          {complete ? (
            <Check className="size-6 text-primary" strokeWidth={3} />
          ) : (
            <span className="font-display text-[13px] font-bold tabular">%{Math.round((minutes / GOAL) * 100)}</span>
          )}
        </ProgressRing>
        <div className="min-w-0">
          <p className="text-[13px] font-semibold text-muted">Günlük hedef</p>
          <p className="font-display text-xl font-bold tabular">
            <AnimatedNumber value={minutes} />
            <span className="text-sm font-semibold text-muted"> / {GOAL} dk</span>
          </p>
          <p className={cn('text-[13px]', complete ? 'font-semibold text-primary' : 'text-muted')}>
            {complete ? 'Bugünkü hedef tamam' : `${done} / ${tasks.length} görev bitti`}
          </p>
        </div>
      </div>

      <ul className="mt-3 space-y-1.5">
        {tasks.map((task, i) => (
          <TaskRow key={task.title} task={task} done={i < done} />
        ))}
      </ul>
    </Card>
  )
}

function TaskRow({ task, done }: { task: (typeof tasks)[number]; done: boolean }) {
  return (
    <li
      className={cn(
        'flex items-center gap-3 rounded-xl border px-3 py-2 transition-colors duration-300',
        done ? 'border-transparent bg-surface-2/70' : 'border-line bg-surface',
      )}
    >
      <TickBox done={done} />
      <div className="min-w-0 flex-1">
        <p
          className={cn(
            'truncate text-[15px] font-semibold transition-colors duration-300',
            done && 'text-muted line-through decoration-line-strong decoration-2',
          )}
        >
          {task.title}
        </p>
        <p className="flex items-center gap-1.5 text-[13px] text-muted">
          <span className="size-2 shrink-0 rounded-full" style={{ backgroundColor: subjectColor({ color: task.color }) }} />
          <span className="truncate">
            {task.subject} · {task.meta}
          </span>
        </p>
      </div>
    </li>
  )
}

function TickBox({ done }: { done: boolean }) {
  return (
    <motion.span
      animate={done ? { scale: [1, 1.16, 1] } : { scale: 1 }}
      transition={{ duration: 0.3 }}
      className={cn(
        'grid size-6 shrink-0 place-items-center rounded-lg border-2 transition-colors duration-200',
        done ? 'border-primary bg-primary' : 'border-line-strong bg-surface',
      )}
    >
      <svg viewBox="0 0 24 24" className="size-4">
        <motion.path
          d="M5 12.5l4.5 4.5L19 7.5"
          fill="none"
          stroke="var(--primary-fg)"
          strokeWidth={3}
          strokeLinecap="round"
          strokeLinejoin="round"
          initial={false}
          animate={{ pathLength: done ? 1 : 0, opacity: done ? 1 : 0 }}
          transition={{ duration: 0.25, ease: 'easeOut' }}
        />
      </svg>
    </motion.span>
  )
}

function AnimatedNumber({ value }: { value: number }) {
  const mv = useMotionValue(value)
  const rounded = useTransform(mv, (v) => Math.round(v))
  useEffect(() => {
    const controls = animate(mv, value, { duration: 0.6, ease: 'easeOut' })
    return () => controls.stop()
  }, [mv, value])
  return <motion.span>{rounded}</motion.span>
}

const nets = [52.33, 57, 55.67, 61.33, 64.67, 71]
const TARGET = 75
const W = 300
const H = 110
const PAD_X = 10
const PAD_TOP = 12
const PAD_BOTTOM = 10
const Y_MIN = 45
const Y_MAX = 80

const xAt = (i: number) => PAD_X + (i * (W - PAD_X * 2)) / (nets.length - 1)
const yAt = (v: number) => PAD_TOP + ((Y_MAX - v) / (Y_MAX - Y_MIN)) * (H - PAD_TOP - PAD_BOTTOM)
const points = nets.map((v, i) => [xAt(i), yAt(v)] as const)
const line = points.reduce((d, [x, y], i) => {
  if (i === 0) return `M${x},${y}`
  const [px, py] = points[i - 1]
  const mx = (px + x) / 2
  return `${d} C${mx},${py} ${mx},${y} ${x},${y}`
}, '')
const area = `${line} L${xAt(nets.length - 1)},${H - PAD_BOTTOM} L${xAt(0)},${H - PAD_BOTTOM} Z`
const last = points[points.length - 1]
const delta = nets[nets.length - 1] - nets[nets.length - 2]

function TrendCard({ play, drawn, still, className }: { play: boolean; drawn: boolean; still: boolean; className?: string }) {
  const show = drawn || still
  return (
    <Card className={cn('p-4', className)}>
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-[13px] font-semibold text-muted">Deneme netleri · LGS</p>
          <p className="mt-1 flex items-baseline gap-1.5">
            <span className="font-display text-3xl leading-none font-extrabold tabular">{formatNet(nets[nets.length - 1])}</span>
            <span className="text-sm font-semibold text-muted">/ 90</span>
          </p>
        </div>
        <Badge tone="primary">
          <TrendingUp />+{formatNet(delta)}
        </Badge>
      </div>

      <svg viewBox={`0 0 ${W} ${H}`} className="mt-3 w-full overflow-visible">
        {[50, 60, 70].map((v) => (
          <line key={v} x1={0} x2={W} y1={yAt(v)} y2={yAt(v)} stroke="var(--line)" strokeDasharray="3 5" />
        ))}
        <rect x={0} y={yAt(TARGET) - 3} width={W} height={6} rx={3} fill="var(--marker)" opacity={0.75} />
        <motion.path
          d={area}
          fill="var(--accent)"
          initial={still ? false : { opacity: 0 }}
          animate={show ? { opacity: 0.09 } : undefined}
          transition={{ duration: 0.6, delay: 1.1 }}
        />
        <motion.path
          d={line}
          fill="none"
          stroke="var(--accent)"
          strokeWidth={2.5}
          strokeLinecap="round"
          initial={still ? false : { pathLength: 0 }}
          animate={show ? { pathLength: 1 } : undefined}
          transition={{ duration: 1.2, ease: 'easeInOut', delay: 0.2 }}
        />
        {points.slice(0, -1).map(([x, y], i) => (
          <motion.circle
            key={i}
            cx={x}
            cy={y}
            r={3}
            fill="var(--surface)"
            stroke="var(--accent)"
            strokeWidth={2}
            initial={still ? false : { opacity: 0 }}
            animate={show ? { opacity: 1 } : undefined}
            transition={{ duration: 0.2, delay: 0.25 + i * 0.2 }}
          />
        ))}
        {!still && (
          <motion.circle
            cx={last[0]}
            cy={last[1]}
            fill="var(--accent)"
            initial={{ r: 4.5, opacity: 0 }}
            animate={play ? { r: [4.5, 12], opacity: [0.35, 0] } : { r: 4.5, opacity: 0 }}
            transition={play ? { duration: 1.6, repeat: Infinity, repeatDelay: 0.8, delay: 1.6, ease: 'easeOut' } : { duration: 0 }}
          />
        )}
        <motion.circle
          cx={last[0]}
          cy={last[1]}
          r={4.5}
          fill="var(--accent)"
          initial={still ? false : { opacity: 0 }}
          animate={show ? { opacity: 1 } : undefined}
          transition={{ duration: 0.2, delay: 1.3 }}
        />
      </svg>

      <div className="mt-2 flex items-center justify-between text-xs font-semibold text-muted">
        <span>Son 6 deneme</span>
        <span className="inline-flex items-center gap-1.5">
          <span className="h-1.5 w-3.5 rounded-full bg-marker" />
          Hedef {TARGET} net
        </span>
      </div>
    </Card>
  )
}
