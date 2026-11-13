import { ChevronRight, CopyPlus, LayoutTemplate, UserPlus } from 'lucide-react'
import { Avatar } from '@/components/ui/avatar'
import { useState } from 'react'
import { Link, useSearchParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { shiftDays, weekStartISO } from '@/lib/dates'
import { studentLabel } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { BulkTaskModal } from './bulk-task'
import { LoadError } from './load-error'
import { useWeekSummary } from './queries'
import { StudentRail, usePlannerStudents } from './student-picker'
import { WeekPlan } from './week-plan'

export default function PlannerPage() {
  const profile = useProfile()
  const students = usePlannerStudents(profile.id)
  const [params, setParams] = useSearchParams()
  const [week, setWeek] = useState(() => weekStartISO())
  const [bulkOpen, setBulkOpen] = useState(false)

  const list = students.data ?? []
  const selected = list.find((s) => s.id === params.get('ogrenci')) ?? list[0]
  const summary = useWeekSummary(
    list.map((s) => s.id),
    week,
    shiftDays(week, 6),
  )

  const header = (
    <PageHeader
      title="Planlayıcı"
      actions={
        selected && (
          <>
            <Button variant="secondary" onClick={() => setBulkOpen(true)}>
              <CopyPlus />
              Toplu görev
            </Button>
            <Button variant="secondary" asChild>
              <Link to={`/app/sablonlar?ogrenci=${selected.id}&hafta=${week}`}>
                <LayoutTemplate />
                Şablonlar
              </Link>
            </Button>
          </>
        )
      }
    />
  )

  if (students.isPending) {
    return (
      <>
        {header}
        <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
          <div className="flex gap-2">
            <Skeleton className="h-[4.5rem] w-48 rounded-2xl" />
            <Skeleton className="h-[4.5rem] w-48 rounded-2xl" />
            <Skeleton className="h-[4.5rem] w-48 rounded-2xl" />
          </div>
          <Skeleton className="h-96 rounded-3xl" />
        </div>
      </>
    )
  }

  if (students.error) {
    return (
      <>
        {header}
        <LoadError message={errorMessage(students.error)} onRetry={() => void students.refetch()} />
      </>
    )
  }

  if (!selected) {
    return (
      <>
        {header}
        <EmptyState
          icon={UserPlus}
          title="Henüz öğrenciniz yok"
          description="Davet kodu oluşturun. Öğrenciniz katılınca haftalık planını buradan hazırlarsınız."
          action={
            <Button asChild>
              <Link to="/app/davetler">Davet oluştur</Link>
            </Button>
          }
        />
      </>
    )
  }

  return (
    <>
      {header}
      <div className="space-y-4">
        <StudentRail
          students={list}
          selected={selected.id}
          onSelect={(id) => setParams({ ogrenci: id }, { replace: true })}
          summary={summary.data}
        />

        <section aria-label={`${selected.full_name} haftalık planı`} className="sm:rounded-3xl sm:border sm:border-line sm:bg-surface sm:p-5 sm:shadow-card">
          <div className="mb-4 flex items-center gap-3 border-b border-line pb-4">
            <Avatar name={selected.full_name} userId={selected.id} className="size-11 text-sm" />
            <div className="min-w-0 flex-1">
              <h2 className="truncate font-display text-lg font-bold">{selected.full_name}</h2>
              <p className="truncate text-sm text-muted">{studentLabel(selected)}</p>
            </div>
            <Link
              to={`/app/ogrenciler/${selected.id}`}
              className="inline-flex h-11 shrink-0 items-center gap-0.5 text-sm font-semibold text-accent hover:underline"
            >
              Öğrenci sayfası
              <ChevronRight className="size-4" aria-hidden />
            </Link>
          </div>
          <WeekPlan key={selected.id} studentId={selected.id} viewer="teacher" week={week} onWeekChange={setWeek} />
        </section>
      </div>

      <BulkTaskModal
        open={bulkOpen}
        onOpenChange={setBulkOpen}
        students={list}
        initialStudentId={selected.id}
        initialWeek={week}
      />
    </>
  )
}
