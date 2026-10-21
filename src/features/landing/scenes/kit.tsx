import { motion, useReducedMotion } from 'motion/react'
import { useEffect, useState, type ReactNode } from 'react'
import { cn } from '@/lib/cn'
import { ease } from '../primitives'

// Sahneler her etkinleşmede baştan çalışır. Hareket azaltma açıksa son kare gösterilir
export function useSteps(times: number[]) {
  const reduce = useReducedMotion()
  const [step, setStep] = useState(0)
  useEffect(() => {
    if (reduce) return
    const timers = times.map((ms, i) => window.setTimeout(() => setStep(i + 1), ms))
    return () => timers.forEach(window.clearTimeout)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [reduce])
  return reduce ? times.length : step
}

export function Pop({ delay = 0, y = 8, className, children }: { delay?: number; y?: number; className?: string; children: ReactNode }) {
  const reduce = useReducedMotion()
  return (
    <motion.div
      initial={reduce ? false : { opacity: 0, y }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.3, ease, delay }}
      className={className}
    >
      {children}
    </motion.div>
  )
}

export function Typing({ text, start = 0, speed = 28, className }: { text: string; start?: number; speed?: number; className?: string }) {
  const reduce = useReducedMotion()
  const [n, setN] = useState(reduce ? text.length : 0)
  useEffect(() => {
    if (reduce) return
    let id = 0
    const timer = window.setTimeout(() => {
      id = window.setInterval(() => setN((c) => (c >= text.length ? c : c + 1)), speed)
    }, start)
    return () => {
      window.clearTimeout(timer)
      window.clearInterval(id)
    }
  }, [reduce, start, speed, text.length])
  return <span className={className}>{text.slice(0, n)}</span>
}

export function Panel({ title, aside, className, children }: { title?: string; aside?: ReactNode; className?: string; children: ReactNode }) {
  return (
    <div className={cn('rounded-2xl border border-line bg-surface p-4 shadow-card', className)}>
      {title && (
        <div className="mb-3 flex items-center justify-between gap-3">
          <p className="font-display text-base font-bold">{title}</p>
          {aside}
        </div>
      )}
      {children}
    </div>
  )
}

export function Bubble({ mine, children }: { mine?: boolean; children: ReactNode }) {
  return (
    <div className={cn('max-w-[85%] rounded-2xl px-3 py-2 text-[14px] leading-snug', mine ? 'ml-auto bg-primary text-primary-fg' : 'border border-line bg-surface')}>{children}</div>
  )
}
