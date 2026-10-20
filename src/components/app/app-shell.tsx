import { AnimatePresence, motion } from 'motion/react'
import { Check, ChevronsUpDown, LogOut, Menu as MenuIcon, Monitor, Moon, Plus, Settings, Sun } from 'lucide-react'
import { Suspense, useState } from 'react'
import { Link, NavLink, Outlet, useLocation, useNavigate } from 'react-router'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { LogoMark, Logo } from '@/components/ui/logo'
import { Menu, MenuContent, MenuItem, MenuLabel, MenuSeparator, MenuTrigger } from '@/components/ui/menu'
import { Modal } from '@/components/ui/modal'
import { PageSkeleton } from '@/components/ui/skeleton'
import { useAuth, useProfile, type Profile } from '@/features/auth/session'
import { NotificationBell } from '@/features/notifications/bell'
import { QuickAddSheet } from '@/features/tracking/quick-add'
import { PendingApproval } from '@/features/auth/pending-approval'
import { cn } from '@/lib/cn'
import { useTheme, type ThemeChoice } from '@/lib/theme'
import { navFor, type NavItem } from './nav'

const roleLabel: Record<Profile['role'], string> = { teacher: 'Öğretmen', student: 'Öğrenci', parent: 'Veli' }

export function AppShell() {
  const profile = useProfile()
  const location = useLocation()
  const [quickAdd, setQuickAdd] = useState(false)
  const items = navFor(profile)
  const isStudent = profile.role === 'student'
  const pending = profile.role === 'teacher' && profile.status !== 'active' && location.pathname !== '/app/ayarlar'

  return (
    <div className="min-h-dvh lg:grid lg:grid-cols-[248px_1fr]">
      <aside className="sticky top-0 hidden h-dvh flex-col border-r border-line bg-surface lg:flex">
        <Link to="/" aria-label="Sınavika ana sayfa" className="flex h-16 items-center px-5">
          <Logo />
        </Link>
        {isStudent && (
          <div className="px-3 pb-2">
            <Button className="w-full" onClick={() => setQuickAdd(true)}>
              <Plus />
              Kayıt ekle
            </Button>
          </div>
        )}
        <nav className="flex-1 space-y-0.5 overflow-y-auto px-3 py-2" aria-label="Ana menü">
          {items.map((item) => (
            <SideLink key={item.to} item={item} />
          ))}
        </nav>
        <div className="border-t border-line p-3">
          <UserMenu profile={profile} wide />
        </div>
      </aside>

      <div className="flex min-w-0 flex-col">
        <header className="pt-safe sticky top-0 z-30 border-b border-line bg-bg/85 backdrop-blur-md">
          <div className="mx-auto flex h-14 max-w-5xl items-center gap-2 px-4 sm:px-6 lg:h-16">
            <Link to="/" className="-ml-1.5 grid size-11 place-items-center rounded-xl lg:hidden" aria-label="Sınavika ana sayfa">
              <LogoMark />
            </Link>
            <ChildSwitcher />
            <div className="ml-auto flex items-center gap-1">
              <NotificationBell />
              <div className="lg:hidden">
                <UserMenu profile={profile} />
              </div>
            </div>
          </div>
        </header>

        <main className="mx-auto w-full max-w-5xl flex-1 px-4 pt-5 pb-32 sm:px-6 sm:pt-8 lg:pb-12">
          <AnimatePresence mode="wait" initial={false}>
            <motion.div
              key={location.pathname}
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -4 }}
              transition={{ duration: 0.18, ease: 'easeOut' }}
            >
              {pending ? (
                <PendingApproval />
              ) : (
                <Suspense fallback={<PageSkeleton />}>
                  <Outlet />
                </Suspense>
              )}
            </motion.div>
          </AnimatePresence>
        </main>
      </div>

      <BottomNav items={items} onQuickAdd={isStudent ? () => setQuickAdd(true) : undefined} />
      {isStudent && <QuickAddSheet open={quickAdd} onOpenChange={setQuickAdd} />}
    </div>
  )
}

function SideLink({ item }: { item: NavItem }) {
  const Icon = item.icon
  return (
    <NavLink
      to={item.to}
      end={item.end}
      className={({ isActive }) =>
        cn(
          'relative flex h-10 items-center gap-3 rounded-xl px-3 text-[15px] font-semibold transition-colors',
          isActive ? 'text-primary-soft-fg' : 'text-muted hover:bg-surface-2 hover:text-fg',
        )
      }
    >
      {({ isActive }) => (
        <>
          {isActive && (
            <motion.span
              layoutId="side-active"
              className="absolute inset-0 rounded-xl bg-primary-soft"
              transition={{ type: 'spring', bounce: 0.15, duration: 0.4 }}
            />
          )}
          <Icon className="relative size-[18px]" />
          <span className="relative">{item.label}</span>
        </>
      )}
    </NavLink>
  )
}

