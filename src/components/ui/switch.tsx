import { Switch as RadixSwitch } from 'radix-ui'
import { cn } from '@/lib/cn'

export function Switch({
  checked,
  onCheckedChange,
  label,
  className,
  disabled,
}: {
  checked: boolean
  onCheckedChange: (checked: boolean) => void
  label: string
  className?: string
  disabled?: boolean
}) {
  return (
    <RadixSwitch.Root
      checked={checked}
      onCheckedChange={onCheckedChange}
      aria-label={label}
      disabled={disabled}
      className={cn(
        'relative h-7 w-12 shrink-0 cursor-pointer rounded-full bg-line-strong transition-colors data-[state=checked]:bg-primary disabled:opacity-50',
        className,
      )}
    >
      <RadixSwitch.Thumb className="block size-5 translate-x-1 rounded-full bg-white shadow transition-transform duration-200 data-[state=checked]:translate-x-6" />
    </RadixSwitch.Root>
  )
}
