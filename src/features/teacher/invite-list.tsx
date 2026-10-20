import { useMutation, useQueryClient } from '@tanstack/react-query'
import { ChevronRight, Clock3, Copy, Link2, MoreVertical, Share2, Trash2, X } from 'lucide-react'
import { motion } from 'motion/react'
import { Link } from 'react-router'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Menu, MenuContent, MenuItem, MenuSeparator, MenuTrigger } from '@/components/ui/menu'
import { cn } from '@/lib/cn'
import { keys } from '@/lib/data'
import { formatRelative } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { createStudentInvite } from './invite-form'
import { InviteCode, inviteSummary } from './invite-share'
import { copyText, daysLeft, expiryLabel, inviteLink, shareInvite, type Invite, type UsedInvite } from './invites'

const item = {
  hidden: { opacity: 0, y: 6 },
  show: (i: number) => ({ opacity: 1, y: 0, transition: { duration: 0.22, delay: Math.min(i, 8) * 0.035 } }),
}

const displayName = (invite: Pick<Invite, 'student_name'>) => invite.student_name ?? 'Öğrenci'

export async function deleteInvite(code: string) {
  const rows = unwrap(await supabase.from('invites').delete().eq('code', code).select('code'))
  return rows.length > 0
}

export function PendingInvites({
  invites,
  onOpen,
  onCancel,
}: {
  invites: Invite[]
  onOpen: (invite: Invite) => void
  onCancel: (invite: Invite) => void
}) {
  return (
    <ul className="space-y-2">
      {invites.map((invite, i) => {
        const name = displayName(invite)
        const soon = daysLeft(invite.expires_at) <= 2
        return (
          <motion.li
            key={invite.code}
            variants={item}
            initial="hidden"
            animate="show"
            custom={i}
            className="flex items-center gap-1 rounded-2xl border border-line bg-surface py-1.5 pr-1.5 pl-1.5 shadow-card"
          >
            <button
              type="button"
              onClick={() => onOpen(invite)}
              className="flex min-w-0 flex-1 items-center gap-3 rounded-xl p-1.5 text-left transition-colors hover:bg-surface-2"
            >
              <Avatar name={name} />
              <span className="min-w-0 flex-1">
                <span className="block truncate font-semibold">{name}</span>
                <span className="block truncate text-sm text-muted">{inviteSummary(invite)}</span>
                <span className="mt-1.5 flex flex-wrap items-center gap-x-2.5 gap-y-1">
                  <InviteCode code={invite.code} className="text-[15px] text-fg" />
                  <Badge tone={soon ? 'warning' : 'neutral'}>
                    <Clock3 />
                    {expiryLabel(invite.expires_at)}
                  </Badge>
                </span>
              </span>
            </button>
            <Button variant="ghost" size="icon" aria-label={`${name} için kodu kopyala`} onClick={() => void copyText(invite.code, 'Kod kopyalandı')}>
              <Copy />
            </Button>
            <Menu>
              <MenuTrigger asChild>
                <Button variant="ghost" size="icon" aria-label={`${name} daveti için diğer işlemler`}>
                  <MoreVertical />
                </Button>
              </MenuTrigger>
              <MenuContent>
                <MenuItem onSelect={() => void shareInvite(invite.code)}>
                  <Share2 />
                  Paylaş
                </MenuItem>
                <MenuItem onSelect={() => void copyText(inviteLink(invite.code), 'Link kopyalandı')}>
                  <Link2 />
                  Linki kopyala
                </MenuItem>
                <MenuSeparator />
                <MenuItem tone="danger" onSelect={() => onCancel(invite)}>
                  <X />
                  Daveti iptal et
                </MenuItem>
              </MenuContent>
            </Menu>
          </motion.li>
        )
      })}
    </ul>
  )
}

