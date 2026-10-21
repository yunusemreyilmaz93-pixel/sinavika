import { ArrowLeft, RotateCw, UserRoundX } from 'lucide-react'
import { motion } from 'motion/react'
import { useEffect, useMemo, useRef } from 'react'
import { Link, useParams, useSearchParams } from 'react-router'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { ExamGoals } from '@/features/exams/exam-goals'
import { TargetCard } from '@/features/goals/target-card'
import { ExamsOverview } from '@/features/exams/exams-overview'
import { SharedStudentNotes } from '@/features/notes/student-notes'
import { TeacherNotes } from '@/features/notes/teacher-notes'
import { ReadingTracker } from '@/features/reading/reading-tracker'
import { WeekPlan } from '@/features/plan/week-plan'
import { TopicMap } from '@/features/topics/topic-map'
import { WrongList } from '@/features/wrong/wrong-list'
import { errorMessage } from '@/lib/supabase'
import { riskSignals, useTeacherOverview } from './overview'
import { StudentHeader } from './student-detail/header'
import { OverviewTab } from './student-detail/overview-tab'
import { useLinkedParents, useStudentDetail } from './student-detail/queries'
import { SettingsTab } from './student-detail/settings-tab'

const tabs = [
  { value: 'ozet', label: 'Özet' },
  { value: 'plan', label: 'Plan' },
  { value: 'denemeler', label: 'Denemeler' },
  { value: 'konular', label: 'Konular' },
  { value: 'yanlislar', label: 'Yanlışlar' },
  { value: 'okuma', label: 'Okuma' },
  { value: 'notlar', label: 'Notlar' },
  { value: 'ayarlar', label: 'Ayarlar' },
] as const

type Tab = (typeof tabs)[number]['value']

function isTab(value: string | null): value is Tab {
  return tabs.some((t) => t.value === value)
}

export default function StudentDetailPage() {
  const { studentId = '' } = useParams()
  const profile = useProfile()
  const [params, setParams] = useSearchParams()
  const raw = params.get('tab')
  const tab: Tab = isTab(raw) ? raw : 'ozet'

  const detail = useStudentDetail(studentId, profile.id)
  const overview = useTeacherOverview()
  const parents = useLinkedParents(studentId)
  const tabsRef = useRef<HTMLDivElement>(null)

  const row = overview.data?.find((r) => r.id === studentId)
  const signals = useMemo(() => (row ? riskSignals(row) : null), [row])
  const parentCount = parents.data?.length ?? row?.parent_count ?? 0

  const setTab = (next: Tab) => {
    setParams(
      (prev) => {
        const out = new URLSearchParams(prev)
        if (next === 'ozet') out.delete('tab')
        else out.set('tab', next)
        return out
      },
      { replace: true },
    )
  }

  useEffect(() => {
    const list = tabsRef.current?.querySelector<HTMLElement>('[role="tablist"]')
    const active = list?.querySelector<HTMLElement>('[aria-selected="true"]')
    if (!list || !active || list.scrollWidth <= list.clientWidth) return
    const offset = active.getBoundingClientRect().left - list.getBoundingClientRect().left + list.scrollLeft
    const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    list.scrollTo({ left: offset - (list.clientWidth - active.offsetWidth) / 2, behavior: reduce ? 'auto' : 'smooth' })
  }, [tab, detail.isSuccess])

  if (detail.isPending) return <DetailSkeleton />

  if (detail.isError) {
    return (
      <div>
        <BackLink />
        <div role="alert" className="flex flex-col items-start gap-3 rounded-2xl border border-line bg-surface p-5">
          <p className="text-sm text-danger">{errorMessage(detail.error)}</p>
          <Button variant="secondary" size="sm" onClick={() => void detail.refetch()}>
            <RotateCw />
            Tekrar deneyin
          </Button>
        </div>
      </div>
    )
  }

  const student = detail.data
  if (!student) {
    return (
      <div>
        <BackLink />
        <EmptyState
          icon={UserRoundX}
          title="Öğrenci bulunamadı"
          description="Bu öğrenci silinmiş ya da sizin öğrenciniz değil."
          action={
            <Button asChild>
              <Link to="/app">Öğrencilere dönün</Link>
            </Button>
          }
        />
      </div>
    )
  }

  return (
    <div>
      <StudentHeader student={student} signals={signals} parentCount={parentCount} />

      <div ref={tabsRef} className="sticky top-14 z-20 -mx-4 mb-5 bg-bg px-4 py-2 sm:static sm:mx-0 sm:bg-transparent sm:px-0 sm:py-0">
        <Segmented options={[...tabs]} value={tab} onChange={setTab} className="[&>button]:min-w-fit [&>button]:px-3.5" />
      </div>

        <motion.div
          key={tab}
          initial={{ opacity: 0, y: 6 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.16, ease: 'easeOut' }}
          role="tabpanel"
          aria-label={tabs.find((t) => t.value === tab)?.label}
        >
          {tab === 'ozet' && <OverviewTab studentId={student.id} onOpenExams={() => setTab('denemeler')} />}
          {tab === 'plan' && <WeekPlan studentId={student.id} viewer="teacher" />}
          {tab === 'yanlislar' && <WrongList studentId={student.id} viewer="teacher" />}
          {tab === 'okuma' && <ReadingTracker studentId={student.id} canEdit />}
          {tab === 'denemeler' && (
            <div className="space-y-4 sm:space-y-5">
              <ExamsOverview
                studentId={student.id}
                student={student}
                canEdit
                newExamHref={`/app/ogrenciler/${student.id}/deneme-ekle`}
              />
              {student.track === 'yks' && <TargetCard studentId={student.id} field={student.field} canEdit />}
              <ExamGoals studentId={student.id} student={student} canEdit />
            </div>
          )}
          {tab === 'konular' && <TopicMap studentId={student.id} student={student} canEdit />}
          {tab === 'notlar' && (
            <>
              <TeacherNotes studentId={student.id} />
              <SharedStudentNotes studentId={student.id} />
            </>
          )}
          {tab === 'ayarlar' && <SettingsTab student={student} />}
        </motion.div>
    </div>
  )
}

function BackLink() {
  return (
    <Link to="/app" className="mb-3 inline-flex min-h-11 items-center gap-1.5 text-sm font-semibold text-muted hover:text-fg">
      <ArrowLeft className="size-4" aria-hidden />
      Öğrenciler
    </Link>
  )
}

function DetailSkeleton() {
  return (
    <div aria-busy="true" aria-label="Yükleniyor">
      <Skeleton className="mb-4 h-5 w-24" />
      <div className="mb-6 flex items-center gap-4">
        <Skeleton className="size-14 rounded-full" />
        <div className="flex-1 space-y-2">
          <Skeleton className="h-7 w-48" />
          <Skeleton className="h-4 w-36" />
        </div>
      </div>
      <Skeleton className="mb-5 h-11 w-full" />
      <div className="grid gap-4 lg:grid-cols-2">
        <Skeleton className="h-56" />
        <Skeleton className="h-56" />
      </div>
    </div>
  )
}
