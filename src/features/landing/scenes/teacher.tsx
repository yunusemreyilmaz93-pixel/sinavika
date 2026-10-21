import { motion, useReducedMotion } from 'motion/react'
import { Bell, CalendarCheck, Check, Clock3, GripVertical, Lock, Send, TrendingDown } from 'lucide-react'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/cn'
import { subjectColor } from '@/lib/exam'
import { StudentCapacity } from '../live-settings'
import { ease } from '../primitives'
import { Bubble, Panel, Pop, Typing, useSteps } from './kit'

const roster = [
  { name: 'Elif K.', label: 'LGS · 8. sınıf', minutes: '9 sa 40 dk', tasks: '12/14 görev' },
  { name: 'Mert A.', label: 'YKS · 12. sınıf', minutes: '6 sa 10 dk', tasks: '8/12 görev' },
  { name: 'Zeynep T.', label: 'YKS · Mezun', minutes: '11 sa 5 dk', tasks: '14/15 görev' },
  { name: 'Can Y.', label: 'LGS · 8. sınıf', minutes: '7 sa 15 dk', tasks: '9/10 görev' },
]

export function Roster() {
  return (
    <Panel title="Öğrencilerim" aside={<Badge className="tabular">4 / <StudentCapacity /></Badge>}>
      <ul className="divide-y divide-line">
        {roster.map((s, i) => (
          <Pop key={s.name} delay={0.1 + i * 0.12} y={6}>
            <li className="flex items-center gap-3 py-2.5">
              <Avatar name={s.name} className="size-9 text-xs" />
              <div className="min-w-0 flex-1">
                <p className="truncate text-[15px] font-semibold">{s.name}</p>
                <p className="truncate text-[13px] text-muted">{s.label}</p>
              </div>
              <div className="shrink-0 text-right">
                <p className="tabular text-sm font-semibold">{s.minutes}</p>
                <p className="tabular text-xs text-muted">{s.tasks}</p>
              </div>
            </li>
          </Pop>
        ))}
      </ul>
    </Panel>
  )
}

export function Attention() {
  const step = useSteps([900, 1900])
  const rows = [
    { name: 'Mert A.', label: 'YKS · 12. sınıf', alert: { tone: 'warning' as const, icon: Clock3, text: '4 gündür kayıt yok' } },
    { name: 'Zeynep T.', label: 'YKS · Mezun', alert: { tone: 'danger' as const, icon: TrendingDown, text: 'Net 6 düştü' } },
  ]
  const ordered = step >= 1 ? [rows[1], rows[0], { ...roster[0], alert: null }, { ...roster[3], alert: null }] : [roster[0], ...rows, roster[3]].map((r) => ('alert' in r ? r : { ...r, alert: null }))
  return (
    <Panel title="Öğrencilerim">
      <ul className="divide-y divide-line">
        {ordered.slice(0, 4).map((s) => (
          <motion.li layout transition={{ duration: 0.45, ease }} key={s.name} className="flex items-center gap-3 py-2.5">
            <Avatar name={s.name} className="size-9 text-xs" />
            <div className="min-w-0 flex-1">
              <p className="truncate text-[15px] font-semibold">{s.name}</p>
              <p className="truncate text-[13px] text-muted">{s.label}</p>
            </div>
            {s.alert && step >= 1 ? (
              <Pop>
                <Badge tone={s.alert.tone}>
                  <s.alert.icon />
                  {s.alert.text}
                </Badge>
              </Pop>
            ) : (
              <span className="tabular text-sm text-muted">{'tasks' in s ? s.tasks : ''}</span>
            )}
          </motion.li>
        ))}
      </ul>
    </Panel>
  )
}

const days = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum']
const chips = [
  { day: 0, label: 'Mat', color: 'sea' },
  { day: 1, label: 'Fen', color: 'pine' },
  { day: 3, label: 'İng', color: 'violet' },
  { day: 4, label: 'Mat', color: 'sea' },
]

