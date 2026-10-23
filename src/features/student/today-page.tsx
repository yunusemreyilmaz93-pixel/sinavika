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
import { useTimerState } from '@/features/tracking/timer-store'
import { formatDate, greeting, todayISO } from '@/lib/dates'
import { ExamCountdown } from './exam-countdown'
import { InboxStrip } from './inbox-strip'
import { LastExamSummary } from './last-exam-summary'
import { MilestonesCard, StreakChip } from './milestones-card'
import { QuickActions, Reveal, TodayProgress } from './today-parts'

export default function TodayPage() {
  const viewed = useViewedStudent()
  const { profile } = useAuth()
  const timer = useTimerState()
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
  const today = todayISO()
  const firstName = name.trim().split(/\s+/)[0]

  return (
    <div>
      <header className="mb-5 sm:mb-7">
        <p className="text-sm font-semibold text-muted">{formatDate(today, 'd MMMM EEEE')}</p>
        <h1 className="mt-0.5 text-2xl font-extrabold sm:text-3xl">
          {greeting()}, {firstName}
        </h1>
        <div className="mt-2 empty:hidden">
          <StreakChip studentId={studentId} />
        </div>
      </header>

      <InboxStrip userId={profile.id} className="mb-4" />
      <NextLesson studentId={studentId} student={student} className="mb-4" />

      <div className="flex flex-col gap-4 lg:grid lg:grid-cols-[minmax(0,1.1fr)_minmax(0,1fr)] lg:items-start lg:gap-5">
        <div className="contents lg:flex lg:flex-col lg:gap-5">
          <Reveal index={1} className="order-2 lg:order-none">
            <TodayProgress studentId={studentId} goals={student} />
          </Reveal>
          <Reveal index={3} className="order-4 lg:order-none">
            <TodayTasks studentId={studentId} canEdit />
          </Reveal>
        </div>
        <div className="contents lg:flex lg:flex-col lg:gap-5">
          <Reveal index={0} className="order-1 lg:order-none">
            <ExamCountdown track={student.track} />
          </Reveal>
          <Reveal index={2} className="order-3 lg:order-none">
            <QuickActions timerRunning={timer.focus?.studentId === studentId} onAddQuestions={() => setAddingQuestions(true)} />
          </Reveal>
          <Reveal index={4} className="order-5 lg:order-none">
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
          <Reveal index={5} className="order-6 lg:order-none">
            <MilestonesCard studentId={studentId} />
          </Reveal>
        </div>
      </div>

      <Modal open={addingQuestions} onOpenChange={setAddingQuestions} title="Soru çözdüm">
        <QuestionLogForm studentId={studentId} onDone={() => setAddingQuestions(false)} />
      </Modal>
    </div>
  )
}
