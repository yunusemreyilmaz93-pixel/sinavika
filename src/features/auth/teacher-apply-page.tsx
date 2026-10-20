import { useQueryClient } from '@tanstack/react-query'
import { ClipboardList, LayoutDashboard, MessagesSquare, PauseCircle, Users } from 'lucide-react'
import { useRef, useState, type FormEvent } from 'react'
import { Link, Navigate } from 'react-router'
import { toast } from 'sonner'
import { z } from 'zod'
import { Button } from '@/components/ui/button'
import { Field, Input, Textarea } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { callApi } from '@/lib/api'
import { keys, useSettings } from '@/lib/data'
import { errorMessage } from '@/lib/supabase'
import { PASSWORD_MIN } from '../../../shared/accounts'
import { AuthHeading, AuthLayout, ValuePanel, type ValuePoint } from './ui/auth-layout'
import {
  ConsentCheckbox,
  focusFirstInvalid,
  FormAlert,
  issuesToErrors,
  KvkkLink,
  OptionalLabel,
  type FieldErrors,
} from './ui/form-bits'
import { PasswordInput } from './ui/password-input'
import { useSignIn } from './ui/use-sign-in'

const NOTE_MAX = 600

const schema = z.object({
  fullName: z.string().min(2, 'Adını ve soyadını yaz').max(80, 'En fazla 80 karakter olabilir'),
  email: z.email('Geçerli bir e-posta adresi yaz').max(160, 'En fazla 160 karakter olabilir'),
  password: z
    .string()
    .min(PASSWORD_MIN, `Şifren en az ${PASSWORD_MIN} karakter olmalı`)
    .max(72, 'Şifren en fazla 72 karakter olabilir'),
  school: z.string().max(120, 'En fazla 120 karakter olabilir'),
  branch: z.string().max(60, 'En fazla 60 karakter olabilir'),
  note: z.string().max(NOTE_MAX, `En fazla ${NOTE_MAX} karakter olabilir`),
  consent: z.literal(true, 'Devam etmek için onaylaman gerekiyor'),
  transfer: z.literal(true, 'Hesap açmak için bu onay gerekiyor'),
})

type Values = { fullName: string; email: string; password: string; school: string; branch: string; note: string; consent: boolean; transfer: boolean }
type Key = keyof Values

const empty: Values = { fullName: '', email: '', password: '', school: '', branch: '', note: '', consent: false, transfer: false }

const points: ValuePoint[] = [
  { icon: Users, title: 'En fazla 10 öğrenci', text: 'Her öğrenciyle yakından ilgilenebilmen için sınır 10.' },
  { icon: ClipboardList, title: 'Plan şablonları', text: 'Haftalık planı şablondan hazırlar, öğrencine gönderirsin.' },
  { icon: LayoutDashboard, title: 'Haftalık özet', text: 'Kim ne kadar çalıştı, kimin görevi gecikti, son netler ne durumda.' },
  { icon: MessagesSquare, title: 'Öğrenci ve veliyle yazışma', text: 'Görüşme notların ve mesajların öğrencinin sayfasında durur.' },
]

const steps = ['Başvurunu gönder', 'Onaylanınca hesabın açılır', 'Öğrencilerine davet kodu gönder']

function trimmed(values: Values) {
  return {
    ...values,
    fullName: values.fullName.trim().replace(/\s+/g, ' '),
    email: values.email.trim().toLowerCase(),
    school: values.school.trim(),
    branch: values.branch.trim(),
    note: values.note.trim(),
  }
}

function validate(values: Values): FieldErrors<Key> {
  const result = schema.safeParse(trimmed(values))
  return result.success ? {} : issuesToErrors<Key>(result.error)
}

export default function TeacherApplyPage() {
  const settings = useSettings()
  const closed = settings.data?.applicationsOpen === false

  return (
    <AuthLayout
      aside={
        <ValuePanel
          title="Öğrencilerini tek ekrandan takip et"
          points={points}
          footer={
            <ol className="space-y-2">
              {steps.map((step, i) => (
                <li key={step} className="flex items-center gap-3">
                  <span className="grid size-6 shrink-0 place-items-center rounded-full border border-line-strong bg-surface text-xs font-bold text-fg tabular">
                    {i + 1}
                  </span>
                  {step}
                </li>
              ))}
            </ol>
          }
        />
      }
    >
      {settings.isPending ? <FormSkeleton /> : closed ? <ApplicationsClosed /> : <ApplyForm />}
    </AuthLayout>
  )
}

