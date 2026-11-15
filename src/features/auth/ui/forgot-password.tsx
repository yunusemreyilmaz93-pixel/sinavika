import { CONTACT_EMAIL } from '@/lib/contact'
import { CircleCheck, X } from 'lucide-react'
import { Popover } from 'radix-ui'
import { useState, type FormEvent } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/field'
import { callApi } from '@/lib/api'
import { errorMessage } from '@/lib/supabase'

const contactEmail = CONTACT_EMAIL

export function ForgotPassword({ identifier = '' }: { identifier?: string }) {
  const [value, setValue] = useState(identifier)
  const [state, setState] = useState<'idle' | 'sending' | 'sent'>('idle')
  const [error, setError] = useState<string | null>(null)

  async function submit(e: FormEvent) {
    e.preventDefault()
    if (value.trim().length < 3) return setError('Kullanıcı adınızı ya da e-posta adresinizi yazın')
    setState('sending')
    setError(null)
    try {
      await callApi('auth', { action: 'reset-request', identifier: value.trim() })
      setState('sent')
    } catch (err) {
      setError(errorMessage(err))
      setState('idle')
    }
  }

  return (
    <Popover.Root
      onOpenChange={(open) => {
        if (open) {
          setValue((v) => v || identifier)
          setState((s) => (s === 'sent' ? 'idle' : s))
        }
      }}
    >
      <Popover.Trigger className="-my-3 -mr-1.5 inline-flex h-11 items-center rounded-lg px-1.5 text-sm font-semibold text-accent underline-offset-4 hover:underline">
        Şifremi unuttum
      </Popover.Trigger>
      <Popover.Portal>
        <Popover.Content
          side="bottom"
          align="end"
          sideOffset={6}
          collisionPadding={16}
          className="z-50 w-[min(21rem,calc(100vw-2rem))] rounded-2xl border border-line bg-surface p-4 shadow-pop outline-none data-[state=closed]:animate-pop-out data-[state=open]:animate-pop-in"
        >
          <div className="flex items-start justify-between gap-3">
            <p className="pt-1 font-display text-base font-bold">Şifrenizi mi unuttunuz?</p>
            <Popover.Close
              aria-label="Kapat"
              className="-mt-1.5 -mr-1.5 grid size-10 shrink-0 place-items-center rounded-xl text-muted hover:bg-surface-2"
            >
              <X className="size-4" />
            </Popover.Close>
          </div>
          {state === 'sent' ? (
            <div className="mt-2 flex gap-3 text-sm">
              <CircleCheck className="mt-0.5 size-5 shrink-0 text-success" />
              <p className="leading-relaxed text-muted">
                {value.includes('@')
                  ? 'Hesap varsa e-posta adresinize şifre yenileme bağlantısı gönderildi. Gelen kutusunda yoksa istenmeyen klasörüne bakın.'
                  : 'İstek öğretmene iletildi. Öğretmen yeni şifreyi belirleyip size iletir.'}
              </p>
            </div>
          ) : (
            <form onSubmit={submit} noValidate className="mt-2 flex flex-col gap-3 text-sm">
              <p className="leading-relaxed text-muted">
                Kullanıcı adınızı ya da e-posta adresinizi yazın. Şifreyi sıfırlayacak kişiye haber gider.
              </p>
              <Input
                value={value}
                onChange={(e) => setValue(e.target.value)}
                aria-label="Kullanıcı adı veya e-posta"
                autoCapitalize="none"
                autoCorrect="off"
                spellCheck={false}
                aria-invalid={error ? true : undefined}
              />
              {error && <p className="text-danger">{error}</p>}
              <Button type="submit" loading={state === 'sending'} className="w-full">
                Sıfırlama isteği gönder
              </Button>
              {contactEmail && (
                <p className="text-xs text-muted">
                  Yanıt alamazsanız{' '}
                  <a href={`mailto:${contactEmail}`} className="font-semibold break-all text-accent hover:underline">
                    {contactEmail}
                  </a>
                </p>
              )}
            </form>
          )}
        </Popover.Content>
      </Popover.Portal>
    </Popover.Root>
  )
}
