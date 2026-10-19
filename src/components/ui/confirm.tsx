import { useState, type ReactNode } from 'react'
import { Button } from './button'
import { Modal } from './modal'

type Props = {
  open: boolean
  onOpenChange: (open: boolean) => void
  title: ReactNode
  description?: ReactNode
  confirmLabel: string
  tone?: 'danger' | 'primary'
  onConfirm: () => Promise<unknown> | unknown
  children?: ReactNode
  disabled?: boolean
}

export function Confirm({ open, onOpenChange, title, description, confirmLabel, tone = 'danger', onConfirm, children, disabled }: Props) {
  const [busy, setBusy] = useState(false)
  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title={title}
      description={description}
      size="sm"
      footer={
        <>
          <Button variant="secondary" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button
            variant={tone}
            loading={busy}
            disabled={disabled}
            onClick={async () => {
              setBusy(true)
              try {
                await onConfirm()
                onOpenChange(false)
              } finally {
                setBusy(false)
              }
            }}
          >
            {confirmLabel}
          </Button>
        </>
      }
    >
      {children}
    </Modal>
  )
}
