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
          description="Öğretmenin ya da çocuğunun oluşturduğu veli koduyla çocuğunun hesabını bağlayabilirsin."
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
        description={
          viewed.canEdit
            ? 'Yanlış yaptığın soruları ekle. Tekrar zamanı gelince karşına çıkarlar.'
            : `${viewed.name} adlı öğrencinin yanlış yaptığı ve tekrar ettiği sorular`
        }
      />
      <WrongList studentId={viewed.studentId} viewer={viewed.canEdit ? 'student' : 'parent'} />
    </div>
  )
}
