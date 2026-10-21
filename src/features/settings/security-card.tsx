import { LockKeyhole } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { PASSWORD_MAX, passwordIssueMessage, passwordProblem } from '../../../shared/accounts'
import { Button } from '@/components/ui/button'
import { Field } from '@/components/ui/field'
import { PasswordChecklist } from '@/features/auth/ui/password-checklist'
import { PasswordInput } from '@/features/auth/ui/password-input'
import { useProfile } from '@/features/auth/session'
import { errorMessage, supabase } from '@/lib/supabase'
import { SettingsCard } from './ui'

function passwordError(message: string) {
  if (/different from the old/i.test(message)) return 'Yeni şifre eskisiyle aynı olamaz'
  if (/reauth/i.test(message)) return 'Güvenlik için çıkış yapıp tekrar giriş yaptıktan sonra deneyin'
  if (/weak|at least|pwned|characters|password/i.test(message)) return passwordProblem({ message })
  return errorMessage(message)
}

export function SecurityCard() {
  const profile = useProfile()
  const [password, setPassword] = useState('')
  const [repeat, setRepeat] = useState('')
  const [errors, setErrors] = useState<{ password?: string; repeat?: string }>({})
  const [saving, setSaving] = useState(false)

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const next: typeof errors = {}
    const issue = passwordIssueMessage(password)
    if (issue) next.password = issue
    if (!next.password && repeat !== password) next.repeat = 'Şifreler aynı değil'
    setErrors(next)
    if (next.password || next.repeat) return
    setSaving(true)
    const { error } = await supabase.auth.updateUser({ password })
    setSaving(false)
    if (error) {
      setErrors({ password: passwordError(error.message) })
      return
    }
    setPassword('')
    setRepeat('')
    toast.success('Şifre değişti')
  }

  return (
    <SettingsCard icon={LockKeyhole} title="Şifre" description="Bir sonraki girişte yeni şifre kullanılır.">
      <form onSubmit={submit} noValidate className="space-y-3">
        <input type="text" autoComplete="username" value={profile.username ?? profile.email ?? ''} readOnly hidden />
        <div className="grid gap-3 sm:grid-cols-2">
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
        </div>
        {password && <PasswordChecklist password={password} />}
        <Button type="submit" loading={saving} disabled={!password && !repeat} className="w-full sm:w-auto">
          Şifreyi değiştirin
        </Button>
      </form>
    </SettingsCard>
  )
}
