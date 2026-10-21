import { motion } from 'motion/react'
import { BookOpenCheck, CircleAlert, ListChecks, RotateCcw, Search } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Input } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useCurriculum } from '@/lib/data'
import { examKindsFor, examLabel, subjectsFor, type ExamKind, type Field, type Topic, type Track } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { fold } from '@/lib/text'
import { matchesFilter, nextStatus, statusMeta, type TopicFilter, type TopicState } from './status'
import { SubjectCard } from './subject-card'
import { TopicSummary, type TopicCounts } from './topic-summary'
import { useSetTopicStatus, useTopicAccuracy, useTopicProgress } from './use-topics'

type Props = {
  studentId: string
  student: { track: Track; field: Field | null }
  canEdit: boolean
}

const filterEmpty: Record<Exclude<TopicFilter, 'all'>, { title: string; description: string }> = {
  missing: { title: 'Eksik konu kalmadı', description: 'Bu sınavdaki tüm konular tamam olarak işaretli.' },
  review: { title: 'Tekrar bekleyen konu yok', description: 'Tekrar lazım olarak işaretlenen konular burada görünür.' },
}

function toggled<T>(set: ReadonlySet<T>, value: T) {
  const next = new Set(set)
  if (next.has(value)) next.delete(value)
  else next.add(value)
  return next
}

