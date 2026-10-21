import { Coffee } from 'lucide-react'
import { cn } from '@/lib/cn'
import { SUPPORT_URL } from '@/lib/contact'

export function SupportLink({ className }: { className?: string }) {
  return (
    <a
      href={SUPPORT_URL}
      target="_blank"
      rel="noreferrer noopener"
      className={cn('flex min-h-11 items-center gap-3 rounded-xl px-3 py-2 text-sm font-semibold text-muted transition-colors hover:bg-surface-2 hover:text-fg', className)}
    >
      <Coffee className="size-5 shrink-0" aria-hidden />
      <span>
        Destek ol
        <span className="block text-xs font-normal text-subtle">Ücretsiz kalır, destek özellik açmaz</span>
      </span>
    </a>
  )
}
