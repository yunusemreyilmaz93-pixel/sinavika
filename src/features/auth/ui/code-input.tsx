import { forwardRef, Fragment, useState, type SyntheticEvent } from 'react'
import { cn } from '@/lib/cn'

export const CODE_LENGTH = 8

export function normalizeCode(value: string) {
  return value
    .replace(/[İı]/g, 'I')
    .toUpperCase()
    .replace(/[^A-Z0-9]/g, '')
    .slice(0, CODE_LENGTH)
}

export function formatCode(code: string) {
  return code.length > 4 ? `${code.slice(0, 4)}-${code.slice(4)}` : code
}

type CodeInputProps = {
  id?: string
  value: string
  onChange: (value: string) => void
  onComplete?: (value: string) => void
  disabled?: boolean
  autoFocus?: boolean
  'aria-invalid'?: boolean
  'aria-describedby'?: string
}

function keepCaretAtEnd(event: SyntheticEvent<HTMLInputElement>) {
  const input = event.currentTarget
  const end = input.value.length
  if (input.selectionStart === input.selectionEnd && input.selectionStart !== end) input.setSelectionRange(end, end)
}

export const CodeInput = forwardRef<HTMLInputElement, CodeInputProps>(function CodeInput(
  { value, onChange, onComplete, disabled, ...props },
  ref,
) {
  const [focused, setFocused] = useState(false)
  const invalid = props['aria-invalid']
  const active = focused ? Math.min(value.length, CODE_LENGTH - 1) : -1

  return (
    <div className={cn('relative', disabled && 'opacity-60')}>
      <div className="flex items-center gap-1.5 sm:gap-2" aria-hidden>
        {Array.from({ length: CODE_LENGTH }, (_, i) => {
          const char = value[i]
          return (
            <Fragment key={i}>
              {i === CODE_LENGTH / 2 && <span className="h-0.5 w-2 shrink-0 rounded-full bg-line-strong sm:w-3" />}
              <span
                className={cn(
                  'grid h-14 min-w-0 flex-1 place-items-center rounded-xl border bg-surface font-display text-2xl font-bold transition-[border-color,box-shadow] duration-150',
                  invalid ? 'border-danger' : char ? 'border-line-strong' : 'border-line',
                  active === i && (invalid ? 'ring-3 ring-danger/15' : 'border-accent ring-3 ring-accent/15'),
                )}
              >
                {char ?? (active === i && <span className="h-6 w-0.5 animate-pulse rounded-full bg-accent" />)}
              </span>
            </Fragment>
          )
        })}
      </div>
      <input
        ref={ref}
        {...props}
        type="text"
        name="invite-code"
        value={value}
        disabled={disabled}
        inputMode="text"
        autoCapitalize="characters"
        autoComplete="off"
        autoCorrect="off"
        spellCheck={false}
        enterKeyHint="go"
        onChange={(e) => {
          const next = normalizeCode(e.target.value)
          onChange(next)
          if (next.length === CODE_LENGTH && value.length !== CODE_LENGTH) onComplete?.(next)
        }}
        onFocus={(e) => {
          setFocused(true)
          keepCaretAtEnd(e)
        }}
        onBlur={() => setFocused(false)}
        onSelect={keepCaretAtEnd}
        className="absolute inset-0 size-full cursor-text rounded-xl bg-transparent text-base text-transparent caret-transparent outline-none selection:bg-transparent focus-visible:outline-none"
      />
    </div>
  )
})
