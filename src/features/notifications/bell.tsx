import type { RealtimePostgresChangesPayload } from '@supabase/supabase-js'
import { useQueryClient } from '@tanstack/react-query'
import { AnimatePresence, motion } from 'motion/react'
import { Bell, CheckCheck } from 'lucide-react'
import { Popover } from 'radix-ui'
import { useEffect, useEffectEvent, useState } from 'react'
import { Link, useLocation, useNavigate } from 'react-router'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'
import { useAuth } from '@/features/auth/session'
import { keys } from '@/lib/data'
import { formatRelative } from '@/lib/dates'
import { supabase } from '@/lib/supabase'
import { NotificationIcon, NotificationText } from './notification-item'
import { useNotificationActions, useNotificationList, useUnreadCount, type Notification } from './lib'

let channelSeq = 0

export function NotificationBell() {
  const { session } = useAuth()
  const userId = session?.user.id
  if (!userId) return null
  return <BellButton userId={userId} />
}

function BellButton({ userId }: { userId: string }) {
  const [open, setOpen] = useState(false)
  const navigate = useNavigate()
  const unread = useUnreadCount(userId)
  const recent = useNotificationList(userId, 8)
  const { markRead, markAllRead } = useNotificationActions(userId)
  useLiveNotifications(userId, markRead)

  const count = unread.data ?? 0
  const items = recent.data ?? []

  const openItem = (n: Notification) => {
    setOpen(false)
    void markRead(n)
    if (n.link) navigate(n.link)
  }

  return (
    <Popover.Root open={open} onOpenChange={setOpen}>
      <Popover.Trigger asChild>
        <Button
          variant="ghost"
          size="icon"
          className="relative"
          aria-label={count ? `Bildirimler, ${count} okunmamış` : 'Bildirimler'}
        >
          <Bell className="!size-[22px]" />
          <AnimatePresence>
            {count > 0 && (
              <motion.span
                key={count > 9 ? 'many' : count}
                initial={{ scale: 0.4, opacity: 0 }}
                animate={{ scale: 1, opacity: 1 }}
                exit={{ scale: 0.4, opacity: 0 }}
                transition={{ type: 'spring', bounce: 0.4, duration: 0.35 }}
                aria-hidden
                className="tabular absolute top-1.5 right-1.5 grid h-[18px] min-w-[18px] place-items-center rounded-full bg-accent px-1 text-[11px] leading-none font-bold text-white ring-2 ring-bg"
              >
                {count > 9 ? '9+' : count}
              </motion.span>
            )}
          </AnimatePresence>
        </Button>
      </Popover.Trigger>
      <Popover.Portal>
        <Popover.Content
          align="end"
          sideOffset={6}
          collisionPadding={12}
          className="z-50 flex max-h-[min(34rem,calc(100dvh-6rem))] w-[min(24rem,calc(100vw-1.5rem))] flex-col overflow-hidden rounded-2xl border border-line bg-surface shadow-pop outline-none data-[state=closed]:animate-pop-out data-[state=open]:animate-pop-in"
        >
          <div className="flex items-center justify-between gap-2 border-b border-line py-2 pr-2 pl-4">
            <h2 className="text-base font-bold">Bildirimler</h2>
            {count > 0 && (
              <Button variant="ghost" size="sm" className="text-primary" onClick={() => void markAllRead()}>
                <CheckCheck />
                Tümünü okundu say
              </Button>
            )}
          </div>
          <div className="min-h-0 flex-1 overflow-y-auto overscroll-contain">
            {recent.isPending ? (
              <div className="space-y-3 p-4" aria-busy="true" aria-label="Yükleniyor">
                {[0, 1, 2].map((i) => (
                  <div key={i} className="flex gap-3">
                    <Skeleton className="size-10 shrink-0" />
                    <div className="flex-1 space-y-2 pt-1">
                      <Skeleton className="h-3.5 w-3/4" />
                      <Skeleton className="h-3 w-1/2" />
                    </div>
                  </div>
                ))}
              </div>
            ) : recent.isError ? (
              <p className="px-4 py-8 text-center text-sm text-muted">Bildirimler yüklenemedi. Biraz sonra tekrar dene.</p>
            ) : items.length === 0 ? (
              <div className="flex flex-col items-center px-6 py-10 text-center">
                <span className="grid size-11 place-items-center rounded-2xl bg-surface-2 text-muted">
                  <Bell className="size-5" />
                </span>
                <p className="mt-3 text-sm font-semibold">Yeni bildirim yok</p>
                <p className="mt-1 text-sm text-muted">Görev, not ve mesajlar geldiğinde burada görünür.</p>
              </div>
            ) : (
              <ul className="divide-y divide-line">
                {items.map((n) => (
                  <li key={n.id}>
                    <button
                      type="button"
                      onClick={() => openItem(n)}
                      className="flex w-full items-start gap-3 px-4 py-3 text-left transition-colors hover:bg-surface-2 focus-visible:bg-surface-2 focus-visible:outline-none"
                    >
                      <NotificationIcon kind={n.kind} />
                      <NotificationText n={n} meta={formatRelative(n.created_at)} />
                    </button>
                  </li>
                ))}
              </ul>
            )}
          </div>
          <div className="border-t border-line p-2">
            <Button asChild variant="ghost" className="w-full text-primary">
              <Link to="/app/bildirimler" onClick={() => setOpen(false)}>
                Tümünü gör
              </Link>
            </Button>
          </div>
        </Popover.Content>
      </Popover.Portal>
    </Popover.Root>
  )
}

