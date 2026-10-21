import { useEffect, useRef, useState } from 'react'
import { useNavigate, useSearchParams } from 'react-router'
import { Spinner } from '@/components/ui/spinner'
import { errorMessage, isTestTab, supabase } from '@/lib/supabase'

export default function TestLoginPage() {
  const [params] = useSearchParams()
  const navigate = useNavigate()
  const started = useRef(false)
  const hash = params.get('th')
  const [error, setError] = useState<string | null>(() => (isTestTab && hash ? null : 'Bu bağlantı yalnızca yönetim panelindeki Test hesapları bölümünden açılır.'))

  useEffect(() => {
    if (started.current || !isTestTab || !hash) return
    started.current = true
    void supabase.auth.verifyOtp({ token_hash: hash, type: 'magiclink' }).then(({ error: failure }) => {
      if (failure) setError(errorMessage(failure))
      else navigate('/app', { replace: true })
    })
  }, [hash, navigate])

  return (
    <main className="grid min-h-dvh place-items-center px-6 text-center">
      {error ? <p role="alert" className="max-w-sm text-[15px] text-muted">{error}</p> : <Spinner className="size-6" />}
    </main>
  )
}
