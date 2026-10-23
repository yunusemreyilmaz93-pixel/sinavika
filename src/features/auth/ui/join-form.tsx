import { trackEvent } from '@/lib/hit'
import { NotebookPen } from 'lucide-react'
import { useRef, useState, type FormEvent } from 'react'
import { Link } from 'react-router'
import { toast } from 'sonner'
import { z } from 'zod'
import { Button } from '@/components/ui/button'
import { Field, Input } from '@/components/ui/field'
import { callApi } from '@/lib/api'
import { errorMessage } from '@/lib/supabase'
import { passwordIssueMessage, suggestUsername, USERNAME_PATTERN } from '../../../../shared/accounts'
import { ConsentCheckbox, focusFirstInvalid, FormAlert, issuesToErrors, KvkkLink, type FieldErrors } from './form-bits'
import type { InvitePreview } from './invite-card'
import { PasswordChecklist } from './password-checklist'
import { PasswordInput } from './password-input'
import type { SignInFlow } from './use-sign-in'

const usernameSchema = z
  .string()
  .min(3, 'En az 3 karakter olmalı')
  .max(24, 'En fazla 24 karakter olabilir')
  .regex(USERNAME_PATTERN, 'Sadece küçük harf, rakam, nokta ve alt çizgi kullanılabilir')

const schema = z.object({
  fullName: z.string().min(2, 'Adınızı ve soyadınızı yazın').max(80, 'En fazla 80 karakter olabilir'),
  username: usernameSchema,
  password: z.string().superRefine((value, ctx) => {
    const issue = passwordIssueMessage(value)
    if (issue) ctx.addIssue({ code: 'custom', message: issue })
  }),
  passwordAgain: z.string().min(1, 'Şifrenizi tekrar yazın'),
  consent: z.literal(true, 'Devam etmek için onay gerekiyor'),
  transfer: z.literal(true, 'Hesap açmak için bu onay gerekiyor'),
})

type Values = { fullName: string; username: string; password: string; passwordAgain: string; consent: boolean; transfer: boolean }
type Key = keyof Values

const turkish: Record<string, string> = { ç: 'c', ğ: 'g', ı: 'i', ö: 'o', ş: 's', ü: 'u', â: 'a', î: 'i', û: 'u' }

function cleanUsername(value: string) {
  return value
    .toLocaleLowerCase('tr')
    .replace(/[çğıöşüâîû]/g, (c) => turkish[c] ?? c)
    .replace(/\s+/g, '')
}

function validate(values: Values): FieldErrors<Key> {
  const result = schema.safeParse({ ...values, fullName: values.fullName.trim().replace(/\s+/g, ' ') })
  const errors = result.success ? {} : issuesToErrors<Key>(result.error)
  if (!errors.passwordAgain && values.passwordAgain && values.password !== values.passwordAgain) {
    errors.passwordAgain = 'Şifreler aynı değil'
  }
  return errors
}

type JoinFormProps = { code: string; invite: InvitePreview; flow: SignInFlow }

