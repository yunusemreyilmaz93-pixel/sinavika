import { useQuery } from '@tanstack/react-query'
import { motion } from 'motion/react'
import { MessageCircle, Search, UserPlus, UserRound } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Link, Navigate } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Input } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { useAuth, type Child } from '@/features/auth/session'
import { useNow } from '@/features/meetings/next-meeting'
import { cn } from '@/lib/cn'
import { keys } from '@/lib/data'
import { fold } from '@/lib/text'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { firstName, loadSummaries, shortStamp, threadLink, type Channel, type ThreadSummary } from './lib'

type Row = {
  studentId: string
  channel: Channel
  title: string
  avatar: string
  avatarId: string
  badge?: string
  subtitle?: string
  search: string
  names: Record<string, string>
  summary: ThreadSummary
}

export default function InboxPage() {
  const { profile, children } = useAuth()
  if (!profile) return null
  if (profile.role === 'student') return <Navigate to={threadLink(profile.id, 'student')} replace />
  if (profile.role === 'parent') {
    if (children.length === 1) return <Navigate to={threadLink(children[0].id, 'parent')} replace />
    return <ParentInbox userId={profile.id} kids={children} />
  }
  return <TeacherInbox userId={profile.id} />
}

async function teacherRows(userId: string): Promise<Row[]> {
  const students = unwrap(
    await supabase.from('students').select('id').eq('teacher_id', userId).is('archived_at', null),
  )
  const ids = students.map((s) => s.id)
  if (!ids.length) return []
  const links = unwrap(await supabase.from('parent_links').select('student_id, parent_id').in('student_id', ids))
  const parentIds = links.map((l) => l.parent_id)
  const threads = ids.flatMap((id) => [
    { studentId: id, channel: 'student' as const },
    ...(links.some((l) => l.student_id === id) ? [{ studentId: id, channel: 'parent' as const }] : []),
  ])
  const [people, summaries] = await Promise.all([
    supabase.from('profiles').select('id, full_name').in('id', [...ids, ...parentIds]),
    loadSummaries(userId, threads),
  ])
  const names = Object.fromEntries(unwrap(people).map((p) => [p.id, p.full_name]))
  return threads.map((t) => {
    const studentName = names[t.studentId] ?? 'Öğrenci'
    const parents = links.filter((l) => l.student_id === t.studentId).map((l) => names[l.parent_id] ?? 'Veli')
    return {
      ...t,
      title: studentName,
      avatar: studentName,
      avatarId: t.studentId,
      badge: t.channel === 'student' ? 'Öğrenci' : 'Veli',
      subtitle: t.channel === 'parent' ? parents.join(', ') : undefined,
      search: fold([studentName, ...(t.channel === 'parent' ? parents : [])].join(' ')),
      names,
      summary: summaries.get(`${t.studentId}:${t.channel}`) ?? { last: null, unread: 0 },
    }
  })
}

async function parentRows(userId: string, kids: Child[]): Promise<Row[]> {
  const threads = kids.map((k) => ({ studentId: k.id, channel: 'parent' as const }))
  const [people, summaries] = await Promise.all([
    supabase.from('profiles').select('id, full_name').in('id', [...new Set(kids.map((k) => k.teacher_id))]),
    loadSummaries(userId, threads),
  ])
  const names = Object.fromEntries(unwrap(people).map((p) => [p.id, p.full_name]))
  return kids.map((k) => {
    const teacher = names[k.teacher_id] ?? 'Öğretmen'
    return {
      studentId: k.id,
      channel: 'parent',
      title: teacher,
      avatar: teacher,
      avatarId: k.teacher_id,
      subtitle: k.full_name,
      search: fold(`${teacher} ${k.full_name}`),
      names,
      summary: summaries.get(`${k.id}:parent`) ?? { last: null, unread: 0 },
    }
  })
}

