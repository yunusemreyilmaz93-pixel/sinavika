import { useQuery, useQueryClient } from '@tanstack/react-query'
import { ShieldCheck } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { Button } from '@/components/ui/button'
import { Field, Input } from '@/components/ui/field'
import { Logo } from '@/components/ui/logo'
import { supabase } from '@/lib/supabase'

export const mfaKey = ['mfa'] as const

// Oturum iki adımla açılmamışsa (aal1) ama hesapta doğrulanmış faktör varsa (aal2 gerekli) kod istenir
export function useMfaRequired(token: string | undefined) {
  return useQuery({
    queryKey: [...mfaKey, 'aal', token],
    enabled: Boolean(token),
    staleTime: Infinity,
    queryFn: async () => {
      const { data } = await supabase.auth.mfa.getAuthenticatorAssuranceLevel()
      return data?.currentLevel === 'aal1' && data.nextLevel === 'aal2'
    },
  })
}

export function cleanCode(value: string) {
  return value.replace(/\D/g, '').slice(0, 6)
}

export async function verifyTotp(code: string) {
  const { data, error } = await supabase.auth.mfa.listFactors()
  const factor = data?.totp.find((f) => f.status === 'verified')
  if (error || !factor) throw new Error('Doğrulama uygulaması bulunamadı')
  const result = await supabase.auth.mfa.challengeAndVerify({ factorId: factor.id, code })
  if (result.error) throw new Error('Kod hatalı ya da süresi geçmiş. Uygulamadaki yeni kodu yazın')
}

export function MfaChallenge({ onSignOut }: { onSignOut: () => void }) {
  const queryClient = useQueryClient()
  const [code, setCode] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function submit(e: FormEvent) {
    e.preventDefault()
    if (code.length !== 6) return setError('6 haneli kodu yazın')
    setBusy(true)
    setError(null)
    try {
      await verifyTotp(code)
      await queryClient.invalidateQueries({ queryKey: mfaKey })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Doğrulanamadı')
      setCode('')
    } finally {
      setBusy(false)
    }
  }

  return (
    <main className="grid min-h-dvh place-items-center px-4">
      <form onSubmit={submit} noValidate className="w-full max-w-sm">
        <Logo />
        <div className="mt-8 grid size-12 place-items-center rounded-2xl bg-primary-soft text-primary-soft-fg">
          <ShieldCheck className="size-6" />
        </div>
        <h1 className="mt-4 text-2xl font-extrabold">İki adımlı doğrulama</h1>
        <p className="mt-1 text-muted">Doğrulama uygulamanızdaki 6 haneli kodu yazın.</p>
        <Field label="Kod" error={error ?? undefined} className="mt-6">
          {(props) => (
            <Input
              {...props}
              value={code}
              onChange={(e) => setCode(cleanCode(e.target.value))}
              inputMode="numeric"
              autoComplete="one-time-code"
              autoFocus
              className="tabular text-center text-2xl tracking-[0.4em]"
            />
          )}
        </Field>
        <Button type="submit" size="lg" loading={busy} className="mt-4 w-full">
          Doğrula
        </Button>
        <Button type="button" variant="ghost" onClick={onSignOut} className="mt-2 w-full">
          Çıkış yap
        </Button>
      </form>
    </main>
  )
}
