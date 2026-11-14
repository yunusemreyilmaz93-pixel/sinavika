import { UserRoundX } from 'lucide-react'
import { useState } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Modal } from '@/components/ui/modal'
import { useAuth, useViewedStudent } from '@/features/auth/session'
import { NextLesson } from '@/features/lessons/next-lesson'
import { TodayTasks } from '@/features/plan/today-tasks'
import { QuestionLogForm } from '@/features/tracking/question-log-form'
import { StudyRoomCard } from '@/features/tracking/study-room-provider'
import { PaceCard } from '@/features/topics/pace-card'
import { InboxStrip } from './inbox-strip'
import { LastExamSummary } from './last-exam-summary'
import { MilestonesCard } from './milestones-card'
import { StudentHero, WeekCard } from './today-hero'
import { Reveal } from './today-parts'

export default function TodayPage() {
  const viewed = useViewedStudent()
  const { profile } = useAuth()
  const [addingQuestions, setAddingQuestions] = useState(false)

  if (!viewed || !profile) {
    return (
      <EmptyState
        icon={UserRoundX}
        title="Öğrenci kaydın bulunamadı"
        description="Hesabın bir öğretmene bağlı görünmüyor. Çıkış yapıp tekrar girmeyi dene."
        action={
          <Button variant="secondary" asChild>
            <Link to="/app/ayarlar">Ayarlara git</Link>
          </Button>
        }
      />
    )
  }

  const { studentId, student, name } = viewed

  return (
    <div className="space-y-4 sm:space-y-5">
      <InboxStrip userId={profile.id} />
      <Reveal index={0}>
        <StudentHero student={student} name={name} mode="student" onAddQuestions={() => setAddingQuestions(true)} />
      </Reveal>

      <div className="grid gap-4 sm:gap-5 xl:grid-cols-[minmax(0,1fr)_22rem] xl:items-start">
        <div className="space-y-4 sm:space-y-5">
          <Reveal index={1} className="xl:hidden">
            <NextLesson studentId={studentId} student={student} />
          </Reveal>
          <div className="grid gap-4 sm:gap-5 2xl:grid-cols-2 2xl:items-start">
            <Reveal index={2}>
              <TodayTasks studentId={studentId} canEdit />
            </Reveal>
            <Reveal index={3}>
              <WeekCard studentId={studentId} goalMinutes={student.daily_minutes_goal} />
            </Reveal>
          </div>
          <Reveal index={4}>
            <LastExamSummary
              studentId={studentId}
              more={{ label: 'Tüm denemeler', href: '/app/denemeler' }}
              empty={{
                description: 'Deneme sonucunu ders ders girince netin ve değişimi burada görünür.',
                action: (
                  <Button variant="secondary" asChild>
                    <Link to="/app/deneme-ekle">Deneme ekle</Link>
                  </Button>
                ),
              }}
            />
          </Reveal>
        </div>
        <div className="space-y-4 sm:space-y-5">
          <Reveal index={1} className="hidden xl:block">
            <NextLesson studentId={studentId} student={student} />
          </Reveal>
          <Reveal index={5}>
            <PaceCard studentId={studentId} student={student} compact topicsHref="/app/konular" />
          </Reveal>
          <Reveal index={6}>
            <StudyRoomCard />
          </Reveal>
          <Reveal index={7}>
            <MilestonesCard studentId={studentId} compact />
          </Reveal>
        </div>
      </div>

      <Modal open={addingQuestions} onOpenChange={setAddingQuestions} title="Soru çözdüm">
        <QuestionLogForm studentId={studentId} onDone={() => setAddingQuestions(false)} />
      </Modal>
    </div>
  )
}
