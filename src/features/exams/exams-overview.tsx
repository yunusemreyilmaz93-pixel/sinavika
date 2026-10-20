import { Plus, RotateCw, Trophy } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { useCurriculum } from '@/lib/data'
import { examKindsFor, examLabel, type ExamKind, type Field, type Track } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { ExamDetail } from './exam-detail'
import { WeakTopicsCard } from './topic-misses'
import { ExamList, type ExamOpener } from './exam-list'
import { NetTrendChart } from './net-trend-chart'
import { examDateLabel, LastExamCard, OverviewSkeleton, SubjectAverages } from './overview-cards'
import { useExamScores, useExams, useGoals, type ExamResult } from './queries'
import { examMax } from './stats'

const KIND_ORDER: ExamKind[] = ['LGS', 'TYT', 'AYT', 'YDT']

type Props = {
  studentId: string
  student: { track: Track; field: Field | null }
  canEdit: boolean
  newExamHref?: string
  examHref?: (examId: number) => string
}

export function ExamsOverview({ studentId, student, canEdit, newExamHref, examHref }: Props) {
  const exams = useExams(studentId)
  const goals = useGoals(studentId)
  const curriculum = useCurriculum()
  const [picked, setPicked] = useState<ExamKind | null>(null)
  const [opened, setOpened] = useState<ExamResult | null>(null)
  const [modalOpen, setModalOpen] = useState(false)

  const all = useMemo(() => exams.data ?? [], [exams.data])
  const { track, field } = student
  const kinds = useMemo(() => {
    const set = new Set<ExamKind>([...examKindsFor({ track, field }), ...all.map((e) => e.kind)])
    return KIND_ORDER.filter((k) => set.has(k))
  }, [track, field, all])
  const kind = picked && kinds.includes(picked) ? picked : (all[0]?.kind ?? kinds[0])
  const kindExams = useMemo(() => all.filter((e) => e.kind === kind), [all, kind])
  const recentIds = useMemo(() => kindExams.slice(0, 3).map((e) => e.id), [kindExams])
  const scores = useExamScores(studentId, recentIds)

  const opener: ExamOpener = examHref
    ? { href: examHref }
    : {
        onOpen: (exam) => {
          setOpened(exam)
          setModalOpen(true)
        },
      }
  const addHref = canEdit && newExamHref ? `${newExamHref}${newExamHref.includes('?') ? '&' : '?'}tur=${kind}` : undefined

  if (exams.isPending || curriculum.isPending) return <OverviewSkeleton />

  if (exams.isError || curriculum.isError) {
    return (
      <Card>
        <CardBody className="flex flex-col items-start gap-3">
          <p className="text-sm text-danger">{errorMessage(exams.error ?? curriculum.error)}</p>
          <Button variant="secondary" size="sm" className="h-11" onClick={() => (exams.isError ? exams.refetch() : curriculum.refetch())}>
            <RotateCw />
            Tekrar dene
          </Button>
        </CardBody>
      </Card>
    )
  }

  const { subjects, subjectById } = curriculum.data
  const last = kindExams[0]
  const target = goals.data?.find((g) => g.kind === kind)?.target_net ?? null
  const trend = kindExams.slice(0, 12).reverse()

  return (
    <div className="space-y-4">
      {kinds.length > 1 && (
        <Segmented
          options={kinds.map((k) => ({ value: k, label: examLabel[k] }))}
          value={kind}
          onChange={setPicked}
          className="sm:max-w-xs"
        />
      )}

      {!last ? (
        <EmptyState
          icon={Trophy}
          title={all.length ? `Henüz ${examLabel[kind]} denemesi yok` : 'Henüz deneme yok'}
          description={
            canEdit
              ? 'Deneme sonucunu ders ders girdiğinde netler ve gelişim burada görünür.'
              : 'Deneme eklendiğinde netler ve gelişim burada görünür.'
          }
          action={
            addHref && (
              <Button asChild>
                <Link to={addHref}>
                  <Plus />
                  Deneme ekle
                </Link>
              </Button>
            )
          }
        />
      ) : (
        <>
          <div className="grid gap-4 lg:grid-cols-3">
            <LastExamCard last={last} previous={kindExams[1]} target={target} opener={opener} />
            <Card className="min-w-0 lg:col-span-2">
              <CardHeader
                title="Net gelişimi"
                description={trend.length > 1 ? `Son ${trend.length} ${examLabel[kind]} denemesi` : 'İkinci denemeden sonra çizgi oluşur'}
              />
              <CardBody className="pt-3 pr-3 pl-1 sm:pr-4 sm:pl-2">
                <NetTrendChart points={trend} target={target} max={examMax(subjects, kind, field)} />
              </CardBody>
            </Card>
          </div>
          <div className="grid items-start gap-4 lg:grid-cols-3">
            <SubjectAverages
              kind={kind}
              scores={scores.data}
              loading={scores.isPending}
              error={scores.error}
              examCount={recentIds.length}
              subjectById={subjectById}
            />
            <ExamList kind={kind} exams={kindExams} opener={opener} addHref={addHref} className="lg:col-span-2" />
          </div>
          <WeakTopicsCard studentId={studentId} kind={kind} examIds={kindExams.slice(0, 5).map((e) => e.id)} />
        </>
      )}

      {!examHref && (
        <Modal
          open={modalOpen}
          onOpenChange={setModalOpen}
          title={opened?.title ?? 'Deneme'}
          description={opened ? examDateLabel(opened) : undefined}
          size="lg"
        >
          {opened && <ExamDetail examId={opened.id} canEdit={canEdit} onDeleted={() => setModalOpen(false)} />}
        </Modal>
      )}
    </div>
  )
}
