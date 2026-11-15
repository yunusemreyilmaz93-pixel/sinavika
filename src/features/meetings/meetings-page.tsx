import { CalendarPlus, ExternalLink, Video } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { Link } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Field, Input, Select } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { NoteForm } from '@/features/notes/note-form'
import { useTeacherOverview } from '@/features/teacher/overview'
import { useNow } from './next-meeting'
import { formatDate, todayISO } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { durationMinutes, MEETING_MINUTES, phaseOf, useCancelMeeting, useCreateMeeting, useMeetings, type Meeting } from './queries'

export default function MeetingsPage() {
  const profile = useProfile()
  const isTeacher = profile.role === 'teacher'
  const meetings = useMeetings()
  const overview = useTeacherOverview(isTeacher)
  const [planning, setPlanning] = useState(false)
  const [cancelling, setCancelling] = useState<Meeting | null>(null)
  const [noteFor, setNoteFor] = useState<Meeting | null>(null)
  const cancel = useCancelMeeting()
  const now = useNow()

  const students = (overview.data ?? []).filter((s) => !s.archived_at)
  const nameOf = (m: Meeting) => (isTeacher ? (students.find((s) => s.id === m.student_id)?.full_name ?? 'Öğrenci') : 'Öğretmen')
  const list = meetings.data ?? []
  const upcoming = list.filter((m) => ['upcoming', 'open', 'live'].includes(phaseOf(m, now)))
  const past = list
    .filter((m) => !upcoming.includes(m))
    .reverse()
    .slice(0, 30)

  return (
    <>
      <PageHeader
        title="Görüşmeler"
        description={`Uygulama içi görüşme ${MEETING_MINUTES} dakika sürer ve her öğrenciyle haftada bir yapılır. Görüntü ve ses kaydedilmez.`}
        actions={
          isTeacher && (
            <Button onClick={() => setPlanning(true)} disabled={!students.length}>
              <CalendarPlus />
              Görüşme planla
            </Button>
          )
        }
      />
      {meetings.isPending ? (
        <div className="space-y-3">
          <Skeleton className="h-24 rounded-3xl" />
          <Skeleton className="h-24 rounded-3xl" />
        </div>
      ) : meetings.isError ? (
        <EmptyState
          icon={Video}
          title="Görüşmeler yüklenemedi"
          description={errorMessage(meetings.error)}
          action={
            <Button variant="secondary" onClick={() => void meetings.refetch()}>
              Tekrar deneyin
            </Button>
          }
        />
      ) : (
        <div className="grid gap-5 xl:grid-cols-[minmax(0,1fr)_22rem] xl:items-start">
          <section aria-label="Yaklaşan görüşmeler" className="min-w-0">
            {upcoming.length === 0 ? (
              <EmptyState
                icon={Video}
                title="Planlı görüşme yok"
                description={
                  isTeacher
                    ? 'Öğrencinizle bir görüşme planlayın, öğrenciye bildirim gider.'
                    : 'Öğretmen görüşme planlayınca burada görünür.'
                }
                action={
                  isTeacher && students.length > 0 ? (
                    <Button onClick={() => setPlanning(true)}>
                      <CalendarPlus />
                      Görüşme planla
                    </Button>
                  ) : undefined
                }
              />
            ) : (
              <ul className="space-y-3">
                {upcoming.map((m) => (
                  <li key={m.id}>
                    <MeetingCard meeting={m} now={now} name={nameOf(m)} isTeacher={isTeacher} onCancel={() => setCancelling(m)} />
                  </li>
                ))}
              </ul>
            )}
          </section>
          <Card>
            <CardHeader title="Geçmiş" />
            {past.length === 0 ? (
              <p className="px-4 pb-5 text-sm text-muted sm:px-5">Henüz geçmiş görüşme yok.</p>
            ) : (
              <ul className="divide-y divide-line">
                {past.map((m) => {
                  const phase = phaseOf(m, now)
                  const minutes = durationMinutes(m)
                  return (
                    <li key={m.id} className="flex min-h-14 items-center gap-3 px-4 py-2.5 sm:px-5">
                      <div className="min-w-0 flex-1">
                        <p className="truncate text-sm font-semibold">{nameOf(m)}</p>
                        <p className="text-xs text-muted">
                          {formatDate(m.starts_at, 'd MMM, HH:mm')}
                          {phase === 'cancelled'
                            ? ' · iptal'
                            : phase === 'missed'
                              ? ' · yapılmadı'
                              : m.mode === 'app' && minutes
                                ? ` · ${minutes} dk`
                                : m.mode === 'link'
                                  ? ' · dış bağlantı'
                                  : ''}
                        </p>
                      </div>
                      {isTeacher && phase === 'done' && (
                        <Button size="sm" variant="secondary" onClick={() => setNoteFor(m)}>
                          Not yaz
                        </Button>
                      )}
                    </li>
                  )
                })}
              </ul>
            )}
          </Card>
        </div>
      )}

      {isTeacher && planning && <PlanDialog onClose={() => setPlanning(false)} students={students} />}
      <Confirm
        open={Boolean(cancelling)}
        onOpenChange={(o) => !o && setCancelling(null)}
        title="Görüşme iptal edilsin mi"
        description="Öğrenciye bildirim gider. Uygulama içi görüşmeyse bu haftaki hakkı yeniden açılır."
        confirmLabel="İptal et"
        onConfirm={async () => {
          if (!cancelling) return
          try {
            await cancel.mutateAsync(cancelling.id)
            toast.success('Görüşme iptal edildi')
            setCancelling(null)
          } catch (e) {
            toast.error(errorMessage(e))
          }
        }}
      />
      {noteFor && (
        <NoteForm
          open
          onOpenChange={(o) => !o && setNoteFor(null)}
          studentId={noteFor.student_id}
          note={null}
          parentCount={students.find((s) => s.id === noteFor.student_id)?.parent_count ?? 0}
          defaults={{
            kind: 'meeting',
            metOn: formatDate(noteFor.starts_at, 'yyyy-MM-dd'),
          }}
        />
      )}
    </>
  )
}

