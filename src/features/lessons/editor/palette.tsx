import { Search } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Modal } from '@/components/ui/modal'
import { Input } from '@/components/ui/field'
import { fold } from '@/lib/text'
import { catalog, type CatalogItem } from './catalog'

export function Palette({ open, onOpenChange, onPick }: { open: boolean; onOpenChange: (open: boolean) => void; onPick: (item: CatalogItem) => void }) {
  const [query, setQuery] = useState('')
  const items = useMemo(() => {
    const q = fold(query.trim())
    return q ? catalog.filter((c) => fold(`${c.label} ${c.hint} ${c.keywords ?? ''}`).includes(q)) : catalog
  }, [query])

  const pick = (item: CatalogItem) => {
    setQuery('')
    onPick(item)
  }

  return (
    <Modal
      open={open}
      onOpenChange={(o) => {
        if (!o) setQuery('')
        onOpenChange(o)
      }}
      title="Blok ekle"
      size="lg"
    >
      <div className="relative mb-3">
        <Search className="pointer-events-none absolute top-1/2 left-3.5 size-4 -translate-y-1/2 text-muted" />
        <Input
          autoFocus
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === 'Enter' && items[0]) pick(items[0])
          }}
          placeholder="Ara: soru, video, tablo"
          aria-label="Blok ara"
          className="pl-10"
        />
      </div>
      {items.length === 0 ? (
        <p className="py-6 text-center text-sm text-muted">Eşleşen blok yok.</p>
      ) : (
        <ul className="grid gap-2 sm:grid-cols-2">
          {items.map((item) => (
            <li key={item.id}>
              <button
                type="button"
                onClick={() => pick(item)}
                className="flex min-h-14 w-full items-center gap-3 rounded-xl border border-line px-3 py-2 text-left hover:border-line-strong hover:bg-surface-2"
              >
                <span className="grid size-10 shrink-0 place-items-center rounded-lg bg-primary-soft text-primary-soft-fg">
                  <item.icon className="size-5" />
                </span>
                <span className="min-w-0">
                  <span className="block text-[15px] font-semibold">{item.label}</span>
                  <span className="block text-sm leading-snug text-muted">{item.hint}</span>
                </span>
              </button>
            </li>
          ))}
        </ul>
      )}
    </Modal>
  )
}
