import { UserPlus } from 'lucide-react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { useAuth } from '@/features/auth/session'
import { TodayTasks } from '@/features/plan/today-tasks'
import { WeeklyReportButton } from '@/features/report/weekly-report-button'
import { InboxStrip } from '@/features/student/inbox-strip'
import { LastExamSummary } from '@/features/student/last-exam-summary'
import { StudentHero, WeekCard } from '@/features/student/today-hero'
import { Reveal } from '@/features/student/today-parts'
import { formatDate, greeting, todayISO } from '@/lib/dates'
import { SharedNote, TeacherContact } from './parent-parts'

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
    <div key={child.id} className="space-y-4 sm:space-y-5">
      <InboxStrip userId={profile.id} />
      <Reveal index={0}>
        <StudentHero student={child} name={child.full_name} mode="parent" />
      </Reveal>
      <div className="grid gap-4 sm:gap-5 xl:grid-cols-[minmax(0,1fr)_22rem] xl:items-start">
        <div className="space-y-4 sm:space-y-5">
          <Reveal index={1}>
            <WeekCard studentId={child.id} goalMinutes={child.daily_minutes_goal} />
          </Reveal>
          <div className="grid gap-4 sm:gap-5 2xl:grid-cols-2 2xl:items-start">
            <Reveal index={2}>
              <TodayTasks studentId={child.id} canEdit={false} />
            </Reveal>
            <Reveal index={3}>
              <LastExamSummary
                studentId={child.id}
                more={{ label: 'Tüm denemeler', href: '/app/denemeler' }}
                empty={{ description: 'Deneme eklendiğinde net ve değişim burada görünür.' }}
              />
            </Reveal>
          </div>
        </div>
        <aside className="space-y-4 sm:space-y-5">
          <Reveal index={4}>
            <SharedNote studentId={child.id} />
          </Reveal>
          <Reveal index={5}>
            <TeacherContact studentId={child.id} teacherId={child.teacher_id} />
          </Reveal>
          <Reveal index={6}>
            <Card className="p-4 sm:p-5">
              <h2 className="text-[17px] font-bold">Haftalık rapor</h2>
              <p className="mt-1 text-sm text-muted">Çalışma, görevler, denemeler ve koçun yorumu tek PDF'te.</p>
              <WeeklyReportButton student={{ ...child, name: child.full_name }} viewer="parent" className="mt-3 w-full" />
            </Card>
          </Reveal>
        </aside>
      </div>
    </div>
  )
}
