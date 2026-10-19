import type { LucideIcon } from 'lucide-react'
import type { ReactNode } from 'react'
import { cn } from '@/lib/cn'

export function EmptyState({
  icon: Icon,
  title,
  description,
  action,
  className,
}: {
  icon: LucideIcon
  title: string
  description?: ReactNode
  action?: ReactNode
  className?: string
}) {
  return (
    <div className={cn('grid-paper flex flex-col items-center rounded-2xl border border-dashed border-line-strong px-6 py-10 text-center', className)}>
      <div className="grid size-12 place-items-center rounded-2xl bg-primary-soft text-primary-soft-fg">
        <Icon className="size-6" />
      </div>
      <h3 className="mt-4 text-base font-bold">{title}</h3>
      {description && <p className="mt-1 max-w-sm text-sm text-muted">{description}</p>}
      {action && <div className="mt-5">{action}</div>}
    </div>
  )
}
