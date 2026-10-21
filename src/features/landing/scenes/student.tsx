import { motion, useReducedMotion } from 'motion/react'
import { Check, Pause, Square, X } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { ProgressRing } from '@/components/ui/progress'
import { cn } from '@/lib/cn'
import { ease } from '../primitives'
import { Panel, Pop, useSteps } from './kit'

export function TodayTasks() {
  const step = useSteps([800, 1500, 2200])
  const tasks = ['Çarpanlar ve Katlar 20 soru', 'Fen video: Basınç', 'Paragraf 15 soru', 'İnkılap tekrar']
  return (
    <Panel title="Bugün" aside={<ProgressRing value={step / 4} size={34} stroke={4} />}>
      <ul className="space-y-1.5">
        {tasks.map((t, i) => {
          const done = i < step
          return (
            <li key={t} className="flex items-center gap-3 rounded-xl bg-surface-2 px-3 py-2.5">
              <span className={cn('grid size-5 shrink-0 place-items-center rounded-md border', done ? 'border-primary bg-primary text-primary-fg' : 'border-line-strong bg-surface')}>
                {done && <Check className="size-3.5" />}
              </span>
              <span className={cn('text-[15px] transition-colors', done && 'text-muted line-through')}>{t}</span>
            </li>
          )
        })}
      </ul>
    </Panel>
  )
}

export function TimerAndLog() {
  const step = useSteps([1500, 2300])
  return (
    <Panel title={step < 1 ? 'Odak sayacı' : 'Soru kaydı'}>
      {step < 1 ? (
        <Pop>
          <p className="text-xs font-semibold text-muted">Matematik · Çarpanlar ve Katlar</p>
          <p className="tabular my-2 font-display text-5xl font-extrabold">
            <Counter />
          </p>
          <div className="flex gap-2">
            <span className="inline-flex h-10 items-center gap-1.5 rounded-xl bg-surface-2 px-4 text-sm font-semibold"><Pause className="size-4" />Duraklat</span>
            <span className="inline-flex h-10 items-center gap-1.5 rounded-xl bg-primary px-4 text-sm font-semibold text-primary-fg"><Square className="size-4" />Bitir</span>
          </div>
        </Pop>
      ) : (
        <Pop>
          <div className="grid grid-cols-3 gap-2 text-center">
            {[['Doğru', '20'], ['Yanlış', '3'], ['Boş', '2']].map(([label, value]) => (
              <div key={label} className="rounded-xl bg-surface-2 py-3">
                <p className="tabular font-display text-2xl font-extrabold">{value}</p>
                <p className="text-xs font-semibold text-muted">{label}</p>
              </div>
            ))}
          </div>
          {step >= 2 && (
            <Pop>
              <p className="mt-3 text-sm text-muted">
                Net <span className="tabular font-bold text-fg">19</span> hesaplandı ve çalışma süresiyle kaydedildi.
              </p>
            </Pop>
          )}
        </Pop>
      )}
    </Panel>
  )
}

function Counter() {
  const reduce = useReducedMotion()
  return (
    <motion.span
      initial={reduce ? false : { opacity: 0.6 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.4 }}
    >
      00:24:10
    </motion.span>
  )
}

export function LessonQuiz() {
  const step = useSteps([1100, 1800])
  const options = ['12', '24', '36', '72']
  return (
    <Panel title="Konu anlatımı" aside={<Badge>Çarpanlar ve Katlar</Badge>}>
      <p className="text-[15px] font-medium">48 ve 72 sayılarının EBOB'u kaçtır?</p>
      <ul className="mt-2 space-y-1.5">
        {options.map((o, i) => {
          const picked = step >= 1 && i === 3
          const right = step >= 1 && i === 1
          return (
            <li key={o} className={cn('flex items-center gap-3 rounded-xl border px-3 py-2 text-[15px] transition-colors', picked ? 'border-danger bg-danger-soft text-danger' : right ? 'border-primary bg-primary-soft text-primary-soft-fg' : 'border-line')}>
              <span className="grid size-6 place-items-center rounded-full bg-surface text-xs font-bold">{'ABCD'[i]}</span>
              {o}
              {picked && <X className="ml-auto size-4" />}
              {right && <Check className="ml-auto size-4" />}
            </li>
          )
        })}
      </ul>
      {step >= 2 && (
        <Pop>
          <div className="mt-3 flex items-center justify-between gap-2 rounded-xl bg-surface-2 px-3 py-2 text-sm">
            <span className="text-muted">Doğru cevap 24</span>
            <Badge tone="accent">Yanlış defterine eklendi</Badge>
          </div>
        </Pop>
      )}
    </Panel>
  )
}

const dots = Array.from({ length: 16 }, (_, i) => ({ x: 10 + ((i * 37) % 80), y: 12 + ((i * 53) % 70), dx: ((i % 5) - 2) * 9, dy: ((i % 3) - 1) * 12, d: 0.9 + (i % 4) * 0.25 }))

