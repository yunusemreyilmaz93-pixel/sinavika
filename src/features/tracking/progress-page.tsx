import { UserRound } from 'lucide-react'
import { PageHeader } from '@/components/app/page-header'
import { EmptyState } from '@/components/ui/empty-state'
import { useViewedStudent } from '@/features/auth/session'
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
          description="Öğretmeninden aldığın veli davet koduyla çocuğunun hesabını bağladığında ilerlemesi burada görünür."
        />
      </>
    )
  }
  return <Progress studentId={viewed.studentId} name={viewed.name} canEdit={viewed.canEdit} self={viewed.canEdit} />
}

function Progress({ studentId, name, canEdit, self }: { studentId: string; name: string; canEdit: boolean; self: boolean }) {
  const { data } = useStudyActivity(studentId)
  return (
    <>
      <PageHeader title="İlerleme" description={self ? 'Çalışma süren, soruların ve düzenin.' : `${name} için çalışma ve soru özeti.`} />
      <div className="space-y-4 sm:space-y-5">
        <ProgressStats studentId={studentId} />
        {data && !data.isEmpty && <RecentActivity studentId={studentId} canEdit={canEdit} />}
      </div>
    </>
  )
}
