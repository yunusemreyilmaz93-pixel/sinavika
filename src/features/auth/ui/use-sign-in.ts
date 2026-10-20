import { useCallback, useEffect, useState } from 'react'
import { useAuth } from '../session'

type Phase = 'idle' | 'waiting' | 'stalled'

export type SignInFlow = ReturnType<typeof useSignIn>

export function useSignIn() {
  const { signIn, session, profile } = useAuth()
  const [phase, setPhase] = useState<Phase>('idle')

  useEffect(() => {
    if (phase !== 'waiting') return
    const timer = window.setTimeout(() => setPhase('stalled'), 15_000)
    return () => window.clearTimeout(timer)
  }, [phase])

  const start = useCallback(
    async (identifier: string, password: string) => {
      setPhase('idle')
      await signIn(identifier, password)
      setPhase('waiting')
    },
    [signIn],
  )

  const lost = phase === 'waiting' && !session
  const error =
    phase === 'stalled'
      ? 'Hesap bilgilerin yüklenemedi. Bağlantını kontrol edip tekrar dene'
      : lost
        ? 'Bu hesapla şu an giriş yapılamıyor. Sorun devam ederse öğretmenine ya da yöneticiye yaz'
        : null

  return {
    signIn: start,
    active: phase !== 'idle',
    waiting: phase === 'waiting' && !lost,
    done: phase !== 'idle' && Boolean(session && profile),
    error,
  }
}
