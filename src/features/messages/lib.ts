import { useInfiniteQuery, useQuery, type InfiniteData, type QueryClient } from '@tanstack/react-query'
import { format } from 'date-fns'
import { tr } from 'date-fns/locale'
import { dayOf } from '@/features/notifications/lib'
import { keys } from '@/lib/data'
import { todayISO, shiftDays } from '@/lib/dates'
import { supabase, unwrap, type Enums, type Tables } from '@/lib/supabase'

export type Channel = Enums<'message_channel'>
export type Message = Tables<'messages'> & { status?: 'sending' | 'failed'; clientKey?: string }
export type Person = Pick<Tables<'profiles'>, 'id' | 'full_name' | 'role' | 'last_seen_at'>

export const PAGE_SIZE = 100
export const MAX_LENGTH = 2000

export function isChannel(value: string | undefined): value is Channel {
  return value === 'student' || value === 'parent'
}

export function threadLink(studentId: string, channel: Channel) {
  return `/app/mesajlar/${studentId}/${channel}`
}

export function firstName(name: string) {
  return name.trim().split(/\s+/)[0] ?? name
}

export function shortStamp(ts: string) {
  const day = dayOf(ts)
  const today = todayISO()
  if (day === today) return format(new Date(ts), 'HH:mm', { locale: tr })
  if (day === shiftDays(today, -1)) return 'Dün'
  if (day.slice(0, 4) === today.slice(0, 4)) return format(new Date(ts), 'd MMM', { locale: tr })
  return format(new Date(ts), 'd.MM.yyyy', { locale: tr })
}

export type ThreadMeta = {
  student: { id: string; teacher_id: string; archived_at: string | null }
  parentIds: string[]
  people: Record<string, Person>
}

export function useThreadMeta(studentId: string, channel: Channel) {
  return useQuery({
    queryKey: ['thread', studentId, channel],
    staleTime: 5 * 60 * 1000,
    queryFn: async (): Promise<ThreadMeta | null> => {
      const [student, links] = await Promise.all([
        supabase.from('students').select('id, teacher_id, archived_at').eq('id', studentId).maybeSingle(),
        channel === 'parent'
          ? supabase.from('parent_links').select('parent_id').eq('student_id', studentId)
          : Promise.resolve({ data: [] as { parent_id: string }[], error: null }),
      ])
      const s = unwrap(student)
      if (!s) return null
      const parentIds = unwrap(links).map((l) => l.parent_id)
      const people = unwrap(
        await supabase.from('profiles').select('id, full_name, role, last_seen_at').in('id', [s.teacher_id, s.id, ...parentIds]),
      )
      return { student: s, parentIds, people: Object.fromEntries(people.map((p) => [p.id, p])) }
    },
  })
}

export function useThreadMessages(studentId: string, channel: Channel, enabled: boolean) {
  return useInfiniteQuery({
    queryKey: keys.messages(studentId, channel),
    enabled,
    initialPageParam: null as string | null,
    queryFn: async ({ pageParam }) => {
      let q = supabase
        .from('messages')
        .select('*')
        .eq('student_id', studentId)
        .eq('channel', channel)
        .order('created_at', { ascending: false })
        .order('id', { ascending: false })
        .limit(PAGE_SIZE)
      if (pageParam) q = q.lt('created_at', pageParam)
      return unwrap(await q) as Message[]
    },
    getNextPageParam: (last) => (last.length < PAGE_SIZE ? null : last[last.length - 1].created_at),
  })
}

type Pages = InfiniteData<Message[], string | null>

export function patchThread(
  queryClient: QueryClient,
  studentId: string,
  channel: Channel,
  fn: (messages: Message[]) => Message[],
) {
  queryClient.setQueryData<Pages>(keys.messages(studentId, channel), (old) => {
    if (!old?.pages.length) return old
    const [first, ...rest] = old.pages
    return { ...old, pages: [fn(first), ...rest] }
  })
}

export function upsertMessage(list: Message[], row: Message, replaceId?: number) {
  const replaced = replaceId === undefined ? undefined : list.find((m) => m.id === replaceId)
  const without = replaced ? list.filter((m) => m !== replaced) : list
  if (without.some((m) => m.id === row.id)) return without
  if (replaced) return [{ ...row, clientKey: replaced.clientKey }, ...without]
  if (!row.status) {
    const pending = without.find((m) => m.status === 'sending' && m.sender_id === row.sender_id && m.body === row.body)
    if (pending) return [{ ...row, clientKey: pending.clientKey }, ...without.filter((m) => m !== pending)]
  }
  return [row, ...without]
}

export function flatten(data: InfiniteData<Message[], unknown> | undefined) {
  if (!data) return []
  const seen = new Set<number>()
  const out: Message[] = []
  for (const page of data.pages) {
    for (const m of page) {
      if (seen.has(m.id)) continue
      seen.add(m.id)
      out.push(m)
    }
  }
  return out.sort((a, b) => {
    if (Boolean(a.status) !== Boolean(b.status)) return a.status ? 1 : -1
    if (a.status && b.status) return b.id - a.id
    return Date.parse(a.created_at) - Date.parse(b.created_at) || a.id - b.id
  })
}

export async function markThreadRead(userId: string, studentId: string, channel: Channel, lastAt: string) {
  await Promise.all([
    supabase
      .from('message_reads')
      .upsert({ user_id: userId, student_id: studentId, channel, last_read_at: lastAt }, { onConflict: 'user_id,student_id,channel' }),
    supabase
      .from('notifications')
      .update({ read_at: new Date().toISOString() })
      .eq('user_id', userId)
      .eq('link', threadLink(studentId, channel))
      .is('read_at', null),
  ])
}

export type ThreadRef = { studentId: string; channel: Channel }
export type ThreadSummary = { last: Pick<Message, 'id' | 'body' | 'sender_id' | 'created_at'> | null; unread: number }

export async function loadSummaries(userId: string, threads: ThreadRef[]) {
  const result = new Map<string, ThreadSummary>()
  if (!threads.length) return result
  const ids = [...new Set(threads.map((t) => t.studentId))]
  const reads = unwrap(
    await supabase.from('message_reads').select('student_id, channel, last_read_at').eq('user_id', userId).in('student_id', ids),
  )
  const readAt = new Map(reads.map((r) => [`${r.student_id}:${r.channel}`, r.last_read_at]))
  const epoch = '1970-01-01T00:00:00Z'
  const since = threads
    .map((t) => readAt.get(`${t.studentId}:${t.channel}`) ?? epoch)
    .reduce((min, v) => (v < min ? v : min))

  const [latest, unread] = await Promise.all([
    Promise.all(
      threads.map((t) =>
        supabase
          .from('messages')
          .select('id, body, sender_id, created_at')
          .eq('student_id', t.studentId)
          .eq('channel', t.channel)
          .order('created_at', { ascending: false })
          .limit(1)
          .maybeSingle(),
      ),
    ),
    supabase
      .from('messages')
      .select('student_id, channel, created_at')
      .in('student_id', ids)
      .neq('sender_id', userId)
      .gt('created_at', since)
      .order('created_at', { ascending: false })
      .limit(1000),
  ])
  const unreadRows = unwrap(unread)
  threads.forEach((t, i) => {
    const key = `${t.studentId}:${t.channel}`
    const lastRead = readAt.get(key) ?? epoch
    result.set(key, {
      last: unwrap(latest[i]),
      unread: unreadRows.filter((r) => r.student_id === t.studentId && r.channel === t.channel && r.created_at > lastRead).length,
    })
  })
  return result
}
