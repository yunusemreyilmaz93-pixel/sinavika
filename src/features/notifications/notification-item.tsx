import { cn } from '@/lib/cn'
import { kindOf, type Notification } from './lib'

export function NotificationIcon({ kind, className }: { kind: string; className?: string }) {
  const k = kindOf(kind)
  const Icon = k.icon
  return (
    <span aria-hidden className={cn('grid size-10 shrink-0 place-items-center rounded-xl', k.className, className)}>
      <Icon className="size-[18px]" />
    </span>
  )
}

export function NotificationText({ n, meta }: { n: Notification; meta: string }) {
  const unread = !n.read_at
  return (
    <span className="min-w-0 flex-1">
      <span className="flex items-start gap-2">
        <span className={cn('min-w-0 flex-1 text-[15px] leading-snug', unread ? 'font-bold text-fg' : 'font-medium text-muted')}>
          {n.title}
        </span>
        {unread && (
          <span className="mt-1.5 size-2 shrink-0 rounded-full bg-primary">
            <span className="sr-only">Okunmadı</span>
          </span>
        )}
      </span>
      {n.body && <span className="mt-0.5 line-clamp-2 block text-sm break-words text-muted">{n.body}</span>}
      <span className="mt-1 block text-xs text-subtle">
        {kindOf(n.kind).label} · {meta}
      </span>
    </span>
  )
}