function useLiveNotifications(userId: string, markRead: (n: Notification) => Promise<void>) {
  const queryClient = useQueryClient()
  const navigate = useNavigate()
  const { pathname } = useLocation()

  const announce = useEffectEvent((payload: RealtimePostgresChangesPayload<Notification>) => {
    if (payload.eventType === 'DELETE') return
    const n = payload.new
    if (n.read_at) return
    if (n.kind === 'message') void queryClient.invalidateQueries({ queryKey: keys.inbox })
    if (n.link && n.link === pathname) return
    toast.custom(
      (id) => (
        <button
          type="button"
          onClick={() => {
            toast.dismiss(id)
            void markRead(n)
            if (n.link) navigate(n.link)
          }}
          className="flex w-full items-start gap-3 p-3.5 text-left"
        >
          <NotificationIcon kind={n.kind} className="size-9" />
          <span className="min-w-0 flex-1">
            <span className="block text-sm font-bold text-fg">{n.title}</span>
            {n.body && <span className="mt-0.5 line-clamp-2 block text-sm break-words text-muted">{n.body}</span>}
          </span>
        </button>
      ),
      { id: `notification-${n.id}`, duration: 6000 },
    )
  })

  useEffect(() => {
    let timer: ReturnType<typeof setTimeout> | undefined
    const refresh = () => {
      clearTimeout(timer)
      timer = setTimeout(() => void queryClient.invalidateQueries({ queryKey: keys.notifications }), 150)
    }
    let joined = false
    const channel = supabase
      .channel(`notifications:${userId}:${++channelSeq}`)
      .on<Notification>(
        'postgres_changes',
        { event: '*', schema: 'public', table: 'notifications', filter: `user_id=eq.${userId}` },
        (payload) => {
          refresh()
          announce(payload)
        },
      )
      .subscribe((status) => {
        if (status !== 'SUBSCRIBED') return
        if (joined) refresh()
        joined = true
      })

    const onVisible = () => {
      if (document.visibilityState !== 'visible') return
      void queryClient.invalidateQueries({ queryKey: keys.notifications })
      void queryClient.invalidateQueries({ queryKey: keys.inbox })
    }
    document.addEventListener('visibilitychange', onVisible)

    return () => {
      clearTimeout(timer)
      document.removeEventListener('visibilitychange', onVisible)
      void supabase.removeChannel(channel)
    }
  }, [userId, queryClient])
}
