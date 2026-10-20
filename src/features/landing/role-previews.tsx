import { Clock3, Eye, GripVertical, Pause, Square, TrendingDown, TrendingUp } from 'lucide-react'
import { motion, useInView, useReducedMotion } from 'motion/react'
import { useEffect, useRef, useState } from 'react'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { ProgressRing } from '@/components/ui/progress'
import { cn } from '@/lib/cn'
import { subjectColor } from '@/lib/exam'
import { StudentCapacity } from './live-settings'
import { ease } from './primitives'

function useLiveLoop(intervalMs: number) {
  const ref = useRef<HTMLDivElement>(null)
  const inView = useInView(ref, { amount: 0.3 })
  const reduce = useReducedMotion()
  const [tick, setTick] = useState(0)
  const play = inView && !reduce
  useEffect(() => {
    if (!play) return
    const id = window.setInterval(() => setTick((t) => t + 1), intervalMs)
    return () => window.clearInterval(id)
  }, [play, intervalMs])
  return { ref, tick }
}

const roster = [
  { name: 'Elif K.', label: 'LGS · 8. sınıf', minutes: '9 sa 40 dk', tasks: '12/14 görev' },
  { name: 'Mert A.', label: 'YKS · 12. sınıf', alert: { tone: 'warning', icon: Clock3, text: '4 gündür kayıt yok' } },
  { name: 'Zeynep T.', label: 'YKS · Mezun', alert: { tone: 'danger', icon: TrendingDown, text: 'Net 6 düştü' } },
  { name: 'Can Y.', label: 'LGS · 8. sınıf', minutes: '7 sa 15 dk', tasks: '9/10 görev' },
] as const

const plannerDays = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum']
const plannerChips: { day: number; label: string; color: string }[] = [
  { day: 0, label: 'Mat', color: 'sea' },
  { day: 1, label: 'Fen', color: 'pine' },
  { day: 1, label: 'Din', color: 'teal' },
  { day: 3, label: 'İng', color: 'violet' },
  { day: 4, label: 'Mat', color: 'sea' },
  { day: 4, label: 'Fen', color: 'pine' },
]

export function TeacherPreview() {
  const { ref, tick } = useLiveLoop(2600)
  const movingDay = tick % 2 === 0 ? 0 : 2

  return (
    <div ref={ref} className="space-y-3">
      <Card className="p-4">
        <div className="flex items-center justify-between gap-3">
          <div>
            <p className="font-display text-lg font-bold">Öğrencilerim</p>
            <p className="text-[13px] text-muted">Bu hafta</p>
          </div>
          <Badge className="tabular">
            4 / <StudentCapacity />
          </Badge>
        </div>
        <ul className="mt-2 divide-y divide-line">
          {roster.map((s) => (
            <li key={s.name} className="flex items-center gap-3 py-2.5">
              <Avatar name={s.name} className="size-9 text-xs" />
              <div className="min-w-0 flex-1">
                <p className="truncate text-[15px] font-semibold">{s.name}</p>
                <p className="truncate text-[13px] text-muted">{s.label}</p>
              </div>
              {'alert' in s ? (
                <Badge tone={s.alert.tone}>
                  <s.alert.icon />
                  {s.alert.text}
                </Badge>
              ) : (
                <div className="shrink-0 text-right">
                  <p className="text-sm font-semibold tabular">{s.minutes}</p>
                  <p className="text-xs text-muted tabular">{s.tasks}</p>
                </div>
              )}
            </li>
          ))}
        </ul>
      </Card>

      <Card className="p-4">
        <div className="flex items-center justify-between gap-3">
          <p className="font-display text-base font-bold">Haftalık program</p>
          <p className="text-xs font-semibold text-muted">Elif K.</p>
        </div>
        <div className="mt-3 grid grid-cols-5 gap-1">
          {plannerDays.map((day, d) => (
            <div key={day} className="min-w-0">
              <p className="pb-1.5 text-center text-[11px] font-bold text-muted">{day}</p>
              <div className="flex min-h-24 flex-col gap-1 rounded-lg bg-surface-2 p-1">
                {movingDay === d && (
                  <motion.div
                    layoutId="planner-moving"
                    transition={{ duration: 0.45, ease }}
                    className="flex items-center gap-0.5 truncate rounded-md border-l-[3px] bg-surface py-1 pr-1 pl-0.5 text-[11px] font-bold shadow-pop"
                    style={{ borderLeftColor: subjectColor({ color: 'amber' }) }}
                  >
                    <GripVertical className="size-3 shrink-0 text-subtle" />
                    <span className="truncate">İnk</span>
                  </motion.div>
                )}
                {plannerChips
                  .filter((c) => c.day === d)
                  .map((c) => (
                    <motion.div
                      layout="position"
                      transition={{ duration: 0.3, ease }}
                      key={c.label}
                      className="truncate rounded-md border-l-[3px] bg-surface px-1.5 py-1 text-[11px] font-semibold shadow-card"
                      style={{ borderLeftColor: subjectColor({ color: c.color }) }}
                    >
                      {c.label}
                    </motion.div>
                  ))}
              </div>
            </div>
          ))}
        </div>
      </Card>
    </div>
  )
}

const TIMER_START = 24 * 60 + 18
const TIMER_GOAL = 45 * 60

