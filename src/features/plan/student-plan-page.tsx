import { UserPlus } from 'lucide-react'
import { PageHeader } from '@/components/app/page-header'
import { EmptyState } from '@/components/ui/empty-state'
import { useViewedStudent } from '@/features/auth/session'
import { WeekPlan } from './week-plan'

export default function StudentPlanPage() {
  const viewed = useViewedStudent()

  if (!viewed) {
    return (
      <>
        <PageHeader title="Haftalık plan" />
        <EmptyState
          icon={UserPlus}
          title="Bağlı öğrenci yok"
          description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli kodunu girince çocuğunuzun planı burada görünür."
        />
      </>
    )
  }

  return (
    <>
      <PageHeader
        title="Haftalık plan"
        description={viewed.canEdit ? undefined : `${viewed.name} için haftanın planı`}
      />
      <WeekPlan key={viewed.studentId} studentId={viewed.studentId} viewer={viewed.canEdit ? 'student' : 'parent'} />
    </>
  )
}
