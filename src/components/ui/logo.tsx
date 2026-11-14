import { cn } from '@/lib/cn'
import { MARK, WORD } from './logo-paths'

export function LogoMark({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 512 512" className={cn('size-8 shrink-0', className)} aria-hidden>
      <rect width="512" height="512" rx="120" fill="var(--brand)" />
      <path d={MARK} fill="var(--brand-ink)" />
      <circle cx="169.6" cy="127.6" r="50.6" fill="var(--marker)" />
    </svg>
  )
}

export function Logo({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 301.6 100" role="img" aria-label="İzlek" className={cn('h-7 w-auto shrink-0 text-primary', className)}>
      <path d={WORD} fill="currentColor" />
      <circle cx="14.0" cy="14.8" r="14.0" fill="var(--marker)" />
    </svg>
  )
}
