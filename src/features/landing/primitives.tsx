import { motion } from 'motion/react'
import type { MouseEvent, ReactNode } from 'react'
import { useAuth } from '@/features/auth/session'
import { cn } from '@/lib/cn'

export const container = 'mx-auto w-full max-w-6xl px-4 sm:px-6 lg:px-8'
export const ease = [0.22, 1, 0.36, 1] as const

export type Role = 'teacher' | 'student' | 'parent'
export type SectionLink = { label: string; href: `#${string}`; role?: Role }

export const sectionLinks: SectionLink[] = [
  { label: 'Nasıl çalışır', href: '#nasil-calisir' },
  { label: 'Öğretmenler', href: '#ogretmenler', role: 'teacher' },
  { label: 'Öğrenciler', href: '#ogrenciler', role: 'student' },
  { label: 'Veliler', href: '#veliler', role: 'parent' },
  { label: 'SSS', href: '#sss' },
]

export function useSignedIn() {
  const { ready, session, profile } = useAuth()
  return ready ? Boolean(profile) : Boolean(session)
}

export function scrollToHash(href: string) {
  const el = document.getElementById(href.slice(1))
  if (!el) return
  const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches
  el.scrollIntoView({ behavior: reduce ? 'auto' : 'smooth', block: 'start' })
  window.history.replaceState(window.history.state, '', href)
}

export function isPlainClick(e: MouseEvent) {
  return e.button === 0 && !e.metaKey && !e.ctrlKey && !e.shiftKey && !e.altKey
}

export function Reveal({ children, className, delay = 0 }: { children: ReactNode; className?: string; delay?: number }) {
  return (
    <motion.div
      className={className}
      initial={{ opacity: 0, y: 18 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, amount: 0.2 }}
      transition={{ duration: 0.4, ease, delay }}
    >
      {children}
    </motion.div>
  )
}

export function Eyebrow({ children, className }: { children: ReactNode; className?: string }) {
  return (
    <p className={cn('inline-flex items-center gap-2.5 text-sm font-bold text-primary', className)}>
      <span aria-hidden className="h-0.5 w-6 rounded-full bg-primary/50" />
      {children}
    </p>
  )
}

export function SectionHeading({
  eyebrow,
  title,
  lead,
  className,
  center,
}: {
  eyebrow: ReactNode
  title: ReactNode
  lead?: ReactNode
  className?: string
  center?: boolean
}) {
  return (
    <Reveal className={cn('max-w-2xl', center && 'mx-auto text-center', className)}>
      <Eyebrow>{eyebrow}</Eyebrow>
      <h2 className="mt-3 text-[1.85rem] leading-[1.12] font-extrabold sm:text-[2.5rem]">{title}</h2>
      {lead && <p className="mt-4 text-[17px] leading-relaxed text-muted">{lead}</p>}
    </Reveal>
  )
}
