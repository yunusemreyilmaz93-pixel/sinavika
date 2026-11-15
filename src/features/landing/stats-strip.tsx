import { useQuery } from '@tanstack/react-query'
import { isConfigured, supabase, unwrap } from '@/lib/supabase'
import { container } from './primitives'

type Stats = { lessons: number; questions: number; tests: number; programs: number }

const items: { key: keyof Stats; label: string; href: string }[] = [
  { key: 'lessons', label: 'konu anlatımı', href: '/konu-anlatimi' },
  { key: 'questions', label: 'çözümlü test sorusu', href: '/kaynaklar' },
  { key: 'tests', label: 'konu testi', href: '/kaynaklar' },
  { key: 'programs', label: 'üniversite programı', href: '/yks-bolumleri' },
]

// Sayılar veritabanından gelir. Okunamazsa şerit hiç görünmez
export function StatsStrip() {
  const stats = useQuery({
    queryKey: ['public-stats'],
    enabled: isConfigured,
    staleTime: 60 * 60_000,
    queryFn: async () => unwrap(await supabase.rpc('public_stats')) as unknown as Stats,
  })
  const data = stats.data
  if (!data || items.some((i) => !Number.isFinite(data[i.key]) || data[i.key] <= 0)) return null

  return (
    <section aria-label="Rakamlarla İzlek" className="border-y border-line bg-surface">
      <dl className={`${container} grid grid-cols-2 divide-line lg:grid-cols-4 lg:divide-x`}>
        {items.map((i) => (
          <div key={i.key} className="flex flex-col px-2 py-5 text-center sm:py-6">
            <dt className="text-sm text-muted">
              <a href={i.href} className="hover:text-fg hover:underline">
                {i.label}
              </a>
            </dt>
            <dd className="tabular -order-1 font-display text-3xl font-extrabold sm:text-4xl">{data[i.key].toLocaleString('tr-TR')}</dd>
          </div>
        ))}
      </dl>
    </section>
  )
}