export function JoinForm({ code, invite, flow }: JoinFormProps) {
  const isStudent = invite.kind === 'student'
  const initialName = isStudent ? invite.student_name.trim() : ''
  const formRef = useRef<HTMLFormElement>(null)
  const [values, setValues] = useState<Values>({
    fullName: initialName,
    username: suggestUsername(initialName),
    password: '',
    passwordAgain: '',
    consent: false,
    transfer: false,
  })
  const [usernameEdited, setUsernameEdited] = useState(false)
  const [attempted, setAttempted] = useState(false)
  const [errors, setErrors] = useState<FieldErrors<Key>>({})
  const [formError, setFormError] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)
  const [created, setCreated] = useState(false)

  function update(patch: Partial<Values>) {
    const next = { ...values, ...patch }
    setValues(next)
    if (attempted) {
      setErrors(validate(next))
    } else {
      const cleared = { ...errors }
      for (const key of Object.keys(patch) as Key[]) delete cleared[key]
      setErrors(cleared)
    }
  }

  const liveUsernameError =
    usernameEdited && values.username ? (usernameSchema.safeParse(values.username).error?.issues[0]?.message ?? null) : null
  const usernameError = errors.username ?? liveUsernameError
  const usernameValid = USERNAME_PATTERN.test(values.username)
  const mismatch =
    !errors.passwordAgain && values.passwordAgain.length >= values.password.length && values.passwordAgain && values.passwordAgain !== values.password
      ? 'Şifreler aynı değil'
      : null

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (submitting || flow.waiting) return
    setAttempted(true)
    setFormError(null)
    const nextErrors = validate(values)
    setErrors(nextErrors)
    if (Object.keys(nextErrors).length) {
      focusFirstInvalid(formRef.current)
      return
    }
    const fullName = values.fullName.trim().replace(/\s+/g, ' ')
    setSubmitting(true)
    try {
      await callApi<{ role: string }>('auth', {
        action: 'join',
        code,
        fullName,
        username: values.username,
        password: values.password,
        consent: true,
      })
    } catch (err) {
      const message = errorMessage(err)
      if (/kullanıcı adı|zaten var/i.test(message)) {
        setErrors({ username: 'Bu kullanıcı adı alınmış, başka bir tane deneyin' })
        setUsernameEdited(true)
        focusFirstInvalid(formRef.current)
      } else if (/şifre/i.test(message)) {
        setErrors({ password: message })
        focusFirstInvalid(formRef.current)
      } else {
        setFormError(message)
      }
      setSubmitting(false)
      return
    }
    toast.success(`Hoş geldiniz, ${fullName.split(' ')[0]}`)
    trackEvent('davetle-katildi')
    try {
      await flow.signIn(values.username, values.password)
    } catch {
      setCreated(true)
    } finally {
      setSubmitting(false)
    }
  }

  if (created) {
    return (
      <div className="mt-5 space-y-4">
        <FormAlert tone="info">
          Hesabınız oluşturuldu ama otomatik giriş yapılamadı. Kullanıcı adınız <b className="font-semibold">{values.username}</b>, bununla
          ve şifrenizle giriş yapabilirsiniz.
        </FormAlert>
        <Button asChild size="lg" className="w-full">
          <Link to="/giris">Giriş yap</Link>
        </Button>
      </div>
    )
  }

  const shownError = formError ?? flow.error

  return (
    <form ref={formRef} onSubmit={submit} noValidate className="mt-6 flex flex-col gap-4">
      <Field label="Ad soyad" error={errors.fullName}>
        {(props) => (
          <Input
            {...props}
            name="name"
            autoComplete="name"
            autoCapitalize="words"
            enterKeyHint="next"
            value={values.fullName}
            onChange={(e) => {
              const fullName = e.target.value
              update(usernameEdited ? { fullName } : { fullName, username: suggestUsername(fullName) })
            }}
          />
        )}
      </Field>

      <Field label="Kullanıcı adı" hint="Küçük harf, rakam, nokta ve alt çizgi. 3 ile 24 karakter." error={usernameError}>
        {(props) => (
          <Input
            {...props}
            name="username"
            autoComplete="username"
            autoCapitalize="none"
            autoCorrect="off"
            spellCheck={false}
            enterKeyHint="next"
            maxLength={32}
            value={values.username}
            onChange={(e) => {
              setUsernameEdited(true)
              update({ username: cleanUsername(e.target.value) })
            }}
          />
        )}
      </Field>

      <div className="flex gap-3 rounded-xl border border-line bg-surface-2 px-3.5 py-3 text-sm leading-relaxed">
        <NotebookPen className="mt-0.5 size-4 shrink-0 text-primary" />
        <p className="min-w-0 break-words text-muted">
          {usernameValid ? (
            <>
              Kullanıcı adınız <b className="font-semibold text-fg">{values.username}</b>. Bir yere not edin, giriş yaparken lazım olacak.
            </>
          ) : (
            'Giriş yaparken kullanıcı adını kullanacaksınız. Seçtikten sonra bir yere not edin.'
          )}
        </p>
      </div>

      <Field label="Şifre" error={errors.password}>
        {(props) => (
          <PasswordInput
            {...props}
            name="new-password"
            autoComplete="new-password"
            enterKeyHint="next"
            value={values.password}
            onChange={(e) => update({ password: e.target.value })}
          />
        )}
      </Field>
      <PasswordChecklist password={values.password} />
      <Field label="Şifre tekrar" error={errors.passwordAgain ?? mismatch}>
        {(props) => (
          <PasswordInput
            {...props}
            name="confirm-password"
            autoComplete="new-password"
            enterKeyHint="go"
            value={values.passwordAgain}
            onChange={(e) => update({ passwordAgain: e.target.value })}
          />
        )}
      </Field>

      <ConsentCheckbox checked={values.consent} onCheckedChange={(consent) => update({ consent })} error={errors.consent}>
        {isStudent ? (
          <>
            <KvkkLink>KVKK aydınlatma metnini</KvkkLink> okudum. 18 yaşından küçüksem velimin bilgisi ve onayı var.
          </>
        ) : (
          <>
            <KvkkLink>KVKK aydınlatma metnini</KvkkLink> okudum ve onaylıyorum.
          </>
        )}
      </ConsentCheckbox>

      <ConsentCheckbox checked={values.transfer} onCheckedChange={(transfer) => update({ transfer })} error={errors.transfer}>
        Verilerimin hizmetin sunulması için yurt dışındaki sunucularda saklanmasına açık rıza veriyorum.
      </ConsentCheckbox>

      {shownError && <FormAlert>{shownError}</FormAlert>}

      <Button type="submit" size="lg" className="mt-1 w-full" loading={submitting || flow.waiting}>
        Hesabımı oluştur
      </Button>
    </form>
  )
}