function MeetingCard({
  meeting: m,
  now,
  name,
  isTeacher,
  onCancel,
}: {
  meeting: Meeting
  now: number
  name: string
  isTeacher: boolean
  onCancel: () => void
}) {
  const phase = phaseOf(m, now)
  const canJoin = phase === 'open' || phase === 'live'
  return (
    <Card className="flex flex-col gap-4 p-4 sm:flex-row sm:items-center sm:p-5">
      <div className="flex min-w-0 flex-1 items-center gap-3">
        <Avatar name={name} userId={isTeacher ? m.student_id : m.teacher_id} className="size-12" />
        <div className="min-w-0">
          <p className="truncate font-bold">{isTeacher ? name : 'Öğretmen görüşmesi'}</p>
          <p className="text-sm text-muted">{formatDate(m.starts_at, 'd MMMM EEEE, HH:mm')}</p>
          <div className="mt-1.5 flex flex-wrap gap-1.5">
            <Badge tone={m.mode === 'app' ? 'primary' : 'accent'}>
              {m.mode === 'app' ? `Uygulama içinde · ${MEETING_MINUTES} dk` : 'Dış bağlantı'}
            </Badge>
            {phase === 'live' && <Badge tone="danger">Şu an sürüyor</Badge>}
          </div>
        </div>
      </div>
      <div className="flex gap-2 sm:shrink-0">
        {isTeacher && phase === 'upcoming' && (
          <Button variant="secondary" onClick={onCancel}>
            İptal et
          </Button>
        )}
        {m.mode === 'app' ? (
          <Button asChild={canJoin} disabled={!canJoin} className="flex-1 sm:flex-none">
            {canJoin ? (
              <Link to={`/app/gorusme/${m.id}`}>
                <Video />
                Katıl
              </Link>
            ) : (
              <>
                <Video />
                10 dk önce açılır
              </>
            )}
          </Button>
        ) : (
          <Button asChild variant={canJoin ? 'primary' : 'secondary'} className="flex-1 sm:flex-none">
            <a href={m.link ?? '#'} target="_blank" rel="noopener noreferrer">
              <ExternalLink />
              Bağlantıyı aç
            </a>
          </Button>
        )}
      </div>
    </Card>
  )
}

