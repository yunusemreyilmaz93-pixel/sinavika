import { CONTACT_EMAIL } from '@/lib/contact'
import { GraduationCap, Presentation, X } from 'lucide-react'
import { Popover } from 'radix-ui'

const contactEmail = CONTACT_EMAIL

export function ForgotPassword() {
  return (
    <Popover.Root>
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
          <ul className="mt-2 space-y-3.5 text-sm">
            <li className="flex gap-3">
              <span className="grid size-9 shrink-0 place-items-center rounded-lg bg-primary-soft text-primary-soft-fg">
                <GraduationCap className="size-[18px]" />
              </span>
              <div>
                <p className="font-semibold">Öğrenci ve veliler</p>
                <p className="mt-0.5 leading-relaxed text-muted">Öğretmene haber verin. Şifreyi sıfırlayıp yenisini iletir.</p>
              </div>
            </li>
            <li className="flex gap-3">
              <span className="grid size-9 shrink-0 place-items-center rounded-lg bg-accent-soft text-accent-soft-fg">
                <Presentation className="size-[18px]" />
              </span>
              <div>
                <p className="font-semibold">Öğretmenler</p>
                <p className="mt-0.5 leading-relaxed text-muted">
                  Kayıtlı e-posta adresinizden yöneticiye yazın. Şifreyi sıfırlayıp bilgi verir.
                </p>
                {contactEmail && (
                  <a href={`mailto:${contactEmail}`} className="mt-1 inline-flex min-h-9 items-center font-semibold break-all text-accent hover:underline">
                    {contactEmail}
                  </a>
                )}
              </div>
            </li>
          </ul>
        </Popover.Content>
      </Popover.Portal>
    </Popover.Root>
  )
}
