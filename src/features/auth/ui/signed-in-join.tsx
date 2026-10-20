import { useQueryClient } from '@tanstack/react-query'
import { UserCheck } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { useAuth, type Profile } from '../session'
import { FormAlert } from './form-bits'
import type { InvitePreview } from './invite-card'

function useLeave() {
  const { signOut } = useAuth()
  const [leaving, setLeaving] = useState(false)
  async function leave() {
    setLeaving(true)
    try {
      await signOut()
    } finally {
      setLeaving(false)
    }
  }
  return { leaving, leave }
}

export function SignedInCard({ profile }: { profile: Profile }) {
  const { leaving, leave } = useLeave()
  return (
    <div>
      <div className="grid size-12 place-items-center rounded-2xl bg-primary-soft text-primary-soft-fg">
        <UserCheck className="size-6" />
      </div>
      <h1 className="mt-5 text-2xl font-extrabold">Zaten giriş yaptın</h1>
      <p className="mt-2 text-[15px] leading-relaxed text-muted">
        <b className="font-semibold text-fg">{profile.full_name}</b> hesabıyla giriş yaptın. Davet kodu yeni hesap açmak için kullanılır.
      </p>
      <Button asChild size="lg" className="mt-6 w-full">
        <Link to="/app">Uygulamaya git</Link>
      </Button>
      <Button variant="ghost" className="mt-2 w-full" loading={leaving} onClick={() => void leave()}>
        Çıkış yap ve yeni hesap aç
      </Button>
    </div>
  )
}

export function LinkChild({ profile, invite, code }: { profile: Profile; invite: InvitePreview; code: string }) {
  const { refresh } = useAuth()
  const queryClient = useQueryClient()
  const navigate = useNavigate()
  const { leaving, leave } = useLeave()
  const [linking, setLinking] = useState(false)
  const [error, setError] = useState<string | null>(null)

  if (invite.kind === 'student') {
    return (
      <div className="mt-5 flex flex-col gap-3">
        <FormAlert tone="info">
          Bu kod bir öğrenci daveti. Öğrenci hesabı açmak için önce veli hesabından çıkış yapman gerekiyor.
        </FormAlert>
        <Button size="lg" variant="secondary" className="w-full" loading={leaving} onClick={() => void leave()}>
          Çıkış yap ve devam et
        </Button>
        <Button asChild variant="ghost" className="w-full">
          <Link to="/app">Uygulamaya dön</Link>
        </Button>
      </div>
    )
  }

  async function link(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (linking) return
    setLinking(true)
    setError(null)
    try {
      unwrap(await supabase.rpc('link_parent', { p_code: code }))
      await refresh()
      void queryClient.invalidateQueries()
      toast.success(`${invite.student_name} hesabına bağlandın`)
      navigate('/app', { replace: true })
    } catch (err) {
      setError(errorMessage(err))
      setLinking(false)
    }
  }

  return (
    <form onSubmit={link} className="mt-5 flex flex-col gap-3">
      <p className="text-[15px] leading-relaxed text-muted">
        <b className="font-semibold text-fg">{profile.full_name}</b> olarak giriş yaptın. Bağladıktan sonra {invite.student_name} için
        planı, ilerlemeyi ve mesajları kendi hesabından görürsün.
      </p>
      {error && <FormAlert>{error}</FormAlert>}
      <Button type="submit" size="lg" className="mt-2 w-full" loading={linking}>
        Hesabıma bağla
      </Button>
      <Button asChild variant="ghost" className="w-full">
        <Link to="/app">Şimdi değil</Link>
      </Button>
    </form>
  )
}
