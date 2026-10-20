import { AnimatePresence, motion } from 'motion/react'
import { Bell, CheckCheck, Trash2 } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { formatDay, formatTime } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { NotificationIcon, NotificationText } from './notification-item'
import { dayOf, useNotificationActions, useNotificationList, useUnreadCount, type Notification } from './lib'

const PAGE = 50

export default function NotificationsPage() {
  const profile = useProfile()
  const navigate = useNavigate()
  const [limit, setLimit] = useState(PAGE)
  const list = useNotificationList(profile.id, limit)
  const unread = useUnreadCount(profile.id)
  const { markRead, markAllRead, remove } = useNotificationActions(profile.id)

  const items = useMemo(() => list.data ?? [], [list.data])
  const groups = useMemo(() => {
    const out: { day: string; items: Notification[] }[] = []
    for (const n of items) {
      const day = dayOf(n.created_at)
      const last = out[out.length - 1]
      if (last?.day === day) last.items.push(n)
      else out.push({ day, items: [n] })
    }
    return out
  }, [items])

  const count = unread.data ?? 0

  const open = (n: Notification) => {
    void markRead(n)
    if (n.link) navigate(n.link)
  }

  return (
    <div>
      <PageHeader
        title="Bildirimler"
        description={count ? `${count} okunmamış bildirimin var` : 'Hepsini okudun'}
        actions={
          count > 0 ? (
            <Button variant="secondary" size="sm" onClick={() => void markAllRead()}>
              <CheckCheck />
              Tümünü okundu say
            </Button>
          ) : null
        }
      />

      {list.isPending ? (
        <div className="space-y-6" aria-busy="true" aria-label="Yükleniyor">
          {[0, 1].map((g) => (
            <div key={g} className="space-y-2">
              <Skeleton className="h-4 w-24" />
              <Skeleton className="h-40" />
            </div>
          ))}
        </div>
      ) : list.isError ? (
        <div className="rounded-2xl border border-line bg-surface p-6 text-center">
          <p className="text-sm text-muted">{errorMessage(list.error)}</p>
          <Button variant="secondary" size="sm" className="mt-4" onClick={() => void list.refetch()}>
            Tekrar dene
          </Button>
        </div>
      ) : items.length === 0 ? (
        <EmptyState
          icon={Bell}
          title="Bildirim yok"
          description="Yeni görev, not ve mesajlar geldiğinde burada görürsün."
          action={
            <Button asChild variant="secondary">
              <Link to="/app">Ana sayfaya dön</Link>
            </Button>
          }
        />
      ) : (
        <div className="space-y-6">
          {groups.map((g) => (
            <section key={g.day} aria-label={formatDay(g.day)}>
              <h2 className="mb-2 px-1 font-sans text-xs font-bold tracking-wide text-muted uppercase">{formatDay(g.day)}</h2>
              <ul className="overflow-hidden rounded-2xl border border-line bg-surface shadow-card">
                <AnimatePresence initial={false}>
                  {g.items.map((n) => (
                    <motion.li
                      key={n.id}
                      layout="position"
                      exit={{ opacity: 0, height: 0 }}
                      transition={{ duration: 0.2, ease: 'easeOut' }}
                      className={cn(
                        'relative flex items-start overflow-hidden border-b border-line last:border-b-0',
                        !n.read_at && 'bg-primary-soft/35',
                      )}
                    >
                      {!n.read_at && <span aria-hidden className="absolute inset-y-0 left-0 w-1 bg-primary" />}
                      <button
                        type="button"
                        onClick={() => open(n)}
                        className="flex min-w-0 flex-1 items-start gap-3 py-3.5 pl-4 text-left transition-colors hover:bg-surface-2/60 focus-visible:bg-surface-2 focus-visible:outline-none sm:pl-5"
                      >
                        <NotificationIcon kind={n.kind} />
                        <NotificationText n={n} meta={formatTime(n.created_at)} />
                      </button>
                      <Button
                        variant="ghost"
                        size="icon"
                        className="my-1.5 mr-1.5 text-muted hover:text-danger"
                        aria-label="Bildirimi sil"
                        onClick={() => void remove(n)}
                      >
                        <Trash2 className="!size-[18px]" />
                      </Button>
                    </motion.li>
                  ))}
                </AnimatePresence>
              </ul>
            </section>
          ))}
          {items.length >= limit && (
            <div className="flex justify-center">
              <Button variant="secondary" loading={list.isPlaceholderData} onClick={() => setLimit((l) => l + PAGE)}>
                Daha eski bildirimler
              </Button>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
