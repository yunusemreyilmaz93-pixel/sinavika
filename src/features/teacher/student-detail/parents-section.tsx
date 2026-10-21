import { useMutation, useQueryClient } from '@tanstack/react-query'
import { format } from 'date-fns'
import { tr } from 'date-fns/locale'
import { Copy, Link2, MessageCircle, RefreshCw, Share2, Unlink, UserPlus } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Skeleton } from '@/components/ui/skeleton'
import { keys } from '@/lib/data'
import { formatRelative } from '@/lib/dates'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'
import { InviteCode } from '../invite-share'
import { canShare, copyText, inviteLink } from '../invites'
import { parentInviteKey, refreshStudent, useLinkedParents, useParentInvite, type LinkedParent, type StudentDetail } from './queries'

function inviteText(studentName: string, code: string) {
  return `${studentName} için Yolumnet veli davet kodu: ${code}. Bu bağlantıdan hesabınızı oluşturabilirsiniz: ${inviteLink(code)}`
}

async function share(studentName: string, code: string) {
  const text = inviteText(studentName, code)
  if (!canShare) {
    window.open(`https://wa.me/?text=${encodeURIComponent(text)}`, '_blank', 'noopener,noreferrer')
    return
  }
  try {
    await navigator.share({ title: 'Yolumnet veli daveti', text })
  } catch (error) {
    if ((error as Error)?.name !== 'AbortError') toast.error('Paylaşılamadı, kodu kopyalayıp gönderebilirsiniz')
  }
}

