import { Check, CircleAlert, Info } from 'lucide-react'
import { motion } from 'motion/react'
import { Checkbox } from 'radix-ui'
import { useId, type ReactNode } from 'react'
import { Link } from 'react-router'
import type { z } from 'zod'
import { cn } from '@/lib/cn'

export type FieldErrors<K extends string> = Partial<Record<K, string>>

export function issuesToErrors<K extends string>(error: z.ZodError): FieldErrors<K> {
  const out: Partial<Record<string, string>> = {}
  for (const issue of error.issues) {
    const key = String(issue.path[0] ?? '')
    if (key && !out[key]) out[key] = issue.message
  }
  return out as FieldErrors<K>
}

export function focusFirstInvalid(form: HTMLFormElement | null) {
  requestAnimationFrame(() => form?.querySelector<HTMLElement>('[aria-invalid="true"]')?.focus())
}

export function FormAlert({ tone = 'danger', children, className }: { tone?: 'danger' | 'info'; children: ReactNode; className?: string }) {
  const Icon = tone === 'danger' ? CircleAlert : Info
  return (
    <motion.div
      role={tone === 'danger' ? 'alert' : 'status'}
      initial={{ opacity: 0, y: -4 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.2 }}
      className={cn(
        'flex gap-2.5 rounded-xl px-3.5 py-3 text-sm leading-relaxed',
        tone === 'danger' ? 'bg-danger-soft text-danger' : 'bg-accent-soft text-accent-soft-fg',
        className,
      )}
    >
      <Icon className="mt-0.5 size-4 shrink-0" />
      <div className="min-w-0">{children}</div>
    </motion.div>
  )
}

export function OptionalLabel({ children }: { children: ReactNode }) {
  return (
    <>
      {children} <span className="font-normal text-subtle">(isteğe bağlı)</span>
    </>
  )
}

export function KvkkLink({ children }: { children: ReactNode }) {
  return (
    <Link to="/kvkk" target="_blank" rel="noopener" className="font-semibold text-accent underline-offset-2 hover:underline">
      {children}
    </Link>
  )
}

export function ConsentCheckbox({
  checked,
  onCheckedChange,
  error,
  children,
}: {
  checked: boolean
  onCheckedChange: (checked: boolean) => void
  error?: string
  children: ReactNode
}) {
  const id = useId()
  return (
    <div>
      <div className="flex items-start gap-3">
        <Checkbox.Root
          id={id}
          checked={checked}
          onCheckedChange={(value) => onCheckedChange(value === true)}
          aria-invalid={error ? true : undefined}
          aria-describedby={error ? `${id}-error` : undefined}
          className="relative mt-0.5 grid size-6 shrink-0 place-items-center rounded-md border-2 border-line-strong bg-surface text-primary-fg transition-colors after:absolute after:-inset-2.5 hover:border-primary aria-invalid:border-danger data-[state=checked]:border-primary data-[state=checked]:bg-primary"
        >
          <Checkbox.Indicator asChild>
            <motion.span className="grid place-items-center" initial={{ scale: 0.4, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} transition={{ duration: 0.15 }}>
              <Check className="size-4" strokeWidth={3} />
            </motion.span>
          </Checkbox.Indicator>
        </Checkbox.Root>
        <label htmlFor={id} className="cursor-pointer text-sm leading-relaxed text-muted">
          {children}
        </label>
      </div>
      {error && (
        <p id={`${id}-error`} className="mt-1.5 pl-9 text-sm text-danger">
          {error}
        </p>
      )}
    </div>
  )
}
