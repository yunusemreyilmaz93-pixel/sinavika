import type { LucideIcon } from 'lucide-react'
import type { ComponentType, ReactNode } from 'react'
import { ArtBell, ArtBooks, ArtCalendar, ArtExams, ArtMessages, ArtNotes, ArtPeople, ArtSearch, ArtTasks } from '@/components/art'
import { cn } from '@/lib/cn'

// Konuya uyan ikonlar çizimle gösterilir, diğerleri ikon zeminiyle kalır
const art: Record<string, ComponentType<{ className?: string }>> = {
  Search: ArtSearch,
  SearchX: ArtSearch,
  UserPlus: ArtPeople,
  UserRound: ArtPeople,
  UserRoundX: ArtPeople,
  UserX: ArtPeople,
  Users: ArtPeople,
  NotebookPen: ArtNotes,
  NotebookTabs: ArtNotes,
  BookBookmark: ArtBooks,
  BookOpen: ArtBooks,
  BookOpenCheck: ArtBooks,
  MessageCircle: ArtMessages,
  Megaphone: ArtMessages,
  Bell: ArtBell,
  Trophy: ArtExams,
  ChartColumn: ArtExams,
  RotateCcwClock: ArtTasks,
  CalendarCheck: ArtCalendar,
  CalendarPlus: ArtCalendar,
  LayoutTemplate: ArtTasks,
  CopyPlus: ArtTasks,
  ListChecks: ArtTasks,
}

export function EmptyState({
  icon: Icon,
  title,
  description,
  action,
  className,
}: {
  icon: LucideIcon
  title: string
  description?: ReactNode
  action?: ReactNode
  className?: string
}) {
  const Art = art[Icon.displayName ?? '']
  return (
    <div className={cn('grid-paper flex flex-col items-center rounded-2xl border border-dashed border-line-strong px-6 py-10 text-center', className)}>
      {Art ? (
        <Art />
      ) : (
        <div className="grid size-12 place-items-center rounded-2xl bg-primary-soft text-primary-soft-fg">
          <Icon className="size-6" />
        </div>
      )}
      <h3 className="mt-4 text-base font-bold">{title}</h3>
      {description && <p className="mt-1 max-w-sm text-sm text-muted">{description}</p>}
      {action && <div className="mt-5">{action}</div>}
    </div>
  )
}
