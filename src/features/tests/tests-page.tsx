import { ChevronRight, ListChecks } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { SubjectIcon } from '@/components/ui/subject-icon'
import { useProfile } from '@/features/auth/session'
import { useCurriculum } from '@/lib/data'
import { examLabel, formatNet, net, type ExamKind } from '@/lib/exam'
import { useTestAttempts, useTestSets, type Attempt, type TestSet } from './queries'

const kindTitle = { deneme: 'Genel denemeler', brans: 'Branş denemeleri', konu: 'Konu testleri' } as const

export default function TestsPage() {
  const studentId = useProfile().id
  const sets = useTestSets()
  const attempts = useTestAttempts(studentId)
  const curriculum = useCurriculum()
  const [picked, setPicked] = useState<ExamKind | null>(null)

  const exams = useMemo(() => [...new Set((sets.data ?? []).map((s) => s.exam))], [sets.data])
  const exam = picked && exams.includes(picked) ? picked : exams[0]
  const last = useMemo(() => {
    const map = new Map<number, Attempt>()
    for (const a of attempts.data ?? []) if (!map.has(a.set_id)) map.set(a.set_id, a)
    return map
  }, [attempts.data])

  if (sets.isLoading || curriculum.isLoading) return <Loading />
  if (!exam || !curriculum.data) {
    return (
      <>
        <PageHeader title="Testler" />
        <EmptyState icon={ListChecks} title="Henüz test yok" description="Yeni testler eklendikçe burada görünür." />
      </>
    )
  }
  const { subjectById, topicById } = curriculum.data
  const inExam = (sets.data ?? []).filter((s) => s.exam === exam)

  return (
    <>
      <PageHeader title="Testler" />
      {exams.length > 1 && (
        <Segmented className="mb-5" value={exam} onChange={setPicked} options={exams.map((e) => ({ value: e, label: examLabel[e] }))} />
      )}
      <div className="space-y-6">
        {(['deneme', 'brans', 'konu'] as const).map((kind) => {
          const list = inExam.filter((s) => s.kind === kind)
          if (!list.length) return null
          const bySubject = new Map<string, TestSet[]>()
          if (kind !== 'deneme') for (const s of list) bySubject.set(s.subject_id ?? '', [...(bySubject.get(s.subject_id ?? '') ?? []), s])
          return (
            <section key={kind} aria-label={kindTitle[kind]}>
              <h2 className="font-display mb-2 text-lg font-bold">{kindTitle[kind]}</h2>
              {kind === 'deneme' ? (
                <Card className="divide-y divide-line">
                  {list.map((s) => (
                    <SetRow key={s.id} set={s} exam={exam} attempt={last.get(s.id)} />
                  ))}
                </Card>
              ) : (
                <div className="space-y-3">
                  {[...bySubject].map(([subjectId, items]) => (
                    <Card key={subjectId}>
                      <div className="flex items-center gap-2.5 px-4 pt-3.5 pb-1 sm:px-5">
                        <SubjectIcon subject={subjectById.get(subjectId)} size="sm" />
                        <h3 className="text-sm font-bold">{subjectById.get(subjectId)?.name}</h3>
                      </div>
                      <div className="divide-y divide-line">
                        {items.map((s) => (
                          <SetRow key={s.id} set={s} exam={exam} attempt={last.get(s.id)} topic={s.topic_id ? topicById.get(s.topic_id)?.name : undefined} />
                        ))}
                      </div>
                    </Card>
                  ))}
                </div>
              )}
            </section>
          )
        })}
      </div>
    </>
  )
}

function SetRow({ set, exam, attempt, topic }: { set: TestSet; exam: ExamKind; attempt?: Attempt; hint?: undefined; topic?: string }) {
  return (
    <Link to={`/app/testler/${set.id}`} className="flex min-h-14 items-center gap-3 px-4 py-2.5 hover:bg-surface-2 sm:px-5">
      <div className="min-w-0 flex-1">
        <p className="truncate text-sm font-semibold">{topic ?? set.title}</p>
        <p className="text-xs text-muted">
          {set.question_count} soru{set.duration_min ? `, ${set.duration_min} dakika` : ''}
        </p>
      </div>
      {attempt ? <Badge tone="primary">{formatNet(net(attempt.correct, attempt.wrong, exam))} net</Badge> : <Badge>Çözülmedi</Badge>}
      <ChevronRight className="size-4 shrink-0 text-subtle" />
    </Link>
  )
}

function Loading() {
  return (
    <>
      <PageHeader title="Testler" />
      <div className="space-y-3">
        <Skeleton className="h-24" />
        <Skeleton className="h-24" />
      </div>
    </>
  )
}
