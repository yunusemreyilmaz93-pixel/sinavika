import { useQuery } from '@tanstack/react-query'
import { ArrowLeft, AtSign, CalendarCheck2, ChevronRight, HeartHandshake, KeyRound, LogIn, Presentation } from 'lucide-react'
import { motion } from 'motion/react'
import { useEffect, useRef, useState } from 'react'
import { Link, Navigate, useSearchParams } from 'react-router'
import { Button } from '@/components/ui/button'
import { Spinner } from '@/components/ui/spinner'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { useAuth, type Profile } from './session'
import { AuthLayout, ValuePanel, type ValuePoint } from './ui/auth-layout'
import { CODE_LENGTH, normalizeCode } from './ui/code-input'
import { CodeStep } from './ui/code-step'
import { InviteCard, type InvitePreview } from './ui/invite-card'
import { JoinForm } from './ui/join-form'
import { LinkChild, SignedInCard } from './ui/signed-in-join'
import { useSignIn, type SignInFlow } from './ui/use-sign-in'

const points: ValuePoint[] = [
  { icon: KeyRound, title: 'Davet koduyla katıl', text: 'Kodu öğretmenin verir. Her kod bir kez kullanılır.' },
  { icon: AtSign, title: 'E-posta gerekmez', text: 'Kullanıcı adın ve şifrenle giriş yaparsın.' },
  { icon: CalendarCheck2, title: 'Öğrenciler için', text: 'Görevlerin, çalışma süren ve denemelerin bir arada.' },
  { icon: HeartHandshake, title: 'Veliler için', text: 'Çocuğunun planını ve ilerlemesini görür, öğretmenle yazışırsın.' },
]

const linkClass = 'inline-flex min-h-11 items-center font-semibold text-accent hover:underline'

const stepVariants = {
  enter: (dir: number) => ({ opacity: 0, x: dir * 24 }),
  center: { opacity: 1, x: 0 },
  exit: (dir: number) => ({ opacity: 0, x: dir * -24 }),
}

export default function JoinPage() {
  const { ready, session, profile } = useAuth()
  const [params, setParams] = useSearchParams()
  const [initialCode] = useState(() => normalizeCode(params.get('kod') ?? ''))
  const [code, setCode] = useState(initialCode)
  const [submitted, setSubmitted] = useState<string | null>(initialCode.length === CODE_LENGTH ? initialCode : null)
  const [codeError, setCodeError] = useState<string | null>(null)
  const [changedCode, setChangedCode] = useState(false)
  const flow = useSignIn()

  const preview = useQuery({
    queryKey: ['invite-preview', submitted],
    enabled: submitted !== null,
    retry: false,
    staleTime: Infinity,
    refetchOnWindowFocus: false,
    queryFn: async () => {
      const rows = unwrap(await supabase.rpc('preview_invite', { p_code: submitted ?? '' }))
      return rows[0] ?? null
    },
  })

  if (flow.done) return <Navigate to="/app" replace />

  const signedInProfile = ready && session && profile && !flow.active ? profile : null
  const invite = submitted && preview.data ? preview.data : null
  const step = invite ? 'details' : 'code'

  function verify(value: string) {
    if (value.length < CODE_LENGTH) {
      setCodeError(`Kod ${CODE_LENGTH} karakter olmalı`)
      return
    }
    setCodeError(null)
    setParams({ kod: value }, { replace: true })
    if (value === submitted) void preview.refetch()
    else setSubmitted(value)
  }

  function changeCode() {
    setChangedCode(true)
    setSubmitted(null)
    setParams({}, { replace: true })
  }

  const sameCode = submitted !== null && submitted === code
  const shownCodeError =
    codeError ??
    (sameCode && preview.isError
      ? errorMessage(preview.error)
      : sameCode && preview.data === null
        ? 'Bu kod geçersiz ya da süresi dolmuş. Öğretmeninden yeni bir kod iste.'
        : null)

  let content
  if (!ready) {
    content = (
      <div className="grid min-h-60 place-items-center text-muted" aria-busy="true" aria-label="Yükleniyor">
        <Spinner />
      </div>
    )
  } else if (signedInProfile && signedInProfile.role !== 'parent') {
    content = <SignedInCard profile={signedInProfile} />
  } else {
    const parentLinking = Boolean(signedInProfile)
    content = (
        <motion.div
          key={step}
          custom={step === 'details' ? 1 : -1}
          variants={stepVariants}
          initial="enter"
          animate="center"
          transition={{ duration: 0.22, ease: [0.22, 1, 0.36, 1] }}
        >
          {invite && submitted ? (
            <InviteDetails
              code={submitted}
              invite={invite}
              flow={flow}
              signedInProfile={signedInProfile}
              onChangeCode={changeCode}
            />
          ) : (
            <CodeStep
              title={parentLinking ? 'Çocuğunu bağla' : 'Davet koduyla katıl'}
              description={
                parentLinking
                  ? 'Öğretmeninin ya da çocuğunun verdiği veli kodunu gir. Çocuğunun hesabına bağlanırsın.'
                  : `Öğretmeninden aldığın ${CODE_LENGTH} karakterlik kodu gir.`
              }
              code={code}
              onCodeChange={(value) => {
                setCode(value)
                setCodeError(null)
              }}
              onSubmit={verify}
              checking={submitted !== null && preview.isFetching}
              error={shownCodeError}
              autoFocus={!initialCode || changedCode}
              footer={
                parentLinking ? (
                  <p className="mt-6 text-center text-sm">
                    <Link to="/app" className={linkClass}>
                      Uygulamaya dön
                    </Link>
                  </p>
                ) : (
                  <div className="mt-8 grid gap-2 border-t border-line pt-6">
                    <Button variant="secondary" asChild className="w-full justify-start">
                      <Link to="/giris">
                        <LogIn className="text-primary" />
                        Hesabım var, giriş yap
                      </Link>
                    </Button>
                    <Button variant="secondary" asChild className="w-full justify-start">
                      <Link to="/ogretmen-basvurusu">
                        <Presentation className="text-accent" />
                        Öğretmen olarak başvur
                      </Link>
                    </Button>
                  </div>
                )
              }
            />
          )}
        </motion.div>
    )
  }

  return (
    <AuthLayout
      aside={
        <ValuePanel
          title="Öğretmeninle aynı planda çalış"
          points={points}
          footer="Ücretsiz. Hesabını ayarlardan istediğin zaman silebilirsin. Şifreni unutursan öğretmenin yenisini verir."
        />
      }
    >
      {content}
    </AuthLayout>
  )
}

