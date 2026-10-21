import { useQuery } from '@tanstack/react-query'
import { format } from 'date-fns'
import { tr } from 'date-fns/locale'
import { BookOpenCheck } from 'lucide-react'
import { Badge } from '@/components/ui/badge'
import { isConfigured, supabase, unwrap } from '@/lib/supabase'
import { container, Reveal, SectionHeading } from './primitives'

function useRecentLessons() {
  return useQuery({
    queryKey: ['recent-lessons'],
    enabled: isConfigured,
    staleTime: 10 * 60_000,
    queryFn: async () => unwrap(await supabase.rpc('recent_lessons', { p_limit: 6 })),
  })
}

export function NewLessons() {
  const { data } = useRecentLessons()
  if (!data?.length) return null

  return (
    <section id="konu-anlatimlari" className="scroll-mt-16 py-6 sm:py-10">
      <div className={container}>
        <SectionHeading
          eyebrow="Konu anlatımları"
          title="Yeni eklenen anlatımlar"
          lead="Konu anlatımları sırayla ekleniyor. Giriş yapan öğrenci, veli ve öğretmenler Konular ekranından okuyabilir."
        />
        <Reveal>
          <ul className="mt-10 grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {data.map((lesson) => (
              <li key={lesson.topic_id} className="flex items-start gap-3 rounded-2xl border border-line bg-surface p-4">
                <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg">
                  <BookOpenCheck className="size-5" aria-hidden />
                </span>
                <div className="min-w-0">
                  <p className="font-semibold break-words">{lesson.topic_name}</p>
                  <p className="mt-0.5 flex flex-wrap items-center gap-x-2 gap-y-1 text-sm text-muted">
                    <Badge tone="neutral">{lesson.exam}</Badge>
                    <span>{lesson.subject_name}</span>
                    <span className="tabular">{format(new Date(lesson.published_at), 'd MMMM', { locale: tr })}</span>
                  </p>
                </div>
              </li>
            ))}
          </ul>
        </Reveal>
      </div>
    </section>
  )
}
