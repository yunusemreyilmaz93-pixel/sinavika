import { Avatar } from '@/components/ui/avatar'
import { gradeLabel, trackLabel } from '@/lib/exam'
import type { RpcReturn } from '@/lib/supabase'
import { formatCode } from './code-input'

export type InvitePreview = RpcReturn<'preview_invite'>[number]

function classLabel(invite: InvitePreview) {
  const track = trackLabel[invite.track]
  if (invite.grade === 13) return `${track} mezun`
  return gradeLabel[invite.grade] ? `${track} ${gradeLabel[invite.grade]}` : track
}

export function InviteCard({ invite, code }: { invite: InvitePreview; code: string }) {
  const student = invite.kind === 'student'
  return (
    <div className="rounded-2xl border border-primary/20 bg-primary-soft p-4">
      <div className="flex items-start gap-3">
        <Avatar name={invite.teacher_name} className="bg-surface text-primary" />
        <div className="min-w-0 flex-1">
          <p className="text-xs font-semibold text-primary-soft-fg tabular">Davet kodu {formatCode(code)}</p>
          <p className="mt-0.5 text-[15px] leading-snug">
            {student ? (
              <>
                <b className="font-semibold">{invite.teacher_name}</b> sizi <b className="font-semibold">{classLabel(invite)}</b>{' '}
                öğrencisi olarak davet etti.
              </>
            ) : (
              <>
                <b className="font-semibold">{invite.student_name}</b> için veli daveti
              </>
            )}
          </p>
          {!student && <p className="mt-1 text-sm text-primary-soft-fg">Öğretmen: {invite.teacher_name}</p>}
        </div>
      </div>
    </div>
  )
}
