import { motion, type Variants } from 'motion/react'
import { ArrowLeft, Clock, ListChecks, NotebookTabs, Timer, Trophy, type LucideIcon } from 'lucide-react'
import { useState } from 'react'
import { useLocation, useNavigate } from 'react-router'
import { Modal } from '@/components/ui/modal'
import { useAuth } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { QuestionLogForm } from './question-log-form'
import { StudySessionForm } from './study-session-form'
import { useTimerWatcher } from './timer-hooks'
import { useTimerState } from './timer-store'

type Step = 'menu' | 'questions' | 'study'

const slide: Variants = {
  enter: (dir: number) => ({ x: dir * 32, opacity: 0 }),
  center: { x: 0, opacity: 1 },
  exit: (dir: number) => ({ x: dir * -32, opacity: 0 }),
}

const titles: Record<Exclude<Step, 'menu'>, { title: string }> = {
  questions: { title: 'Soru çözdüm' },
  study: { title: 'Çalıştım' },
}

type SheetProps = { open: boolean; onOpenChange: (open: boolean) => void }

export function QuickAddSheet(props: SheetProps) {
  const { student } = useAuth()
  const { pathname } = useLocation()
  useTimerWatcher(student?.id, pathname !== '/app/sayac')
  return <QuickAddModal {...props} />
}

export function QuickAddModal({ open, onOpenChange }: SheetProps) {
  const { student } = useAuth()
  const navigate = useNavigate()
  const timer = useTimerState()
  const [step, setStep] = useState<Step>('menu')
  const [dir, setDir] = useState(1)
  const [wasOpen, setWasOpen] = useState(open)

  if (open !== wasOpen) {
    setWasOpen(open)
    if (open) {
      setStep('menu')
      setDir(1)
    }
  }

  if (!student) return null

  const go = (next: Step) => {
    setDir(next === 'menu' ? -1 : 1)
    setStep(next)
  }
  const leave = (to: string) => {
    onOpenChange(false)
    navigate(to)
  }
  const close = () => onOpenChange(false)
  const timerRunning = timer.focus?.studentId === student.id

  const header =
    step === 'menu' ? null : (
      <span className="flex items-center gap-1">
        <button
          type="button"
          onClick={() => go('menu')}
          aria-label="Geri"
          className="-ml-2.5 grid size-10 shrink-0 place-items-center rounded-xl text-muted transition-colors hover:bg-surface-2 hover:text-fg"
        >
          <ArrowLeft className="size-5" />
        </button>
        {titles[step].title}
      </span>
    )

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title={header ?? 'Kayıt ekle'}
    >
      <div className="-mx-5 overflow-x-clip px-5">
          <motion.div
            key={step}
            custom={dir}
            variants={slide}
            initial="enter"
            animate="center"
            transition={{ duration: 0.2, ease: [0.22, 1, 0.36, 1] }}
          >
            {step === 'menu' && (
              <div className="grid grid-cols-2 gap-3 pb-1">
                <Tile icon={ListChecks} title="Soru çözdüm" hint="Doğru, yanlış, boş" tone="primary" onClick={() => go('questions')} />
                <Tile icon={Clock} title="Çalıştım" hint="Süre ekle" tone="accent" onClick={() => go('study')} />
                <Tile
                  icon={Timer}
                  title={timerRunning ? 'Sayaca dön' : 'Sayacı başlat'}
                  hint={timerRunning ? 'Oturum sürüyor' : 'Bitince kendisi kaydeder'}
                  tone="marker"
                  live={timerRunning}
                  onClick={() => leave('/app/sayac')}
                />
                <Tile icon={Trophy} title="Deneme ekle" hint="Sonuçları gir" tone="neutral" onClick={() => leave('/app/deneme-ekle')} />
                <Tile
                  icon={NotebookTabs}
                  title="Yanlış soru"
                  hint="Fotoğrafını deftere ekle"
                  tone="neutral"
                  onClick={() => leave('/app/yanlislar?ekle=1')}
                />
              </div>
            )}
            {step === 'questions' && <QuestionLogForm studentId={student.id} onDone={close} />}
            {step === 'study' && <StudySessionForm studentId={student.id} onDone={close} />}
          </motion.div>
      </div>
    </Modal>
  )
}

const tones = {
  primary: 'bg-primary-soft text-primary-soft-fg',
  accent: 'bg-accent-soft text-accent-soft-fg',
  marker: 'bg-warning-soft text-warning',
  neutral: 'bg-surface-2 text-fg',
}

function Tile({
  icon: Icon,
  title,
  hint,
  tone,
  live,
  onClick,
}: {
  icon: LucideIcon
  title: string
  hint: string
  tone: keyof typeof tones
  live?: boolean
  onClick: () => void
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      className="flex min-h-32 flex-col items-start justify-between gap-3 rounded-2xl border border-line bg-bg p-4 text-left transition-[border-color,transform] duration-150 hover:border-line-strong active:scale-[0.98]"
    >
      <span className={cn('relative grid size-11 place-items-center rounded-xl', tones[tone])}>
        <Icon className="size-[22px]" />
        {live && (
          <span className="absolute -top-0.5 -right-0.5 size-3 rounded-full border-2 border-bg bg-primary" aria-hidden />
        )}
      </span>
      <span>
        <span className="block text-[15px] leading-tight font-bold">{title}</span>
        <span className="mt-1 block text-[13px] leading-snug text-muted">{hint}</span>
      </span>
    </button>
  )
}
