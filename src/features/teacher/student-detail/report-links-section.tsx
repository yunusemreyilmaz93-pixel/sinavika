import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { Check, Copy, Link2, Plus } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { formatDate, formatRelative } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { copyText } from '../invites'
import type { StudentDetail } from './queries'

type Link = { id: number; label: string | null; expires_at: string; revoked_at: string | null; last_viewed_at: string | null; view_count: number }

const key = (studentId: string) => ['report-links', studentId] as const

function useReportLinks(studentId: string) {
  return useQuery({
    queryKey: key(studentId),
    queryFn: async (): Promise<Link[]> =>
      unwrap(
        await supabase
          .from('report_links')
          .select('id, label, expires_at, revoked_at, last_viewed_at, view_count')
          .eq('student_id', studentId)
          .is('revoked_at', null)
          .gt('expires_at', new Date().toISOString())
          .order('created_at', { ascending: false })
          .limit(20),
      ),
  })
}

export function ReportLinksSection({ student }: { student: StudentDetail }) {
  const qc = useQueryClient()
  const links = useReportLinks(student.id)
  const [creating, setCreating] = useState(false)
  const [revoking, setRevoking] = useState<Link | null>(null)
  const revoke = useMutation({
    mutationFn: async (id: number) => unwrap(await supabase.rpc('revoke_report_link', { p_id: id })),
    onSuccess: () => qc.invalidateQueries({ queryKey: key(student.id) }),
  })

  const active = links.data ?? []

  return (
    <Card>
      <CardHeader
        title="Veli rapor bağlantısı"
        description="Giriş yapmadan açılan, süreli ve salt okunur haftalık rapor."
        action={
          <Button variant="secondary" size="sm" className="min-h-11" onClick={() => setCreating(true)}>
            <Plus />
            Oluştur
          </Button>
        }
      />
      <CardBody>
        {links.isPending ? (
          <Skeleton className="h-16" />
        ) : links.isError ? (
          <p className="text-sm text-danger">{errorMessage(links.error)}</p>
        ) : active.length === 0 ? (
          <p className="text-sm text-muted">Geçerli bağlantı yok.</p>
        ) : (
          <ul className="divide-y divide-line">
            {active.map((l) => (
              <li key={l.id} className="flex items-center justify-between gap-3 py-2.5">
                <div className="min-w-0 text-sm">
                  <p className="flex items-center gap-2 font-semibold">
                    <Link2 className="size-4 shrink-0 text-muted" />
                    <span className="truncate">{l.label || 'Rapor bağlantısı'}</span>
                  </p>
                  <p className="mt-0.5 text-muted">
                    {formatDate(l.expires_at.slice(0, 10), 'd MMMM')} tarihine kadar geçerli
                    {l.view_count > 0 ? ` · ${l.view_count} kez açıldı, son ${formatRelative(l.last_viewed_at ?? l.expires_at)}` : ' · Henüz açılmadı'}
                  </p>
                </div>
                <Button variant="ghost" size="sm" className="min-h-11 text-danger" onClick={() => setRevoking(l)}>
                  İptal et
                </Button>
              </li>
            ))}
          </ul>
        )}
      </CardBody>
      <CreateDialog studentId={student.id} open={creating} onOpenChange={setCreating} />
      <Confirm
        open={Boolean(revoking)}
        onOpenChange={(o) => !o && setRevoking(null)}
        title="Bağlantı iptal edilsin mi?"
        description="Bağlantıyı açan herkes için hemen geçersiz olur."
        confirmLabel="İptal et"
        onConfirm={async () => {
          if (!revoking) return
          try {
            await revoke.mutateAsync(revoking.id)
            toast.success('Bağlantı iptal edildi')
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
    </Card>
  )
}

function CreateDialog({ studentId, open, onOpenChange }: { studentId: string; open: boolean; onOpenChange: (o: boolean) => void }) {
  const qc = useQueryClient()
  const [days, setDays] = useState<'7' | '14' | '30'>('14')
  const [label, setLabel] = useState('')
  const [url, setUrl] = useState<string | null>(null)
  const [copied, setCopied] = useState(false)

  const create = useMutation({
    mutationFn: async () => {
      const token = unwrap(await supabase.rpc('create_report_link', { p_student: studentId, p_days: Number(days), p_label: label.trim() || undefined }))
      return `${window.location.origin}/rapor/${token}`
    },
    onSuccess: (link) => {
      setUrl(link)
      void qc.invalidateQueries({ queryKey: key(studentId) })
    },
    onError: (err) => toast.error(errorMessage(err)),
  })

  const close = (o: boolean) => {
    if (!o) {
      setUrl(null)
      setLabel('')
      setCopied(false)
    }
    onOpenChange(o)
  }

  return (
    <Modal open={open} onOpenChange={close} title={url ? 'Bağlantı hazır' : 'Rapor bağlantısı oluştur'} size="sm">
      {url ? (
        <div className="space-y-4">
          <p className="rounded-xl bg-surface-2 p-3 text-sm break-all">{url}</p>
          <p className="text-sm text-muted">Bu bağlantı yalnızca şimdi gösterilir. Kapattıktan sonra tekrar kopyalayamazsınız.</p>
          <Button
            className="min-h-11 w-full"
            onClick={async () => {
              await copyText(url, 'Bağlantı kopyalandı')
              setCopied(true)
            }}
          >
            {copied ? <Check /> : <Copy />}
            {copied ? 'Kopyalandı' : 'Bağlantıyı kopyala'}
          </Button>
        </div>
      ) : (
        <div className="space-y-4">
          <p className="rounded-xl bg-warning-soft px-3 py-2.5 text-sm text-warning">
            Bağlantıya sahip herkes raporu görür. Yalnızca veliyle paylaşın.
          </p>
          <Field label="Süre">
            {() => (
              <Segmented
                value={days}
                onChange={setDays}
                options={[
                  { value: '7', label: '7 gün' },
                  { value: '14', label: '14 gün' },
                  { value: '30', label: '30 gün' },
                ]}
              />
            )}
          </Field>
          <Field label="Etiket">{(props) => <Input {...props} value={label} onChange={(e) => setLabel(e.target.value)} maxLength={60} placeholder="Örnek: Anne" />}</Field>
          <Button className="min-h-11 w-full" loading={create.isPending} onClick={() => create.mutate()}>
            Oluştur
          </Button>
        </div>
      )}
    </Modal>
  )
}
