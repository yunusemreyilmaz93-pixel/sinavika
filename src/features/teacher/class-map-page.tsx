import { ChevronDown, ChevronRight, CopyPlus, Grid3x3, UserPlus, Users } from 'lucide-react'
import { Fragment, useMemo, useState } from 'react'
import { Link } from 'react-router'
import { PageHeader } from '@/components/app/page-header'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { BulkTaskModal } from '@/features/plan/bulk-task'
import { firstName, usePlannerStudents, type PlannerStudent } from '@/features/plan/student-picker'
import { levelLabel, type MasteryLevel } from '@/features/topics/mastery'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { weekStartISO } from '@/lib/dates'
import { examKindsFor, examLabel, subjectsFor, type ExamKind, type Subject, type Topic } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { groupCandidates, masteryGrid, useClassSignals } from './class-map'

const swatch: Record<MasteryLevel, string> = {
  mastered: 'bg-primary',
  solid: 'bg-primary/55',
  learning: 'bg-accent',
  review: 'bg-warning',
  none: 'bg-line-strong/60',
}
const legend: MasteryLevel[] = ['mastered', 'solid', 'learning', 'review', 'none']
const order: MasteryLevel[] = ['mastered', 'solid', 'learning', 'review', 'none']

type Bulk = { studentIds: string[]; subjectId: string; topicId: number; title: string }

