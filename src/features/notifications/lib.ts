import { keepPreviousData, useQuery, useQueryClient } from '@tanstack/react-query'
import { AlarmClock, BadgeCheck, Bell, ChartColumn, ClipboardList, Megaphone, MessageCircle, NotebookPen, UserPlus, type LucideIcon } from 'lucide-react'
import { useCallback } from 'react'
import { toast } from 'sonner'
import { keys } from '@/lib/data'
import { AppError, errorMessage, supabase, unwrap, type Tables } from '@/lib/supabase'

export type Notification = Tables<'notifications'>

const istanbulDay = new Intl.DateTimeFormat('en-CA', {
  timeZone: 'Europe/Istanbul',
  year: 'numeric',
  month: '2-digit',
  day: '2-digit',
})

export function dayOf(ts: string) {
  return istanbulDay.format(new Date(ts))
}

const kinds: Record<string, { icon: LucideIcon; label: string; className: string }> = {
  task: { icon: ClipboardList, label: 'Görev', className: 'bg-primary-soft text-primary-soft-fg' },
  note: { icon: NotebookPen, label: 'Not', className: 'bg-warning-soft text-warning' },
  message: { icon: MessageCircle, label: 'Mesaj', className: 'bg-accent-soft text-accent-soft-fg' },
  join: { icon: UserPlus, label: 'Katılım', className: 'bg-primary-soft text-primary-soft-fg' },
  approved: { icon: BadgeCheck, label: 'Onay', className: 'bg-primary-soft text-success' },
  report: { icon: ChartColumn, label: 'Haftalık rapor', className: 'bg-accent-soft text-accent-soft-fg' },
  announcement: { icon: Megaphone, label: 'Duyuru', className: 'bg-accent-soft text-accent-soft-fg' },
  reminder: { icon: AlarmClock, label: 'Hatırlatma', className: 'bg-warning-soft text-warning' },
}

const fallbackKind = { icon: Bell, label: 'Bildirim', className: 'bg-surface-2 text-muted' }

export function kindOf(kind: string) {
  return kinds[kind] ?? fallbackKind
}

export const notificationKeys = {
  unread: [...keys.notifications, 'unread'] as const,
  lists: [...keys.notifications, 'list'] as const,
  list: (limit: number) => [...keys.notifications, 'list', limit] as const,
}

export function useUnreadCount(userId: string) {
  return useQuery({
    queryKey: notificationKeys.unread,
    queryFn: async () => {
      const { count, error } = await supabase
        .from('notifications')
        .select('id', { count: 'exact', head: true })
        .eq('user_id', userId)
        .is('read_at', null)
      if (error) throw new AppError(errorMessage(error))
      return count ?? 0
    },
  })
}

export function useNotificationList(userId: string, limit: number) {
  return useQuery({
    queryKey: notificationKeys.list(limit),
    placeholderData: keepPreviousData,
    queryFn: async () =>
      unwrap(
        await supabase
          .from('notifications')
          .select('*')
          .eq('user_id', userId)
          .order('created_at', { ascending: false })
          .order('id', { ascending: false })
          .limit(limit),
      ),
  })
}

export function useNotificationActions(userId: string) {
  const queryClient = useQueryClient()

  const patch = useCallback(
    (fn: (list: Notification[]) => Notification[], unreadDelta: (count: number) => number) => {
      queryClient.setQueriesData<Notification[]>({ queryKey: notificationKeys.lists }, (old) => (old ? fn(old) : old))
      queryClient.setQueryData<number>(notificationKeys.unread, (old) => (old === undefined ? old : Math.max(0, unreadDelta(old))))
    },
    [queryClient],
  )

  const settle = useCallback(() => queryClient.invalidateQueries({ queryKey: keys.notifications }), [queryClient])

  const markRead = useCallback(
    async (n: Notification) => {
      if (n.read_at) return
      const now = new Date().toISOString()
      patch(
        (list) => list.map((x) => (x.id === n.id ? { ...x, read_at: now } : x)),
        (c) => c - 1,
      )
      const { error } = await supabase.from('notifications').update({ read_at: now }).eq('id', n.id)
      if (error) toast.error(errorMessage(error))
      void settle()
    },
    [patch, settle],
  )

  const markAllRead = useCallback(async () => {
    const now = new Date().toISOString()
    patch(
      (list) => list.map((x) => (x.read_at ? x : { ...x, read_at: now })),
      () => 0,
    )
    const { error } = await supabase.from('notifications').update({ read_at: now }).eq('user_id', userId).is('read_at', null)
    if (error) toast.error(errorMessage(error))
    void settle()
  }, [patch, settle, userId])

  const remove = useCallback(
    async (n: Notification) => {
      patch(
        (list) => list.filter((x) => x.id !== n.id),
        (c) => (n.read_at ? c : c - 1),
      )
      const { error } = await supabase.from('notifications').delete().eq('id', n.id)
      if (error) toast.error(errorMessage(error))
      void settle()
    },
    [patch, settle],
  )

  return { markRead, markAllRead, remove }
}
