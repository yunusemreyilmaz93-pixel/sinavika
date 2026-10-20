import type { LucideIcon } from 'lucide-react'
import { motion } from 'motion/react'
import type { ReactNode } from 'react'
import { Link } from 'react-router'
import { Logo } from '@/components/ui/logo'

export function AuthLayout({ children, aside }: { children: ReactNode; aside: ReactNode }) {
  return (
    <div className="min-h-dvh lg:grid lg:grid-cols-2">
      <div className="flex min-h-dvh min-w-0 flex-col overflow-x-clip px-4 pt-safe pb-safe sm:px-8">
        <header className="flex h-16 shrink-0 items-center sm:h-20">
          <Link to="/" aria-label="Yolumnet ana sayfa" className="-m-1.5 rounded-xl p-1.5">
            <Logo />
          </Link>
        </header>
        <main className="flex flex-1 justify-center pt-2 pb-8 sm:items-center sm:py-10">
          <div className="w-full max-w-md sm:rounded-2xl sm:border sm:border-line sm:bg-surface sm:p-8 sm:shadow-card">
            {children}
          </div>
        </main>
        <footer className="flex flex-wrap gap-x-5 text-sm text-subtle">
          <Link to="/kvkk" className="inline-flex min-h-11 items-center hover:text-fg">
            KVKK aydınlatma metni
          </Link>
          <Link to="/" className="inline-flex min-h-11 items-center hover:text-fg">
            Ana sayfa
          </Link>
        </footer>
      </div>
      <aside className="grid-paper hidden border-l border-line bg-surface lg:block">
        <div className="sticky top-0 flex h-dvh items-center overflow-y-auto px-12 py-12 xl:px-20">{aside}</div>
      </aside>
    </div>
  )
}

export type ValuePoint = { icon: LucideIcon; title: string; text: string }

export function ValuePanel({ title, points, footer }: { title: ReactNode; points: ValuePoint[]; footer?: ReactNode }) {
  return (
    <div className="max-w-md">
      <h2 className="text-3xl leading-tight font-extrabold xl:text-4xl">{title}</h2>
      <ul className="mt-9 space-y-6">
        {points.map(({ icon: Icon, title: pointTitle, text }, i) => (
          <motion.li
            key={pointTitle}
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.3, delay: 0.1 + i * 0.07, ease: 'easeOut' }}
            className="flex gap-4"
          >
            <span className="grid size-11 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg">
              <Icon className="size-5" />
            </span>
            <div className="pt-0.5">
              <p className="font-semibold">{pointTitle}</p>
              <p className="mt-0.5 text-[15px] leading-relaxed text-muted">{text}</p>
            </div>
          </motion.li>
        ))}
      </ul>
      {footer && <div className="mt-10 border-t border-line pt-6 text-sm text-muted">{footer}</div>}
    </div>
  )
}

export function AuthHeading({ title, description }: { title: ReactNode; description?: ReactNode }) {
  return (
    <div className="mb-6">
      <h1 className="text-2xl font-extrabold sm:text-[1.75rem]">{title}</h1>
      {description && <p className="mt-1.5 text-[15px] text-muted">{description}</p>}
    </div>
  )
}