type InviteDetailsProps = {
  code: string
  invite: InvitePreview
  flow: SignInFlow
  signedInProfile: Profile | null
  onChangeCode: () => void
}

function InviteDetails({ code, invite, flow, signedInProfile, onChangeCode }: InviteDetailsProps) {
  const headingRef = useRef<HTMLHeadingElement>(null)
  const parentInvite = invite.kind === 'parent'

  useEffect(() => {
    headingRef.current?.focus({ preventScroll: true })
  }, [])

  const title = signedInProfile
    ? parentInvite
      ? 'Çocuğunu bağla'
      : 'Öğrenci daveti'
    : parentInvite
      ? 'Veli hesabını oluştur'
      : 'Hesabını oluştur'

  return (
    <div>
      <Button variant="ghost" size="sm" className="-ml-2 mb-3 h-11 text-muted" onClick={onChangeCode} disabled={flow.waiting}>
        <ArrowLeft />
        Kodu değiştir
      </Button>
      <h1 ref={headingRef} tabIndex={-1} className="mb-4 text-2xl font-extrabold outline-none sm:text-[1.75rem]">
        {title}
      </h1>
      <InviteCard invite={invite} code={code} />

      {signedInProfile ? (
        <LinkChild profile={signedInProfile} invite={invite} code={code} />
      ) : (
        <>
          {parentInvite && (
            <p className="mt-4 text-sm leading-relaxed text-muted">
              Zaten veli hesabın var mı?{' '}
              <Link to={`/giris?next=${encodeURIComponent('/app/ayarlar')}`} className="font-semibold text-accent hover:underline">
                Giriş yap
              </Link>
              , sonra{' '}
              <span className="whitespace-nowrap font-semibold text-fg">
                Ayarlar
                <ChevronRight className="mx-0.5 inline size-3.5 align-[-2px]" aria-hidden />
                Çocuk bağla
              </span>{' '}
              bölümüne bu kodu gir.
            </p>
          )}
          <JoinForm code={code} invite={invite} flow={flow} />
        </>
      )}
    </div>
  )
}
