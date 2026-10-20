import { cn } from '@/lib/cn'

export function LogoMark({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 32 32" className={cn('size-8 shrink-0', className)} aria-hidden>
      <rect width="32" height="32" rx="9" fill="var(--brand)" />
      <path d="M7 26 13.2 8M25 26 18.8 8" stroke="var(--brand-ink)" strokeWidth="2.6" strokeLinecap="round" />
      <path d="M16 24v-3M16 17.5v-2.2M16 12.4v-1.6" stroke="var(--marker)" strokeWidth="2.2" strokeLinecap="round" />
    </svg>
  )
}

export function Logo({ className }: { className?: string }) {
  return (
    <span className={cn('inline-flex items-center gap-2', className)}>
      <LogoMark />
      <span className="font-display text-xl font-extrabold tracking-tight">
        Yolum<span className="text-primary">net</span>
      </span>
    </span>
  )
}
