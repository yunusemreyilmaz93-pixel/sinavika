import { Search } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Button } from '@/components/ui/button'
import { Input, Select } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { errorMessage } from '@/lib/supabase'
import { useUniversities, useUniversityPrograms } from './queries'

const norm = (s: string) => s.toLocaleLowerCase('tr-TR')

export function ProgramPicker({
  open,
  onOpenChange,
  scoreType,
  saving,
  onPick,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  scoreType: string | null
  saving: boolean
  onPick: (code: number) => void
}) {
  const universities = useUniversities()
  const [universityId, setUniversityId] = useState<number | null>(null)
  const [query, setQuery] = useState('')
  const [uniQuery, setUniQuery] = useState('')
  const [all, setAll] = useState(scoreType === null)
  const programs = useUniversityPrograms(universityId)

  const unis = useMemo(() => {
    const q = norm(uniQuery.trim())
    return (universities.data ?? []).filter((u) => u.id === universityId || !q || norm(`${u.short_name} ${u.city ?? ''}`).includes(q))
  }, [universities.data, uniQuery, universityId])

  const rows = useMemo(() => {
    const q = norm(query.trim())
    return (programs.data ?? []).filter((p) => (all || p.score_type === scoreType) && (!q || norm(p.name).includes(q)))
  }, [programs.data, query, all, scoreType])

  return (
    <Modal open={open} onOpenChange={onOpenChange} title="Hedef bölüm" size="md">
      <div className="space-y-3">
        {(universities.data?.length ?? 0) > 40 && (
          <Input
            aria-label="Üniversite ara"
            placeholder="Üniversite ya da şehir ara"
            value={uniQuery}
            onChange={(e) => setUniQuery(e.target.value)}
          />
        )}
        <Select
          aria-label="Üniversite"
          value={universityId ?? ''}
          onChange={(e) => setUniversityId(e.target.value ? Number(e.target.value) : null)}
        >
          <option value="">Üniversite seçin</option>
          {unis.map((u) => (
            <option key={u.id} value={u.id}>
              {u.short_name} {u.kind === 'vakif' ? '(Vakıf)' : ''}
            </option>
          ))}
        </Select>
        {universities.error && <p className="text-sm text-danger">{errorMessage(universities.error)}</p>}

        {universityId !== null && (
          <>
            {scoreType && (
              <Segmented
                size="sm"
                options={[
                  { value: 'tur', label: scoreType },
                  { value: 'all', label: 'Tümü' },
                ]}
                value={all ? 'all' : 'tur'}
                onChange={(v) => setAll(v === 'all')}
                className="max-w-[200px]"
              />
            )}
            <div className="relative">
              <Search className="pointer-events-none absolute top-1/2 left-3 size-4 -translate-y-1/2 text-muted" />
              <Input
                aria-label="Bölüm ara"
                placeholder="Bölüm ara"
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                className="pl-9"
              />
            </div>
            {programs.isPending ? (
              <div className="space-y-2" aria-busy="true">
                <Skeleton className="h-12" />
                <Skeleton className="h-12" />
                <Skeleton className="h-12" />
              </div>
            ) : programs.error ? (
              <p className="text-sm text-danger">{errorMessage(programs.error)}</p>
            ) : rows.length === 0 ? (
              <p className="py-4 text-center text-sm text-muted">Bölüm bulunamadı</p>
            ) : (
              <ul className="max-h-[50vh] divide-y divide-line overflow-y-auto rounded-xl border border-line">
                {rows.map((p) => (
                  <li key={p.code}>
                    <Button
                      variant="ghost"
                      disabled={saving}
                      onClick={() => onPick(p.code)}
                      className="h-auto min-h-11 w-full flex-col items-start justify-center gap-0 rounded-none py-2 text-left whitespace-normal"
                    >
                      <span className="text-sm font-semibold">{p.name}</span>
                      <span className="text-xs font-normal text-muted">
                        {p.score_type}
                        {p.scholarship ? ` · ${p.scholarship}` : ''}
                      </span>
                    </Button>
                  </li>
                ))}
              </ul>
            )}
          </>
        )}
      </div>
    </Modal>
  )
}
