import { BookOpenText, CornerDownLeft, Search, UserRound } from 'lucide-react'
import { useEffect, useMemo, useRef, useState, type ReactNode } from 'react'
import { useNavigate } from 'react-router'
import { Modal } from '@/components/ui/modal'
import { useProfile } from '@/features/auth/session'
import { useTeacherOverview } from '@/features/teacher/overview'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { navFor } from './nav'

type Result = { key: string; label: string; hint: string; to: string; icon: ReactNode }

const fold = (s: string) => s.toLocaleLowerCase('tr').normalize('NFD').replace(/[̀-ͯ]/g, '').replace(/ı/g, 'i')

// Sayfalar, konular ve öğretmen için öğrenciler arasında arama. Ctrl K ya da / ile açılır
export function SearchPalette({ open, onOpenChange }: { open: boolean; onOpenChange: (open: boolean) => void }) {
  const profile = useProfile()
  const navigate = useNavigate()
  const curriculum = useCurriculum()
  const teacher = profile.role === 'teacher'
  const overview = useTeacherOverview(teacher)
  const [query, setQuery] = useState('')
  const [active, setActive] = useState(0)
  const listRef = useRef<HTMLUListElement>(null)

  const all = useMemo<Result[]>(() => {
    const pages = navFor(profile).map((i) => ({ key: `p:${i.to}`, label: i.label, hint: 'Sayfa', to: i.to, icon: <i.icon className="size-4" /> }))
    const students = teacher
      ? (overview.data ?? []).filter((s) => !s.archived_at).map((s) => ({ key: `s:${s.id}`, label: s.full_name, hint: 'Öğrenci', to: `/app/ogrenciler/${s.id}`, icon: <UserRound className="size-4" /> }))
      : []
    const topics = (curriculum.data?.topics ?? []).map((t) => ({
      key: `t:${t.id}`,
      label: t.name,
      hint: curriculum.data?.subjectById.get(t.subject_id)?.name ?? 'Konu',
      to: `/app/konular/${t.id}`,
      icon: <BookOpenText className="size-4" />,
    }))
    return [...pages, ...students, ...topics]
  }, [profile, teacher, overview.data, curriculum.data])

  const results = useMemo(() => {
    const q = fold(query.trim())
    if (!q) return all.filter((r) => r.hint === 'Sayfa' || r.hint === 'Öğrenci').slice(0, 12)
    return all.filter((r) => fold(r.label).includes(q) || fold(r.hint).includes(q)).slice(0, 30)
  }, [all, query])

  function go(r: Result | undefined) {
    if (!r) return
    onOpenChange(false)
    setQuery('')
    navigate(r.to)
  }

  useEffect(() => {
    listRef.current?.querySelector(`[data-index="${active}"]`)?.scrollIntoView({ block: 'nearest' })
  }, [active])

  return (
    <Modal
      open={open}
      onOpenChange={(o) => {
        if (!o) setQuery('')
        onOpenChange(o)
      }}
      title="Ara"
      size="md"
    >
      <div className="flex h-12 items-center gap-2 rounded-xl border border-line-strong bg-bg px-3">
        <Search className="size-5 text-muted" />
        <input
          autoFocus
          value={query}
          onChange={(e) => {
            setQuery(e.target.value)
            setActive(0)
          }}
          onKeyDown={(e) => {
            if (e.key === 'ArrowDown') {
              e.preventDefault()
              setActive((i) => Math.min(i + 1, results.length - 1))
            } else if (e.key === 'ArrowUp') {
              e.preventDefault()
              setActive((i) => Math.max(i - 1, 0))
            } else if (e.key === 'Enter') {
              e.preventDefault()
              go(results[active])
            }
          }}
          placeholder={teacher ? 'Öğrenci, konu ya da sayfa' : 'Konu ya da sayfa'}
          aria-label="Arama"
          className="h-full flex-1 bg-transparent text-base outline-none placeholder:text-subtle"
        />
      </div>
      <ul ref={listRef} className="mt-3 max-h-[55vh] space-y-0.5 overflow-y-auto" role="listbox" aria-label="Sonuçlar">
        {results.length === 0 && <li className="px-3 py-6 text-center text-sm text-muted">Sonuç yok</li>}
        {results.map((r, i) => (
          <li key={r.key} data-index={i} role="option" aria-selected={i === active}>
            <button
              type="button"
              onMouseEnter={() => setActive(i)}
              onClick={() => go(r)}
              className={cn('flex min-h-11 w-full items-center gap-3 rounded-xl px-3 text-left', i === active ? 'bg-primary-soft text-primary-soft-fg' : 'hover:bg-surface-2')}
            >
              <span className="grid size-8 shrink-0 place-items-center rounded-lg bg-surface-2 text-muted">{r.icon}</span>
              <span className="min-w-0 flex-1 truncate font-semibold">{r.label}</span>
              <span className="shrink-0 text-xs text-muted">{r.hint}</span>
              {i === active && <CornerDownLeft className="size-4 shrink-0" />}
            </button>
          </li>
        ))}
      </ul>
    </Modal>
  )
}

export function useSearchShortcut(setOpen: (open: boolean) => void) {
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      const target = e.target as HTMLElement | null
      const typing = target && (target.tagName === 'INPUT' || target.tagName === 'TEXTAREA' || target.isContentEditable)
      if ((e.key === 'k' || e.key === 'K') && (e.ctrlKey || e.metaKey)) {
        e.preventDefault()
        setOpen(true)
      } else if (e.key === '/' && !typing) {
        e.preventDefault()
        setOpen(true)
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [setOpen])
}
