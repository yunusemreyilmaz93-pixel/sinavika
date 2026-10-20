import { cn } from '@/lib/cn'

export function LogoMark({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 32 32" className={cn('size-8 shrink-0', className)} aria-hidden>
      <rect width="32" height="32" rx="9" fill="var(--brand)" />
      <path
        d="M16 26.5V17L9 8.5M16 17l6.2-7.4"
        fill="none"
        stroke="var(--brand-ink)"
        strokeWidth="3.4"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
      <circle cx="23.4" cy="8.2" r="2.9" fill="var(--marker)" />
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
