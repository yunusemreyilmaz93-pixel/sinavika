import { ChevronRight } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useNavigate } from 'react-router'
import { kindOf, useNotificationActions, useNotificationList, type Notification } from '@/features/notifications/lib'
import { cn } from '@/lib/cn'
import { formatRelative } from '@/lib/dates'

const KINDS = new Set(['message', 'note'])
const SHOWN = 2

function label(n: Notification) {
  return n.kind === 'message' ? `${n.title} mesaj gönderdi` : n.title
}

export function InboxStrip({ userId, className }: { userId: string; className?: string }) {
  const list = useNotificationList(userId, 20)
  const { markRead } = useNotificationActions(userId)
  const navigate = useNavigate()
  const items = (list.data ?? []).filter((n) => !n.read_at && KINDS.has(n.kind)).slice(0, SHOWN)

  const open = (n: Notification) => {
    void markRead(n)
    if (n.link) navigate(n.link)
  }

  return (
    <AnimatePresence initial={false}>
      {items.length > 0 && (
        <motion.ul
          initial={{ opacity: 0, height: 0 }}
          animate={{ opacity: 1, height: 'auto' }}
          exit={{ opacity: 0, height: 0 }}
          transition={{ duration: 0.2 }}
          aria-label="Okunmamış mesaj ve notlar"
          className={cn('space-y-2 overflow-hidden', className)}
        >
          {items.map((n) => {
            const kind = kindOf(n.kind)
            const Icon = kind.icon
            return (
              <li key={n.id}>
                <button
                  type="button"
                  onClick={() => open(n)}
                  className="flex min-h-14 w-full items-center gap-3 rounded-2xl border border-accent/25 bg-accent-soft/50 px-3 py-2 text-left transition-colors hover:bg-accent-soft"
                >
                  <span className={cn('grid size-9 shrink-0 place-items-center rounded-xl', kind.className)} aria-hidden>
                    <Icon className="size-[18px]" />
                  </span>
                  <span className="min-w-0 flex-1">
                    <span className="block truncate text-sm font-bold">{label(n)}</span>
                    {n.body && <span className="block truncate text-sm text-muted">{n.body}</span>}
                  </span>
                  <span className="hidden shrink-0 text-xs text-muted sm:block">{formatRelative(n.created_at)}</span>
                  <ChevronRight className="size-4 shrink-0 text-muted" aria-hidden />
                </button>
              </li>
            )
          })}
        </motion.ul>
      )}
    </AnimatePresence>
  )
}
