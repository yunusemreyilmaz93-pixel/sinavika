import { UserRound } from 'lucide-react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { useViewedStudent } from '@/features/auth/session'
import { TopicMap } from './topic-map'

export default function TopicsPage() {
  const viewed = useViewedStudent()

  if (!viewed) {
    return (
      <>
        <PageHeader title="Konular" />
        <EmptyState
          icon={UserRound}
          title="Bağlı öğrenci yok"
          description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli koduyla çocuğunuzun hesabını bağlayabilirsiniz."
          action={
            <Button asChild>
              <Link to="/katil">Kodu gir</Link>
            </Button>
          }
        />
      </>
    )
  }

  return (
    <>
      <PageHeader
        title="Konular"
        description={viewed.canEdit ? 'Soldaki simgeye dokununca konunun durumu değişir. Kitap simgeli konuların anlatımı vardır.' : `${viewed.name} için konu durumları.`}
      />
      <TopicMap key={viewed.studentId} studentId={viewed.studentId} student={viewed.student} canEdit={viewed.canEdit} />
    </>
  )
}