export function TopicMap({ studentId, student, canEdit }: Props) {
  const curriculum = useCurriculum()
  const progress = useTopicProgress(studentId)
  const accuracy = useTopicAccuracy(studentId)
  const setStatus = useSetTopicStatus(studentId)

  const kinds = examKindsFor(student)
  const [kindChoice, setKindChoice] = useState<ExamKind>(kinds[0])
  const kind = kinds.includes(kindChoice) ? kindChoice : kinds[0]
  const [filter, setFilter] = useState<TopicFilter>('all')
  const [opened, setOpened] = useState<ReadonlySet<string>>(() => new Set())
  const [collapsed, setCollapsed] = useState<ReadonlySet<string>>(() => new Set())
  const [touched, setTouched] = useState<ReadonlySet<number>>(() => new Set())
  const [announcement, setAnnouncement] = useState('')
  const [query, setQuery] = useState('')

  if (curriculum.isPending || progress.isPending) return <TopicMapSkeleton tabs={kinds.length > 1} />

  if (curriculum.isError || progress.isError) {
    return (
      <div role="alert" className="flex flex-col items-start gap-3 rounded-2xl border border-line bg-surface p-5 shadow-card sm:flex-row sm:items-center">
        <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-danger-soft text-danger">
          <CircleAlert className="size-5" aria-hidden />
        </span>
        <div className="min-w-0 flex-1">
          <p className="font-semibold">Konular yüklenemedi</p>
          <p className="mt-0.5 text-sm text-muted">{errorMessage(curriculum.error ?? progress.error)}</p>
        </div>
        <Button
          variant="secondary"
          onClick={() => {
            if (curriculum.isError) void curriculum.refetch()
            if (progress.isError) void progress.refetch()
          }}
        >
          Tekrar dene
        </Button>
      </div>
    )
  }

  const statusById = new Map<number, TopicState>(progress.data.map((row) => [row.topic_id, row.status]))
  const statusOf = (topicId: number) => statusById.get(topicId) ?? 'none'

  const groups = subjectsFor(curriculum.data.subjects, kind, student.field)
    .map((subject) => ({ subject, topics: curriculum.data.topicsBySubject.get(subject.id) ?? [] }))
    .filter((g) => g.topics.length > 0)

  const counts: TopicCounts = { total: 0, done: 0, learning: 0, review: 0 }
  for (const g of groups) {
    for (const t of g.topics) {
      counts.total++
      const s = statusOf(t.id)
      if (s !== 'none') counts[s]++
    }
  }

  const hasAccuracy = groups.some((g) => g.topics.some((t) => (accuracy.data?.[t.id]?.total ?? 0) > 0))

  const search = fold(query)
  const visibleGroups = groups
    .map((g) => {
      const byStatus =
        filter === 'all' ? g.topics : g.topics.filter((t) => matchesFilter(filter, statusOf(t.id)) || touched.has(t.id))
      return { ...g, visible: search ? byStatus.filter((t) => fold(t.name).includes(search)) : byStatus }
    })
    .filter((g) => g.visible.length > 0)

  const changeFilter = (next: TopicFilter) => {
    setFilter(next)
    setTouched(new Set())
    setCollapsed(new Set())
  }

  const changeKind = (next: ExamKind) => {
    setKindChoice(next)
    setTouched(new Set())
  }

  const cycle = (topic: Topic, topics: Topic[], subjectName: string) => {
    const next = nextStatus(statusOf(topic.id))
    if (filter !== 'all') setTouched((prev) => new Set(prev).add(topic.id))
    setStatus.mutate({ topicId: topic.id, status: next })
    setAnnouncement(`${topic.name}: ${statusMeta[next].label}`)
    if (next === 'done' && topics.every((t) => t.id === topic.id || statusOf(t.id) === 'done')) {
      toast.success(`${subjectName} dersindeki tüm konular tamam`)
    }
  }

  return (
    <div className="space-y-4 sm:space-y-5">
      <p className="sr-only" aria-live="polite">
        {announcement}
      </p>

      {kinds.length > 1 && (
        <Segmented
          options={kinds.map((k) => ({ value: k, label: examLabel[k] }))}
          value={kind}
          onChange={changeKind}
          className="sm:max-w-sm"
        />
      )}

      {groups.length === 0 ? (
        <EmptyState
          icon={BookOpenCheck}
          title="Bu sınav için konu listesi yok"
          description="Konu listesi eklendiğinde burada görünecek."
        />
      ) : (
        <>
          <TopicSummary counts={counts} canEdit={canEdit} showAccuracyHint={hasAccuracy} />

          <div className="flex flex-wrap items-center justify-between gap-x-4 gap-y-3 pt-1">
            <h2 className="text-lg font-bold">Dersler</h2>
            <Segmented
              size="sm"
              options={[
                { value: 'all', label: 'Hepsi' },
                { value: 'missing', label: 'Eksikler' },
                { value: 'review', label: 'Tekrar lazım', badge: counts.review || undefined },
              ]}
              value={filter}
              onChange={changeFilter}
              className="w-full sm:w-auto"
            />
          </div>

          <div className="relative">
            <Search className="pointer-events-none absolute top-1/2 left-3.5 size-4 -translate-y-1/2 text-muted" aria-hidden />
            <Input
              type="search"
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Konu ara"
              aria-label="Konu ara"
              className="pl-10"
            />
          </div>

          {visibleGroups.length === 0 && search ? (
            <EmptyState
              icon={Search}
              title="Konu bulunamadı"
              description="Yazımı kontrol et ya da konunun adından bir parça yaz. Türkçe karakter şart değil."
              action={
                <Button variant="secondary" onClick={() => setQuery('')}>
                  Aramayı temizle
                </Button>
              }
            />
          ) : visibleGroups.length === 0 && filter !== 'all' ? (
            <EmptyState
              icon={filter === 'review' ? RotateCcw : ListChecks}
              title={filterEmpty[filter].title}
              description={filterEmpty[filter].description}
              action={
                <Button variant="secondary" onClick={() => changeFilter('all')}>
                  Hepsini göster
                </Button>
              }
            />
          ) : (
            <ul className="space-y-3">
              {visibleGroups.map((g, i) => {
                const open = search ? true : filter === 'all' ? opened.has(g.subject.id) : !collapsed.has(g.subject.id)
                return (
                  <motion.li
                    key={g.subject.id}
                    initial={{ opacity: 0, y: 8 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.25, delay: Math.min(i * 0.035, 0.25), ease: 'easeOut' }}
                  >
                    <SubjectCard
                      subject={g.subject}
                      topics={g.topics}
                      visible={g.visible}
                      statusOf={statusOf}
                      accuracy={accuracy.data}
                      open={open}
                      onToggle={() =>
                        filter === 'all'
                          ? setOpened((prev) => toggled(prev, g.subject.id))
                          : setCollapsed((prev) => toggled(prev, g.subject.id))
                      }
                      onCycle={canEdit ? (topic) => cycle(topic, g.topics, g.subject.name) : undefined}
                    />
                  </motion.li>
                )
              })}
            </ul>
          )}
        </>
      )}
    </div>
  )
}

function TopicMapSkeleton({ tabs }: { tabs: boolean }) {
  return (
    <div className="space-y-4 sm:space-y-5" aria-busy="true" aria-label="Yükleniyor">
      {tabs && <Skeleton className="h-11 sm:max-w-sm" />}
      <Skeleton className="h-48 rounded-2xl sm:h-40" />
      <div className="flex flex-wrap items-center justify-between gap-3 pt-1">
        <Skeleton className="h-7 w-24" />
        <Skeleton className="h-10 w-full sm:w-72" />
      </div>
      <div className="space-y-3">
        {Array.from({ length: 5 }, (_, i) => (
          <Skeleton key={i} className="h-[88px] rounded-2xl" />
        ))}
      </div>
    </div>
  )
}