export function Simulation() {
  const step = useSteps([1200])
  const reduce = useReducedMotion()
  return (
    <Panel title="Gaz parçacıkları" aside={<Badge tone="accent">Önce tahmin et</Badge>}>
      <div className="relative h-32 overflow-hidden rounded-xl border border-line bg-surface-2">
        {dots.map((d, i) => (
          <motion.span
            key={i}
            className="absolute size-2 rounded-full bg-primary"
            style={{ left: `${d.x}%`, top: `${d.y}%` }}
            animate={reduce ? undefined : { x: [0, d.dx * (step ? 2 : 1), 0], y: [0, d.dy * (step ? 2 : 1), 0] }}
            transition={{ duration: step ? d.d * 0.5 : d.d, repeat: Infinity, ease: 'easeInOut' }}
          />
        ))}
      </div>
      <div className="mt-3 space-y-2 text-sm">
        <div className="flex items-center gap-3">
          <span className="w-16 font-semibold">Sıcaklık</span>
          <div className="relative h-1.5 flex-1 rounded-full bg-surface-2">
            <motion.span className="absolute top-1/2 size-4 -translate-y-1/2 rounded-full bg-primary shadow-card" initial={false} animate={{ left: step ? '82%' : '28%' }} transition={{ duration: 0.8, ease }} />
          </div>
          <span className="tabular w-14 text-right font-semibold">{step ? '480 K' : '300 K'}</span>
        </div>
        <p className="flex items-center justify-between rounded-lg bg-surface-2 px-3 py-2">
          <span className="text-muted">Ölçülen bağıl basınç</span>
          <span className="tabular font-display text-lg font-extrabold text-primary">{step ? '1,60' : '1,00'}</span>
        </p>
      </div>
    </Panel>
  )
}

export function WrongReview() {
  const step = useSteps([1000, 1800, 2600])
  const boxes = ['1 gün', '3 gün', '7 gün', '14 gün', '30 gün']
  return (
    <Panel title="Yanlış defteri">
      <p className="text-[15px] font-medium">EBOB EKOK problemi</p>
      <div className="mt-2 flex gap-2 text-sm font-semibold">
        <span className="rounded-lg bg-surface-2 px-3 py-2">Yapamadım</span>
        <span className={cn('rounded-lg px-3 py-2 transition-colors', step >= 1 ? 'bg-primary text-primary-fg' : 'bg-surface-2')}>Yaptım</span>
        <span className="rounded-lg bg-surface-2 px-3 py-2">Artık biliyorum</span>
      </div>
      <p className="mt-4 text-xs font-semibold text-muted">Sonraki tekrar</p>
      <div className="mt-1.5 flex gap-1">
        {boxes.map((b, i) => (
          <span key={b} className={cn('flex-1 rounded-lg py-2 text-center text-xs font-semibold transition-colors', i <= Math.min(step, 4) - 0 && step >= 1 && i < step + 1 ? 'bg-primary-soft text-primary-soft-fg' : 'bg-surface-2 text-muted')}>
            {b}
          </span>
        ))}
      </div>
    </Panel>
  )
}

export function ExamNets() {
  const reduce = useReducedMotion()
  const points = [14, 17, 16, 21]
  const path = points.map((p, i) => `${i === 0 ? 'M' : 'L'}${20 + i * 80},${100 - p * 3.6}`).join(' ')
  return (
    <Panel title="Deneme netleri" aside={<Badge tone="primary">+5 net</Badge>}>
      <svg viewBox="0 0 280 110" className="h-28 w-full" role="img" aria-label="Deneme netleri artıyor">
        <motion.path d={path} fill="none" stroke="var(--primary)" strokeWidth={3} strokeLinecap="round" strokeLinejoin="round" initial={reduce ? false : { pathLength: 0 }} animate={{ pathLength: 1 }} transition={{ duration: 1.4, ease }} />
        {points.map((p, i) => (
          <motion.circle key={i} cx={20 + i * 80} cy={100 - p * 3.6} r={4.5} fill="var(--surface)" stroke="var(--primary)" strokeWidth={2.5} initial={reduce ? false : { opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.3 + i * 0.35 }} />
        ))}
      </svg>
      <div className="mt-1 flex justify-between text-xs font-semibold text-muted">
        {['Eylül', 'Ekim', 'Kasım', 'Aralık'].map((m) => <span key={m}>{m}</span>)}
      </div>
    </Panel>
  )
}

const levels = [
  { label: 'Hakim', color: 'bg-primary', w: 14 },
  { label: 'Pekişiyor', color: 'bg-primary/55', w: 30 },
  { label: 'Öğreniyor', color: 'bg-accent', w: 22 },
  { label: 'Tekrar lazım', color: 'bg-warning', w: 14 },
  { label: 'Başlanmadı', color: 'bg-line-strong', w: 20 },
]

export function TopicMap() {
  const reduce = useReducedMotion()
  return (
    <Panel title="Hakimiyet haritası">
      <div className="flex h-3 overflow-hidden rounded-full bg-surface-2">
        {levels.map((l, i) => (
          <motion.span key={l.label} className={l.color} initial={reduce ? false : { width: 0 }} animate={{ width: `${l.w}%` }} transition={{ duration: 0.5, ease, delay: i * 0.15 }} />
        ))}
      </div>
      <p className="mt-4 text-sm font-semibold">Öncelikli konular</p>
      <ul className="mt-1.5 space-y-1.5">
        {['Üslü İfadeler', 'Kareköklü İfadeler', 'Olasılık'].map((t, i) => (
          <Pop key={t} delay={0.9 + i * 0.25} y={6}>
            <li className="flex items-center justify-between rounded-xl bg-surface-2 px-3 py-2 text-[15px]">
              {t}
              <Badge tone="warning">Tekrar lazım</Badge>
            </li>
          </Pop>
        ))}
      </ul>
    </Panel>
  )
}
