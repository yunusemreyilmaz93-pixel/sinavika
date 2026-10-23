import { ChevronRight } from 'lucide-react'
import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { SubjectIcon } from '@/components/ui/subject-icon'
import { examLabel, type ExamKind } from '@/lib/exam'
import { TopicEditor } from './topic-editor'
import { LoadError } from './ui'

const exams: { value: ExamKind; label: string }[] = (['LGS', 'TYT', 'AYT', 'YDT'] as const).map((value) => ({
  value,
  label: examLabel[value],
}))

export function CurriculumSection() {
  const curriculum = useCurriculum()
  const [exam, setExam] = useState<ExamKind>('LGS')
  const [selected, setSelected] = useState<string | null>(null)

  if (curriculum.isPending) {
    return (
      <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-11" />
        <Skeleton className="h-80" />
      </div>
    )
  }
  if (curriculum.isError) return <LoadError error={curriculum.error} onRetry={() => void curriculum.refetch()} />

  const { subjects, topicsBySubject } = curriculum.data
  const list = subjects.filter((s) => s.exam === exam).sort((a, b) => a.sort - b.sort)
  const picked = list.find((s) => s.id === selected)
  const current = picked ?? list[0]

  return (
    <div className="space-y-4">
      <Segmented
        options={exams}
        value={exam}
        onChange={(next) => {
          setExam(next)
          setSelected(null)
        }}
      />
      <div className="lg:grid lg:grid-cols-[minmax(0,18rem)_minmax(0,1fr)] lg:items-start lg:gap-5">
        <Card className={cn('overflow-hidden', picked && 'hidden lg:block')}>
          <ul className="divide-y divide-line">
            {list.map((subject) => {
              const count = topicsBySubject.get(subject.id)?.length ?? 0
              const active = subject.id === current?.id
              return (
                <li key={subject.id}>
                  <button
                    type="button"
                    onClick={() => setSelected(subject.id)}
                    aria-current={active ? 'true' : undefined}
                    className={cn(
                      'flex min-h-14 w-full items-center gap-3 px-4 py-3 text-left transition-colors hover:bg-surface-2',
                      active && 'lg:bg-primary-soft lg:hover:bg-primary-soft',
                    )}
                  >
                    <SubjectIcon subject={subject} size="sm" />
                    <span className="min-w-0 flex-1">
                      <span className={cn('block font-semibold', active && 'lg:text-primary-soft-fg')}>{subject.name}</span>
                      <span className="tabular block text-xs text-muted">
                        {count} konu · {subject.question_count} soru
                      </span>
                    </span>
                    <ChevronRight className="size-4 shrink-0 text-subtle lg:hidden" />
                  </button>
                </li>
              )
            })}
          </ul>
        </Card>
        {current && (
          <div className={cn(!picked && 'hidden lg:block')}>
            <TopicEditor key={current.id} subject={current} topics={topicsBySubject.get(current.id) ?? []} onBack={() => setSelected(null)} />
          </div>
        )}
      </div>
    </div>
  )
}
