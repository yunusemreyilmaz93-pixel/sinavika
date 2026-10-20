import { Search, UserX, Users } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useDeferredValue, useMemo, useState } from 'react'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Input } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { useProfile } from '@/features/auth/session'
import { formatRelative } from '@/lib/dates'
import { useAdminTeachers, type AccountStatus, type AdminTeacher } from './queries'
import { TeacherActions } from './teacher-actions'
import { LoadError } from './ui'

type Filter = 'all' | 'active' | 'disabled' | 'rejected'

const filters: { value: Filter; label: string }[] = [
  { value: 'all', label: 'Tümü' },
  { value: 'active', label: 'Aktif' },
  { value: 'disabled', label: 'Durduruldu' },
  { value: 'rejected', label: 'Reddedildi' },
]

const statusBadge: Record<AccountStatus, { label: string; tone: 'primary' | 'warning' | 'danger' | 'neutral' }> = {
  active: { label: 'Aktif', tone: 'primary' },
  pending: { label: 'Bekliyor', tone: 'neutral' },
  disabled: { label: 'Durduruldu', tone: 'warning' },
  rejected: { label: 'Reddedildi', tone: 'danger' },
}

function normalize(value: string) {
  return value.toLocaleLowerCase('tr').trim()
}

export function TeachersSection() {
  const profile = useProfile()
  const teachers = useAdminTeachers()
  const [query, setQuery] = useState('')
  const [filter, setFilter] = useState<Filter>('all')
  const deferred = useDeferredValue(query)

  const all = useMemo(() => (teachers.data ?? []).filter((t) => t.status !== 'pending'), [teachers.data])
  const visible = useMemo(() => {
    const q = normalize(deferred)
    return all.filter((t) => {
      if (filter !== 'all' && t.status !== filter) return false
      if (!q) return true
      return [t.full_name, t.email, t.school, t.branch].some((v) => v && normalize(v).includes(q))
    })
  }, [all, deferred, filter])

  if (teachers.isPending) {
    return (
      <div className="space-y-3" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-11" />
        <Skeleton className="h-72" />
      </div>
    )
  }
  if (teachers.isError) return <LoadError error={teachers.error} onRetry={() => void teachers.refetch()} />

  return (
    <div className="space-y-3">
      <div className="flex flex-col gap-3 sm:flex-row sm:items-center">
        <label className="relative block flex-1">
          <span className="sr-only">Öğretmen ara</span>
          <Search className="pointer-events-none absolute top-1/2 left-3.5 size-4 -translate-y-1/2 text-subtle" />
          <Input
            type="search"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Ad, e-posta veya okul ara"
            className="pl-10"
            enterKeyHint="search"
          />
        </label>
        <Segmented options={filters} value={filter} onChange={setFilter} size="sm" className="sm:w-auto" />
      </div>

      {visible.length === 0 ? (
        all.length === 0 ? (
          <EmptyState icon={Users} title="Henüz öğretmen yok" description="Onayladığın başvurular burada listelenir." />
        ) : (
          <EmptyState
            icon={UserX}
            title="Eşleşen öğretmen yok"
            description="Aramayı ya da filtreyi değiştirmeyi dene."
            action={
              <Button
                variant="secondary"
                onClick={() => {
                  setQuery('')
                  setFilter('all')
                }}
              >
                Filtreyi temizle
              </Button>
            }
          />
        )
      ) : (
        <Card className="overflow-hidden">
          <ul className="divide-y divide-line">
            <AnimatePresence initial={false}>
              {visible.map((teacher) => (
                <motion.li
                  key={teacher.id}
                  layout="position"
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  exit={{ opacity: 0 }}
                  transition={{ duration: 0.18 }}
                >
                  <TeacherRow teacher={teacher} self={teacher.id === profile.id} />
                </motion.li>
              ))}
            </AnimatePresence>
          </ul>
        </Card>
      )}
      {visible.length > 0 && (
        <p className="px-1 text-sm text-muted">
          {visible.length === all.length ? `${all.length} öğretmen` : `${all.length} öğretmenden ${visible.length} tanesi gösteriliyor`}
        </p>
      )}
    </div>
  )
}

function TeacherRow({ teacher, self }: { teacher: AdminTeacher; self: boolean }) {
  const badge = statusBadge[teacher.status]
  const place = [teacher.school, teacher.branch].filter(Boolean).join(' · ')
  return (
    <div className="flex items-start gap-3 px-4 py-3.5 sm:px-5">
      <Avatar name={teacher.full_name} className="mt-0.5" />
      <div className="min-w-0 flex-1">
        <div className="flex flex-wrap items-center gap-x-2 gap-y-1">
          <span className="min-w-0 font-semibold break-words">{teacher.full_name}</span>
          {self && <Badge tone="primary">Sen</Badge>}
          {teacher.is_admin && !self && <Badge tone="accent">Yönetici</Badge>}
          {teacher.status !== 'active' && <Badge tone={badge.tone}>{badge.label}</Badge>}
        </div>
        {teacher.email && <p className="truncate text-sm text-muted">{teacher.email}</p>}
        {place && <p className="mt-0.5 truncate text-sm text-muted">{place}</p>}
        <p className="mt-1.5 flex flex-wrap gap-x-3 gap-y-0.5 text-xs text-subtle">
          <span className="tabular">{teacher.student_count} öğrenci</span>
          <span>{teacher.last_seen_at ? `Son görülme ${formatRelative(teacher.last_seen_at)}` : 'Henüz giriş yapmadı'}</span>
        </p>
      </div>
      {!self && <TeacherActions teacher={teacher} />}
    </div>
  )
}
