import { UserRound } from 'lucide-react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { useViewedStudent } from '@/features/auth/session'
import { WrongList } from './wrong-list'

export default function WrongPage() {
  const viewed = useViewedStudent()

  if (!viewed) {
    return (
      <div>
        <PageHeader title="Yanlış soru defteri" />
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
    <div>
      <PageHeader
        title="Yanlış soru defteri"
        description={viewed.canEdit ? undefined : `${viewed.name} adlı öğrencinin yanlış yaptığı ve tekrar ettiği sorular`}
      />
      <WrongList studentId={viewed.studentId} viewer={viewed.canEdit ? 'student' : 'parent'} />
    </div>
  )
}
