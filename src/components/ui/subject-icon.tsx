import { Atom, Calculator, Dna, Feather, FlaskConical, Globe, Hourglass, Languages, Lightbulb, Landmark, MoonStar, Orbit, BookText, Shapes, type LucideIcon } from 'lucide-react'
import { cn } from '@/lib/cn'
import { subjectColor, type Subject } from '@/lib/exam'
import { subjectIconName } from '@/lib/subject-icons'

const icons: Record<string, LucideIcon> = { Atom, Calculator, Dna, Feather, FlaskConical, Globe, Hourglass, Languages, Lightbulb, Landmark, MoonStar, Orbit, BookText, Shapes }

const sizes = { xs: 'size-3.5', sm: 'size-7 rounded-lg [&>svg]:size-4', md: 'size-9 rounded-xl [&>svg]:size-[18px]', lg: 'size-11 rounded-xl [&>svg]:size-5' }

// Ders rengiyle boyanmış yuvarlak köşeli ikon. xs yalnızca renkli ikondur, zemin yoktur
export function SubjectIcon({
  subject,
  size = 'md',
  className,
}: {
  subject: Pick<Subject, 'id' | 'color'> | undefined | null
  size?: keyof typeof sizes
  className?: string
}) {
  const Icon = icons[subjectIconName(subject?.id)] ?? Shapes
  const color = subjectColor(subject)
  if (size === 'xs') return <Icon aria-hidden className={cn(sizes.xs, 'shrink-0', className)} style={{ color }} />
  return (
    <span
      aria-hidden
      className={cn('inline-grid shrink-0 place-items-center', sizes[size], className)}
      style={{ color, backgroundColor: `${color}22` }}
    >
      <Icon />
    </span>
  )
}
