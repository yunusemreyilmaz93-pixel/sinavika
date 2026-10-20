import { Check, Circle } from 'lucide-react'
import { PASSWORD_RULES } from '../../../../shared/accounts'
import { cn } from '@/lib/cn'

export function PasswordChecklist({ password, id }: { password: string; id?: string }) {
  const done = PASSWORD_RULES.filter((r) => r.test(password)).length
  return (
    <div id={id} className="rounded-xl bg-surface-2 px-3 py-2.5">
      <p className="sr-only" aria-live="polite">
        Şifre kurallarının {PASSWORD_RULES.length} tanesinden {done} tanesi sağlandı
      </p>
      <ul className="grid gap-1.5 text-[13px] sm:grid-cols-2">
        {PASSWORD_RULES.map((rule) => {
          const ok = rule.test(password)
          return (
            <li key={rule.id} className={cn('flex items-center gap-2 transition-colors duration-200', ok ? 'text-success' : 'text-muted')}>
              <span
                className={cn(
                  'grid size-4 shrink-0 place-items-center rounded-full transition-colors duration-200',
                  ok ? 'bg-success text-primary-fg' : 'text-subtle',
                )}
                aria-hidden
              >
                {ok ? <Check className="size-3" strokeWidth={3.5} /> : <Circle className="size-3.5" />}
              </span>
              <span className={ok ? 'font-semibold' : undefined}>{rule.label}</span>
              <span className="sr-only">{ok ? 'sağlandı' : 'eksik'}</span>
            </li>
          )
        })}
      </ul>
    </div>
  )
}