function FormSkeleton() {
  return (
    <div aria-busy="true" aria-label="Yükleniyor" className="space-y-5">
      <Skeleton className="h-8 w-56" />
      <Skeleton className="h-4 w-full" />
      {Array.from({ length: 4 }, (_, i) => (
        <div key={i} className="space-y-2">
          <Skeleton className="h-4 w-24" />
          <Skeleton className="h-11" />
        </div>
      ))}
      <Skeleton className="h-13" />
    </div>
  )
}

function ApplicationsClosed() {
  return (
    <div>
      <div className="grid size-12 place-items-center rounded-2xl bg-warning-soft text-warning">
        <PauseCircle className="size-6" />
      </div>
      <h1 className="mt-5 text-2xl font-extrabold">Başvurular şu an kapalı</h1>
      <p className="mt-2 text-[15px] leading-relaxed text-muted">
        Yeni öğretmen hesaplarını bir süreliğine açmıyoruz. Daha sonra tekrar bakabilirsin.
      </p>
      <p className="mt-3 text-[15px] leading-relaxed text-muted">
        Öğrenci ya da veliysen öğretmeninden davet kodu istemen yeterli.
      </p>
      <div className="mt-6 grid gap-2">
        <Button asChild size="lg">
          <Link to="/katil">Davet kodum var</Link>
        </Button>
        <Button asChild variant="secondary" size="lg">
          <Link to="/giris">Giriş yap</Link>
        </Button>
      </div>
    </div>
  )
}

