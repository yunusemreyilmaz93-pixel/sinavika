import { UserRound } from 'lucide-react'
import { PageHeader } from '@/components/app/page-header'
import { EmptyState } from '@/components/ui/empty-state'
import { useAuth, useViewedStudent } from '@/features/auth/session'
import { WeeklyReportButton } from '@/features/report/weekly-report-button'
import { ProgressStats } from './progress-stats'
import { RecentActivity } from './recent-activity'
import { useStudyActivity } from './stats'

export default function ProgressPage() {
  const viewed = useViewedStudent()
  if (!viewed) {
    return (
      <>
        <PageHeader title="İlerleme" />
        <EmptyState
          icon={UserRound}
          title="Bağlı öğrenci yok"
          description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli koduyla çocuğunuzun hesabını bağladığınızda ilerlemesi burada görünür."
        />
      </>
    )
  }
  return <Progress viewed={viewed} />
}

function Progress({ viewed }: { viewed: NonNullable<ReturnType<typeof useViewedStudent>> }) {
  const { studentId, name, canEdit, student } = viewed
  const self = canEdit
  const { profile } = useAuth()
  const { data } = useStudyActivity(studentId)
  return (
    <>
      <PageHeader
        title="İlerleme"
        description={self ? undefined : `${name} için çalışma ve soru özeti.`}
        actions={<WeeklyReportButton student={{ ...student, name }} viewer={profile?.role === 'parent' ? 'parent' : 'student'} />}
      />
      <div className="space-y-4 sm:space-y-5">
        <ProgressStats studentId={studentId} />
        {data && !data.isEmpty && <RecentActivity studentId={studentId} canEdit={canEdit} />}
      </div>
    </>
  )
}
