import { useQuery } from '@tanstack/react-query'
import { toast } from 'sonner'
import { useProfile } from '@/features/auth/session'
import { keys, useSettings } from '@/lib/data'
import { supabase, unwrap, type Tables } from '@/lib/supabase'
import { useTeacherOverview } from './overview'

export type Invite = Tables<'invites'>
export type UsedInvite = Invite & { used: { full_name: string } | null }

const DAY = 24 * 60 * 60 * 1000

export function useInvites() {
  const profile = useProfile()
  return useQuery({
    queryKey: keys.invites,
    queryFn: async () => {
      const [open, used] = await Promise.all([
        supabase
          .from('invites')
          .select('*')
          .eq('teacher_id', profile.id)
          .eq('kind', 'student')
          .is('used_at', null)
          .order('created_at', { ascending: false }),
        supabase
          .from('invites')
          .select('*, used:profiles!invites_used_by_fkey(full_name)')
          .eq('teacher_id', profile.id)
          .not('used_at', 'is', null)
          .order('used_at', { ascending: false })
          .limit(10),
      ])
      return { open: unwrap(open), used: unwrap(used) as UsedInvite[] }
    },
  })
}

export function isLive(invite: Pick<Invite, 'expires_at'>) {
  return new Date(invite.expires_at).getTime() > Date.now()
}

export function daysLeft(expiresAt: string) {
  return Math.ceil((new Date(expiresAt).getTime() - Date.now()) / DAY)
}

export function expiryLabel(expiresAt: string) {
  const days = daysLeft(expiresAt)
  if (days <= 0) return 'Süresi doldu'
  if (days === 1) return 'Son gün'
  return `${days} gün kaldı`
}

export function useCapacity() {
  const overview = useTeacherOverview()
  const invites = useInvites()
  const settings = useSettings()
  const active = overview.data?.filter((r) => !r.archived_at).length ?? 0
  const pending = invites.data?.open.filter(isLive).length ?? 0
  return {
    ready: overview.isSuccess && invites.isSuccess && settings.isSuccess,
    failed: overview.isError || invites.isError || settings.isError,
    used: active + pending,
    pending,
    capacity: settings.data?.studentCapacity ?? 10,
  }
}

export function inviteLink(code: string) {
  return `${window.location.origin}/katil?kod=${code}`
}

export function inviteMessage(code: string) {
  return `Sınavika'ya katılmak için davet kodun: ${code}. Buradan katılabilirsin: ${inviteLink(code)}`
}

export function whatsappLink(code: string) {
  return `https://wa.me/?text=${encodeURIComponent(inviteMessage(code))}`
}

export const canShare = typeof navigator !== 'undefined' && typeof navigator.share === 'function'

export async function shareInvite(code: string) {
  if (!canShare) {
    window.open(whatsappLink(code), '_blank', 'noopener')
    return
  }
  try {
    await navigator.share({ title: 'Sınavika daveti', text: inviteMessage(code) })
  } catch (error) {
    if ((error as Error)?.name !== 'AbortError') toast.error('Paylaşılamadı, kodu kopyalayıp gönderebilirsin')
  }
}

export async function copyText(text: string, success: string) {
  try {
    await navigator.clipboard.writeText(text)
    toast.success(success)
  } catch {
    const area = document.createElement('textarea')
    area.value = text
    area.setAttribute('readonly', '')
    area.style.position = 'fixed'
    area.style.opacity = '0'
    document.body.appendChild(area)
    area.select()
    const ok = document.execCommand('copy')
    area.remove()
    if (ok) toast.success(success)
    else toast.error('Kopyalanamadı, kodu elle seçip kopyala')
  }
}

export function isCapacityError(error: unknown) {
  const e = error as { hint?: string; message?: string } | null
  return e?.hint === 'capacity' || /kontenjan/i.test(e?.message ?? '')
}
