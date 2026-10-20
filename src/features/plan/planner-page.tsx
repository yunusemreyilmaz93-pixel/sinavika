import { ChevronRight, CopyPlus, LayoutTemplate, UserPlus } from 'lucide-react'
import { useState } from 'react'
import { Link, useSearchParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { weekStartISO } from '@/lib/dates'
import { studentLabel } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { BulkTaskModal } from './bulk-task'
import { LoadError } from './load-error'
import { StudentChips, usePlannerStudents } from './student-picker'
import { TemplatesModal } from './templates'
import { WeekPlan } from './week-plan'

export default function PlannerPage() {
  const profile = useProfile()
  const students = usePlannerStudents(profile.id)
  const [params, setParams] = useSearchParams()
  const [week, setWeek] = useState(() => weekStartISO())
  const [bulkOpen, setBulkOpen] = useState(false)
  const [templatesOpen, setTemplatesOpen] = useState(false)

  const list = students.data ?? []
  const selected = list.find((s) => s.id === params.get('ogrenci')) ?? list[0]

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
            <Button variant="secondary" onClick={() => setTemplatesOpen(true)}>
              <LayoutTemplate />
              Şablonlar
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
            <Skeleton className="h-11 w-28 rounded-full" />
            <Skeleton className="h-11 w-28 rounded-full" />
            <Skeleton className="h-11 w-28 rounded-full" />
          </div>
          <Skeleton className="h-14" />
          <Skeleton className="h-72" />
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
          title="Henüz öğrencin yok"
          description="Davet kodu oluştur. Öğrencin katılınca haftalık planını buradan hazırlarsın."
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
      <div className="space-y-5">
        <div>
          <StudentChips
            label="Öğrenci seç"
            students={list}
            selected={[selected.id]}
            onToggle={(id) => setParams({ ogrenci: id }, { replace: true })}
          />
          <div className="mt-2 flex flex-wrap items-center justify-between gap-x-3 gap-y-1">
            <p className="text-sm text-muted">
              <span className="font-semibold text-fg">{selected.full_name}</span> · {studentLabel(selected)}
            </p>
            <Link
              to={`/app/ogrenciler/${selected.id}`}
              className="-my-2 inline-flex h-11 items-center gap-0.5 text-sm font-semibold text-accent hover:underline"
            >
              Öğrenci sayfası
              <ChevronRight className="size-4" aria-hidden />
            </Link>
          </div>
        </div>

        <WeekPlan key={selected.id} studentId={selected.id} viewer="teacher" week={week} onWeekChange={setWeek} />
      </div>

      <BulkTaskModal
        open={bulkOpen}
        onOpenChange={setBulkOpen}
        students={list}
        initialStudentId={selected.id}
        initialWeek={week}
      />
      <TemplatesModal
        open={templatesOpen}
        onOpenChange={setTemplatesOpen}
        students={list}
        student={selected}
        week={week}
      />
    </>
  )
}
