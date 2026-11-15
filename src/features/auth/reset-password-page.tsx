import { KeyRound } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router'
import { toast } from 'sonner'
import { PASSWORD_MAX, passwordIssueMessage, passwordProblem } from '../../../shared/accounts'
import { Button } from '@/components/ui/button'
import { Field } from '@/components/ui/field'
import { errorMessage, supabase } from '@/lib/supabase'
import { AuthHeading, AuthLayout, ValuePanel } from './ui/auth-layout'
import { FormAlert } from './ui/form-bits'
import { PasswordChecklist } from './ui/password-checklist'
import { PasswordInput } from './ui/password-input'

const expired = 'Bağlantının süresi dolmuş ya da daha önce kullanılmış. Giriş sayfasındaki "Şifremi unuttum" ile yeni bağlantı isteyin.'

// E-postadaki şifre yenileme bağlantısı buraya gelir. Bağlantı sayfa açılınca değil kaydet düğmesine basılınca doğrulanır,
// böylece e-posta tarayıcılarının bağlantıyı önceden açması tek kullanımlık kodu harcamaz
export default function ResetPasswordPage() {
  const [params] = useSearchParams()
  const tokenHash = params.get('token_hash')
  const navigate = useNavigate()
  const [password, setPassword] = useState('')
  const [repeat, setRepeat] = useState('')
  const [errors, setErrors] = useState<{ password?: string; repeat?: string }>({})
  const [failure, setFailure] = useState<string | null>(tokenHash ? null : expired)
  const [verified, setVerified] = useState(false)
  const [saving, setSaving] = useState(false)

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const issue = passwordIssueMessage(password)
    const next = { password: issue ?? undefined, repeat: !issue && repeat !== password ? 'Şifreler aynı değil' : undefined }
    setErrors(next)
    if (next.password || next.repeat || !tokenHash) return
    setSaving(true)
    try {
      if (!verified) {
        const { error } = await supabase.auth.verifyOtp({ token_hash: tokenHash, type: 'recovery' })
        if (error) return setFailure(expired)
        setVerified(true)
      }
      const { error } = await supabase.auth.updateUser({ password })
      if (error) {
        setErrors({ password: /different from the old/i.test(error.message) ? 'Yeni şifre eskisiyle aynı olamaz' : passwordProblem(error) })
        return
      }
      toast.success('Şifre yenilendi')
      navigate('/app', { replace: true })
    } catch (error) {
      setFailure(errorMessage(error))
    } finally {
      setSaving(false)
    }
  }

  return (
    <AuthLayout aside={<ValuePanel title="Şifrenizi yenileyin" points={[]} />}>
      <AuthHeading title="Yeni şifre" description="Yeni şifrenizi belirleyin. Kaydedince hesabınıza giriş yapılır." />
      {failure ? (
        <div className="flex flex-col gap-4">
          <FormAlert>{failure}</FormAlert>
          <Button asChild variant="secondary" className="w-full">
            <Link to="/giris">
              <KeyRound />
              Giriş sayfasına dön
            </Link>
          </Button>
        </div>
      ) : (
        <form onSubmit={submit} noValidate className="flex flex-col gap-4">
          <Field label="Yeni şifre" error={errors.password}>
            {(props) => (
              <PasswordInput
                {...props}
                value={password}
                onChange={(e) => {
                  setPassword(e.target.value)
                  setErrors({})
                }}
                autoComplete="new-password"
                maxLength={PASSWORD_MAX}
                autoFocus
              />
            )}
          </Field>
          <Field label="Yeni şifre tekrar" error={errors.repeat}>
            {(props) => (
              <PasswordInput
                {...props}
                value={repeat}
                onChange={(e) => {
                  setRepeat(e.target.value)
                  setErrors((prev) => ({ ...prev, repeat: undefined }))
                }}
                autoComplete="new-password"
                maxLength={PASSWORD_MAX}
              />
            )}
          </Field>
          {password && <PasswordChecklist password={password} />}
          <Button type="submit" size="lg" className="mt-1 w-full" loading={saving}>
            Şifreyi kaydet
          </Button>
        </form>
      )}
    </AuthLayout>
  )
}
