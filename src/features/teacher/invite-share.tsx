import { Copy, Link2, MessageCircle, Share2 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { cn } from '@/lib/cn'
import { studentLabel } from '@/lib/exam'
import { canShare, copyText, expiryLabel, inviteLink, shareInvite, whatsappLink, type Invite } from './invites'

export function InviteCode({ code, className }: { code: string; className?: string }) {
  return (
    <span className={cn('tabular inline-flex gap-[0.45em] font-display font-extrabold tracking-[0.08em]', className)}>
      <span>{code.slice(0, 4)}</span>
      <span>{code.slice(4)}</span>
    </span>
  )
}

export function inviteSummary(invite: Pick<Invite, 'track' | 'grade' | 'field'>) {
  if (!invite.track || invite.grade == null) return 'Öğrenci daveti'
  return studentLabel({ track: invite.track, grade: invite.grade, field: invite.field })
}

export function InviteShare({ invite }: { invite: Invite }) {
  const { code } = invite
  return (
    <div className="space-y-4">
      <div className="grid-paper rounded-2xl border border-line bg-bg px-4 py-6 text-center">
        <p className="text-sm font-semibold text-muted">{invite.student_name ?? 'Öğrenci'} için davet kodu</p>
        <p className="mt-2 text-[2.5rem] leading-none text-fg select-all sm:text-5xl" aria-label={`Davet kodu ${code.split('').join(' ')}`}>
          <InviteCode code={code} />
        </p>
        <p className="mt-3 text-sm text-muted">
          {inviteSummary(invite)} · {expiryLabel(invite.expires_at)}
        </p>
      </div>
      <div className="grid gap-2 sm:grid-cols-3">
        <Button variant="primary" onClick={() => void copyText(code, 'Kod kopyalandı')}>
          <Copy />
          Kodu kopyalayın
        </Button>
        {canShare ? (
          <Button variant="secondary" onClick={() => void shareInvite(code)}>
            <Share2 />
            Paylaş
          </Button>
        ) : (
          <Button variant="secondary" asChild>
            <a href={whatsappLink(code)} target="_blank" rel="noopener noreferrer">
              <MessageCircle />
              WhatsApp
            </a>
          </Button>
        )}
        <Button variant="secondary" onClick={() => void copyText(inviteLink(code), 'Link kopyalandı')}>
          <Link2 />
          Linki kopyalayın
        </Button>
      </div>
      <p className="text-center text-sm text-muted">
        Öğrenciniz linke dokunur ya da <span className="font-semibold break-all text-fg">{window.location.host}/katil</span> adresinde
        kodu girer.
      </p>
    </div>
  )
}
