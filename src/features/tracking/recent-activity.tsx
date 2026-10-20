import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { AnimatePresence, motion } from 'motion/react'
import { Clock, History, ListChecks, RotateCw, Timer, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { keys, useCurriculum } from '@/lib/data'
import { formatDay, formatMinutes } from '@/lib/dates'
import { subjectColor, type Subject } from '@/lib/exam'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { formatCount, invalidateActivity, type LogRow, type SessionRow } from './stats'
import { subjectName } from './subjects'

const LIMIT = 10

type Entry =
  | { kind: 'session'; id: number; date: string; created: string; row: SessionRow }
  | { kind: 'questions'; id: number; date: string; created: string; row: LogRow }

function useRecent(studentId: string) {
  const sessions = useQuery({
    queryKey: [...keys.sessions(studentId), 'recent', LIMIT],
    enabled: Boolean(studentId),
    queryFn: async () =>
      unwrap(
        await supabase
          .from('study_sessions')
          .select('id, subject_id, topic_id, minutes, studied_on, source, created_at')
          .eq('student_id', studentId)
          .order('studied_on', { ascending: false })
          .order('created_at', { ascending: false })
          .limit(LIMIT),
      ),
  })
  const logs = useQuery({
    queryKey: [...keys.questions(studentId), 'recent', LIMIT],
    enabled: Boolean(studentId),
    queryFn: async () =>
      unwrap(
        await supabase
          .from('question_logs')
          .select('id, subject_id, topic_id, correct, wrong, blank, solved_on, created_at')
          .eq('student_id', studentId)
          .order('solved_on', { ascending: false })
          .order('created_at', { ascending: false })
          .limit(LIMIT),
      ),
  })
  const entries: Entry[] | undefined =
    sessions.data && logs.data
      ? [
          ...sessions.data.map((row): Entry => ({ kind: 'session', id: row.id, date: row.studied_on, created: row.created_at, row })),
          ...logs.data.map((row): Entry => ({ kind: 'questions', id: row.id, date: row.solved_on, created: row.created_at, row })),
        ]
          .sort((a, b) => b.date.localeCompare(a.date) || b.created.localeCompare(a.created))
          .slice(0, LIMIT)
      : undefined
  return {
    entries,
    isPending: sessions.isPending || logs.isPending,
    error: sessions.error ?? logs.error,
    refetch: () => Promise.all([sessions.refetch(), logs.refetch()]),
  }
}

export function RecentActivity({ studentId, canEdit }: { studentId: string; canEdit: boolean }) {
  const queryClient = useQueryClient()
  const curriculum = useCurriculum()
  const { entries, isPending, error, refetch } = useRecent(studentId)
  const [pending, setPending] = useState<Entry | null>(null)

  const remove = useMutation({
    mutationFn: async (entry: Entry) => {
      const table = entry.kind === 'session' ? 'study_sessions' : 'question_logs'
      unwrap(await supabase.from(table).delete().eq('id', entry.id))
    },
    onSuccess: () => {
      invalidateActivity(queryClient, studentId)
      toast.success('Kayıt silindi')
    },
    onError: (err) => toast.error(errorMessage(err)),
  })

  const groups: { date: string; items: Entry[] }[] = []
  for (const e of entries ?? []) {
    const last = groups[groups.length - 1]
    if (last?.date === e.date) last.items.push(e)
    else groups.push({ date: e.date, items: [e] })
  }

  return (
    <Card>
      <CardHeader title="Son kayıtlar" description={canEdit ? 'Yanlış girdiğin bir kaydı buradan silebilirsin.' : undefined} />
      <div className="px-4 pt-3 pb-2 sm:px-5 sm:pb-3">
        {isPending ? (
          <div className="space-y-3 py-2" aria-busy="true" aria-label="Yükleniyor">
            {[0, 1, 2, 3].map((i) => (
              <div key={i} className="flex items-center gap-3">
                <Skeleton className="size-10 shrink-0" />
                <div className="flex-1 space-y-2">
                  <Skeleton className="h-3.5 w-2/5" />
                  <Skeleton className="h-3 w-3/5" />
                </div>
              </div>
            ))}
          </div>
        ) : error ? (
          <div className="flex flex-col items-center gap-3 py-8 text-center">
            <p className="text-sm text-muted">{errorMessage(error)}</p>
            <Button variant="secondary" size="sm" onClick={() => void refetch()}>
              <RotateCw />
              Tekrar dene
            </Button>
          </div>
        ) : groups.length === 0 ? (
          <EmptyState
            icon={History}
            title="Henüz kayıt yok"
            description="Soru ve çalışma kayıtları girildikçe burada listelenir."
            className="mb-2 py-8"
          />
        ) : (
          <div className="space-y-1">
            {groups.map((group) => (
              <section key={group.date}>
                <h4 className="pt-2 pb-1 font-sans text-xs font-semibold tracking-wide text-muted uppercase">{formatDay(group.date)}</h4>
                <ul className="divide-y divide-line">
                  <AnimatePresence initial={false}>
                    {group.items.map((entry, i) => (
                      <motion.li
                        key={`${entry.kind}-${entry.id}`}
                        layout
                        initial={{ opacity: 0, y: 4 }}
                        animate={{ opacity: 1, y: 0, transition: { delay: Math.min(i, 6) * 0.03 } }}
                        exit={{ opacity: 0, height: 0 }}
                        transition={{ duration: 0.2 }}
                      >
                        <Row
                          entry={entry}
                          subject={curriculum.data?.subjectById.get(entry.row.subject_id ?? '')}
                          topic={entry.row.topic_id ? curriculum.data?.topicById.get(entry.row.topic_id)?.name : undefined}
                          onDelete={canEdit ? () => setPending(entry) : undefined}
                        />
                      </motion.li>
                    ))}
                  </AnimatePresence>
                </ul>
              </section>
            ))}
          </div>
        )}
      </div>

      <Confirm
        open={pending != null}
        onOpenChange={(open) => !open && setPending(null)}
        title="Kaydı sil"
        description="Bu kayıt istatistiklerden çıkarılır. Geri alınamaz."
        confirmLabel="Sil"
        onConfirm={async () => {
          if (pending) await remove.mutateAsync(pending).catch(() => {})
        }}
      />
    </Card>
  )
}

function Row({
  entry,
  subject,
  topic,
  onDelete,
}: {
  entry: Entry
  subject: Subject | undefined
  topic?: string
  onDelete?: () => void
}) {
  const color = subjectColor(subject)
  const Icon = entry.kind === 'questions' ? ListChecks : entry.row.source === 'timer' ? Timer : Clock
  const name = subject ? subjectName(subject, { exam: true }) : 'Genel çalışma'

  let amount: string
  let detail: string
  if (entry.kind === 'questions') {
    const { correct, wrong, blank } = entry.row
    amount = `${formatCount(correct + wrong + blank)} soru`
    detail = `${correct} D · ${wrong} Y · ${blank} B`
  } else {
    amount = formatMinutes(entry.row.minutes)
    detail = entry.row.source === 'timer' ? 'Sayaç' : 'Elle eklendi'
  }

  return (
    <div className="flex min-h-14 items-center gap-3 py-2">
      <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-surface-2" style={{ color }}>
        <Icon className="size-5" aria-hidden />
      </span>
      <div className="min-w-0 flex-1">
        <p className="flex items-baseline justify-between gap-3">
          <span className="truncate text-[15px] font-semibold">{name}</span>
          <span className="tabular shrink-0 text-[15px] font-bold">{amount}</span>
        </p>
        <p className="truncate text-[13px] text-muted">
          {detail}
          {topic && ` · ${topic}`}
        </p>
      </div>
      {onDelete && (
        <Button variant="ghost" size="icon" onClick={onDelete} aria-label={`${name} kaydını sil`} className="-mr-2 text-muted hover:text-danger">
          <Trash2 />
        </Button>
      )}
    </div>
  )
}