export function StudentPreview() {
  const { ref, tick } = useLiveLoop(1000)
  const elapsed = Math.min(TIMER_START + tick, TIMER_GOAL)
  const mm = String(Math.floor(elapsed / 60)).padStart(2, '0')
  const ss = String(elapsed % 60).padStart(2, '0')

  return (
    <div ref={ref} className="grid gap-3 sm:grid-cols-[1.1fr_1fr] lg:grid-cols-1 xl:grid-cols-[1.1fr_1fr]">
      <Card className="p-4 text-center sm:p-5">
        <p className="text-[13px] font-semibold text-muted">Odak sayacı</p>
        <div className="mt-3 flex justify-center">
          <ProgressRing value={elapsed / TIMER_GOAL} size={148} stroke={9}>
            <div>
              <p className="font-display text-[2rem] leading-none font-extrabold tabular">
                {mm}:{ss}
              </p>
              <p className="mt-1.5 text-xs font-semibold text-muted">hedef 45 dk</p>
            </div>
          </ProgressRing>
        </div>
        <p className="mt-3 font-bold">Matematik</p>
        <p className="text-sm text-muted">Üslü İfadeler</p>
        <div className="mt-4 grid grid-cols-2 gap-2">
          <Button variant="secondary" size="sm" tabIndex={-1}>
            <Pause />
            Duraklat
          </Button>
          <Button size="sm" tabIndex={-1}>
            <Square />
            Bitir
          </Button>
        </div>
      </Card>

      <Card className="flex flex-col p-4 sm:p-5">
        <div className="flex items-center justify-between gap-2">
          <p className="font-display text-base font-bold">Soru kaydı</p>
          <Badge tone="accent">Fen · LGS</Badge>
        </div>
        <div className="mt-3 grid grid-cols-3 gap-2">
          {[
            { label: 'Doğru', value: 15, tone: 'text-success' },
            { label: 'Yanlış', value: 3, tone: 'text-danger' },
            { label: 'Boş', value: 2, tone: 'text-muted' },
          ].map((x) => (
            <div key={x.label} className="rounded-xl border border-line bg-bg px-1 py-2.5 text-center">
              <p className="text-xs font-semibold text-muted">{x.label}</p>
              <p className={cn('mt-0.5 font-display text-2xl font-bold tabular', x.tone)}>{x.value}</p>
            </div>
          ))}
        </div>
        <div className="mt-3 flex items-center justify-between rounded-xl bg-primary-soft px-3.5 py-2.5 text-primary-soft-fg">
          <span className="text-sm font-semibold">Net</span>
          <span className="font-display text-xl font-extrabold tabular">14</span>
        </div>
        <p className="mt-auto pt-3 text-xs leading-snug text-muted">15 doğru, 3 yanlış. LGS'de 3 yanlış 1 doğruyu götürür.</p>
      </Card>
    </div>
  )
}

const week = [
  { day: 'Pzt', minutes: 95 },
  { day: 'Sal', minutes: 120 },
  { day: 'Çar', minutes: 80 },
  { day: 'Per', minutes: 135 },
  { day: 'Cum', minutes: 110 },
  { day: 'Cmt', minutes: 60 },
  { day: 'Paz', minutes: 80 },
]
const weekMax = Math.max(...week.map((d) => d.minutes))

export function ParentPreview() {
  return (
    <div className="space-y-3">
      <Card className="p-4 sm:p-5">
        <div className="flex items-start justify-between gap-3">
          <div>
            <p className="text-[13px] font-semibold text-muted">Elif · bu hafta</p>
            <p className="mt-1 font-display text-2xl font-extrabold tabular">11 sa 20 dk</p>
          </div>
          <Badge>
            <Eye />
            Sadece görüntüleme
          </Badge>
        </div>
        <div className="mt-4 grid h-32 grid-cols-7 gap-1.5">
          {week.map((d, i) => (
            <div key={d.day} className="flex min-w-0 flex-col items-center gap-1.5">
              <div className="relative w-full flex-1">
                <motion.div
                  className={cn('absolute inset-x-0 bottom-0 rounded-md', d.minutes === weekMax ? 'bg-primary' : 'bg-primary/45')}
                  initial={{ height: 0 }}
                  animate={{ height: `${(d.minutes / weekMax) * 100}%` }}
                  transition={{ duration: 0.45, ease, delay: 0.1 + i * 0.05 }}
                />
              </div>
              <span className="text-[11px] font-semibold text-muted">{d.day}</span>
            </div>
          ))}
        </div>
        <div className="mt-4 grid grid-cols-2 gap-2 border-t border-line pt-4">
          <div>
            <p className="text-xs font-semibold text-muted">Çözülen soru</p>
            <p className="font-display text-lg font-bold tabular">640</p>
          </div>
          <div>
            <p className="text-xs font-semibold text-muted">Son deneme</p>
            <p className="flex items-center gap-2">
              <span className="font-display text-lg font-bold tabular">71 net</span>
              <span className="inline-flex items-center gap-0.5 text-xs font-bold text-success">
                <TrendingUp className="size-3.5" />
                6,33
              </span>
            </p>
          </div>
        </div>
      </Card>

      <Card className="p-4">
        <div className="flex items-center gap-2.5">
          <Avatar name="Ayşe Demir" className="size-8 text-[11px]" />
          <div className="min-w-0">
            <p className="text-sm font-semibold">Ayşe Hoca</p>
            <p className="text-xs text-muted">Öğretmen · 18:40</p>
          </div>
        </div>
        <p className="mt-2.5 rounded-2xl rounded-tl-md bg-surface-2 px-3.5 py-2.5 text-[15px] leading-snug">
          Elif bu hafta paragraf sorularında çok iyiydi. Cumartesi bir LGS denemesi planladık.
        </p>
      </Card>
    </div>
  )
}
