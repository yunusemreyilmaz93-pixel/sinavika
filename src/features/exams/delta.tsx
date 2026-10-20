import { ArrowDownRight, ArrowUpRight, Minus } from 'lucide-react'
import { formatNet } from '@/lib/exam'
import { cn } from '@/lib/cn'
import { round2, signed } from './stats'

export function Delta({ value, className, suffix }: { value: number; className?: string; suffix?: string }) {
  const v = round2(value)
  const Icon = v > 0 ? ArrowUpRight : v < 0 ? ArrowDownRight : Minus
  const label = v > 0 ? `${formatNet(v)} net artış` : v < 0 ? `${formatNet(-v)} net düşüş` : 'Değişim yok'
  return (
    <span
      className={cn(
        'tabular inline-flex items-center gap-0.5 font-semibold whitespace-nowrap',
        v > 0 ? 'text-success' : v < 0 ? 'text-danger' : 'text-muted',
        className,
      )}
    >
      <Icon className="size-[1.1em] shrink-0" aria-hidden />
      <span aria-hidden>
        {signed(v)}
        {suffix}
      </span>
      <span className="sr-only">{label}</span>
    </span>
  )
}
