import { useQuery, useQueryClient } from '@tanstack/react-query'
import { ShieldCheck } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input } from '@/components/ui/field'
import { cleanCode, mfaKey } from '@/features/auth/mfa'
import { useProfile } from '@/features/auth/session'
import { errorMessage, supabase } from '@/lib/supabase'
import { copyText, SettingsCard } from './ui'

type Enrollment = { id: string; qr: string; secret: string }

// İki adımlı doğrulama (TOTP). Öğretmenler açabilir, yönetici için yönetim yetkisi buna bağlıdır (private.is_admin)
export function MfaCard() {
  const profile = useProfile()
  const queryClient = useQueryClient()
  const factors = useQuery({
    queryKey: [...mfaKey, 'factors'],
    queryFn: async () => {
      const { data, error } = await supabase.auth.mfa.listFactors()
      if (error) throw error
      return data.all
    },
  })
  const [enroll, setEnroll] = useState<Enrollment | null>(null)
  const [code, setCode] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [confirmOff, setConfirmOff] = useState(false)

  const verified = factors.data?.find((f) => f.factor_type === 'totp' && f.status === 'verified')

  async function start() {
    setBusy(true)
    setError(null)
    try {
      for (const f of factors.data ?? []) if (f.status !== 'verified') await supabase.auth.mfa.unenroll({ factorId: f.id })
      const { data, error } = await supabase.auth.mfa.enroll({ factorType: 'totp', friendlyName: `İzlek ${Date.now()}` })
      if (error) throw error
      setEnroll({ id: data.id, qr: data.totp.qr_code, secret: data.totp.secret })
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setBusy(false)
    }
  }

  async function confirm() {
    if (!enroll) return
    if (code.length !== 6) return setError('6 haneli kodu yazın')
    setBusy(true)
    setError(null)
    const { error } = await supabase.auth.mfa.challengeAndVerify({ factorId: enroll.id, code })
    setBusy(false)
    if (error) {
      setError('Kod hatalı. Uygulamadaki güncel kodu yazın')
      return
    }
    setEnroll(null)
    setCode('')
    await queryClient.invalidateQueries({ queryKey: mfaKey })
    toast.success('İki adımlı doğrulama açıldı')
  }

  async function turnOff() {
    if (!verified) return
    const { error } = await supabase.auth.mfa.unenroll({ factorId: verified.id })
    if (error) {
      toast.error(/aal2|assurance/i.test(error.message) ? 'Kapatmak için önce çıkış yapıp kodla yeniden giriş yapın' : errorMessage(error))
      return
    }
    await supabase.auth.refreshSession()
    await queryClient.invalidateQueries({ queryKey: mfaKey })
    toast.success('İki adımlı doğrulama kapatıldı')
  }

  return (
    <SettingsCard
      icon={ShieldCheck}
      title="İki adımlı doğrulama"
      description={
        profile.is_admin
          ? 'Yönetim işlemleri, açıldığında yalnızca doğrulama koduyla girilen oturumda yapılabilir.'
          : 'Girişte şifrenin yanında telefondaki doğrulama uygulamasından bir kod da istenir.'
      }
      action={verified ? <Badge tone="primary">Açık</Badge> : profile.is_admin ? <Badge tone="warning">Kapalı</Badge> : undefined}
    >
      {factors.isPending ? null : verified ? (
        <Button variant="secondary" onClick={() => setConfirmOff(true)} className="w-full sm:w-auto">
          Kapatın
        </Button>
      ) : enroll ? (
        <div className="grid gap-4 sm:grid-cols-[11rem_minmax(0,1fr)] sm:items-start">
          <img src={enroll.qr} alt="Doğrulama uygulamasıyla okutulacak kare kod" className="size-44 rounded-2xl border border-line bg-white p-2" />
          <div className="space-y-3">
            <p className="text-sm text-muted">
              Google Authenticator ya da benzeri bir uygulamayla kare kodu okutun. Okutamıyorsanız anahtarı elle girin.
            </p>
            <button
              type="button"
              onClick={() => void copyText(enroll.secret, 'Anahtar kopyalandı')}
              className="tabular min-h-11 w-full rounded-xl bg-surface-2 px-3 text-left font-mono text-sm break-all"
            >
              {enroll.secret}
            </button>
            <Field label="Uygulamadaki kod" error={error ?? undefined}>
              {(props) => (
                <Input
                  {...props}
                  value={code}
                  onChange={(e) => setCode(cleanCode(e.target.value))}
                  inputMode="numeric"
                  autoComplete="one-time-code"
                  className="tabular tracking-[0.3em]"
                />
              )}
            </Field>
            <div className="flex flex-wrap gap-2">
              <Button onClick={() => void confirm()} loading={busy}>
                Doğrulayın ve açın
              </Button>
              <Button variant="ghost" onClick={() => setEnroll(null)}>
                Vazgeçin
              </Button>
            </div>
          </div>
        </div>
      ) : (
        <Button onClick={() => void start()} loading={busy} className="w-full sm:w-auto">
          Açın
        </Button>
      )}
      <Confirm
        open={confirmOff}
        onOpenChange={setConfirmOff}
        title="İki adımlı doğrulama kapatılsın mı?"
        description="Girişte yalnızca şifre istenir."
        confirmLabel="Kapatın"
        onConfirm={turnOff}
      />
    </SettingsCard>
  )
}

