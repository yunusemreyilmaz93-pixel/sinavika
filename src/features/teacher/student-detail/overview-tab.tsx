import { Plus } from 'lucide-react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { TodayTasks } from '@/features/plan/today-tasks'
import { LastExamSummary } from '@/features/student/last-exam-summary'
import { ProgressStats } from '@/features/tracking/progress-stats'
import { RecentActivity } from '@/features/tracking/recent-activity'
import { PaceCard } from '@/features/topics/pace-card'
import type { Field, Track } from '@/lib/exam'

export function OverviewTab({
  studentId,
  student,
  onOpenExams,
}: {
  studentId: string
  student: { track: Track; field: Field | null }
  onOpenExams: () => void
}) {
  return (
    <div className="space-y-4 sm:space-y-5">
      <div className="grid gap-4 sm:gap-5 lg:grid-cols-2 lg:items-start">
        <TodayTasks studentId={studentId} canEdit />
        <LastExamSummary
          studentId={studentId}
          more={{ label: 'Denemelere gidin', onClick: onOpenExams }}
          empty={{
            description: 'Öğrencinin deneme sonucunu buradan da girebilirsiniz.',
            action: (
              <Button variant="secondary" asChild>
                <Link to={`/app/ogrenciler/${studentId}/deneme-ekle`}>
                  <Plus />
                  Deneme ekleyin
                </Link>
              </Button>
            ),
          }}
        />
      </div>
      <PaceCard studentId={studentId} student={student} />
      <ProgressStats studentId={studentId} />
      <RecentActivity studentId={studentId} canEdit={false} />
    </div>
  )
}
