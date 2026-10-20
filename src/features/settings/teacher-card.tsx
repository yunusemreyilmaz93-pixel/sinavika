import { useQuery } from '@tanstack/react-query'
import { School } from 'lucide-react'
import { Link } from 'react-router'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { ProgressBar } from '@/components/ui/progress'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { keys, useSettings } from '@/lib/data'
import { errorMessage, supabase } from '@/lib/supabase'
import { SettingsCard } from './ui'

const statusLabel = {
  active: { label: 'Onaylı', tone: 'primary' },
  pending: { label: 'Onay bekliyor', tone: 'warning' },
  rejected: { label: 'Reddedildi', tone: 'danger' },
  disabled: { label: 'Durduruldu', tone: 'danger' },
} as const

export function TeacherCard() {
  const profile = useProfile()
  const settings = useSettings()
  const active = profile.status === 'active'

  const usage = useQuery({
    queryKey: [...keys.invites, 'capacity', profile.id],
    enabled: active,
    queryFn: async () => {
      const [students, invites] = await Promise.all([
        supabase.from('students').select('id', { count: 'exact', head: true }).eq('teacher_id', profile.id).is('archived_at', null),
        supabase
          .from('invites')
          .select('code', { count: 'exact', head: true })
          .eq('teacher_id', profile.id)
          .eq('kind', 'student')
          .is('used_at', null)
          .gt('expires_at', new Date().toISOString()),
      ])
      if (students.error) throw new Error(errorMessage(students.error))
      if (invites.error) throw new Error(errorMessage(invites.error))
      return { students: students.count ?? 0, invites: invites.count ?? 0 }
    },
  })

  const status = statusLabel[profile.status]
  const capacity = settings.data?.studentCapacity

  return (
    <SettingsCard icon={School} title="Öğretmen bilgileri" action={<Badge tone={status.tone}>{status.label}</Badge>}>
      <dl className="grid gap-3 text-sm sm:grid-cols-2">
        <div>
          <dt className="text-xs font-semibold text-muted">Okul</dt>
          <dd className="mt-0.5 font-semibold">{profile.school || <span className="font-normal text-subtle">Belirtilmedi</span>}</dd>
        </div>
        <div>
          <dt className="text-xs font-semibold text-muted">Branş</dt>
          <dd className="mt-0.5 font-semibold">{profile.branch || <span className="font-normal text-subtle">Belirtilmedi</span>}</dd>
        </div>
      </dl>

      {active && (
        <div className="mt-5 border-t border-line pt-4">
          <div className="flex items-baseline justify-between gap-3">
            <h4 className="text-sm font-semibold">Öğrenci kontenjanı</h4>
            {usage.data && capacity ? (
              <span className="tabular font-display text-lg font-bold">
                {usage.data.students + usage.data.invites}
                <span className="text-subtle"> / {capacity}</span>
              </span>
            ) : null}
          </div>
          {usage.isPending || !capacity ? (
            <Skeleton className="mt-3 h-10" />
          ) : usage.isError ? (
            <p className="mt-2 text-sm text-danger">{errorMessage(usage.error)}</p>
          ) : (
            <>
              <ProgressBar
                className="mt-2"
                value={(usage.data.students + usage.data.invites) / capacity}
                tone={usage.data.students + usage.data.invites >= capacity ? 'warning' : 'primary'}
              />
              <p className="mt-2 text-sm text-muted">
                {usage.data.students} öğrenci
                {usage.data.invites > 0 && `, ${usage.data.invites} açık davet`}.{' '}
                {usage.data.students + usage.data.invites >= capacity
                  ? 'Kontenjan dolu. Açık bir daveti iptal edersen yer açılır.'
                  : `${capacity - usage.data.students - usage.data.invites} yer boş.`}
              </p>
              <Button asChild variant="secondary" className="mt-3 w-full sm:w-auto">
                <Link to="/app/davetler">Davetlere git</Link>
              </Button>
            </>
          )}
        </div>
      )}
    </SettingsCard>
  )
}
