import type { ReactNode } from 'react'
import { Button } from '@/components/ui/button'
import { Field } from '@/components/ui/field'
import { AuthHeading } from './auth-layout'
import { CodeInput } from './code-input'

type CodeStepProps = {
  title: string
  description: string
  code: string
  onCodeChange: (code: string) => void
  onSubmit: (code: string) => void
  checking: boolean
  error: string | null
  autoFocus: boolean
  footer?: ReactNode
}

export function CodeStep({ title, description, code, onCodeChange, onSubmit, checking, error, autoFocus, footer }: CodeStepProps) {
  return (
    <>
      <AuthHeading title={title} description={description} />
      <form
        noValidate
        className="flex flex-col gap-5"
        onSubmit={(event) => {
          event.preventDefault()
          if (!checking) onSubmit(code)
        }}
      >
        <Field label="Davet kodu" error={error}>
          {(props) => (
            <CodeInput
              {...props}
              value={code}
              onChange={onCodeChange}
              onComplete={(value) => {
                if (!checking) onSubmit(value)
              }}
              autoFocus={autoFocus}
            />
          )}
        </Field>
        <Button type="submit" size="lg" className="w-full" loading={checking}>
          Devam et
        </Button>
      </form>
      {footer}
    </>
  )
}
