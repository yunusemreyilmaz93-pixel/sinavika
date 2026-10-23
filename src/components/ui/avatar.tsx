import { useState } from 'react'
import { cn } from '@/lib/cn'
import { useAvatars } from '@/lib/avatars'

const palette = [
  'bg-primary-soft text-primary-soft-fg',
  'bg-accent-soft text-accent-soft-fg',
  'bg-warning-soft text-warning',
  'bg-danger-soft text-danger',
  'bg-surface-2 text-fg',
]

export function initials(name: string) {
  return name
    .trim()
    .split(/\s+/)
    .slice(0, 2)
    .map((p) => p[0]?.toLocaleUpperCase('tr'))
    .join('')
}

type Props = { name: string; userId?: string; src?: string | null; className?: string }

export function Avatar({ userId, src, ...props }: Props) {
  return userId && src === undefined ? <UserAvatar userId={userId} {...props} /> : <Face src={src} {...props} />
}

function UserAvatar({ userId, ...props }: Omit<Props, 'src'> & { userId: string }) {
  const avatars = useAvatars()
  return <Face src={avatars.data?.get(userId)} {...props} />
}

function Face({ name, src, className }: Omit<Props, 'userId'>) {
  const [failed, setFailed] = useState<string | null>(null)
  let hash = 0
  for (const ch of name) hash = (hash * 31 + ch.charCodeAt(0)) >>> 0
  const showImage = Boolean(src) && failed !== src
  return (
    <span
      aria-hidden
      className={cn(
        'inline-grid size-10 shrink-0 place-items-center overflow-hidden rounded-full font-display text-sm font-bold',
        !showImage && palette[hash % palette.length],
        className,
      )}
    >
      {showImage ? (
        <img src={src!} alt="" loading="lazy" decoding="async" className="size-full object-cover" onError={() => setFailed(src ?? null)} />
      ) : (
        initials(name)
      )}
    </span>
  )
}