export function Planner() {
  const step = useSteps([900, 2000])
  const movingDay = step === 0 ? 1 : step === 1 ? 2 : 3
  return (
    <Panel title="Haftalık program" aside={<span className="text-xs font-semibold text-muted">Elif K.</span>}>
      <div className="grid grid-cols-5 gap-1">
        {days.map((day, d) => (
          <div key={day}>
            <p className="pb-1.5 text-center text-[11px] font-bold text-muted">{day}</p>
            <div className="flex min-h-24 flex-col gap-1 rounded-lg bg-surface-2 p-1">
              {movingDay === d && (
                <motion.div
                  layoutId="landing-planner-chip"
                  transition={{ duration: 0.5, ease }}
                  className="flex items-center gap-0.5 truncate rounded-md border-l-[3px] bg-surface py-1 pr-1 pl-0.5 text-[11px] font-bold shadow-pop"
                  style={{ borderLeftColor: subjectColor({ color: 'amber' }) }}
                >
                  <GripVertical className="size-3 shrink-0 text-subtle" />
                  <span className="truncate">İnk</span>
                </motion.div>
              )}
              {chips
                .filter((c) => c.day === d)
                .map((c) => (
                  <div key={c.label + c.day} className="truncate rounded-md border-l-[3px] bg-surface px-1.5 py-1 text-[11px] font-semibold shadow-card" style={{ borderLeftColor: subjectColor({ color: c.color }) }}>
                    {c.label}
                  </div>
                ))}
            </div>
          </div>
        ))}
      </div>
      <div className="mt-3 flex items-center justify-between rounded-xl bg-surface-2 px-3 py-2 text-sm">
        <span className="text-muted">Şablon: Hafta içi tekrar</span>
        <Badge tone="primary">
          <Check />
          Haftaya eklendi
        </Badge>
      </div>
    </Panel>
  )
}

const losses = [
  { name: 'Fen', value: 7, color: 'pine' },
  { name: 'Matematik', value: 5.3, color: 'sea' },
  { name: 'Türkçe', value: 5, color: 'coral' },
]

export function NetLoss() {
  const step = useSteps([1500])
  const reduce = useReducedMotion()
  return (
    <Panel title="Net kaybı" aside={<Badge tone="warning" className="tabular">26,7 net</Badge>}>
      <ul className="space-y-2.5">
        {losses.map((l, i) => (
          <li key={l.name}>
            <div className="flex justify-between text-sm font-semibold">
              <span>{l.name}</span>
              <span className="tabular text-muted">{String(l.value).replace('.', ',')} net</span>
            </div>
            <div className="mt-1 h-1.5 overflow-hidden rounded-full bg-surface-2">
              <motion.div
                className="h-full rounded-full bg-warning"
                initial={reduce ? false : { width: 0 }}
                animate={{ width: `${(l.value / 7) * 100}%` }}
                transition={{ duration: 0.6, ease, delay: 0.15 + i * 0.12 }}
              />
            </div>
          </li>
        ))}
      </ul>
      <div className="mt-3 border-t border-line pt-3">
        <p className="text-sm font-semibold">En çok takılınan konular</p>
        <p className="mt-1 text-[14px] text-muted">Çarpanlar ve Katlar 20 soru · Üslü İfadeler 20 soru</p>
        <motion.div
          animate={step >= 1 ? { scale: [1, 0.96, 1] } : {}}
          className={cn('mt-3 inline-flex h-10 items-center gap-2 rounded-xl px-4 text-sm font-semibold', step >= 1 ? 'bg-primary-soft text-primary-soft-fg' : 'bg-primary text-primary-fg')}
        >
          {step >= 1 ? <Check className="size-4" /> : null}
          {step >= 1 ? 'Görevler öğrenciye verildi' : 'Görevleri öğrenciye ver'}
        </motion.div>
      </div>
    </Panel>
  )
}

