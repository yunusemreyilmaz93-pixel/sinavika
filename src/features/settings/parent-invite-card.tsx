import { useQuery, useQueryClient } from '@tanstack/react-query'
import { format } from 'date-fns'
import { tr } from 'date-fns/locale'
import { Copy, HeartHandshake, Link2, RefreshCw, Share2 } from 'lucide-react'
import { AnimatePresence, motion } from 'motion/react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'
import { useAuth } from '@/features/auth/session'
import { formatRelative } from '@/lib/dates'
import { errorMessage, supabase, unwrap, type Tables } from '@/lib/supabase'
import { copyText, SettingsCard } from './ui'

type Invite = Tables<'invites'>

function formatCode(code: string) {
  return `${code.slice(0, 4)}-${code.slice(4)}`
}

function inviteLink(code: string) {
  return `${window.location.origin}/katil?kod=${code}`
}

export function ParentInviteCard() {
  const { student, profile } = useAuth()
  const queryClient = useQueryClient()
  const [creating, setCreating] = useState(false)
  const studentId = student?.id ?? ''

  const invite = useQuery({
    queryKey: ['parent-invite', studentId],
    enabled: Boolean(studentId),
    queryFn: async (): Promise<Invite | null> =>
      unwrap(
        await supabase
          .from('invites')
          .select('*')
          .eq('kind', 'parent')
          .eq('student_id', studentId)
          .is('used_at', null)
          .gt('expires_at', new Date().toISOString())
          .order('created_at', { ascending: false })
          .limit(1)
          .maybeSingle(),
      ),
  })

  const parents = useQuery({
    queryKey: ['parent-links', studentId],
    enabled: Boolean(studentId),
    queryFn: async () => {
      const links = unwrap(await supabase.from('parent_links').select('parent_id, created_at').eq('student_id', studentId))
      if (!links.length) return []
      const names = unwrap(await supabase.from('profiles').select('id, full_name').in('id', links.map((l) => l.parent_id)))
      const byId = new Map(names.map((n) => [n.id, n.full_name]))
      return links
        .map((l) => ({ id: l.parent_id, name: byId.get(l.parent_id) ?? 'Veli', linkedAt: l.created_at }))
        .sort((a, b) => a.name.localeCompare(b.name, 'tr'))
    },
  })

  if (!student || !profile) return null

  async function create() {
    setCreating(true)
    try {
      const next = unwrap(await supabase.rpc('create_parent_invite', { p_student_id: studentId }))
      queryClient.setQueryData(['parent-invite', studentId], next)
      toast.success(invite.data ? 'Yeni kod oluşturuldu. Eski kod artık geçersiz.' : 'Davet kodu oluşturuldu')
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setCreating(false)
    }
  }

  async function share(code: string) {
    const link = inviteLink(code)
    const text = `${profile!.full_name} seni Yolumnet'te veli olarak ekliyor. Bağlantıyı açıp hesabını oluştur. Davet kodu: ${formatCode(code)}`
    if (typeof navigator.share === 'function') {
      try {
        await navigator.share({ title: 'Yolumnet veli daveti', text, url: link })
      } catch (err) {
        if ((err as Error).name !== 'AbortError') void copyText(link, 'Bağlantı kopyalandı')
      }
      return
    }
    window.open(`https://wa.me/?text=${encodeURIComponent(`${text}\n${link}`)}`, '_blank', 'noopener,noreferrer')
  }

  const current = invite.data

  return (
    <SettingsCard
      icon={HeartHandshake}
      title="Velini bağla"
      description="Velin planını, ilerlemeni ve denemelerini kendi hesabından görür."
    >
      {invite.isPending ? (
        <Skeleton className="h-40" />
      ) : invite.isError ? (
        <div className="flex flex-col items-start gap-3">
          <p className="text-sm text-danger">{errorMessage(invite.error)}</p>
          <Button variant="secondary" onClick={() => void invite.refetch()}>
            Tekrar dene
          </Button>
        </div>
      ) : current ? (
        <div>
          <AnimatePresence mode="wait" initial={false}>
            <motion.div
              key={current.code}
              initial={{ opacity: 0, scale: 0.98 }}
              animate={{ opacity: 1, scale: 1 }}
              exit={{ opacity: 0 }}
              transition={{ duration: 0.2 }}
              className="grid-paper rounded-2xl border border-dashed border-line-strong px-4 py-5 text-center"
            >
              <p className="text-xs font-semibold tracking-wide text-muted uppercase">Veli davet kodu</p>
              <div className="mt-1 flex items-center justify-center gap-1">
                <span className="tabular font-display text-4xl font-extrabold tracking-[0.08em] select-all sm:text-5xl" aria-label={current.code.split('').join(' ')}>
                  {formatCode(current.code)}
                </span>
                <Button variant="ghost" size="icon" className="text-muted" aria-label="Kodu kopyala" onClick={() => void copyText(current.code, 'Kod kopyalandı')}>
                  <Copy />
                </Button>
              </div>
              <p className="mt-1 text-sm text-muted">
                {format(new Date(current.expires_at), 'd MMMM', { locale: tr })} tarihine kadar geçerli. Tek kullanımlık.
              </p>
            </motion.div>
          </AnimatePresence>
          <div className="mt-3 flex flex-col gap-2 sm:flex-row">
            <Button className="sm:flex-1" onClick={() => void share(current.code)}>
              <Share2 />
              Paylaş
            </Button>
            <Button variant="secondary" className="sm:flex-1" onClick={() => void copyText(inviteLink(current.code), 'Bağlantı kopyalandı')}>
              <Link2 />
              Bağlantıyı kopyala
            </Button>
          </div>
          <p className="mt-3 text-sm text-muted">
            Velin bağlantıyı açıp hesabını oluşturur. Zaten hesabı varsa kodu kendi Ayarlar sayfasına girer. Her veli için ayrı kod oluştur.
          </p>
          <Button variant="ghost" className="mt-1 -ml-3 text-muted" loading={creating} onClick={() => void create()}>
            {!creating && <RefreshCw />}
            Yeni kod oluştur
          </Button>
        </div>
      ) : (
        <div className="flex flex-col items-start gap-3">
          <p className="text-sm text-muted">Kod oluştur ve velinle paylaş. Kod 14 gün geçerli ve tek kullanımlık.</p>
          <Button loading={creating} onClick={() => void create()} className="w-full sm:w-auto">
            Davet kodu oluştur
          </Button>
        </div>
      )}

      <div className="mt-5 border-t border-line pt-4">
        <h4 className="text-sm font-semibold">Bağlı veliler</h4>
        {parents.isPending ? (
          <Skeleton className="mt-3 h-12" />
        ) : parents.isError ? (
          <p className="mt-2 text-sm text-danger">{errorMessage(parents.error)}</p>
        ) : parents.data.length === 0 ? (
          <p className="mt-1 text-sm text-muted">Henüz bağlı velin yok.</p>
        ) : (
          <ul className="mt-2 space-y-1">
            {parents.data.map((p) => (
              <li key={p.id} className="flex min-h-12 items-center gap-3">
                <Avatar name={p.name} className="size-9 text-xs" />
                <div className="min-w-0 flex-1">
                  <p className="truncate font-semibold">{p.name}</p>
                  <p className="text-xs text-muted">{formatRelative(p.linkedAt)} bağlandı</p>
                </div>
              </li>
            ))}
          </ul>
        )}
      </div>
    </SettingsCard>
  )
}
