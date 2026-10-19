import { cn } from '@/lib/cn'

const palette = [
  'bg-primary-soft text-primary-soft-fg',
  'bg-accent-soft text-accent-soft-fg',
  'bg-warning-soft text-warning',
  'bg-danger-soft text-danger',
  'bg-surface-2 text-fg',
]

export function initials(name: string) {
  return name
    .trim()
    .split(/\s+/)
    .slice(0, 2)
    .map((p) => p[0]?.toLocaleUpperCase('tr'))
    .join('')
}

export function Avatar({ name, className }: { name: string; className?: string }) {
  let hash = 0
  for (const ch of name) hash = (hash * 31 + ch.charCodeAt(0)) >>> 0
  return (
    <span
      aria-hidden
      className={cn(
        'inline-grid size-10 shrink-0 place-items-center rounded-full font-display text-sm font-bold',
        palette[hash % palette.length],
        className,
      )}
    >
      {initials(name)}
    </span>
  )
}
