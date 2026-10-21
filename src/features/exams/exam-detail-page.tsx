import { SearchX } from 'lucide-react'
import { Link, useNavigate, useParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { useViewedStudent } from '@/features/auth/session'
import { examLabel } from '@/lib/exam'
import { formatDate } from '@/lib/dates'
import { ExamDetail } from './exam-detail'
import { useExamDetail } from './queries'

const back = { to: '/app/denemeler', label: 'Denemeler' }

export default function ExamDetailPage() {
  const { examId } = useParams()
  const navigate = useNavigate()
  const viewed = useViewedStudent()
  const id = Number(examId)
  const valid = Number.isInteger(id) && id > 0
  const detail = useExamDetail(valid ? id : 0)
  const exam = detail.data?.exam

  if (!valid || (detail.isSuccess && !exam)) {
    return (
      <>
        <PageHeader title="Deneme" back={back} />
        <EmptyState
          icon={SearchX}
          title="Deneme bulunamadı"
          description="Silinmiş olabilir ya da bu denemeyi görme yetkisi yok."
          action={
            <Button asChild variant="secondary">
              <Link to="/app/denemeler">Denemelere dön</Link>
            </Button>
          }
        />
      </>
    )
  }

  return (
    <>
      <PageHeader
        title={exam?.title ?? 'Deneme'}
        description={exam ? `${examLabel[exam.kind]} · ${formatDate(exam.taken_on, 'd MMMM yyyy EEEE')}` : undefined}
        back={back}
      />
      <ExamDetail examId={id} canEdit={viewed?.canEdit ?? false} onDeleted={() => navigate('/app/denemeler', { replace: true })} />
    </>
  )
}