function sortRows(rows: Row[]) {
  return [...rows].sort((a, b) => {
    const at = a.summary.last?.created_at
    const bt = b.summary.last?.created_at
    if (at && bt) return Date.parse(bt) - Date.parse(at)
    if (at) return -1
    if (bt) return 1
    return a.title.localeCompare(b.title, 'tr') || a.channel.localeCompare(b.channel)
  })
}

function TeacherInbox({ userId }: { userId: string }) {
  const [query, setQuery] = useState('')
  const inbox = useQuery({ queryKey: keys.inbox, queryFn: () => teacherRows(userId) })
  const rows = useMemo(() => sortRows(inbox.data ?? []), [inbox.data])
  const q = fold(query)
  const visible = q ? rows.filter((r) => r.search.includes(q)) : rows
  const unread = rows.reduce((sum, r) => sum + r.summary.unread, 0)
  const now = useNow(60_000)
  const waiting = rows.filter((r) => waitingHours(r, userId, now) !== null).length
  const summary = [unread ? `${unread} okunmamış mesaj` : '', waiting ? `${waiting} sohbet cevap bekliyor` : ''].filter(Boolean).join(' · ')

  return (
    <div>
      <PageHeader title="Mesajlar" description={summary || undefined} />
      {inbox.isPending ? (
        <ListSkeleton />
      ) : inbox.isError ? (
        <ErrorBox message={errorMessage(inbox.error)} onRetry={() => void inbox.refetch()} />
      ) : rows.length === 0 ? (
        <EmptyState
          icon={MessageCircle}
          title="Henüz öğrenciniz yok"
          description="Öğrenci davet ettiğinizde onunla ve velisiyle buradan yazışırsınız."
          action={
            <Button asChild>
              <Link to="/app/davetler">
                <UserPlus />
                Öğrenci davet et
              </Link>
            </Button>
          }
        />
      ) : (
        <>
          <div className="relative mb-3">
            <Search className="pointer-events-none absolute top-1/2 left-3.5 size-4 -translate-y-1/2 text-muted" />
            <Input
              type="search"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="İsimle ara"
              aria-label="Sohbetlerde ara"
              className="pl-10"
            />
          </div>
          {visible.length === 0 ? (
            <p className="rounded-2xl border border-dashed border-line-strong px-4 py-8 text-center text-sm text-muted">
              Bu isimle eşleşen sohbet yok.
            </p>
          ) : (
            <ThreadList rows={visible} userId={userId} now={now} />
          )}
        </>
      )}
    </div>
  )
}

function ParentInbox({ userId, kids }: { userId: string; kids: Child[] }) {
  const inbox = useQuery({
    queryKey: [...keys.inbox, 'parent', kids.map((k) => k.id).join(',')],
    queryFn: () => parentRows(userId, kids),
    enabled: kids.length > 0,
  })
  const rows = useMemo(() => sortRows(inbox.data ?? []), [inbox.data])

  return (
    <div>
      <PageHeader title="Mesajlar" />
      {kids.length === 0 ? (
        <EmptyState
          icon={UserRound}
          title="Bağlı öğrenci yok"
          description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli koduyla çocuğunuzun hesabını bağlayabilirsiniz."
          action={
            <Button asChild variant="secondary">
              <Link to="/app/ayarlar">Ayarlara git</Link>
            </Button>
          }
        />
      ) : inbox.isPending ? (
        <ListSkeleton />
      ) : inbox.isError ? (
        <ErrorBox message={errorMessage(inbox.error)} onRetry={() => void inbox.refetch()} />
      ) : (
        <ThreadList rows={rows} userId={userId} />
      )}
    </div>
  )
}

// Son mesaj karşı taraftansa ve son 7 gün içindeyse sohbet cevap bekler. Öğretmen listesinde gösterilir
function waitingHours(row: Row, userId: string, now: number) {
  const last = row.summary.last
  if (!last || last.sender_id === userId) return null
  const hours = (now - Date.parse(last.created_at)) / 36e5
  return hours < 24 * 7 ? hours : null
}