function PlanDialog({ onClose, students }: { onClose: () => void; students: { id: string; full_name: string }[] }) {
  const create = useCreateMeeting()
  const [studentId, setStudentId] = useState(students[0]?.id ?? '')
  const [date, setDate] = useState(todayISO())
  const [time, setTime] = useState('19:00')
  const [mode, setMode] = useState<'app' | 'link'>('app')
  const [link, setLink] = useState('')
  const [error, setError] = useState<string | null>(null)

  async function submit(e: FormEvent) {
    e.preventDefault()
    setError(null)
    const startsAt = new Date(`${date}T${time}`)
    if (Number.isNaN(startsAt.getTime())) return setError('Tarih ve saati kontrol edin')
    const url = link.trim()
    if (mode === 'link' && !/^https:\/\/\S+$/.test(url)) return setError('Bağlantı https:// ile başlamalı')
    try {
      await create.mutateAsync({
        studentId,
        mode,
        startsAt: startsAt.toISOString(),
        link: mode === 'link' ? url : null,
      })
      toast.success('Görüşme planlandı, öğrenciye bildirim gitti')
      onClose()
    } catch (err) {
      setError(errorMessage(err))
    }
  }

  return (
    <Modal
      open
      onOpenChange={(o) => !o && onClose()}
      title="Görüşme planla"
      footer={
        <>
          <Button variant="secondary" onClick={onClose}>
            Vazgeç
          </Button>
          <Button type="submit" form="plan-meeting" loading={create.isPending}>
            Planla
          </Button>
        </>
      }
    >
      <form id="plan-meeting" onSubmit={submit} className="space-y-4">
        <Field label="Öğrenci">
          {(p) => (
            <Select {...p} value={studentId} onChange={(e) => setStudentId(e.target.value)}>
              {students.map((s) => (
                <option key={s.id} value={s.id}>
                  {s.full_name}
                </option>
              ))}
            </Select>
          )}
        </Field>
        <div className="grid grid-cols-2 gap-3">
          <Field label="Tarih">
            {(p) => <Input {...p} type="date" value={date} min={todayISO()} onChange={(e) => setDate(e.target.value)} required />}
          </Field>
          <Field label="Saat">{(p) => <Input {...p} type="time" value={time} onChange={(e) => setTime(e.target.value)} required />}</Field>
        </div>
        <Field
          label="Nerede"
          hint={
            mode === 'app'
              ? `Haftada bir, ${MEETING_MINUTES} dakika. 35. dakikada uyarı verilir.`
              : 'Google Meet, Zoom ya da başka bir görüşme bağlantısı. Sınır yok.'
          }
        >
          {(p) => (
            <Segmented
              aria-describedby={p['aria-describedby']}
              value={mode}
              onChange={setMode}
              options={[
                { value: 'app', label: 'Uygulama içinde' },
                { value: 'link', label: 'Kendi bağlantım' },
              ]}
            />
          )}
        </Field>
        {mode === 'link' && (
          <Field label="Görüşme bağlantısı">
            {(p) => (
              <Input
                {...p}
                type="url"
                inputMode="url"
                placeholder="https://meet.google.com/..."
                value={link}
                onChange={(e) => setLink(e.target.value)}
                required
              />
            )}
          </Field>
        )}
        {error && (
          <p role="alert" className="rounded-xl bg-danger-soft px-3 py-2 text-sm text-danger">
            {error}
          </p>
        )}
      </form>
    </Modal>
  )
}
