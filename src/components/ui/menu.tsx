import { DropdownMenu } from 'radix-ui'
import type { ReactNode } from 'react'
import { cn } from '@/lib/cn'

export const Menu = DropdownMenu.Root
export const MenuTrigger = DropdownMenu.Trigger

export function MenuContent({ children, align = 'end', className }: { children: ReactNode; align?: 'start' | 'end' | 'center'; className?: string }) {
  return (
    <DropdownMenu.Portal>
      <DropdownMenu.Content
        align={align}
        sideOffset={6}
        className={cn(
          'z-50 min-w-48 rounded-xl border border-line bg-surface p-1 shadow-pop data-[state=closed]:animate-pop-out data-[state=open]:animate-pop-in',
          className,
        )}
      >
        {children}
      </DropdownMenu.Content>
    </DropdownMenu.Portal>
  )
}

export function MenuItem({
  children,
  onSelect,
  tone = 'default',
}: {
  children: ReactNode
  onSelect?: (event: Event) => void
  tone?: 'default' | 'danger'
}) {
  return (
    <DropdownMenu.Item
      onSelect={onSelect}
      className={cn(
        'flex h-10 cursor-pointer items-center gap-2.5 rounded-lg px-3 text-sm font-medium outline-none select-none data-[highlighted]:bg-surface-2 [&_svg]:size-4 [&_svg]:text-muted',
        tone === 'danger' && 'text-danger [&_svg]:text-danger',
      )}
    >
      {children}
    </DropdownMenu.Item>
  )
}

export function MenuSeparator() {
  return <DropdownMenu.Separator className="my-1 h-px bg-line" />
}

export function MenuLabel({ children }: { children: ReactNode }) {
  return <DropdownMenu.Label className="px-3 py-2 text-xs font-semibold text-muted">{children}</DropdownMenu.Label>
}
