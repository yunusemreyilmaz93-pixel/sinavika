import { cn } from '@/lib/cn'

export function LogoMark({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 32 32" className={cn('size-8 shrink-0', className)} aria-hidden>
      <rect width="32" height="32" rx="9" fill="var(--brand)" />
      <path
        d="M7.6 23h10.25a3.5 3.5 0 0 0 0-7h-5.5a3.5 3.5 0 0 1 0-7h4.25"
        fill="none"
        stroke="var(--brand-ink)"
        strokeWidth="3.4"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <circle cx="21.85" cy="9" r="2.6" fill="var(--marker)" />
    </svg>
  )
}

export function Logo({ className }: { className?: string }) {
  return (
    <span className={cn('inline-flex items-center gap-2', className)}>
      <LogoMark />
      <span className="font-display text-xl font-extrabold tracking-tight">Sınavika</span>
    </span>
  )
}