function ThreadList({ rows, userId, now }: { rows: Row[]; userId: string; now?: number }) {
  return (
    <ul className="overflow-hidden rounded-3xl border border-line bg-surface">
      {rows.map((r, i) => (
        <motion.li
          key={`${r.studentId}:${r.channel}`}
          initial={{ opacity: 0, y: 6 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.2, delay: Math.min(i, 8) * 0.025 }}
          className="border-b border-line last:border-b-0"
        >
          <ThreadRow row={r} userId={userId} waiting={now === undefined ? null : waitingHours(r, userId, now)} />
        </motion.li>
      ))}
    </ul>
  )
}

function ThreadRow({ row, userId, waiting }: { row: Row; userId: string; waiting: number | null }) {
  const { last, unread } = row.summary
  const mine = last?.sender_id === userId
  const prefix = !last ? '' : mine ? 'Siz: ' : row.channel === 'parent' && row.badge ? `${firstName(row.names[last.sender_id] ?? 'Veli')}: ` : ''

  return (
    <Link
      to={threadLink(row.studentId, row.channel)}
      className="flex items-center gap-3 px-4 py-3.5 transition-colors hover:bg-surface-2/60 focus-visible:bg-surface-2 focus-visible:outline-none sm:px-5"
    >
      <Avatar name={row.avatar} userId={row.avatarId} className="size-11" />
      <span className="min-w-0 flex-1">
        <span className="flex items-center gap-2">
          <span className={cn('truncate text-[15px]', unread ? 'font-bold' : 'font-semibold')}>{row.title}</span>
          {row.badge && <Badge tone={row.channel === 'parent' ? 'accent' : 'neutral'}>{row.badge}</Badge>}
          {last && (
            <span className={cn('tabular ml-auto shrink-0 text-xs', unread ? 'font-semibold text-primary' : 'text-subtle')}>
              {shortStamp(last.created_at)}
            </span>
          )}
        </span>
        {row.subtitle && <span className="block truncate text-xs text-muted">{row.subtitle}</span>}
        {waiting !== null && waiting >= 24 && (
          <span className="mt-0.5 block text-xs font-semibold text-warning">{Math.floor(waiting / 24)} gündür cevap bekliyor</span>
        )}
        <span className="mt-0.5 flex items-center gap-2">
          <span className={cn('min-w-0 flex-1 truncate text-sm', unread ? 'font-medium text-fg' : 'text-muted', !last && 'text-subtle')}>
            {last ? prefix + last.body.replace(/\s+/g, ' ') : 'Henüz mesaj yok'}
          </span>
          {unread > 0 && (
            <span className="tabular grid h-5 min-w-5 shrink-0 place-items-center rounded-full bg-primary px-1.5 text-[11px] font-bold text-primary-fg">
              {unread > 99 ? '99+' : unread}
              <span className="sr-only"> okunmamış mesaj</span>
            </span>
          )}
        </span>
      </span>
    </Link>
  )
}

function ListSkeleton() {
  return (
    <div className="space-y-2" aria-busy="true" aria-label="Yükleniyor">
      {[0, 1, 2, 3].map((i) => (
        <div key={i} className="flex items-center gap-3 rounded-2xl border border-line bg-surface p-4">
          <Skeleton className="size-11 shrink-0 rounded-full" />
          <div className="flex-1 space-y-2">
            <Skeleton className="h-4 w-1/2" />
            <Skeleton className="h-3 w-3/4" />
          </div>
        </div>
      ))}
    </div>
  )
}

function ErrorBox({ message, onRetry }: { message: string; onRetry: () => void }) {
  return (
    <div className="rounded-2xl border border-line bg-surface p-6 text-center">
      <p className="text-sm text-muted">{message}</p>
      <Button variant="secondary" size="sm" className="mt-4" onClick={onRetry}>
        Tekrar deneyin
      </Button>
    </div>
  )
}
