import { useQueryClient } from '@tanstack/react-query'
import { AnimatePresence, motion } from 'motion/react'
import { ArrowDown, ArrowLeft, Lock, MessageCircle, UserRound, UserPlus } from 'lucide-react'
import { useCallback, useMemo, useState, type CSSProperties } from 'react'
import { Link, useParams } from 'react-router'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { useAuth } from '@/features/auth/session'
import { keys } from '@/lib/data'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { Composer, ComposerDock } from './composer'
import { flatten, isChannel, patchThread, upsertMessage, useThreadMessages, useThreadMeta, type Channel, type Message } from './lib'
import { useLiveMessages, useMarkRead, useThreadScroll } from './thread-hooks'
import { MessageList } from './message-list'

let tempSeq = 0

export default function ThreadPage() {
  const { studentId, channel } = useParams()
  if (!studentId || !isChannel(channel)) return <NotFoundThread />
  return <Thread key={`${studentId}:${channel}`} studentId={studentId} channel={channel} />
}

function NotFoundThread() {
  return (
    <EmptyState
      icon={MessageCircle}
      title="Bu sohbet bulunamadı"
      description="Bağlantı hatalı olabilir ya da bu sohbete erişimin yok."
      action={
        <Button asChild variant="secondary">
          <Link to="/app/mesajlar">Mesajlara dön</Link>
        </Button>
      }
    />
  )
}

