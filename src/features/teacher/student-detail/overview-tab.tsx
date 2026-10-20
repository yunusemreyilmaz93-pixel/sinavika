import { Plus } from 'lucide-react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { TodayTasks } from '@/features/plan/today-tasks'
import { LastExamSummary } from '@/features/student/last-exam-summary'
import { ProgressStats } from '@/features/tracking/progress-stats'
import { RecentActivity } from '@/features/tracking/recent-activity'

export function OverviewTab({ studentId, onOpenExams }: { studentId: string; onOpenExams: () => void }) {
  return (
    <div className="space-y-4 sm:space-y-5">
      <div className="grid gap-4 sm:gap-5 lg:grid-cols-2 lg:items-start">
        <TodayTasks studentId={studentId} canEdit />
        <LastExamSummary
          studentId={studentId}
          more={{ label: 'Denemelere git', onClick: onOpenExams }}
          empty={{
            description: 'Öğrencinin deneme sonucunu buradan da girebilirsin.',
            action: (
              <Button variant="secondary" asChild>
                <Link to={`/app/ogrenciler/${studentId}/deneme-ekle`}>
                  <Plus />
                  Deneme ekle
                </Link>
              </Button>
            ),
          }}
        />
      </div>
      <ProgressStats studentId={studentId} />
      <RecentActivity studentId={studentId} canEdit={false} />
    </div>
  )
}