export function ExpiredInvites({ invites, onRenewed }: { invites: Invite[]; onRenewed: (invite: Invite) => void }) {
  const queryClient = useQueryClient()
  const refresh = () => queryClient.invalidateQueries({ queryKey: keys.invites })

  const renew = useMutation({
    mutationFn: async (old: Invite) => {
      const fresh = await createStudentInvite({
        name: old.student_name ?? '',
        track: old.track ?? 'lgs',
        grade: old.grade ?? 8,
        field: old.field,
      })
      await deleteInvite(old.code).catch(() => false)
      return fresh
    },
    onSuccess: (fresh) => {
      void refresh()
      onRenewed(fresh)
    },
    onError: (error) => {
      toast.error(errorMessage(error))
      void refresh()
    },
  })

  const remove = useMutation({
    mutationFn: (code: string) => deleteInvite(code),
    onSuccess: () => void refresh(),
    onError: (error) => toast.error(errorMessage(error)),
  })

  return (
    <ul className="space-y-2">
      {invites.map((invite) => {
        const name = displayName(invite)
        const busy = (renew.isPending && renew.variables?.code === invite.code) || (remove.isPending && remove.variables === invite.code)
        return (
          <li key={invite.code} className={cn('flex items-center gap-3 rounded-2xl border border-dashed border-line-strong p-3', busy && 'opacity-60')}>
            <Avatar name={name} className="opacity-60 grayscale" />
            <div className="min-w-0 flex-1 text-muted">
              <p className="truncate font-semibold text-fg/70">{name}</p>
              <p className="truncate text-sm">
                <span className="tabular line-through decoration-1">{invite.code}</span> · {formatRelative(invite.expires_at)} doldu
              </p>
            </div>
            <Button
              variant="soft"
              size="sm"
              className="h-11 sm:h-9"
              loading={renew.isPending && renew.variables?.code === invite.code}
              disabled={busy}
              onClick={() => renew.mutate(invite)}
            >
              Yeni kod
            </Button>
            <Button
              variant="ghost"
              size="icon"
              aria-label={`${name} için süresi dolan daveti sil`}
              disabled={busy}
              onClick={() => remove.mutate(invite.code)}
            >
              <Trash2 />
            </Button>
          </li>
        )
      })}
    </ul>
  )
}

type JoinedProps = {
  invites: UsedInvite[]
  studentName: (id: string) => string | undefined
  knownStudents: Set<string>
}

export function JoinedInvites({ invites, studentName, knownStudents }: JoinedProps) {
  return (
    <ul className="divide-y divide-line overflow-hidden rounded-2xl border border-line bg-surface shadow-card">
      {invites.map((invite) => {
        const parent = invite.kind === 'parent'
        const name = invite.used?.full_name ?? invite.student_name ?? (parent ? 'Veli' : 'Öğrenci')
        const target = parent ? invite.student_id : invite.used_by
        const linkable = Boolean(target && knownStudents.has(target))
        const detail = !invite.used_by
          ? 'Hesap silindi'
          : parent
            ? `Veli · ${studentName(invite.student_id ?? '') ?? 'öğrenci'}`
            : inviteSummary(invite)
        const body = (
          <>
            <Avatar name={name} className="size-9 text-xs" />
            <div className="min-w-0 flex-1">
              <p className="truncate font-semibold">{name}</p>
              <p className="truncate text-sm text-muted">{detail}</p>
            </div>
            <span className="shrink-0 text-xs text-muted tabular">{invite.used_at ? formatRelative(invite.used_at) : ''}</span>
            {linkable && <ChevronRight className="size-4 shrink-0 text-subtle" />}
          </>
        )
        return (
          <li key={invite.code}>
            {linkable ? (
              <Link to={`/app/ogrenciler/${target}`} className="flex min-h-14 items-center gap-3 px-3.5 py-2.5 transition-colors hover:bg-surface-2">
                {body}
              </Link>
            ) : (
              <div className="flex min-h-14 items-center gap-3 px-3.5 py-2.5">{body}</div>
            )}
          </li>
        )
      })}
    </ul>
  )
}