export function ParentsSection({ student }: { student: StudentDetail }) {
  const queryClient = useQueryClient()
  const parents = useLinkedParents(student.id)
  const invite = useParentInvite(student.id)
  const [removing, setRemoving] = useState<LinkedParent | null>(null)

  const create = useMutation({
    mutationFn: async () => unwrap(await supabase.rpc('create_parent_invite', { p_student_id: student.id })),
    onSuccess: (next) => {
      queryClient.setQueryData(parentInviteKey(student.id), next)
      toast.success(invite.data ? 'Yeni kod oluşturuldu. Eski kod artık geçersiz.' : 'Veli davet kodu oluşturuldu')
    },
    onError: (e) => toast.error(errorMessage(e)),
  })

  const unlink = useMutation({
    mutationFn: async (parent: LinkedParent) => {
      const rows = unwrap(
        await supabase.from('parent_links').delete().eq('parent_id', parent.id).eq('student_id', student.id).select('parent_id'),
      )
      if (!rows.length) throw new AppError('Bağlantı kaldırılamadı')
    },
    onSuccess: async (_, parent) => {
      await Promise.all([
        queryClient.invalidateQueries({ queryKey: ['parent-links', student.id] }),
        queryClient.invalidateQueries({ queryKey: keys.notes(student.id) }),
        queryClient.invalidateQueries({ queryKey: keys.messages(student.id, 'parent') }),
        queryClient.invalidateQueries({ queryKey: ['thread', student.id] }),
        refreshStudent(queryClient, student.id),
      ])
      toast.success(`${parent.full_name} artık bu öğrenciyi göremez`)
    },
    onError: (e) => toast.error(errorMessage(e)),
  })

  const current = invite.data

  return (
    <Card>
      <CardHeader title="Veliler" description="Veli planı, ilerlemeyi, denemeleri ve paylaştığınız notları görür." />
      <CardBody className="space-y-5">
        <div>
          {parents.isPending ? (
            <Skeleton className="h-14" />
          ) : parents.isError ? (
            <div className="flex flex-wrap items-center justify-between gap-3" role="alert">
              <p className="text-sm text-danger">{errorMessage(parents.error)}</p>
              <Button variant="secondary" size="sm" onClick={() => void parents.refetch()}>
                Tekrar deneyin
              </Button>
            </div>
          ) : parents.data.length === 0 ? (
            <p className="text-sm text-muted">Henüz bağlı veli yok.</p>
          ) : (
            <ul className="divide-y divide-line">
              <AnimatePresence initial={false}>
                {parents.data.map((p) => (
                  <motion.li
                    key={p.id}
                    layout
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    transition={{ duration: 0.2 }}
                    className="flex min-h-14 items-center gap-3 py-2 first:pt-0"
                  >
                    <Avatar name={p.full_name} className="size-9 text-xs" />
                    <div className="min-w-0 flex-1">
                      <p className="truncate font-semibold">{p.full_name}</p>
                      <p className="truncate text-xs text-muted">
                        {p.username ? `@${p.username} · ` : ''}
                        {p.last_seen_at ? `son görülme ${formatRelative(p.last_seen_at)}` : `${formatRelative(p.linked_at)} bağlandı`}
                      </p>
                    </div>
                    <Button variant="ghost" size="icon" className="text-muted" aria-label={`${p.full_name} bağlantısını kaldırın`} onClick={() => setRemoving(p)}>
                      <Unlink />
                    </Button>
                  </motion.li>
                ))}
              </AnimatePresence>
            </ul>
          )}
        </div>

        <div className="border-t border-line pt-4">
          <h4 className="text-sm font-semibold">Veli davet kodu</h4>
          {invite.isPending ? (
            <Skeleton className="mt-3 h-32" />
          ) : invite.isError ? (
            <p className="mt-2 text-sm text-danger">{errorMessage(invite.error)}</p>
          ) : current ? (
            <div className="mt-3">
                <motion.div
                  key={current.code}
                  initial={{ opacity: 0, scale: 0.98 }}
                  animate={{ opacity: 1, scale: 1 }}
                  transition={{ duration: 0.2 }}
                  className="grid-paper rounded-2xl border border-dashed border-line-strong px-4 py-5 text-center"
                >
                  <p
                    className="text-4xl leading-none select-all sm:text-5xl"
                    aria-label={`Davet kodu ${current.code.split('').join(' ')}`}
                  >
                    <InviteCode code={current.code} />
                  </p>
                  <p className="mt-3 text-sm text-muted">
                    {format(new Date(current.expires_at), 'd MMMM', { locale: tr })} tarihine kadar geçerli. Tek kullanımlık.
                  </p>
                </motion.div>
              <div className="mt-3 grid gap-2 sm:grid-cols-3">
                <Button onClick={() => void copyText(current.code, 'Kod kopyalandı')}>
                  <Copy />
                  Kodu kopyalayın
                </Button>
                <Button variant="secondary" onClick={() => void share(student.full_name, current.code)}>
                  {canShare ? <Share2 /> : <MessageCircle />}
                  {canShare ? 'Paylaş' : 'WhatsApp'}
                </Button>
                <Button variant="secondary" onClick={() => void copyText(inviteLink(current.code), 'Link kopyalandı')}>
                  <Link2 />
                  Linki kopyalayın
                </Button>
              </div>
              <p className="mt-3 text-sm text-muted">
                Veli linke dokunup hesabını oluşturur. Hesabı varsa kodu kendi Ayarlar sayfasına girer. Her veli için ayrı kod oluşturun.
              </p>
              <Button variant="ghost" className="mt-1 -ml-3 text-muted" loading={create.isPending} onClick={() => create.mutate()}>
                {!create.isPending && <RefreshCw />}
                Yeni kod oluşturun
              </Button>
            </div>
          ) : (
            <div className="mt-2 flex flex-col items-start gap-3">
              <p className="text-sm text-muted">Kod 14 gün geçerli ve tek kullanımlık. Öğrenci kontenjanını etkilemez.</p>
              <Button loading={create.isPending} onClick={() => create.mutate()} className="w-full sm:w-auto">
                {!create.isPending && <UserPlus />}
                Veli davet kodu oluşturun
              </Button>
            </div>
          )}
        </div>
      </CardBody>

      <Confirm
        open={removing != null}
        onOpenChange={(open) => !open && setRemoving(null)}
        title="Veli bağlantısı kaldırılsın mı?"
        description={
          removing
            ? `${removing.full_name} artık ${student.full_name} adlı öğrencinin bilgilerini ve veli mesajlarını göremez. Veli hesabı silinmez.`
            : undefined
        }
        confirmLabel="Bağlantıyı kaldırın"
        onConfirm={async () => {
          if (removing) await unlink.mutateAsync(removing).catch(() => {})
        }}
      />
    </Card>
  )
}
