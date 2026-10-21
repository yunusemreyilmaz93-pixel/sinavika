import { useQuery } from '@tanstack/react-query'
import { motion, useScroll, useSpring } from 'motion/react'
import { BookOpen, ChevronDown, Clock3, NotebookPen } from 'lucide-react'
import { useEffect, useState } from 'react'
import { useParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { EmptyState } from '@/components/ui/empty-state'
import { PageSkeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { formatDate } from '@/lib/dates'
import { examLabel } from '@/lib/exam'
import { lessonFor } from './registry'
import type { LessonOutline } from './types'

export default function LessonPage() {
  const { topicId } = useParams()
  const profile = useProfile()
  const curriculum = useCurriculum()
  const topic = curriculum.data?.topicById.get(Number(topicId))
  const subject = topic ? curriculum.data?.subjectById.get(topic.subject_id) : undefined
  const lesson = topic ? lessonFor(topic) : undefined
  const body = useQuery({
    queryKey: ['lesson', topic?.subject_id, topic?.name],
    queryFn: () => lesson!.load(),
    enabled: Boolean(lesson),
    staleTime: Infinity,
  })

  const back =
    profile.role === 'teacher'
      ? profile.is_admin
        ? { to: '/app/yonetim?bolum=mufredat', label: 'Müfredat' }
        : { to: '/app', label: 'Öğrenciler' }
      : { to: '/app/konular', label: 'Konular' }

  if (curriculum.isPending || (lesson && body.isPending)) return <PageSkeleton />

  if (!topic || !lesson || !body.data) {
    return (
      <div>
        <PageHeader title={topic?.name ?? 'Konu anlatımı'} back={back} />
        <EmptyState
          icon={BookOpen}
          title={body.isError ? 'Konu anlatımı açılamadı' : 'Bu konunun anlatımı henüz hazır değil'}
          description={body.isError ? 'Sayfayı yenileyip tekrar dene.' : 'Hazır olduğunda Konular ekranında bu konunun yanında görünecek.'}
        />
      </div>
    )
  }

  const Body = body.data.default
  const outline = body.data.outline

  return (
    <div>
      <ReadingProgress />
      <PageHeader
        back={back}
        title={topic.name}
        description={lesson.grade}
        actions={
          <Badge tone="neutral" className="h-8 px-3 text-sm">
            <Clock3 />
            Yaklaşık {lesson.readingMinutes} dakika
          </Badge>
        }
      />
      <p className="-mt-3 mb-6 text-sm text-muted">
        {subject ? `${examLabel[subject.exam]} · ${subject.name}` : null} · {formatDate(lesson.date, 'd MMMM yyyy')}
      </p>

      {profile.role === 'teacher' && (
        <aside className="mb-8 rounded-2xl border border-warning/30 bg-warning-soft p-4 sm:p-5">
          <p className="flex items-center gap-2 font-display font-bold text-warning">
            <NotebookPen className="size-5" />
            Öğretmen için not
          </p>
          <p className="mt-1 text-sm text-fg/80">Bu not öğrencilere ve velilere görünmez.</p>
          <dl className="mt-3 space-y-2 text-[15px] leading-relaxed">
            {lesson.teacherNote.map((n) => (
              <div key={n.label}>
                <dt className="inline font-semibold">{n.label}: </dt>
                <dd className="inline">{n.text}</dd>
              </div>
            ))}
          </dl>
        </aside>
      )}

      <div className="lg:grid lg:grid-cols-[minmax(0,1fr)_14rem] lg:gap-10">
        <div className="min-w-0">
          <MobileOutline outline={outline} />
          <Body role={profile.role} />
        </div>
        <DesktopOutline outline={outline} />
      </div>
    </div>
  )
}

function ReadingProgress() {
  const { scrollYProgress } = useScroll()
  const scaleX = useSpring(scrollYProgress, { stiffness: 200, damping: 30, restDelta: 0.001 })
  return (
    <motion.div
      aria-hidden
      className="fixed inset-x-0 top-0 z-[55] h-1 origin-left bg-primary lg:left-[248px]"
      style={{ scaleX }}
    />
  )
}

function useActiveSection(outline: LessonOutline) {
  const [active, setActive] = useState(outline[0]?.id)
  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        const visible = entries.filter((e) => e.isIntersecting).sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top)
        if (visible[0]) setActive(visible[0].target.id)
      },
      { rootMargin: '-80px 0px -60% 0px' },
    )
    outline.forEach((o) => {
      const el = document.getElementById(o.id)
      if (el) observer.observe(el)
    })
    return () => observer.disconnect()
  }, [outline])
  return active
}

function scrollTo(id: string) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth', block: 'start' })
}

function DesktopOutline({ outline }: { outline: LessonOutline }) {
  const active = useActiveSection(outline)
  return (
    <nav aria-label="İçindekiler" className="hidden lg:block">
      <div className="sticky top-24">
        <p className="mb-2 text-xs font-semibold tracking-wide text-muted uppercase">İçindekiler</p>
        <ol className="space-y-0.5 border-l border-line">
          {outline.map((o) => (
            <li key={o.id}>
              <button
                type="button"
                onClick={() => scrollTo(o.id)}
                className={cn(
                  '-ml-px block w-full border-l-2 py-1.5 pl-3 text-left text-sm leading-snug transition-colors',
                  active === o.id ? 'border-primary font-semibold text-fg' : 'border-transparent text-muted hover:text-fg',
                )}
              >
                {o.title}
              </button>
            </li>
          ))}
        </ol>
      </div>
    </nav>
  )
}

function MobileOutline({ outline }: { outline: LessonOutline }) {
  const [open, setOpen] = useState(false)
  return (
    <div className="mb-8 rounded-2xl border border-line bg-surface lg:hidden">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        aria-expanded={open}
        className="flex min-h-12 w-full items-center justify-between px-4 text-left font-semibold"
      >
        İçindekiler
        <ChevronDown className={cn('size-4 text-muted transition-transform', open && 'rotate-180')} />
      </button>
      {open && (
        <ol className="border-t border-line px-2 py-2">
          {outline.map((o, i) => (
            <li key={o.id}>
              <button
                type="button"
                onClick={() => {
                  setOpen(false)
                  scrollTo(o.id)
                }}
                className="flex min-h-11 w-full items-center gap-3 rounded-lg px-2 text-left text-[15px] hover:bg-surface-2"
              >
                <span className="w-5 text-sm text-subtle tabular">{i + 1}</span>
                {o.title}
              </button>
            </li>
          ))}
        </ol>
      )}
    </div>
  )
}
