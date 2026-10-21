import { useQuery } from '@tanstack/react-query'
import { LinkIcon } from 'lucide-react'
import { useEffect } from 'react'
import { useParams } from 'react-router'
import { Logo } from '@/components/ui/logo'
import { Skeleton } from '@/components/ui/skeleton'
import { formatDate, formatMinutes } from '@/lib/dates'
import { formatNet, gradeLabel } from '@/lib/exam'
import { supabase } from '@/lib/supabase'

type Report = {
  student: { name: string; track: 'lgs' | 'yks'; grade: number }
  expires_at: string
  days: { day: string; minutes: number }[]
  questions: number
  tasks_total: number
  tasks_done: number
  exams: { title: string; kind: string; taken_on: string; net: number }[]
}

const weekday = ['Paz', 'Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt']

// Giriş gerektirmeyen, salt okunur veli raporu. Arama motorlarına kapalı ve adres bilgisi sızdırmaz
export default function ReportPage() {
  const { token = '' } = useParams()

  useEffect(() => {
    const robots = document.createElement('meta')
    robots.name = 'robots'
    robots.content = 'noindex, nofollow'
    const referrer = document.createElement('meta')
    referrer.name = 'referrer'
    referrer.content = 'no-referrer'
    document.head.append(robots, referrer)
    const previous = document.title
    document.title = 'Haftalık rapor · Yolumnet'
    return () => {
      robots.remove()
      referrer.remove()
      document.title = previous
    }
  }, [])

  const report = useQuery({
    queryKey: ['report', token],
    retry: false,
    queryFn: async (): Promise<Report | null> => {
      const { data, error } = await supabase.rpc('report_by_token', { p_token: token })
      if (error) throw error
      return data as unknown as Report | null
    },
  })

  const data = report.data
  const total = data?.days.reduce((s, d) => s + d.minutes, 0) ?? 0
  const peak = Math.max(1, ...(data?.days.map((d) => d.minutes) ?? [1]))

  return (
    <div className="min-h-dvh bg-bg">
      <header className="border-b border-line bg-surface">
        <div className="mx-auto flex h-14 max-w-2xl items-center px-4">
          <Logo />
        </div>
      </header>
      <main className="mx-auto max-w-2xl space-y-4 px-4 py-6">
        {report.isPending ? (
          <>
            <Skeleton className="h-10 w-2/3" />
            <Skeleton className="h-40" />
          </>
        ) : !data ? (
          <div className="rounded-2xl border border-dashed border-line-strong p-8 text-center">
            <LinkIcon className="mx-auto size-6 text-muted" />
            <h1 className="mt-3 text-lg font-bold">Bu bağlantı geçersiz ya da süresi dolmuş</h1>
            <p className="mt-1 text-sm text-muted">Yeni bir bağlantı için öğretmeninizle görüşün.</p>
          </div>
        ) : (
          <>
            <div>
              <h1 className="text-2xl font-extrabold">{data.student.name}</h1>
              <p className="text-[15px] text-muted">
                {data.student.track === 'lgs' ? 'LGS' : 'YKS'} · {gradeLabel[data.student.grade] ?? `${data.student.grade}. sınıf`} · Son 7 gün
              </p>
            </div>

            <section className="rounded-2xl border border-line bg-surface p-4">
              <div className="flex items-baseline justify-between gap-3">
                <h2 className="font-display text-base font-bold">Çalışma süresi</h2>
                <p className="tabular text-sm font-semibold">{formatMinutes(total)}</p>
              </div>
              <div className="mt-3 flex h-24 items-end gap-1.5">
                {data.days.map((d) => (
                  <div key={d.day} className="flex h-full flex-1 flex-col items-center gap-1">
                    <div className="flex w-full flex-1 items-end">
                      <div className="w-full rounded-t-md bg-primary" style={{ height: `${(d.minutes / peak) * 100}%`, minHeight: d.minutes ? 3 : 0 }} />
                    </div>
                    <span className="text-[11px] font-semibold text-muted">{weekday[new Date(`${d.day}T12:00:00`).getDay()]}</span>
                  </div>
                ))}
              </div>
            </section>

            <div className="grid grid-cols-2 gap-3">
              <div className="rounded-2xl border border-line bg-surface p-4">
                <p className="text-sm text-muted">Çözülen soru</p>
                <p className="tabular mt-1 font-display text-3xl font-extrabold">{data.questions}</p>
              </div>
              <div className="rounded-2xl border border-line bg-surface p-4">
                <p className="text-sm text-muted">Tamamlanan görev</p>
                <p className="tabular mt-1 font-display text-3xl font-extrabold">
                  {data.tasks_done}
                  <span className="text-lg text-subtle"> / {data.tasks_total}</span>
                </p>
              </div>
            </div>

            <section className="rounded-2xl border border-line bg-surface p-4">
              <h2 className="font-display text-base font-bold">Son denemeler</h2>
              {data.exams.length === 0 ? (
                <p className="mt-2 text-sm text-muted">Henüz deneme girilmedi.</p>
              ) : (
                <ul className="mt-2 divide-y divide-line">
                  {data.exams.map((e, i) => (
                    <li key={i} className="flex items-center justify-between gap-3 py-2.5">
                      <div className="min-w-0">
                        <p className="truncate font-semibold">{e.title}</p>
                        <p className="text-sm text-muted">
                          {e.kind} · {formatDate(e.taken_on, 'd MMMM')}
                        </p>
                      </div>
                      <p className="tabular shrink-0 font-display text-lg font-bold">{formatNet(e.net)} net</p>
                    </li>
                  ))}
                </ul>
              )}
            </section>

            <p className="pt-2 text-center text-xs text-subtle">Bu bağlantı {formatDate(data.expires_at.slice(0, 10), 'd MMMM')} tarihine kadar geçerlidir.</p>
          </>
        )}
      </main>
    </div>
  )
}
