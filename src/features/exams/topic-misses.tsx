import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { ChevronDown, Crosshair } from 'lucide-react'
import { useMemo, useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'
import { Stepper } from '@/components/ui/stepper'
import { cn } from '@/lib/cn'
import { useCurriculum, type Curriculum } from '@/lib/data'
import { subjectColor, type ExamKind } from '@/lib/exam'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import type { Score } from './queries'

type Miss = { mock_exam_id: number; topic_id: number; misses: number }

const missKeys = {
  exam: (examId: number) => ['topic-misses', 'exam', examId] as const,
  student: (studentId: string, kind: ExamKind) => ['topic-misses', 'student', studentId, kind] as const,
}

function useExamMisses(examId: number) {
  return useQuery({
    queryKey: missKeys.exam(examId),
    queryFn: async (): Promise<Miss[]> =>
      unwrap(await supabase.from('mock_exam_topic_misses').select('mock_exam_id, topic_id, misses').eq('mock_exam_id', examId)),
  })
}

export function ExamTopicMisses({ examId, scores, canEdit }: { examId: number; scores: Score[]; canEdit: boolean }) {
  const curriculum = useCurriculum()
  const saved = useExamMisses(examId)
  const qc = useQueryClient()
  const [draft, setDraft] = useState<Map<number, number> | null>(null)
  const [openSubject, setOpenSubject] = useState<string | null>(null)

  const subjects = scores.filter((s) => s.wrong + s.blank > 0)
  const current = useMemo(() => draft ?? new Map((saved.data ?? []).map((m) => [m.topic_id, m.misses])), [draft, saved.data])

  const save = useMutation({
    mutationFn: async () => {
      unwrap(await supabase.from('mock_exam_topic_misses').delete().eq('mock_exam_id', examId))
      const rows = [...current]
        .filter(([, n]) => n > 0)
        .map(([topic_id, misses]) => ({
          mock_exam_id: examId,
          topic_id,
          misses,
        }))
      if (rows.length) unwrap(await supabase.from('mock_exam_topic_misses').insert(rows))
    },
    onSuccess: async () => {
      setDraft(null)
      await qc.invalidateQueries({ queryKey: ['topic-misses'] })
      toast.success('Konu analizi kaydedildi')
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  if (!subjects.length) return null
  if (saved.isPending || curriculum.isPending) return <Skeleton className="h-32" />
  if (!curriculum.data) return null

  const topicsOf = (subjectId: string) => curriculum.data.topicsBySubject.get(subjectId) ?? []
  const usedIn = (subjectId: string) => topicsOf(subjectId).reduce((sum, t) => sum + (current.get(t.id) ?? 0), 0)
  const tagged = [...current.values()].some((n) => n > 0)

  if (!canEdit && !tagged) return null

  return (
    <Card>
      <CardHeader
        title="Konu analizi"
        description={
          canEdit
            ? 'Yanlış ve boşlarının hangi konulardan geldiğini işaretle. Hangi konuda takıldığın netleşir.'
            : 'Yanlış ve boşların hangi konulardan geldiği'
        }
      />
      <CardBody className="space-y-2 pt-3">
        {subjects.map((score) => {
          const subject = curriculum.data.subjectById.get(score.subject_id)
          const topics = topicsOf(score.subject_id)
          const limit = score.wrong + score.blank
          const used = usedIn(score.subject_id)
          const open = openSubject === score.subject_id
          const marked = topics.filter((t) => (current.get(t.id) ?? 0) > 0)
          return (
            <div key={score.subject_id} className="rounded-xl border border-line">
              <button
                type="button"
                onClick={() => setOpenSubject(open ? null : score.subject_id)}
                className="flex min-h-12 w-full items-center gap-3 px-3 text-left"
                aria-expanded={open}
              >
                <span className="size-2.5 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(subject) }} aria-hidden />
                <span className="min-w-0 flex-1">
                  <span className="block truncate font-semibold">{subject?.name ?? score.subject_id}</span>
                  <span className="block truncate text-xs text-muted">
                    {marked.length ? marked.map((t) => `${t.name} ${current.get(t.id)}`).join(', ') : 'Konu işaretlenmedi'}
                  </span>
                </span>
                <span className={cn('tabular text-sm font-semibold', used === limit ? 'text-primary' : 'text-muted')}>
                  {used}/{limit}
                </span>
                <ChevronDown className={cn('size-4 shrink-0 text-subtle transition-transform', open && 'rotate-180')} />
              </button>
              {open && (
                <ul className="space-y-1 border-t border-line p-2">
                  {topics.length === 0 && <li className="px-2 py-2 text-sm text-muted">Bu dersin konu listesi yok.</li>}
                  {topics.map((t) => {
                    const value = current.get(t.id) ?? 0
                    return (
                      <li key={t.id} className="flex items-center gap-2 rounded-lg px-2 py-1">
                        <span className="min-w-0 flex-1 text-sm">{t.name}</span>
                        {canEdit ? (
                          <Stepper
                            label={t.name}
                            value={value}
                            max={value + Math.max(0, limit - used)}
                            onChange={(n) => setDraft(new Map(current).set(t.id, n))}
                            className="[&>span:first-child]:sr-only"
                          />
                        ) : (
                          <span className="tabular text-sm font-semibold">{value || '-'}</span>
                        )}
                      </li>
                    )
                  })}
                </ul>
              )}
            </div>
          )
        })}
        {canEdit && draft && (
          <div className="flex justify-end gap-2 pt-2">
            <Button variant="ghost" onClick={() => setDraft(null)}>
              Vazgeç
            </Button>
            <Button loading={save.isPending} onClick={() => save.mutate()}>
              Kaydet
            </Button>
          </div>
        )}
      </CardBody>
    </Card>
  )
}

type Weak = {
  topicId: number
  name: string
  subjectId: string
  misses: number
  exams: number
}

function weakTopics(rows: (Miss & { kind: ExamKind })[], curriculum: Curriculum): Weak[] {
  const map = new Map<number, Weak>()
  for (const r of rows) {
    const topic = curriculum.topicById.get(r.topic_id)
    if (!topic) continue
    const w = map.get(r.topic_id) ?? {
      topicId: r.topic_id,
      name: topic.name,
      subjectId: topic.subject_id,
      misses: 0,
      exams: 0,
    }
    w.misses += r.misses
    w.exams += 1
    map.set(r.topic_id, w)
  }
  return [...map.values()].sort((a, b) => b.misses - a.misses || b.exams - a.exams).slice(0, 6)
}

export function WeakTopicsCard({
  studentId,
  kind,
  examIds,
  className,
}: {
  studentId: string
  kind: ExamKind
  examIds: number[]
  className?: string
}) {
  const curriculum = useCurriculum()
  const misses = useQuery({
    queryKey: [...missKeys.student(studentId, kind), examIds],
    enabled: examIds.length > 0,
    queryFn: async () =>
      unwrap(
        await supabase.from('mock_exam_topic_misses').select('mock_exam_id, topic_id, misses').in('mock_exam_id', examIds),
      ).map((m) => ({
        ...m,
        kind,
      })),
  })

  if (!examIds.length || misses.isPending || !curriculum.data || !misses.data?.length) return null
  const list = weakTopics(misses.data, curriculum.data)
  const top = list[0]?.misses ?? 1

  return (
    <Card className={className}>
      <CardHeader title="En çok takılınan konular" description={`Son ${examIds.length} denemenin konu analizine göre`} />
      <CardBody className="pt-3">
        <ul className="space-y-3">
          {list.map((w) => {
            const subject = curriculum.data.subjectById.get(w.subjectId)
            return (
              <li key={w.topicId}>
                <div className="flex items-baseline justify-between gap-3 text-sm">
                  <span className="min-w-0 truncate font-semibold">{w.name}</span>
                  <span className="tabular shrink-0 text-muted">
                    {w.misses} yanlış ve boş, {w.exams} denemede
                  </span>
                </div>
                <div className="mt-1.5 flex items-center gap-2">
                  <Crosshair className="size-3.5 shrink-0" style={{ color: subjectColor(subject) }} aria-hidden />
                  <div className="h-2 flex-1 overflow-hidden rounded-full bg-surface-2">
                    <div
                      className="h-full rounded-full"
                      style={{
                        width: `${(w.misses / top) * 100}%`,
                        backgroundColor: subjectColor(subject),
                      }}
                    />
                  </div>
                  <span className="w-16 shrink-0 truncate text-right text-xs text-muted">{subject?.short}</span>
                </div>
              </li>
            )
          })}
        </ul>
      </CardBody>
    </Card>
  )
}
