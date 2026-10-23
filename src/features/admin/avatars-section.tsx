import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { ImageOff } from 'lucide-react'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { avatarKeys, avatarUrl } from '@/lib/avatars'
import { formatRelative } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { LoadError } from './ui'

const roleLabel = { teacher: 'Öğretmen', student: 'Öğrenci', parent: 'Veli' } as const
const statusLabel: Record<string, { label: string; tone: 'warning' | 'primary' | 'danger' | 'neutral' }> = {
  pending: { label: 'Bekliyor', tone: 'warning' },
  approved: { label: 'Yayında', tone: 'primary' },
  rejected: { label: 'Reddedildi', tone: 'danger' },
  removed: { label: 'Kaldırıldı', tone: 'neutral' },
}

const key = ['admin', 'avatars'] as const

export function AvatarsSection() {
  const qc = useQueryClient()
  const uploads = useQuery({ queryKey: key, queryFn: async () => unwrap(await supabase.rpc('admin_avatar_uploads')) })
  const review = useMutation({
    mutationFn: async (v: { id: number; approve: boolean }) =>
      unwrap(await supabase.rpc('admin_review_avatar', { p_id: v.id, p_approve: v.approve })),
    onSuccess: async () => {
      await Promise.all([qc.invalidateQueries({ queryKey: key }), qc.invalidateQueries({ queryKey: avatarKeys.all })])
      toast.success('Kaydedildi')
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  if (uploads.isPending) {
    return (
      <div className="grid gap-3 sm:grid-cols-2" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-28" />
        <Skeleton className="h-28" />
      </div>
    )
  }
  if (uploads.isError) return <LoadError error={uploads.error} onRetry={() => void uploads.refetch()} />
  if (!uploads.data.length) {
    return <EmptyState icon={ImageOff} title="Henüz yüklenen fotoğraf yok" description="Kullanıcılar fotoğraf yüklediğinde burada görünür." />
  }

  return (
    <div className="grid gap-3 sm:grid-cols-2">
      {uploads.data.map((u) => {
        const status = statusLabel[u.status] ?? statusLabel.removed
        const shown = u.status === 'pending' || u.status === 'approved'
        return (
          <Card key={u.id} className="flex gap-3 p-4">
            {shown ? (
              <img src={avatarUrl(`photo:${u.path}`)!} alt="" loading="lazy" className="size-20 shrink-0 rounded-full border border-line object-cover" />
            ) : (
              <span className="grid size-20 shrink-0 place-items-center rounded-full bg-surface-2 text-muted">
                <ImageOff className="size-6" aria-hidden />
              </span>
            )}
            <div className="min-w-0 flex-1">
              <p className="truncate font-semibold">{u.full_name}</p>
              <p className="text-sm text-muted">
                {roleLabel[u.role]} · {formatRelative(u.created_at)}
              </p>
              <div className="mt-1 flex flex-wrap gap-1.5">
                <Badge tone={status.tone}>{status.label}</Badge>
                {u.reviewed_by === 'auto' && <Badge>Otomatik</Badge>}
                {u.reason && <Badge tone="danger">{u.reason}</Badge>}
              </div>
              {shown && (
                <div className="mt-2 flex gap-2">
                  {u.status === 'pending' && (
                    <Button size="sm" onClick={() => review.mutate({ id: u.id, approve: true })} disabled={review.isPending}>
                      Onayla
                    </Button>
                  )}
                  <Button size="sm" variant="secondary" onClick={() => review.mutate({ id: u.id, approve: false })} disabled={review.isPending}>
                    {u.status === 'pending' ? 'Reddet' : 'Kaldır'}
                  </Button>
                </div>
              )}
            </div>
          </Card>
        )
      })}
    </div>
  )
}
