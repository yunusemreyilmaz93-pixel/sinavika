import { UserPlus } from 'lucide-react'
import { Link } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { useAuth } from '@/features/auth/session'
import { TodayTasks } from '@/features/plan/today-tasks'
import { ExamCountdown } from '@/features/student/exam-countdown'
import { InboxStrip } from '@/features/student/inbox-strip'
import { LastExamSummary } from '@/features/student/last-exam-summary'
import { Reveal } from '@/features/student/today-parts'
import { formatDate, greeting, todayISO } from '@/lib/dates'
import { studentLabel } from '@/lib/exam'
import { SharedNote, TeacherContact, WeekSummary } from './parent-parts'

export default function ParentHomePage() {
  const { profile, activeChild } = useAuth()
  const today = todayISO()
  const firstName = profile?.full_name.trim().split(/\s+/)[0] ?? ''

  if (!profile) return null

  if (!activeChild) {
    return (
      <div>
        <header className="mb-5 sm:mb-7">
          <p className="text-sm font-semibold text-muted">{formatDate(today, 'd MMMM EEEE')}</p>
          <h1 className="mt-0.5 text-2xl font-extrabold sm:text-3xl">
            {greeting()}, {firstName}
          </h1>
        </header>
        <EmptyState
          icon={UserPlus}
          title="Henüz bağlı çocuğunuz yok"
          description="Öğretmen ya da çocuğunuz tarafından oluşturulan veli koduyla çocuğunuzun hesabını bağlayabilirsiniz."
          action={
            <Button asChild>
              <Link to="/app/ayarlar">
                <UserPlus />
                Çocuk bağla
              </Link>
            </Button>
          }
        />
      </div>
    )
  }

  const child = activeChild

  return (
    <div>
      <header className="mb-5 flex items-center gap-3 sm:mb-7 sm:gap-4">
        <Avatar name={child.full_name} className="size-12 text-base sm:size-14 sm:text-lg" />
        <div className="min-w-0">
          <p className="text-sm font-semibold text-muted">
            {greeting()}, {firstName}
          </p>
          <h1 className="truncate text-2xl font-extrabold sm:text-3xl">{child.full_name}</h1>
          <p className="truncate text-sm text-muted">
            {studentLabel(child)}
            {child.target ? ` · Hedef: ${child.target}` : ''}
          </p>
        </div>
      </header>

      <InboxStrip userId={profile.id} className="mb-4" />

      <div key={child.id} className="flex flex-col gap-4 lg:grid lg:grid-cols-2 lg:items-start lg:gap-5">
        <Reveal index={0}>
          <ExamCountdown track={child.track} />
        </Reveal>
        <Reveal index={1}>
          <TeacherContact studentId={child.id} teacherId={child.teacher_id} />
        </Reveal>
        <Reveal index={2} className="lg:col-span-2">
          <WeekSummary studentId={child.id} />
        </Reveal>
        <Reveal index={3}>
          <TodayTasks studentId={child.id} canEdit={false} />
        </Reveal>
        <Reveal index={4}>
          <LastExamSummary
            studentId={child.id}
            more={{ label: 'Tüm denemeler', href: '/app/denemeler' }}
            empty={{ description: 'Deneme eklendiğinde net ve değişim burada görünür.' }}
          />
        </Reveal>
        <Reveal index={5} className="lg:col-span-2">
          <SharedNote studentId={child.id} />
        </Reveal>
      </div>
    </div>
  )
}
