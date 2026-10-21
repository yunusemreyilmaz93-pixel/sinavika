import { UserRound } from 'lucide-react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { useViewedStudent } from '@/features/auth/session'
import { ReadingTracker } from './reading-tracker'

export default function ReadingPage() {
  const viewed = useViewedStudent()
  if (!viewed) {
    return (
      <div>
        <PageHeader title="Okuma" />
        <EmptyState
          icon={UserRound}
          title="Bağlı öğrenci yok"
          description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli koduyla çocuğunuzun hesabını bağlayabilirsiniz."
          action={
            <Button asChild variant="secondary">
              <Link to="/app/ayarlar">Ayarlara git</Link>
            </Button>
          }
        />
      </div>
    )
  }
  return (
    <div className="max-w-3xl">
      <PageHeader title="Okuma" description={viewed.canEdit ? undefined : `${viewed.name} adlı öğrencinin okuma kayıtları`} />
      <ReadingTracker studentId={viewed.studentId} canEdit={viewed.canEdit} />
    </div>
  )
}
