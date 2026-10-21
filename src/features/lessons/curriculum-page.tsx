import { BookOpen, ChevronDown, Search } from 'lucide-react'
import { useState } from 'react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { EmptyState } from '@/components/ui/empty-state'
import { Input } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { examLabel, subjectColor, subjectsFor, type ExamKind } from '@/lib/exam'
import { fold } from '@/lib/text'
import { useLessonIndex } from './queries'

const KINDS: ExamKind[] = ['LGS', 'TYT', 'AYT', 'YDT']

export default function CurriculumPage() {
  const curriculum = useCurriculum()
  const lessons = useLessonIndex()
  const [kind, setKind] = useState<ExamKind>('LGS')
  const [query, setQuery] = useState('')
  const [open, setOpen] = useState<ReadonlySet<string>>(() => new Set())

  const search = fold(query)
  const groups = (curriculum.data ? subjectsFor(curriculum.data.subjects, kind, null) : [])
    .map((subject) => ({ subject, topics: curriculum.data?.topicsBySubject.get(subject.id) ?? [] }))
    .map((g) => ({ ...g, visible: search ? g.topics.filter((t) => fold(t.name).includes(search)) : g.topics }))
    .filter((g) => g.visible.length > 0)

  const toggle = (id: string) =>
    setOpen((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else next.add(id)
      return next
    })

  return (
    <div className="max-w-3xl">
      <PageHeader title="Müfredat" description="Konu anlatımlarını öğrenci gibi okuyabilir, örnek soruları çözebilirsiniz. Çözümleriniz kaydedilmez." />

      <div className="space-y-4">
        <Segmented options={KINDS.map((k) => ({ value: k, label: examLabel[k] }))} value={kind} onChange={setKind} className="sm:max-w-sm" />

        <div className="relative">
          <Search className="pointer-events-none absolute top-1/2 left-3.5 size-4 -translate-y-1/2 text-muted" aria-hidden />
          <Input type="search" value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Konu ara" aria-label="Konu ara" className="pl-10" />
        </div>

        {curriculum.isPending ? (
          <div className="space-y-3">
            {Array.from({ length: 4 }, (_, i) => (
              <Skeleton key={i} className="h-16 rounded-2xl" />
            ))}
          </div>
        ) : groups.length === 0 ? (
          <EmptyState icon={Search} title="Konu bulunamadı" description="Konunun adından bir parça yazın. Türkçe karakter şart değil." />
        ) : (
          <ul className="space-y-3">
            {groups.map(({ subject, topics, visible }) => {
              const isOpen = search ? true : open.has(subject.id)
              const ready = topics.filter((t) => lessons.data?.get(t.id) !== undefined).length
              return (
                <li key={subject.id} className="overflow-hidden rounded-2xl border border-line bg-surface shadow-card">
                  <h2>
                    <button
                      type="button"
                      aria-expanded={isOpen}
                      onClick={() => toggle(subject.id)}
                      className="flex min-h-14 w-full items-center gap-3 px-4 py-3 text-left hover:bg-surface-2/60 sm:px-5"
                    >
                      <span aria-hidden className="size-2.5 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(subject) }} />
                      <span className="min-w-0 flex-1">
                        <span className="block font-display text-[15px] leading-snug font-bold sm:text-base">{subject.name}</span>
                        <span className="tabular text-sm text-muted">
                          {ready}/{topics.length} konuda anlatım var
                        </span>
                      </span>
                      <ChevronDown aria-hidden className={cn('size-5 shrink-0 text-muted transition-transform duration-200', isOpen && 'rotate-180')} />
                    </button>
                  </h2>
                  {isOpen && (
                    <ul className="divide-y divide-line border-t border-line">
                      {visible.map((topic) => {
                        const published = lessons.data?.get(topic.id)
                        return (
                          <li key={topic.id} className="flex items-center gap-3 px-4 py-1 sm:px-5">
                            <p className="min-w-0 flex-1 py-2 text-[15px] leading-snug font-medium">{topic.name}</p>
                            {published === undefined ? (
                              <span className="shrink-0 text-sm text-subtle">Hazırlanıyor</span>
                            ) : (
                              <div className="flex shrink-0 items-center gap-2">
                                {published === false && <Badge tone="warning">Taslak</Badge>}
                                <Link
                                  to={`/app/konular/${topic.id}`}
                                  className="inline-flex min-h-11 items-center gap-1.5 rounded-xl bg-accent-soft px-3 text-sm font-semibold text-accent-soft-fg transition-colors hover:brightness-95"
                                >
                                  <BookOpen className="size-4" aria-hidden />
                                  Oku
                                  <span className="sr-only">, {topic.name}</span>
                                </Link>
                              </div>
                            )}
                          </li>
                        )
                      })}
                    </ul>
                  )}
                </li>
              )
            })}
          </ul>
        )}
      </div>
    </div>
  )
}
