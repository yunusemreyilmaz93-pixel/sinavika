import { CircleAlert, RotateCw } from 'lucide-react'
import { animate, useReducedMotion } from 'motion/react'
import { useEffect, useRef } from 'react'
import { Button } from '@/components/ui/button'
import { errorMessage } from '@/lib/supabase'

const numberFormat = new Intl.NumberFormat('tr-TR')

export function CountUp({ value }: { value: number }) {
  const ref = useRef<HTMLSpanElement>(null)
  const reduce = useReducedMotion()
  useEffect(() => {
    const node = ref.current
    if (!node || reduce) return
    const controls = animate(0, value, {
      duration: 0.6,
      ease: [0.22, 1, 0.36, 1],
      onUpdate: (v) => {
        node.textContent = numberFormat.format(Math.round(v))
      },
    })
    return () => controls.stop()
  }, [value, reduce])
  return <span ref={ref}>{numberFormat.format(value)}</span>
}

export function LoadError({ error, onRetry }: { error: unknown; onRetry: () => void }) {
  return (
    <div role="alert" className="flex flex-col items-start gap-3 rounded-2xl border border-line bg-surface p-4 sm:flex-row sm:items-center">
      <div className="flex min-w-0 flex-1 items-start gap-2.5 text-sm">
        <CircleAlert className="mt-0.5 size-4 shrink-0 text-danger" />
        <p className="min-w-0">
          <span className="font-semibold">Yüklenemedi.</span> <span className="text-muted">{errorMessage(error)}</span>
        </p>
      </div>
      <Button variant="secondary" onClick={onRetry}>
        <RotateCw />
        Tekrar dene
      </Button>
    </div>
  )
}
