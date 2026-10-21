import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { MessageSquareWarning, Trash2 } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { formatRelative } from '@/lib/dates'
import { errorMessage, supabase, unwrap, type Tables } from '@/lib/supabase'
import { LoadError } from './ui'

type Report = Tables<'bug_reports'>

const roleLabel = { teacher: 'Öğretmen', student: 'Öğrenci', parent: 'Veli' } as const
const KEY = ['admin', 'bug-reports'] as const

export function useOpenReportCount() {
  return useQuery({
    queryKey: [...KEY, 'open-count'],
    queryFn: async () => {
      const { count, error } = await supabase.from('bug_reports').select('id', { count: 'exact', head: true }).eq('status', 'open')
      if (error) throw error
      return count ?? 0
    },
  })
}

function Screenshot({ path }: { path: string }) {
  const url = useQuery({
    queryKey: [...KEY, 'image', path],
    staleTime: 30 * 60_000,
    queryFn: async () => {
      const { data, error } = await supabase.storage.from('bug-reports').createSignedUrl(path, 3600)
      if (error) throw error
      return data.signedUrl
    },
  })
  if (url.isPending) return <Skeleton className="size-24 rounded-xl" />
  if (url.isError) return <p className="grid size-24 place-items-center rounded-xl bg-surface-2 text-center text-xs text-muted">Görsel açılamadı</p>
  return (
    <a href={url.data} target="_blank" rel="noreferrer noopener" aria-label="Ekran görüntüsünü yeni sekmede aç">
      <img src={url.data} alt="Ekran görüntüsü" className="size-24 rounded-xl border border-line object-cover" />
    </a>
  )
}

export function ReportsSection() {
  const qc = useQueryClient()
  const [status, setStatus] = useState<'open' | 'done'>('open')
  const [removing, setRemoving] = useState<Report | null>(null)
  const reports = useQuery({
    queryKey: [...KEY, status],
    queryFn: async () => unwrap(await supabase.from('bug_reports').select('*').eq('status', status).order('created_at', { ascending: false }).limit(100)),
  })

  const refresh = () => qc.invalidateQueries({ queryKey: KEY })
  const setDone = useMutation({
    mutationFn: async (v: { id: number; status: 'open' | 'done' }) => unwrap(await supabase.from('bug_reports').update({ status: v.status }).eq('id', v.id)),
    onSuccess: refresh,
    onError: (error) => toast.error(errorMessage(error)),
  })
  const remove = useMutation({
    mutationFn: async (report: Report) => {
      if (report.images.length) await supabase.storage.from('bug-reports').remove(report.images)
      unwrap(await supabase.from('bug_reports').delete().eq('id', report.id))
    },
    onSuccess: refresh,
  })

  return (
    <div className="max-w-3xl space-y-4">
      <Segmented
        size="sm"
        options={[
          { value: 'open', label: 'Açık' },
          { value: 'done', label: 'Çözüldü' },
        ]}
        value={status}
        onChange={setStatus}
        className="sm:max-w-xs"
      />

      {reports.isPending ? (
        <Skeleton className="h-32 rounded-2xl" />
      ) : reports.isError ? (
        <LoadError error={reports.error} onRetry={() => void reports.refetch()} />
      ) : reports.data.length === 0 ? (
        <EmptyState icon={MessageSquareWarning} title={status === 'open' ? 'Açık bildirim yok' : 'Çözülen bildirim yok'} description="Kullanıcıların gönderdiği hata bildirimleri burada görünür." />
      ) : (
        <ul className="space-y-3">
          {reports.data.map((r) => (
            <li key={r.id}>
              <Card>
                <CardBody className="space-y-3">
                  <div className="flex flex-wrap items-center gap-2">
                    {r.role && <Badge tone="neutral">{roleLabel[r.role]}</Badge>}
                    <span className="text-sm font-semibold">{r.reporter_name ?? 'Kullanıcı'}</span>
                    <span className="text-sm text-muted">{formatRelative(r.created_at)}</span>
                  </div>
                  <p className="text-[15px] leading-relaxed break-words whitespace-pre-wrap">{r.message}</p>
                  {r.images.length > 0 && (
                    <ul className="flex flex-wrap gap-2">
                      {r.images.map((path) => (
                        <li key={path}>
                          <Screenshot path={path} />
                        </li>
                      ))}
                    </ul>
                  )}
                  <p className="text-xs break-all text-subtle">
                    {r.path}
                    {r.user_agent ? ` · ${r.user_agent}` : ''}
                  </p>
                  <div className="flex gap-2">
                    <Button
                      variant={r.status === 'open' ? 'primary' : 'secondary'}
                      size="sm"
                      className="min-h-11"
                      onClick={() => setDone.mutate({ id: r.id, status: r.status === 'open' ? 'done' : 'open' })}
                    >
                      {r.status === 'open' ? 'Çözüldü' : 'Yeniden aç'}
                    </Button>
                    <Button variant="ghost" size="icon" aria-label="Bildirimi sil" className="text-muted hover:text-danger" onClick={() => setRemoving(r)}>
                      <Trash2 />
                    </Button>
                  </div>
                </CardBody>
              </Card>
            </li>
          ))}
        </ul>
      )}

      <Confirm
        open={removing !== null}
        onOpenChange={(open) => !open && setRemoving(null)}
        title="Bildirim silinsin mi?"
        description="Bildirim ve ekran görüntüleri kalıcı olarak silinir."
        confirmLabel="Sil"
        onConfirm={async () => {
          if (!removing) return
          try {
            await remove.mutateAsync(removing)
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
    </div>
  )
}
