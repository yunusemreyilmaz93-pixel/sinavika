import { motion, useScroll, useSpring } from 'motion/react'
import { BookOpen, ChevronDown, Clock3, NotebookPen, Pencil } from 'lucide-react'
import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { PageSkeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { examLabel } from '@/lib/exam'
import { estimateMinutes, formatLessonMinutes, outlineOf, type OutlineItem } from './markdown/parse'
import { LessonTrackProvider } from './answers'
import { LessonSummary } from './lesson-summary'
import { LessonBody } from './markdown/render'
import { useLesson } from './queries'

export default function LessonPage() {
  const { topicId } = useParams()
  const profile = useProfile()
  const curriculum = useCurriculum()
  const topic = curriculum.data?.topicById.get(Number(topicId))
  const subject = topic ? curriculum.data?.subjectById.get(topic.subject_id) : undefined
  const isTeacher = profile.role === 'teacher'
  const data = useLesson(Number(topicId), isTeacher)
  const lesson = data.data?.lesson
  const outline = useMemo(() => (lesson ? outlineOf(lesson.body) : []), [lesson])
  const minutes = useMemo(() => (lesson ? formatLessonMinutes(estimateMinutes(lesson.body)) : 0), [lesson])

  const back = isTeacher
    ? profile.is_admin
      ? { to: '/app/yonetim?bolum=mufredat', label: 'Müfredat' }
      : { to: '/app', label: 'Öğrenciler' }
    : { to: '/app/konular', label: 'Konular' }

  if (curriculum.isPending || data.isPending) return <PageSkeleton />

  if (!topic || !lesson) {
    return (
      <div>
        <PageHeader title={topic?.name ?? 'Konu anlatımı'} back={back} />
        <EmptyState
          icon={BookOpen}
          title={data.isError ? 'Konu anlatımı açılamadı' : 'Bu konunun anlatımı henüz hazır değil'}
          description={data.isError ? 'Sayfayı yenileyip tekrar deneyin.' : 'Hazır olduğunda Konular ekranında bu konunun yanında görünecek.'}
          action={
            profile.is_admin && topic ? (
              <Button asChild>
                <Link to={`/app/yonetim/anlatim/${topic.id}`}>
                  <Pencil />
                  Anlatım yaz
                </Link>
              </Button>
            ) : undefined
          }
        />
      </div>
    )
  }

  const note = data.data?.note.trim()

  return (
    <div>
      <ReadingProgress />
      <PageHeader
        back={back}
        title={topic.name}
        description={subject ? `${examLabel[subject.exam]} · ${subject.name}` : undefined}
        actions={
          <>
            {!lesson.published && <Badge tone="warning">Taslak</Badge>}
            <Badge tone="neutral" className="h-8 px-3 text-sm">
              <Clock3 />
              Yaklaşık {minutes} dakika
            </Badge>
            {profile.is_admin && (
              <Button variant="soft" size="sm" asChild>
                <Link to={`/app/yonetim/anlatim/${topic.id}`}>
                  <Pencil />
                  Düzenle
                </Link>
              </Button>
            )}
          </>
        }
      />

      {isTeacher && note && (
        <aside className="mb-8 rounded-2xl border border-warning/30 bg-warning-soft p-4 sm:p-5">
          <p className="flex items-center gap-2 font-display font-bold text-warning">
            <NotebookPen className="size-5" />
            Öğretmen için not
          </p>
          <p className="mt-1 text-sm text-fg/80">Bu not öğrencilere ve velilere görünmez.</p>
          <p className="mt-3 text-[15px] leading-relaxed whitespace-pre-line">{note}</p>
        </aside>
      )}

      <div className="lg:grid lg:grid-cols-[minmax(0,1fr)_14rem] lg:gap-10">
        <div className="min-w-0">
          <MobileOutline outline={outline} />
          {profile.role === 'student' && topic && subject ? (
            <LessonTrackProvider topicId={topic.id} topicName={topic.name} subjectId={subject.id}>
              <LessonBody source={lesson.body} />
              <LessonSummary source={lesson.body} />
            </LessonTrackProvider>
          ) : (
            <LessonBody source={lesson.body} />
          )}
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

function useActiveSection(outline: OutlineItem[]) {
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

function DesktopOutline({ outline }: { outline: OutlineItem[] }) {
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

function MobileOutline({ outline }: { outline: OutlineItem[] }) {
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
