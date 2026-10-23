import { Check, Inbox, Mail } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { useSettings } from '@/lib/data'
import { formatRelative } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { useAdminOverview, useAdminTeachers, useTeacherStatus, type AdminTeacher } from './queries'
import { LoadError } from './ui'

const dateTime = new Intl.DateTimeFormat('tr-TR', { dateStyle: 'long', timeStyle: 'short', timeZone: 'Europe/Istanbul' })

export function ApplicationsSection({ onNavigate }: { onNavigate: (section: 'ogretmenler') => void }) {
  const teachers = useAdminTeachers()
  const overview = useAdminOverview()
  const settings = useSettings()

  if (teachers.isPending) {
    return (
      <div className="space-y-3" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-48" />
        <Skeleton className="h-48" />
      </div>
    )
  }
  if (teachers.isError) return <LoadError error={teachers.error} onRetry={() => void teachers.refetch()} />

  const pending = teachers.data.filter((t) => t.status === 'pending')
  const active = overview.data?.teachers_active
  const capacity = settings.data?.teacherCapacity

  if (!pending.length) {
    return (
      <EmptyState
        icon={Inbox}
        title="Bekleyen başvuru yok"
        description="Yeni öğretmen başvuruları burada görünür. Onayladığınız öğretmen hemen öğrenci davet edebilir."
        action={
          <Button variant="secondary" onClick={() => onNavigate('ogretmenler')}>
            Öğretmenleri görün
          </Button>
        }
      />
    )
  }

  return (
    <div className="space-y-3">
      <p className="text-sm text-muted">
        {pending.length} başvuru bekliyor
        {active != null && capacity ? (
          <>
            . Öğretmen kontenjanı{' '}
            <span className="tabular font-semibold text-fg">
              {active} / {capacity}
            </span>
          </>
        ) : null}
      </p>
      <ul className="space-y-3">
        <AnimatePresence initial={false}>
          {pending.map((teacher) => (
            <motion.li
              key={teacher.id}
              layout
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, x: 24, transition: { duration: 0.2 } }}
              transition={{ duration: 0.25 }}
            >
              <ApplicationCard teacher={teacher} />
            </motion.li>
          ))}
        </AnimatePresence>
      </ul>
    </div>
  )
}

function ApplicationCard({ teacher }: { teacher: AdminTeacher }) {
  const status = useTeacherStatus()
  const [rejecting, setRejecting] = useState(false)
  const busy = status.isPending

  async function approve() {
    try {
      await status.mutateAsync({ id: teacher.id, status: 'active' })
      toast.success(`${teacher.full_name} onaylandı`)
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  async function reject() {
    try {
      await status.mutateAsync({ id: teacher.id, status: 'rejected' })
      toast.success('Başvuru reddedildi')
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <Card className="p-4 sm:p-5">
      <div className="flex items-start gap-3">
        <Avatar name={teacher.full_name} userId={teacher.id} />
        <div className="min-w-0 flex-1">
          <div className="flex flex-wrap items-baseline justify-between gap-x-3 gap-y-0.5">
            <h3 className="text-base font-bold">{teacher.full_name}</h3>
            <time dateTime={teacher.created_at} title={dateTime.format(new Date(teacher.created_at))} className="text-xs text-muted">
              {formatRelative(teacher.created_at)} başvurdu
            </time>
          </div>
          {teacher.email && (
            <a href={`mailto:${teacher.email}`} className="mt-0.5 inline-flex max-w-full items-center gap-1.5 text-sm text-accent hover:underline">
              <Mail className="size-3.5 shrink-0" />
              <span className="truncate">{teacher.email}</span>
            </a>
          )}
        </div>
      </div>

      <dl className="mt-4 grid gap-3 text-sm sm:grid-cols-2">
        <div className="min-w-0">
          <dt className="text-xs font-semibold text-muted">Okul</dt>
          <dd className="mt-0.5">
            {teacher.school || <span className="text-subtle">Belirtilmedi</span>}
          </dd>
        </div>
        <div className="min-w-0">
          <dt className="text-xs font-semibold text-muted">Branş</dt>
          <dd className="mt-0.5">{teacher.branch || <span className="text-subtle">Belirtilmedi</span>}</dd>
        </div>
      </dl>

      {teacher.application_note && (
        <div className="mt-3">
          <p className="text-xs font-semibold text-muted">Not</p>
          <p className="mt-1 rounded-xl bg-surface-2 px-3.5 py-2.5 text-sm leading-relaxed break-words whitespace-pre-line">
            {teacher.application_note}
          </p>
        </div>
      )}

      <div className="mt-4 flex gap-2 sm:justify-end">
        <Button variant="secondary" className="flex-1 sm:flex-none" disabled={busy} onClick={() => setRejecting(true)}>
          Reddet
        </Button>
        <Button className="flex-1 sm:flex-none" loading={busy && status.variables?.status === 'active'} disabled={busy} onClick={() => void approve()}>
          <Check />
          Onayla
        </Button>
      </div>

      <Confirm
        open={rejecting}
        onOpenChange={setRejecting}
        title="Başvuru reddedilsin mi?"
        description={`${teacher.full_name} uygulamayı kullanamaz. Fikrinizi değiştirirseniz Öğretmenler bölümünden onaylayabilirsiniz.`}
        confirmLabel="Reddet"
        onConfirm={reject}
      />
    </Card>
  )
}
