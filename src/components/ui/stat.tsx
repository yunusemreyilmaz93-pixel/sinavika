import { TrendingDown, TrendingUp } from 'lucide-react'
import type { ReactNode } from 'react'
import { cn } from '@/lib/cn'
import { subjectColors } from '@/lib/exam'

export type Hue = keyof typeof subjectColors

// Ders paletinden yumuşak zeminli renkli ikon kutusu
export function IconChip({ hue, children, className }: { hue: Hue; children: ReactNode; className?: string }) {
  const color = subjectColors[hue]
  return (
    <span aria-hidden className={cn('grid size-9 shrink-0 place-items-center rounded-xl [&_svg]:size-[18px]', className)} style={{ color, backgroundColor: `${color}1f` }}>
      {children}
    </span>
  )
}

// Artış ya da düşüş etiketi. up undefined ise nötr
export function Trend({ up, children, className }: { up?: boolean; children: ReactNode; className?: string }) {
  return (
    <span
      className={cn(
        'tabular inline-flex items-center gap-0.5 rounded-full px-1.5 py-0.5 text-[11px] font-bold whitespace-nowrap',
        up === undefined ? 'bg-surface-2 text-muted' : up ? 'bg-primary-soft text-primary-soft-fg' : 'bg-danger-soft text-danger',
        className,
      )}
    >
      {up === true && <TrendingUp aria-hidden className="size-3" />}
      {up === false && <TrendingDown aria-hidden className="size-3" />}
      {children}
    </span>
  )
}

export type StripItem = { label: ReactNode; value: ReactNode; aside?: ReactNode; tone?: 'warning' }

// Ana sayfalardaki ince sayı şeridi. Sayılar destek bilgisidir, ekranın ana öğesi değildir. Telefonda da tek satır
export function StatStrip({ items, caption, className }: { items: StripItem[]; caption?: ReactNode; className?: string }) {
  return (
    <div className={cn('rounded-2xl bg-bg px-3 py-2.5 sm:px-4 sm:py-3', className)}>
      {caption && <p className="mb-1.5 text-xs font-semibold text-muted">{caption}</p>}
      <dl className="grid grid-cols-4 gap-2 sm:gap-4">
        {items.map((item, i) => (
          <div key={i} className="min-w-0">
            <dt className="truncate text-xs text-muted sm:text-[13px]">{item.label}</dt>
            <dd className="flex min-w-0 flex-wrap items-center gap-x-1.5">
              <span className={cn('tabular truncate font-display text-lg leading-tight font-extrabold sm:text-xl', item.tone === 'warning' && 'text-warning')}>{item.value}</span>
              {item.aside && <span className="hidden sm:inline-flex">{item.aside}</span>}
            </dd>
          </div>
        ))}
      </dl>
    </div>
  )
}

// Karşılama kartlarındaki sayı kutusu
export function StatTile({ icon, hue, label, value, aside, className }: { icon: ReactNode; hue: Hue; label: ReactNode; value: ReactNode; aside?: ReactNode; className?: string }) {
  return (
    <div className={cn('min-w-0 rounded-2xl bg-bg p-3.5', className)}>
      <div className="flex items-center justify-between gap-2">
        <IconChip hue={hue}>{icon}</IconChip>
        {aside && <div className="min-w-0 text-right text-xs text-muted">{aside}</div>}
      </div>
      <p className="mt-3 truncate text-[13px] text-muted">{label}</p>
      <p className="tabular truncate font-display text-2xl font-extrabold">{value}</p>
    </div>
  )
}

// Küçük sütun grafik. highlight çubuğu koyu, goal kesikli çizgi
export function MiniBars({ values, peak, highlight, goal, className, label }: { values: number[]; peak?: number; highlight?: number; goal?: number; className?: string; label?: string }) {
  const max = Math.max(1, peak ?? 0, ...values, goal ?? 0)
  return (
    <div className={cn('relative flex h-full items-end gap-[3px]', className)} role={label ? 'img' : undefined} aria-label={label}>
      {goal != null && goal > 0 && <div aria-hidden className="absolute inset-x-0 border-t border-dashed border-warning/70" style={{ bottom: `${(goal / max) * 100}%` }} />}
      {values.map((v, i) => (
        <div key={i} aria-hidden className={cn('flex-1 rounded-t-[3px]', i === highlight ? 'bg-primary' : 'bg-primary/35')} style={{ height: `${(v / max) * 100}%`, minHeight: v ? 3 : 2 }} />
      ))}
    </div>
  )
}
