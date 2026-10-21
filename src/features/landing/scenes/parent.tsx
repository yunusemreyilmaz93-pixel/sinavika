import { motion, useReducedMotion } from 'motion/react'
import { Eye, Lock } from 'lucide-react'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/cn'
import { ease } from '../primitives'
import { Bubble, Panel, Pop, useSteps } from './kit'
import { ExamNets as StudentExamNets } from './student'

export function WeekSummary() {
  const reduce = useReducedMotion()
  const bars = [60, 90, 40, 100, 70, 30, 55]
  return (
    <Panel title="Bu hafta" aside={<Badge className="tabular">7 sa 40 dk</Badge>}>
      <div className="flex h-24 items-end gap-1.5">
        {bars.map((h, i) => (
          <div key={i} className="flex h-full flex-1 flex-col items-center gap-1">
            <div className="flex w-full flex-1 items-end">
              <motion.div className="w-full rounded-t-md bg-primary" initial={reduce ? false : { height: 0 }} animate={{ height: `${h}%` }} transition={{ duration: 0.5, ease, delay: i * 0.08 }} />
            </div>
            <span className="text-[11px] font-semibold text-muted">{['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'][i]}</span>
          </div>
        ))}
      </div>
      <p className="mt-3 text-sm text-muted">
        <span className="tabular font-bold text-fg">312</span> soru çözüldü, <span className="tabular font-bold text-fg">11/13</span> görev tamamlandı.
      </p>
    </Panel>
  )
}

export const ExamResults = StudentExamNets

export function ChatParent() {
  return (
    <Panel title="Mesajlar" aside={<Badge>Öğretmen</Badge>}>
      <div className="space-y-2">
        <Pop delay={0.1}><Bubble mine>Fen denemesinde ne kadar vakit harcıyor?</Bubble></Pop>
        <Pop delay={0.9}><Bubble>Zamanı iyi kullanıyor, tekrarlara ağırlık vereceğiz.</Bubble></Pop>
        <Pop delay={1.7}><Bubble mine>Teşekkür ederim.</Bubble></Pop>
      </div>
    </Panel>
  )
}

export function Children() {
  const step = useSteps([1300])
  const kids = [
    { name: 'Elif K.', info: 'LGS · 8. sınıf', line: '9 sa 40 dk · 14 görev' },
    { name: 'Deniz K.', info: 'YKS · 12. sınıf', line: '6 sa 5 dk · 9 görev' },
  ]
  const active = step >= 1 ? 1 : 0
  return (
    <Panel title="Çocuklarım">
      <div className="flex gap-2">
        {kids.map((k, i) => (
          <span key={k.name} className={cn('flex items-center gap-2 rounded-full border px-3 py-1.5 text-sm font-semibold transition-colors', i === active ? 'border-primary bg-primary-soft text-primary-soft-fg' : 'border-line text-muted')}>
            <Avatar name={k.name} className="size-6 text-[10px]" />
            {k.name.split(' ')[0]}
          </span>
        ))}
      </div>
      <Pop key={active}>
        <div className="mt-3 rounded-xl bg-surface-2 p-3">
          <p className="font-semibold">{kids[active].name}</p>
          <p className="text-sm text-muted">{kids[active].info}</p>
          <p className="mt-2 tabular text-sm">{kids[active].line}</p>
        </div>
      </Pop>
    </Panel>
  )
}

export function ReadOnly() {
  const step = useSteps([1200])
  return (
    <Panel title="Planı görüntüleyin" aside={<Badge><Eye />Yalnızca izleme</Badge>}>
      <ul className="space-y-1.5">
        {['Çarpanlar ve Katlar 20 soru', 'Paragraf 15 soru'].map((t) => (
          <li key={t} className="flex items-center gap-3 rounded-xl bg-surface-2 px-3 py-2.5 text-[15px]">
            <span className="size-5 rounded-md border border-line-strong bg-surface" />
            {t}
          </li>
        ))}
      </ul>
      {step >= 1 && (
        <Pop>
          <p className="mt-3 flex items-center gap-2 rounded-lg bg-warning-soft px-3 py-2 text-sm text-warning">
            <Lock className="size-4 shrink-0" />
            Veli hesabıyla kayıtlar değiştirilemez
          </p>
        </Pop>
      )}
    </Panel>
  )
}