export default function ClassMapPage() {
  const profile = useProfile()
  const students = usePlannerStudents(profile.id)
  const curriculum = useCurriculum()
  const list = useMemo(() => students.data ?? [], [students.data])
  const signals = useClassSignals(list.map((s) => s.id))
  const kinds = useMemo(() => {
    const all: ExamKind[] = ['LGS', 'TYT', 'AYT', 'YDT']
    return all.filter((k) => list.some((s) => examKindsFor(s).includes(k)))
  }, [list])
  const [picked, setPicked] = useState<ExamKind | null>(null)
  const kind = picked && kinds.includes(picked) ? picked : kinds[0]
  const [open, setOpen] = useState<string | null>(null)
  const [bulk, setBulk] = useState<Bulk | null>(null)

  const header = <PageHeader title="Sınıf haritası" />

  if (students.isPending || curriculum.isPending || (list.length > 0 && signals.isPending)) {
    return (
      <>
        {header}
        <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
          <Skeleton className="h-10 w-64" />
          <Skeleton className="h-40 rounded-2xl" />
          <Skeleton className="h-96 rounded-2xl" />
        </div>
      </>
    )
  }
  if (students.error || curriculum.error || signals.error) {
    return (
      <>
        {header}
        <EmptyState
          icon={Grid3x3}
          title="Harita yüklenemedi"
          description={errorMessage(students.error ?? curriculum.error ?? signals.error)}
          action={
            <Button variant="secondary" onClick={() => void signals.refetch()}>
              Tekrar deneyin
            </Button>
          }
        />
      </>
    )
  }
  if (!list.length || !kind || !curriculum.data || !signals.data) {
    return (
      <>
        {header}
        <EmptyState
          icon={UserPlus}
          title="Henüz öğrenciniz yok"
          description="Öğrencileriniz katılınca her birinin konu hakimiyetini burada yan yana görürsünüz."
          action={
            <Button asChild>
              <Link to="/app/davetler?yeni=1">Öğrenci davet edin</Link>
            </Button>
          }
        />
      </>
    )
  }

  const level = masteryGrid(signals.data)
  const rows = list.filter((s) => examKindsFor(s).includes(kind))
  const subjects = subjectsFor(curriculum.data.subjects, kind, null).filter((sub) =>
    rows.some((s) => subjectsFor(curriculum.data.subjects, kind, s.field).some((x) => x.id === sub.id)),
  )
  const topicsOf = (sub: Subject) => curriculum.data.topicsBySubject.get(sub.id) ?? []
  const takes = (s: PlannerStudent, sub: Subject) => !sub.fields || !s.field || sub.fields.includes(s.field)
  const eligible = (studentId: string, topicId: number) => {
    const s = rows.find((r) => r.id === studentId)
    const t = curriculum.data.topicById.get(topicId)
    const sub = t && curriculum.data.subjectById.get(t.subject_id)
    return Boolean(s && sub && takes(s, sub))
  }
  const candidates = groupCandidates(
    (studentId, topicId) => (eligible(studentId, topicId) ? level(studentId, topicId) : 'none'),
    rows.map((s) => s.id),
    subjects.flatMap((sub) => topicsOf(sub).map((t) => t.id)),
  )
    .slice(0, 6)

  return (
    <>
      {header}
      {kinds.length > 1 && (
        <Segmented
          className="mb-5 sm:w-fit"
          value={kind}
          onChange={(k) => {
            setPicked(k)
            setOpen(null)
          }}
          options={kinds.map((k) => ({ value: k, label: examLabel[k] }))}
        />
      )}

      <Card className="mb-5 p-4 sm:p-5">
        <div className="flex items-start gap-3">
          <span className="grid size-10 shrink-0 place-items-center rounded-xl bg-warning-soft text-warning" aria-hidden>
            <Users className="size-5" />
          </span>
          <div className="min-w-0">
            <h2 className="text-base font-bold">Toplu anlatım adayları</h2>
            <p className="mt-0.5 text-sm text-muted">
              {candidates.length ? 'Birden fazla öğrencide tekrar gereken konular.' : 'Şu an birden fazla öğrencide tekrar gereken konu yok.'}
            </p>
          </div>
        </div>
        {candidates.length > 0 && (
          <ul className="mt-4 divide-y divide-line">
            {candidates.map((c) => {
              const topic = curriculum.data.topicById.get(c.topicId) as Topic
              const subject = curriculum.data.subjectById.get(topic.subject_id)
              const names = c.studentIds.map((id) => list.find((s) => s.id === id)).filter((s): s is PlannerStudent => Boolean(s))
              return (
                <li key={c.topicId} className="flex flex-wrap items-center gap-x-3 gap-y-2 py-3 first:pt-0 last:pb-0">
                  <div className="min-w-0 flex-1">
                    <p className="font-semibold">{topic.name}</p>
                    <p className="text-sm text-muted">
                      {subject?.name} · {names.map((s) => firstName(s.full_name)).join(', ')}
                    </p>
                  </div>
                  <div className="flex -space-x-2" aria-hidden>
                    {names.slice(0, 4).map((s) => (
                      <Avatar key={s.id} name={s.full_name} userId={s.id} className="size-8 text-xs ring-2 ring-surface" />
                    ))}
                  </div>
                  <Button
                    variant="soft"
                    size="sm"
                    className="min-h-11"
                    onClick={() =>
                      setBulk({ studentIds: c.studentIds, subjectId: topic.subject_id, topicId: topic.id, title: `${topic.name} · Tekrar` })
                    }
                  >
                    <CopyPlus />
                    {c.studentIds.length} öğrenciye görev
                  </Button>
                </li>
              )
            })}
          </ul>
        )}
      </Card>

      <div className="mb-3 flex flex-wrap items-center gap-x-4 gap-y-2 text-sm" aria-label="Renkler">
        {legend.map((l) => (
          <span key={l} className="inline-flex items-center gap-1.5 text-muted">
            <span className={cn('size-3 rounded-[4px]', swatch[l])} aria-hidden />
            {levelLabel[l]}
          </span>
        ))}
      </div>

      <Card className="overflow-x-auto">
        <table className="w-full border-separate border-spacing-0 text-sm">
          <thead>
            <tr>
              <th scope="col" className="sticky left-0 z-10 border-b border-line bg-surface px-3 py-3 text-left font-semibold sm:min-w-44 sm:px-4">
                Öğrenci
              </th>
              {subjects.map((sub) => {
                const isOpen = open === sub.id
                return (
                  <Fragment key={sub.id}>
                    <th scope="col" colSpan={isOpen ? topicsOf(sub).length : 1} className="border-b border-l border-line px-1 py-1 align-bottom">
                      <button
                        type="button"
                        aria-expanded={isOpen}
                        onClick={() => setOpen(isOpen ? null : sub.id)}
                        className={cn(
                          'flex min-h-11 w-full items-center justify-center gap-1 rounded-lg px-2 text-[13px] font-semibold whitespace-nowrap transition-colors hover:bg-surface-2',
                          isOpen && 'bg-surface-2',
                        )}
                      >
                        {isOpen ? sub.name : sub.short}
                        {isOpen ? <ChevronDown className="size-4" aria-hidden /> : <ChevronRight className="size-4 text-subtle" aria-hidden />}
                      </button>
                    </th>
                  </Fragment>
                )
              })}
            </tr>
            {open && (
              <tr>
                <th className="sticky left-0 z-10 border-b border-line bg-surface" aria-hidden />
                {subjects.map((sub) =>
                  open === sub.id ? (
                    topicsOf(sub).map((t, i) => (
                      <th key={t.id} scope="col" className={cn('border-b border-line px-0.5 pt-2 pb-1 align-bottom', i === 0 && 'border-l')}>
                        <span title={t.name} className="mx-auto block max-h-40 overflow-hidden text-[11px] font-medium text-ellipsis whitespace-nowrap text-muted [writing-mode:vertical-rl] rotate-180">
                          {t.name}
                        </span>
                      </th>
                    ))
                  ) : (
                    <th key={sub.id} className="border-b border-l border-line" aria-hidden />
                  ),
                )}
              </tr>
            )}
          </thead>
          <tbody>
            {rows.map((s) => (
              <tr key={s.id} className="group">
                <th scope="row" className="sticky left-0 z-10 border-b border-line bg-surface px-3 py-2 text-left font-normal group-last:border-b-0 sm:px-4">
                  <Link to={`/app/ogrenciler/${s.id}?tab=konular`} className="flex min-h-11 items-center gap-2.5 hover:underline">
                    <Avatar name={s.full_name} userId={s.id} className="size-8 text-xs" />
                    <span className="truncate font-semibold sm:hidden">{firstName(s.full_name)}</span>
                    <span className="hidden truncate font-semibold sm:inline">{s.full_name}</span>
                  </Link>
                </th>
                {subjects.map((sub) => {
                  const topics = topicsOf(sub)
                  if (!takes(s, sub)) {
                    return (
                      <td key={sub.id} colSpan={open === sub.id ? topics.length : 1} className="border-b border-l border-line text-center text-xs text-subtle group-last:border-b-0">
                        Almıyor
                      </td>
                    )
                  }
                  if (open === sub.id) {
                    return topics.map((t, i) => {
                      const l = level(s.id, t.id)
                      return (
                        <td key={t.id} className={cn('border-b border-line p-0.5 text-center group-last:border-b-0', i === 0 && 'border-l')}>
                          <span
                            role="img"
                            aria-label={`${t.name}: ${levelLabel[l]}`}
                            title={`${t.name}: ${levelLabel[l]}`}
                            className={cn('mx-auto block size-6 rounded-md', swatch[l])}
                          />
                        </td>
                      )
                    })
                  }
                  const counts = Object.fromEntries(order.map((o) => [o, 0])) as Record<MasteryLevel, number>
                  for (const t of topics) counts[level(s.id, t.id)]++
                  const good = counts.mastered + counts.solid
                  return (
                    <td key={sub.id} className="border-b border-l border-line px-3 py-2 group-last:border-b-0">
                      <div
                        role="img"
                        aria-label={`${sub.name}: ${order.map((o) => `${levelLabel[o]} ${counts[o]}`).join(', ')}`}
                        className="mx-auto flex h-2.5 w-20 overflow-hidden rounded-full"
                      >
                        {order.map((o) =>
                          counts[o] ? <span key={o} className={swatch[o]} style={{ width: `${(counts[o] / topics.length) * 100}%` }} /> : null,
                        )}
                      </div>
                      <p className="tabular mt-1 text-center text-[11px] text-muted">
                        {good}/{topics.length}
                        {counts.review > 0 && <span className="font-semibold text-warning"> · {counts.review} tekrar</span>}
                      </p>
                    </td>
                  )
                })}
              </tr>
            ))}
          </tbody>
        </table>
      </Card>
      <p className="mt-2 text-xs text-muted">Bir derse dokunun, konuları tek tek açılır. Öğrenci adına dokununca konuları açılır.</p>

      {bulk && (
        <BulkTaskModal
          open
          onOpenChange={(o) => !o && setBulk(null)}
          students={list}
          initialStudentIds={bulk.studentIds}
          initialDraft={{ kind: 'review', subjectId: bulk.subjectId, topicId: String(bulk.topicId), title: bulk.title }}
          initialWeek={weekStartISO()}
        />
      )}
    </>
  )
}
