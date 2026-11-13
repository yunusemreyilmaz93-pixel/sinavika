import { useQuery } from '@tanstack/react-query'
import { Search } from 'lucide-react'
import { useEffect, useState } from 'react'
import { Badge } from '@/components/ui/badge'
import { Input } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { supabase, unwrap } from '@/lib/supabase'

type MediaKind = 'film' | 'dizi' | 'belgesel'
type Media = { id: number; title: string; year: number | null; kind: string; origin: string; min_age: number | null }

const activities: { label: string; media?: MediaKind }[] = [
  { label: 'Film', media: 'film' },
  { label: 'Dizi', media: 'dizi' },
  { label: 'Belgesel', media: 'belgesel' },
  { label: 'Yürüyüş' },
  { label: 'Spor' },
  { label: 'Müzik' },
  { label: 'Oyun' },
  { label: 'Arkadaşlarla vakit' },
  { label: 'Ailece vakit' },
  { label: 'Hobi' },
]

function activityOf(title: string) {
  return activities.find((a) => title === a.label || title.startsWith(`${a.label}: `))
}

// Dinlenme görevi: etkinlik seçilir, film, dizi ve belgeselde katalogdan yapım seçilebilir
export function RestFields({ title, onTitle }: { title: string; onTitle: (title: string) => void }) {
  const [picked, setPicked] = useState(() => activityOf(title)?.label ?? '')
  const activity = activities.find((a) => a.label === picked)

  return (
    <div className="space-y-3">
      <fieldset>
        <legend className="mb-1.5 text-sm font-semibold">Etkinlik</legend>
        <div role="radiogroup" aria-label="Etkinlik" className="flex flex-wrap gap-2">
          {activities.map((a) => {
            const active = a.label === picked
            return (
              <button
                key={a.label}
                type="button"
                role="radio"
                aria-checked={active}
                onClick={() => {
                  setPicked(a.label)
                  onTitle(a.label)
                }}
                className={cn(
                  'h-11 rounded-full border px-4 text-sm font-semibold transition-colors',
                  active ? 'border-primary bg-primary-soft text-primary-soft-fg' : 'border-line bg-surface text-muted hover:border-line-strong hover:text-fg',
                )}
              >
                {a.label}
              </button>
            )
          })}
        </div>
      </fieldset>
      {activity?.media && (
        <MediaPicker key={activity.media} kind={activity.media} label={activity.label} title={title} onTitle={onTitle} />
      )}
    </div>
  )
}

const ageLabel = (age: number | null) => (age === null ? null : age === 0 ? 'Genel izleyici' : `${age}+`)

function useMediaSearch(kind: MediaKind, query: string) {
  const [debounced, setDebounced] = useState('')
  useEffect(() => {
    const timer = setTimeout(() => setDebounced(query.trim()), 250)
    return () => clearTimeout(timer)
  }, [query])
  return useQuery({
    queryKey: ['media-catalog', kind, debounced],
    staleTime: 10 * 60_000,
    queryFn: async (): Promise<Media[]> => unwrap(await supabase.rpc('search_catalog_media', { p_query: debounced, p_kind: kind })),
  })
}

function MediaPicker({ kind, label, title, onTitle }: { kind: MediaKind; label: string; title: string; onTitle: (title: string) => void }) {
  const [query, setQuery] = useState('')
  const results = useMediaSearch(kind, query)

  return (
    <div className="rounded-2xl border border-line p-3">
      <div className="relative">
        <Search className="pointer-events-none absolute top-1/2 left-3 size-4 -translate-y-1/2 text-subtle" aria-hidden />
        <Input
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder={`${label} ara`}
          aria-label={`${label} ara`}
          className="pl-9"
        />
      </div>
      <p className="mt-2 text-xs text-muted">Yalnızca 12 yaş ve altı için uygun yapımlar listelenir.</p>
      <ul className="mt-2 max-h-64 space-y-1 overflow-y-auto" aria-label={`${label} önerileri`}>
        {results.isPending ? (
          [0, 1, 2].map((i) => <Skeleton key={i} className="h-11" />)
        ) : results.data?.length ? (
          results.data.map((m) => {
            const value = `${label}: ${m.title}${m.year ? ` (${m.year})` : ''}`.slice(0, 140)
            const active = title === value
            const age = ageLabel(m.min_age)
            return (
              <li key={m.id}>
                <button
                  type="button"
                  onClick={() => onTitle(value)}
                  aria-pressed={active}
                  className={cn(
                    'flex min-h-11 w-full items-center gap-2 rounded-xl px-3 py-2 text-left text-sm transition-colors',
                    active ? 'bg-primary-soft text-primary-soft-fg' : 'hover:bg-surface-2',
                  )}
                >
                  <span className="min-w-0 flex-1">
                    <span className="font-semibold">{m.title}</span>
                    {m.year && <span className="text-muted"> · {m.year}</span>}
                  </span>
                  <Badge>{m.origin === 'yerli' ? 'Yerli' : 'Yabancı'}</Badge>
                  {age && <Badge tone="primary">{age}</Badge>}
                </button>
              </li>
            )
          })
        ) : (
          <li className="px-3 py-4 text-center text-sm text-muted">Sonuç yok. Başlığa kendiniz yazabilirsiniz.</li>
        )}
      </ul>
    </div>
  )
}
