import { cn } from '@/lib/cn'

export function LogoMark({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 32 32" className={cn('size-8', className)} aria-hidden>
      <rect width="32" height="32" rx="9" fill="var(--primary)" />
      <path d="M7 21.5h18" stroke="var(--marker)" strokeWidth="5" strokeLinecap="round" opacity="0.9" />
      <path d="M9.5 16.5l4.2 4.2L23 10.5" fill="none" stroke="#fff" strokeWidth="3.2" strokeLinecap="round" strokeLinejoin="round" />
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
