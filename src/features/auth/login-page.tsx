import { CalendarCheck2, KeyRound, MessagesSquare, Presentation, Timer, TrendingUp } from 'lucide-react'
import { useId, useRef, useState, type FormEvent } from 'react'
import { Link, Navigate, useSearchParams } from 'react-router'
import { Button } from '@/components/ui/button'
import { Field, Input } from '@/components/ui/field'
import { errorMessage } from '@/lib/supabase'
import { AuthHeading, AuthLayout, ValuePanel, type ValuePoint } from './ui/auth-layout'
import { ForgotPassword } from './ui/forgot-password'
import { focusFirstInvalid, FormAlert } from './ui/form-bits'
import { PasswordInput } from './ui/password-input'
import { useSignIn } from './ui/use-sign-in'

const points: ValuePoint[] = [
  { icon: CalendarCheck2, title: 'Haftalık plan', text: 'Öğretmenin görevleri verir, sen yaptıkça işaretlersin.' },
  { icon: Timer, title: 'Çalışma ve soru takibi', text: 'Süreni ve çözdüğün soruları ders ders kaydedersin.' },
  { icon: TrendingUp, title: 'Deneme netleri', text: 'Her denemeden sonra netlerin ve konu durumun görünür.' },
  { icon: MessagesSquare, title: 'Öğretmen, öğrenci ve veli', text: 'Herkes aynı planı kendi ekranından görür, gerektiğinde yazışır.' },
]

export default function LoginPage() {
  const [params] = useSearchParams()
  const next = params.get('next')
  const target = next?.startsWith('/app') ? next : '/app'
  const flow = useSignIn()
  const formRef = useRef<HTMLFormElement>(null)
  const passwordRef = useRef<HTMLInputElement>(null)
  const passwordId = useId()
  const [identifier, setIdentifier] = useState('')
  const [password, setPassword] = useState('')
  const [errors, setErrors] = useState<{ identifier?: string; password?: string }>({})
  const [formError, setFormError] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)

  if (flow.done) return <Navigate to={target} replace />

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (submitting || flow.waiting) return
    const nextErrors = {
      identifier: identifier.trim() ? undefined : 'Kullanıcı adını ya da e-posta adresini yaz',
      password: password ? undefined : 'Şifreni yaz',
    }
    setErrors(nextErrors)
    setFormError(null)
    if (nextErrors.identifier || nextErrors.password) {
      focusFirstInvalid(formRef.current)
      return
    }
    setSubmitting(true)
    try {
      await flow.signIn(identifier, password)
    } catch (err) {
      setFormError(errorMessage(err))
      requestAnimationFrame(() => passwordRef.current?.select())
    } finally {
      setSubmitting(false)
    }
  }

  const shownError = formError ?? flow.error
  const passwordError = errors.password

  return (
    <AuthLayout
      aside={
        <ValuePanel
          title="Plan, takip ve deneme netleri tek yerde"
          points={points}
          footer="Yolumnet ücretsiz. Her öğretmen en fazla 10 öğrenciyle çalışır."
        />
      }
    >
      <AuthHeading title="Giriş yap" description="Öğrenci ve veliler kullanıcı adıyla, öğretmenler e-posta adresiyle giriş yapar." />

      <form ref={formRef} onSubmit={submit} noValidate className="flex flex-col gap-4">
        <Field label="Kullanıcı adı veya e-posta" error={errors.identifier}>
          {(props) => (
            <Input
              {...props}
              name="username"
              type="text"
              inputMode="email"
              autoComplete="username"
              autoCapitalize="none"
              autoCorrect="off"
              spellCheck={false}
              enterKeyHint="next"
              autoFocus
              value={identifier}
              onChange={(e) => {
                setIdentifier(e.target.value)
                if (errors.identifier) setErrors((prev) => ({ ...prev, identifier: undefined }))
              }}
            />
          )}
        </Field>

        <div className="flex flex-col gap-1.5">
          <div className="flex items-center justify-between gap-3">
            <label htmlFor={passwordId} className="text-sm font-semibold">
              Şifre
            </label>
            <ForgotPassword />
          </div>
          <PasswordInput
            ref={passwordRef}
            id={passwordId}
            name="password"
            autoComplete="current-password"
            enterKeyHint="go"
            value={password}
            aria-invalid={passwordError ? true : undefined}
            aria-describedby={passwordError ? `${passwordId}-error` : undefined}
            onChange={(e) => {
              setPassword(e.target.value)
              if (errors.password) setErrors((prev) => ({ ...prev, password: undefined }))
            }}
          />
          {passwordError && (
            <p id={`${passwordId}-error`} className="text-sm text-danger">
              {passwordError}
            </p>
          )}
        </div>

        {shownError && <FormAlert>{shownError}</FormAlert>}

        <Button type="submit" size="lg" className="mt-1 w-full" loading={submitting || flow.waiting}>
          Giriş yap
        </Button>
      </form>

      <div className="mt-8 border-t border-line pt-6">
        <p className="text-sm font-semibold text-muted">Hesabın yok mu?</p>
        <div className="mt-3 grid gap-2">
          <Button variant="secondary" asChild className="w-full justify-start">
            <Link to="/katil">
              <KeyRound className="text-primary" />
              Davet kodum var
            </Link>
          </Button>
          <Button variant="secondary" asChild className="w-full justify-start">
            <Link to="/ogretmen-basvurusu">
              <Presentation className="text-accent" />
              Öğretmen olarak başvur
            </Link>
          </Button>
        </div>
      </div>
    </AuthLayout>
  )
}
