import type { HTMLAttributes } from 'react'
import { cn } from '@/lib/cn'

const tones = {
  neutral: 'bg-surface-2 text-muted',
  primary: 'bg-primary-soft text-primary-soft-fg',
  accent: 'bg-accent-soft text-accent-soft-fg',
  warning: 'bg-warning-soft text-warning',
  danger: 'bg-danger-soft text-danger',
  marker: 'bg-marker text-marker-fg',
}

export function Badge({
  tone = 'neutral',
  className,
  ...props
}: HTMLAttributes<HTMLSpanElement> & { tone?: keyof typeof tones }) {
  return (
    <span
      className={cn(
        'inline-flex items-center gap-1 rounded-full px-2 py-0.5 text-xs font-semibold whitespace-nowrap [&_svg]:size-3.5',
        tones[tone],
        className,
      )}
      {...props}
    />
  )
}