function ApplyForm() {
  const queryClient = useQueryClient()
  const flow = useSignIn()
  const formRef = useRef<HTMLFormElement>(null)
  const [values, setValues] = useState<Values>(empty)
  const [website, setWebsite] = useState('')
  const [errors, setErrors] = useState<FieldErrors<Key>>({})
  const [attempted, setAttempted] = useState(false)
  const [formError, setFormError] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)
  const [registeredEmail, setRegisteredEmail] = useState<string | null>(null)

  if (flow.done) return <Navigate to="/app" replace />

  function set<K extends Key>(key: K, value: Values[K]) {
    const next = { ...values, [key]: value }
    setValues(next)
    if (attempted) setErrors(validate(next))
    else if (errors[key]) setErrors((prev) => ({ ...prev, [key]: undefined }))
  }

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
    const input = trimmed(values)
    setSubmitting(true)
    try {
      await callApi<{ status: string }>('auth', {
        action: 'register-teacher',
        fullName: input.fullName,
        email: input.email,
        password: input.password,
        school: input.school,
        branch: input.branch,
        note: input.note,
        consent: true,
        website,
      })
    } catch (err) {
      const message = errorMessage(err)
      if (/zaten var/i.test(message)) {
        setErrors({ email: 'Bu e-posta adresiyle kayıtlı bir hesap var. Giriş yapmayı dene' })
        focusFirstInvalid(formRef.current)
      } else if (/şifre/i.test(message)) {
        setErrors({ password: message })
        focusFirstInvalid(formRef.current)
      } else {
        if (/kapalı/i.test(message)) void queryClient.invalidateQueries({ queryKey: keys.settings })
        setFormError(message)
      }
      setSubmitting(false)
      return
    }
    toast.success('Başvurun alındı')
    try {
      await flow.signIn(input.email, input.password)
    } catch {
      setRegisteredEmail(input.email)
    } finally {
      setSubmitting(false)
    }
  }

  if (registeredEmail) {
    return (
      <div>
        <AuthHeading title="Başvurun alındı" description="Hesabın onaylandığında öğrencilerini davet edebileceksin." />
        <FormAlert tone="info">
          Otomatik giriş yapılamadı. {registeredEmail} adresin ve şifrenle giriş yaparak başvurunun durumunu görebilirsin.
        </FormAlert>
        <Button asChild size="lg" className="mt-5 w-full">
          <Link to="/giris">Giriş yap</Link>
        </Button>
      </div>
    )
  }

  const shownError = formError ?? flow.error

  return (
    <>
      <AuthHeading
        title="Öğretmen başvurusu"
        description="Yolumnet öğretmenler için ücretsiz. Başvurunu inceledikten sonra hesabın açılır."
      />

      <form ref={formRef} onSubmit={submit} noValidate className="flex flex-col gap-4">
        <Field label="Ad soyad" error={errors.fullName}>
          {(props) => (
            <Input
              {...props}
              name="name"
              autoComplete="name"
              autoCapitalize="words"
              enterKeyHint="next"
              value={values.fullName}
              onChange={(e) => set('fullName', e.target.value)}
            />
          )}
        </Field>
        <Field label="E-posta" hint="Giriş yaparken bunu kullanacaksın." error={errors.email}>
          {(props) => (
            <Input
              {...props}
              name="email"
              type="email"
              inputMode="email"
              autoComplete="email"
              autoCapitalize="none"
              autoCorrect="off"
              spellCheck={false}
              enterKeyHint="next"
              value={values.email}
              onChange={(e) => set('email', e.target.value)}
            />
          )}
        </Field>
        <Field label="Şifre" hint={`En az ${PASSWORD_MIN} karakter.`} error={errors.password}>
          {(props) => (
            <PasswordInput
              {...props}
              name="new-password"
              autoComplete="new-password"
              enterKeyHint="next"
              value={values.password}
              onChange={(e) => set('password', e.target.value)}
            />
          )}
        </Field>
        <div className="grid gap-4 sm:grid-cols-2">
          <Field label={<OptionalLabel>Okul</OptionalLabel>} error={errors.school}>
            {(props) => (
              <Input
                {...props}
                name="organization"
                autoComplete="organization"
                enterKeyHint="next"
                value={values.school}
                onChange={(e) => set('school', e.target.value)}
              />
            )}
          </Field>
          <Field label={<OptionalLabel>Branş</OptionalLabel>} error={errors.branch}>
            {(props) => (
              <Input
                {...props}
                name="branch"
                autoComplete="off"
                enterKeyHint="next"
                placeholder="Matematik"
                value={values.branch}
                onChange={(e) => set('branch', e.target.value)}
              />
            )}
          </Field>
        </div>
        <Field
          label={<OptionalLabel>Kısa not</OptionalLabel>}
          hint={
            <span className="flex justify-between gap-3">
              <span>Kaç öğrenciyle çalışmayı düşündüğünü yazabilirsin.</span>
              <span className="shrink-0 tabular">
                {values.note.length}/{NOTE_MAX}
              </span>
            </span>
          }
          error={errors.note}
        >
          {(props) => (
            <Textarea
              {...props}
              name="note"
              rows={3}
              maxLength={NOTE_MAX}
              value={values.note}
              onChange={(e) => set('note', e.target.value)}
            />
          )}
        </Field>

        <div aria-hidden className="absolute -left-[9999px] size-px overflow-hidden">
          <label>
            Web sitesi
            <input name="website" tabIndex={-1} autoComplete="off" value={website} onChange={(e) => setWebsite(e.target.value)} />
          </label>
        </div>

        <ConsentCheckbox checked={values.consent} onCheckedChange={(checked) => set('consent', checked)} error={errors.consent}>
          <KvkkLink>KVKK aydınlatma metnini</KvkkLink> okudum ve onaylıyorum.
        </ConsentCheckbox>

        <ConsentCheckbox checked={values.transfer} onCheckedChange={(checked) => set('transfer', checked)} error={errors.transfer}>
          Verilerimin hizmetin sunulması için yurt dışındaki sunucularda saklanmasına açık rıza veriyorum.
        </ConsentCheckbox>

        {shownError && <FormAlert>{shownError}</FormAlert>}

        <Button type="submit" size="lg" className="mt-1 w-full" loading={submitting || flow.waiting}>
          Başvuruyu gönder
        </Button>
      </form>

      <p className="mt-6 text-center text-sm text-muted">
        Hesabın var mı?{' '}
        <Link to="/giris" className="inline-flex min-h-11 items-center font-semibold text-accent hover:underline">
          Giriş yap
        </Link>
      </p>
    </>
  )
}