function Thread({ studentId, channel }: { studentId: string; channel: Channel }) {
  const { profile, children } = useAuth()
  const me = profile!.id
  const role = profile!.role
  const queryClient = useQueryClient()
  const meta = useThreadMeta(studentId, channel)

  const allowed =
    role === 'student'
      ? studentId === me && channel === 'student'
      : role === 'parent'
        ? channel === 'parent' && children.some((c) => c.id === studentId)
        : meta.data?.student.teacher_id === me

  const messages = useThreadMessages(studentId, channel, Boolean(allowed))
  const list = useMemo(() => flatten(messages.data), [messages.data])
  const [composerHeight, setComposerHeight] = useState(72)

  const people = meta.data?.people ?? {}
  const nameOf = useCallback(
    (id: string) => meta.data?.people[id]?.full_name ?? (channel === 'parent' ? 'Veli' : 'Öğrenci'),
    [meta.data, channel],
  )

  useLiveMessages(studentId, channel, me, Boolean(allowed))
  useMarkRead(studentId, channel, me, list)
  const { stuck, showNew, scrollToBottom, topRef } = useThreadScroll(list, me, messages)

  const send = useCallback(
    async (body: string, previous?: Message) => {
      const temp: Message = {
        id: -++tempSeq,
        clientKey: previous?.clientKey ?? `tmp-${tempSeq}`,
        student_id: studentId,
        channel,
        sender_id: me,
        body,
        created_at: new Date().toISOString(),
        status: 'sending',
      }
      patchThread(queryClient, studentId, channel, (l) => [temp, ...l.filter((m) => m.id !== previous?.id)])
      requestAnimationFrame(() => scrollToBottom('smooth'))
      try {
        const row = unwrap(await supabase.from('messages').insert({ student_id: studentId, channel, body }).select().single())
        patchThread(queryClient, studentId, channel, (l) => upsertMessage(l, row, temp.id))
        void queryClient.invalidateQueries({ queryKey: keys.inbox })
      } catch (e) {
        patchThread(queryClient, studentId, channel, (l) => {
          const failed = { ...temp, status: 'failed' as const }
          return l.some((m) => m.id === temp.id) ? l.map((m) => (m.id === temp.id ? failed : m)) : [failed, ...l]
        })
        toast.error(errorMessage(e))
      }
    },
    [queryClient, studentId, channel, me, scrollToBottom],
  )

  if (meta.isPending || (allowed && messages.isPending)) return <ThreadSkeleton />
  if (meta.isError) {
    return (
      <EmptyState
        icon={MessageCircle}
        title="Sohbet yüklenemedi"
        description={errorMessage(meta.error)}
        action={
          <Button variant="secondary" onClick={() => void meta.refetch()}>
            Tekrar dene
          </Button>
        }
      />
    )
  }
  if (!meta.data || !allowed) return <NotFoundThread />

  const studentName = people[studentId]?.full_name ?? 'Öğrenci'
  const teacherName = people[meta.data.student.teacher_id]?.full_name ?? 'Öğretmen'
  const parentNames = meta.data.parentIds.map((id) => people[id]?.full_name).filter(Boolean) as string[]
  const noParents = role === 'teacher' && channel === 'parent' && meta.data.parentIds.length === 0
  const direct = role === 'student' || (role === 'parent' && children.length === 1)

  const header =
    role === 'teacher'
      ? {
          title: studentName,
          suffix: channel === 'student' ? 'Öğrenci' : 'Veliler',
          subtitle: channel === 'parent' ? parentNames.join(', ') || 'Bağlı veli yok' : lastSeen(people[studentId]),
          avatar: studentName,
        }
      : {
          title: teacherName,
          suffix: undefined,
          subtitle: role === 'student' ? 'Öğretmenin' : `Öğretmen · ${studentName}`,
          avatar: teacherName,
        }

  const privacy =
    channel === 'student'
      ? role === 'teacher'
        ? 'Bu sohbeti sadece sen ve öğrencin görürsünüz.'
        : 'Bu sohbeti sadece sen ve öğretmenin görürsünüz.'
      : 'Bu sohbeti öğretmen ve bağlı veliler görür. Öğrenci görmez.'

  const placeholder =
    role === 'teacher' ? (channel === 'student' ? `${studentName} için mesaj yaz` : 'Velilere mesaj yaz') : role === 'student' ? 'Öğretmenine mesaj yaz' : 'Öğretmene mesaj yaz'

  return (
    <div>
      <div className="sticky top-[calc(3.5rem+env(safe-area-inset-top))] z-20 -mx-4 -mt-5 mb-2 border-b border-line bg-bg px-2 py-2 sm:-mx-6 sm:-mt-8 sm:px-4 lg:top-16">
        <div className="flex items-center gap-2">
          <Button asChild variant="ghost" size="icon" aria-label="Geri">
            <Link to={direct ? '/app' : '/app/mesajlar'}>
              <ArrowLeft className="!size-5" />
            </Link>
          </Button>
          <Avatar name={header.avatar} className="size-9 text-xs" />
          <div className="min-w-0 flex-1">
            <h1 className="truncate font-display text-base leading-tight font-bold sm:text-lg">
              {header.title}
              {header.suffix && <span className="font-semibold text-muted"> · {header.suffix}</span>}
            </h1>
            {header.subtitle && <p className="truncate text-xs text-muted">{header.subtitle}</p>}
          </div>
          {role === 'teacher' && (
            <Button asChild variant="ghost" size="icon" aria-label="Öğrenci sayfası">
              <Link to={`/app/ogrenciler/${studentId}`}>
                <UserRound className="!size-5" />
              </Link>
            </Button>
          )}
        </div>
      </div>

      <div ref={topRef} aria-hidden className="h-px" />
      {messages.hasNextPage ? (
        <div className="flex justify-center py-3">
          <Button
            variant="ghost"
            size="sm"
            loading={messages.isFetchingNextPage}
            onClick={() => void messages.fetchNextPage()}
            className="text-muted"
          >
            Daha eski mesajlar
          </Button>
        </div>
      ) : (
        <p className="mx-auto my-4 max-w-xs text-center text-xs text-subtle">
          <Lock className="mr-1 inline size-3.5 -translate-y-px" aria-hidden />
          {privacy}
        </p>
      )}

      {messages.isError ? (
        <div className="py-10 text-center">
          <p className="text-sm text-muted">{errorMessage(messages.error)}</p>
          <Button variant="secondary" size="sm" className="mt-4" onClick={() => void messages.refetch()}>
            Tekrar dene
          </Button>
        </div>
      ) : list.length === 0 ? (
        <div className="flex flex-col items-center px-6 py-14 text-center">
          <span className="grid size-12 place-items-center rounded-2xl bg-primary-soft text-primary-soft-fg">
            <MessageCircle className="size-6" />
          </span>
          <h2 className="mt-4 text-base font-bold">Henüz mesaj yok</h2>
          <p className="mt-1 max-w-xs text-sm text-muted">
            {noParents
              ? 'Veli bağlandığında buradan yazışabilirsin.'
              : role === 'teacher'
                ? channel === 'student'
                  ? 'İlk mesajı yaz, öğrencine bildirim gider.'
                  : 'İlk mesajı yaz, velilere bildirim gider.'
                : 'İlk mesajı yaz, öğretmenine bildirim gider.'}
          </p>
        </div>
      ) : (
        <MessageList
          messages={list}
          me={me}
          nameOf={nameOf}
          showNames={channel === 'parent'}
          onRetry={(m) => void send(m.body, m)}
        />
      )}

      <div aria-hidden style={{ height: composerHeight + 8 }} />

      <AnimatePresence>
        {!stuck && (
          <motion.div
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: 8 }}
            transition={{ duration: 0.18 }}
            className="fixed right-4 bottom-[calc(var(--dock)+4rem+env(safe-area-inset-bottom))] z-30 lg:right-8 lg:bottom-[var(--dock)]"
            style={{ '--dock': `${composerHeight + 12}px` } as CSSProperties}
          >
            <Button
              variant="secondary"
              size={showNew ? 'sm' : 'icon'}
              className="rounded-full shadow-pop"
              aria-label="En alta in"
              onClick={() => scrollToBottom('smooth')}
            >
              <ArrowDown />
              {showNew && 'Yeni mesaj'}
            </Button>
          </motion.div>
        )}
      </AnimatePresence>

      {noParents ? (
        <ComposerDock onHeight={setComposerHeight}>
          <div className="flex items-center gap-3">
            <p className="min-w-0 flex-1 text-sm text-muted">Bu öğrencinin bağlı velisi yok.</p>
            <Button asChild variant="soft" size="sm">
              <Link to={`/app/ogrenciler/${studentId}`}>
                <UserPlus />
                Veli davet et
              </Link>
            </Button>
          </div>
        </ComposerDock>
      ) : (
        <Composer onSend={(body) => void send(body)} onHeight={setComposerHeight} placeholder={placeholder} />
      )}
    </div>
  )
}

function lastSeen(person: { last_seen_at?: string | null } | undefined) {
  if (!person?.last_seen_at) return undefined
  const diff = Date.now() - Date.parse(person.last_seen_at)
  if (diff < 15 * 60 * 1000) return 'Az önce uygulamadaydı'
  const hours = Math.round(diff / 3_600_000)
  if (hours < 24) return `${Math.max(1, hours)} saat önce uygulamadaydı`
  const days = Math.round(hours / 24)
  return `${days} gün önce uygulamadaydı`
}

function ThreadSkeleton() {
  return (
    <div className="space-y-3" aria-busy="true" aria-label="Yükleniyor">
      <div className="flex items-center gap-3">
        <Skeleton className="size-9 rounded-full" />
        <Skeleton className="h-5 w-40" />
      </div>
      <div className="space-y-3 pt-6">
        <Skeleton className="h-14 w-2/3" />
        <Skeleton className="ml-auto h-10 w-1/2" />
        <Skeleton className="h-20 w-3/4" />
        <Skeleton className="ml-auto h-12 w-2/5" />
      </div>
    </div>
  )
}
