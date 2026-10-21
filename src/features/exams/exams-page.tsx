import { Plus, Users } from 'lucide-react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { useAuth, useViewedStudent } from '@/features/auth/session'
import { ExamGoals } from './exam-goals'
import { ExamsOverview } from './exams-overview'

const examHref = (id: number) => `/app/denemeler/${id}`

export default function ExamsPage() {
  const { profile } = useAuth()
  const viewed = useViewedStudent()
  const isStudent = profile?.role === 'student'

  if (!viewed) {
    return (
      <>
        <PageHeader title="Denemeler" />
        <EmptyState icon={Users} title="Bağlı öğrenci yok" description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli koduyla çocuğunuzun hesabını bağlayabilirsiniz." />
      </>
    )
  }

  const { studentId, student, canEdit, name } = viewed

  return (
    <>
      <PageHeader
        title="Denemeler"
        description={isStudent ? undefined : name}
        actions={
          isStudent && (
            <Button asChild>
              <Link to="/app/deneme-ekle">
                <Plus />
                Deneme ekle
              </Link>
            </Button>
          )
        }
      />
      <div className="space-y-4">
        <ExamsOverview
          key={studentId}
          studentId={studentId}
          student={student}
          canEdit={canEdit}
          newExamHref={isStudent ? '/app/deneme-ekle' : undefined}
          examHref={examHref}
        />
        <ExamGoals key={`goals-${studentId}`} studentId={studentId} student={student} canEdit={canEdit} />
      </div>
    </>
  )
}
