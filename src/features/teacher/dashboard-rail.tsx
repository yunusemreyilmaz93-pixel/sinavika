import { ArrowRight, Grid3x3 } from 'lucide-react'
import { Link } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Card, CardHeader } from '@/components/ui/card'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { formatMinutes, todayISO } from '@/lib/dates'
import { studentSubjects, subjectColor } from '@/lib/exam'
import { groupCandidates, masteryGrid, useClassSignals } from './class-map'
import type { OverviewRow } from './overview'

// Birden fazla öğrencide tekrar gereken konular. Ayrıntısı ve toplu görev sınıf haritasında
export function ClassWeakTopics({ students }: { students: OverviewRow[] }) {
  const curriculum = useCurriculum()
  const signals = useClassSignals(students.map((s) => s.id))
  const data = curriculum.data
  if (!data || !signals.data || students.length < 2) return null

  const level = masteryGrid(signals.data, todayISO())
  const allowed = new Map(students.map((s) => [s.id, new Set(studentSubjects(data.subjects, s).map((x) => x.id))]))
  const topicIds = data.topics.filter((t) => students.some((s) => allowed.get(s.id)?.has(t.subject_id))).map((t) => t.id)
  const candidates = groupCandidates(
    (studentId, topicId) => (allowed.get(studentId)?.has(data.topicById.get(topicId)?.subject_id ?? '') ? level(studentId, topicId) : 'none'),
    students.map((s) => s.id),
    topicIds,
  ).slice(0, 3)
  if (!candidates.length) return null

  return (
    <Card>
      <CardHeader title="Sınıfta zorlanılan konular" action={<Grid3x3 aria-hidden className="size-5 text-muted" />} />
      <ul className="space-y-2.5 p-4 sm:p-5">
        {candidates.map((c) => {
          const topic = data.topicById.get(c.topicId)
          const subject = data.subjectById.get(topic?.subject_id ?? '')
          const color = subjectColor(subject)
          return (
            <li key={c.topicId} className="flex items-center gap-3">
              <span className="tabular grid size-9 shrink-0 place-items-center rounded-xl text-sm font-extrabold" style={{ color, backgroundColor: `${color}1f` }}>
                {c.studentIds.length}
              </span>
              <div className="min-w-0 flex-1">
                <p className="truncate text-sm font-semibold">{topic?.name}</p>
                <p className="truncate text-xs text-muted">
                  {subject?.name} · {c.studentIds.length} öğrencide tekrar gerekiyor
                </p>
              </div>
            </li>
          )
        })}
      </ul>
      <div className="px-4 pb-4 sm:px-5 sm:pb-5">
        <Link to="/app/sinif" className="inline-flex min-h-11 items-center gap-1 text-sm font-semibold text-accent hover:underline">
          Sınıf haritasında görev verin
          <ArrowRight className="size-4" />
        </Link>
      </div>
    </Card>
  )
}

export function TopStudents({ students }: { students: OverviewRow[] }) {
  const top = [...students].filter((s) => s.minutes_7d > 0).sort((a, b) => b.minutes_7d - a.minutes_7d).slice(0, 3)
  if (top.length < 2) return null
  return (
    <Card>
      <CardHeader title="Bu hafta en çok çalışanlar" />
      <ol className="space-y-2.5 p-4 sm:p-5">
        {top.map((s, i) => (
          <li key={s.id}>
            <Link to={`/app/ogrenciler/${s.id}`} className="flex min-h-11 items-center gap-3 rounded-xl hover:bg-surface-2">
              <span className={cn('tabular grid size-7 shrink-0 place-items-center rounded-full text-xs font-extrabold', i === 0 ? 'bg-marker text-marker-fg' : 'bg-surface-2 text-muted')}>{i + 1}</span>
              <Avatar name={s.full_name} userId={s.id} className="size-8 text-[11px]" />
              <span className="min-w-0 flex-1 truncate text-sm font-semibold">{s.full_name}</span>
              <span className="tabular text-xs text-muted">{formatMinutes(s.minutes_7d)}</span>
            </Link>
          </li>
        ))}
      </ol>
    </Card>
  )
}
