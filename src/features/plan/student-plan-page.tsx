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
          description="Öğretmenden veli davet kodu iste. Kodu girince çocuğunun planı burada görünür."
        />
      </>
    )
  }

  return (
    <>
      <PageHeader
        title="Haftalık plan"
        description={viewed.canEdit ? 'Görevlerini işaretle, kendi çalışmanı ekle.' : `${viewed.name} için haftanın planı`}
      />
      <WeekPlan key={viewed.studentId} studentId={viewed.studentId} viewer={viewed.canEdit ? 'student' : 'parent'} />
    </>
  )
}