function BottomNav({ items, onQuickAdd }: { items: NavItem[]; onQuickAdd?: () => void }) {
  const [more, setMore] = useState(false)
  const navigate = useNavigate()
  const primary = items.filter((i) => i.mobile)
  const rest = items.filter((i) => !i.mobile)
  const slots: (NavItem | 'add')[] = onQuickAdd ? [primary[0], primary[1], 'add', ...primary.slice(2)] : primary

  return (
    <>
      <nav
        aria-label="Alt menü"
        className="pb-safe fixed inset-x-0 bottom-0 z-40 border-t border-line bg-surface/95 backdrop-blur-md lg:hidden"
      >
        <div className="mx-auto flex h-16 max-w-lg items-stretch px-1">
          {slots.map((slot) =>
            slot === 'add' ? (
              <div key="add" className="flex flex-1 items-center justify-center">
                <button
                  type="button"
                  onClick={onQuickAdd}
                  aria-label="Kayıt ekle"
                  className="grid size-13 -translate-y-3 place-items-center rounded-2xl bg-primary text-primary-fg shadow-pop transition-transform active:scale-95"
                >
                  <Plus className="size-7" strokeWidth={2.5} />
                </button>
              </div>
            ) : (
              <BottomLink key={slot.to} item={slot} />
            ),
          )}
          <button
            type="button"
            onClick={() => setMore(true)}
            className="flex flex-1 flex-col items-center justify-center gap-1 text-[11px] font-semibold text-muted"
          >
            <MenuIcon className="size-[22px]" />
            Menü
          </button>
        </div>
      </nav>
      <Modal open={more} onOpenChange={setMore} title="Menü">
        <div className="grid grid-cols-3 gap-2">
          {rest.map((item) => {
            const Icon = item.icon
            return (
              <button
                key={item.to}
                type="button"
                onClick={() => {
                  setMore(false)
                  navigate(item.to)
                }}
                className="flex flex-col items-center gap-2 rounded-2xl border border-line bg-bg px-2 py-4 text-sm font-semibold transition-colors active:bg-surface-2"
              >
                <Icon className="size-6 text-primary" />
                {item.label}
              </button>
            )
          })}
        </div>
      </Modal>
    </>
  )
}

function BottomLink({ item }: { item: NavItem }) {
  const Icon = item.icon
  return (
    <NavLink
      to={item.to}
      end={item.end}
      className={({ isActive }) =>
        cn(
          'relative flex flex-1 flex-col items-center justify-center gap-1 text-[11px] font-semibold transition-colors',
          isActive ? 'text-primary' : 'text-muted',
        )
      }
    >
      {({ isActive }) => (
        <>
          {isActive && (
            <motion.span
              layoutId="bottom-active"
              className="absolute top-0 h-0.5 w-8 rounded-full bg-primary"
              transition={{ type: 'spring', bounce: 0.2, duration: 0.4 }}
            />
          )}
          <Icon className="size-[22px]" strokeWidth={isActive ? 2.4 : 2} />
          {item.label}
        </>
      )}
    </NavLink>
  )
}

const themeOptions: { value: ThemeChoice; label: string; icon: typeof Sun }[] = [
  { value: 'system', label: 'Sistem', icon: Monitor },
  { value: 'light', label: 'Açık', icon: Sun },
  { value: 'dark', label: 'Koyu', icon: Moon },
]

function UserMenu({ profile, wide }: { profile: Profile; wide?: boolean }) {
  const { signOut } = useAuth()
  const navigate = useNavigate()
  const [theme, setTheme] = useTheme()
  return (
    <Menu>
      <MenuTrigger asChild>
        {wide ? (
          <button type="button" className="flex w-full items-center gap-3 rounded-xl p-2 text-left hover:bg-surface-2">
            <Avatar name={profile.full_name} className="size-9" />
            <span className="min-w-0 flex-1">
              <span className="block truncate text-sm font-semibold">{profile.full_name}</span>
              <span className="block text-xs text-muted">{profile.is_admin ? 'Yönetici' : roleLabel[profile.role]}</span>
            </span>
            <ChevronsUpDown className="size-4 text-muted" />
          </button>
        ) : (
          <button type="button" aria-label="Hesap menüsü" className="rounded-full p-1">
            <Avatar name={profile.full_name} className="size-8 text-xs" />
          </button>
        )}
      </MenuTrigger>
      <MenuContent align={wide ? 'start' : 'end'}>
        <MenuLabel>{profile.full_name}</MenuLabel>
        <MenuItem onSelect={() => navigate('/app/ayarlar')}>
          <Settings />
          Ayarlar
        </MenuItem>
        <MenuSeparator />
        <MenuLabel>Tema</MenuLabel>
        {themeOptions.map((o) => (
          <MenuItem key={o.value} onSelect={() => setTheme(o.value)}>
            <o.icon />
            {o.label}
            {theme === o.value && <Check className="ml-auto !text-primary" />}
          </MenuItem>
        ))}
        <MenuSeparator />
        <MenuItem tone="danger" onSelect={() => void signOut()}>
          <LogOut />
          Çıkış yap
        </MenuItem>
      </MenuContent>
    </Menu>
  )
}

function ChildSwitcher() {
  const { profile, children, activeChild, setActiveChild } = useAuth()
  if (profile?.role !== 'parent' || !activeChild) return null
  if (children.length < 2) {
    return <span className="truncate text-sm font-semibold lg:text-base">{activeChild.full_name}</span>
  }
  return (
    <Menu>
      <MenuTrigger asChild>
        <button type="button" className="flex min-w-0 items-center gap-1.5 rounded-lg px-2 py-1.5 text-sm font-semibold hover:bg-surface-2 lg:text-base">
          <span className="truncate">{activeChild.full_name}</span>
          <ChevronsUpDown className="size-4 shrink-0 text-muted" />
        </button>
      </MenuTrigger>
      <MenuContent align="start">
        <MenuLabel>Çocuğunu seç</MenuLabel>
        {children.map((c) => (
          <MenuItem key={c.id} onSelect={() => setActiveChild(c.id)}>
            {c.full_name}
            {c.id === activeChild.id && <Check className="ml-auto !text-primary" />}
          </MenuItem>
        ))}
      </MenuContent>
    </Menu>
  )
}