export function Notes() {
  const step = useSteps([1600])
  return (
    <Panel title="Görüşme notu" aside={<Badge tone={step >= 1 ? 'primary' : 'neutral'}>{step >= 1 ? <CalendarCheck /> : <Lock />}{step >= 1 ? 'Veliyle paylaşıldı' : 'Yalnızca siz'}</Badge>}>
      <p className="min-h-20 text-[15px] leading-relaxed">
        <Typing text="Matematikte işlem hatası var. Hafta sonu kısa deneme yapıp birlikte bakacağız." speed={22} />
      </p>
      <div className="mt-3 flex gap-2 text-sm">
        <Badge tone="neutral">Öğrenci</Badge>
        <Badge tone={step >= 1 ? 'primary' : 'neutral'}>Veli</Badge>
      </div>
    </Panel>
  )
}

export function ChatTeacher() {
  return (
    <Panel title="Mesajlar" aside={<Badge>Elif K. velisi</Badge>}>
      <div className="space-y-2">
        <Pop delay={0.1}><Bubble>Bu hafta denemesi nasıl geçti?</Bubble></Pop>
        <Pop delay={0.9}><Bubble mine>Fen'de 7 net kaybı var, Perşembe birlikte bakıyoruz.</Bubble></Pop>
        <Pop delay={1.7}><Bubble>Teşekkürler, akşam konuşurum.</Bubble></Pop>
      </div>
      <div className="mt-3 flex items-center gap-2 rounded-xl border border-line px-3 py-2 text-sm text-subtle">
        <span className="flex-1">Mesaj yazın</span>
        <Send className="size-4" />
      </div>
    </Panel>
  )
}

export function Assistant() {
  const step = useSteps([1500, 2600, 3500])
  return (
    <Panel title="Asistan" aside={<Badge tone="accent">Kendi anahtarınız</Badge>}>
      <div className="space-y-2">
        <Bubble mine><Typing text="Elif'e bu hafta 3 matematik görevi ver" speed={24} /></Bubble>
        {step >= 1 && (
          <Pop>
            <div className="rounded-2xl border border-line bg-surface px-3 py-2.5 text-[14px]">
              <p className="font-semibold">Elif için 3 görev taslağı</p>
              <ul className="mt-1.5 space-y-0.5 text-muted">
                <li>Çarpanlar ve Katlar 20 soru · Salı</li>
                <li>EBOB EKOK 15 soru · Perşembe</li>
                <li>Üslü İfadeler tekrar · Cuma</li>
              </ul>
              <div className={cn('mt-2 inline-flex h-9 items-center gap-1.5 rounded-lg px-3 text-sm font-semibold', step >= 3 ? 'bg-primary-soft text-primary-soft-fg' : 'bg-primary text-primary-fg')}>
                {step >= 3 && <Check className="size-4" />}
                {step >= 3 ? 'Eklendi' : 'Görevleri ekle'}
              </div>
            </div>
          </Pop>
        )}
        {step >= 2 && (
          <Pop>
            <p className="rounded-lg bg-surface-2 px-3 py-2 text-xs text-muted">Servise giden: OGR-482913'e bu hafta 3 matematik görevi ver</p>
          </Pop>
        )}
      </div>
    </Panel>
  )
}

export function Digest() {
  return (
    <Panel title="Bildirimler" aside={<Bell className="size-4 text-muted" />}>
      <Pop delay={0.2}>
        <div className="rounded-xl border border-line bg-bg p-3">
          <p className="text-xs font-semibold text-muted">Pazartesi 08.00</p>
          <p className="mt-0.5 font-semibold">2 öğrenciye bakmak iyi olur</p>
          <ul className="mt-1.5 space-y-1 text-[14px] text-muted">
            <Pop delay={0.7}><li>Mert: 7 gündür kayıt yok, 4 gecikmiş görev</li></Pop>
            <Pop delay={1.2}><li>Zeynep: net 6 düştü</li></Pop>
          </ul>
        </div>
      </Pop>
    </Panel>
  )
}
