import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { Bug, ChevronDown, Trash2 } from 'lucide-react'
import { useMemo, useState } from 'react'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { EmptyState } from '@/components/ui/empty-state'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { formatRelative } from '@/lib/dates'
import { errorMessage, supabase, unwrap, type Tables } from '@/lib/supabase'
import { LoadError } from './ui'

type ErrorRow = Tables<'client_errors'>
type Group = { key: string; message: string; shown: string | null; rows: ErrorRow[]; users: number; last: string }

const roleLabel = { teacher: 'Öğretmen', student: 'Öğrenci', parent: 'Veli' } as const

function useErrors() {
  return useQuery({
    queryKey: ['admin', 'errors'],
    queryFn: async () =>
      unwrap(await supabase.from('client_errors').select('*').order('created_at', { ascending: false }).limit(300)),
  })
}

function group(rows: ErrorRow[]): Group[] {
  const map = new Map<string, Group>()
  for (const r of rows) {
    const key = r.message
    const g = map.get(key) ?? { key, message: r.message, shown: r.shown, rows: [], users: 0, last: r.created_at }
    g.rows.push(r)
    map.set(key, g)
  }
  for (const g of map.values()) g.users = new Set(g.rows.map((r) => r.user_id ?? 'anon')).size
  return [...map.values()].sort((a, b) => b.last.localeCompare(a.last))
}

export function ErrorsSection() {
  const errors = useErrors()
  const qc = useQueryClient()
  const [open, setOpen] = useState<string | null>(null)
  const [clearing, setClearing] = useState(false)
  const groups = useMemo(() => group(errors.data ?? []), [errors.data])

  const clear = useMutation({
    mutationFn: async () => unwrap(await supabase.from('client_errors').delete().gte('id', 0)),
    onSuccess: async () => {
      await qc.invalidateQueries({ queryKey: ['admin', 'errors'] })
      toast.success('Hata kayıtları temizlendi')
    },
    onError: (error) => toast.error(errorMessage(error)),
  })

  if (errors.isPending) {
    return (
      <div className="space-y-2" aria-busy="true">
        <Skeleton className="h-16" />
        <Skeleton className="h-16" />
      </div>
    )
  }
  if (errors.isError) return <LoadError error={errors.error} onRetry={() => void errors.refetch()} />

  if (!groups.length) {
    return (
      <EmptyState
        icon={Bug}
        title="Kayıtlı hata yok"
        description="Kullanıcılar uygulamada bir hatayla karşılaşınca burada görünür. Kayıtlar 30 gün saklanır."
      />
    )
  }

  return (
    <div className="space-y-3">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-muted">
          Son 30 günde {errors.data.length} hata, {groups.length} farklı türde. Kullanıcıya gösterilen mesaj ve teknik ayrıntı
          birlikte görünür.
        </p>
        <Button variant="ghost" className="text-danger hover:bg-danger-soft" onClick={() => setClearing(true)}>
          <Trash2 />
          Temizle
        </Button>
      </div>
      <ul className="space-y-2">
        {groups.map((g) => {
          const expanded = open === g.key
          const latest = g.rows[0]
          return (
            <li key={g.key}>
              <Card className="overflow-hidden">
                <button
                  type="button"
                  aria-expanded={expanded}
                  onClick={() => setOpen(expanded ? null : g.key)}
                  className="flex w-full items-start gap-3 p-4 text-left"
                >
                  <span className="min-w-0 flex-1">
                    <span className="block font-semibold break-words">{g.shown ?? g.message}</span>
                    <span className="mt-0.5 block truncate font-mono text-xs text-muted">{g.message}</span>
                    <span className="mt-2 flex flex-wrap items-center gap-2 text-xs text-muted">
                      <Badge tone={g.rows.length > 5 ? 'danger' : 'neutral'}>{g.rows.length} kez</Badge>
                      <span>{g.users} kişi</span>
                      <span>Son: {formatRelative(g.last)}</span>
                      {latest.path && <span className="font-mono">{latest.path}</span>}
                    </span>
                  </span>
                  <ChevronDown
                    className={cn('mt-1 size-4 shrink-0 text-subtle transition-transform', expanded && 'rotate-180')}
                  />
                </button>
                {expanded && (
                  <ul className="divide-y divide-line border-t border-line text-sm">
                    {g.rows.slice(0, 10).map((r) => (
                      <li key={r.id} className="space-y-1 px-4 py-3">
                        <p className="flex flex-wrap gap-x-3 gap-y-1 text-xs text-muted">
                          <span>{formatRelative(r.created_at)}</span>
                          <span>{r.role ? roleLabel[r.role] : 'Giriş yapmamış'}</span>
                          {r.path && <span className="font-mono">{r.path}</span>}
                          {r.version && <span className="font-mono">Sürüm {r.version}</span>}
                        </p>
                        {r.user_agent && <p className="truncate text-xs text-subtle">{r.user_agent}</p>}
                        {r.detail && (
                          <pre className="max-h-40 overflow-auto rounded-lg bg-surface-2 p-2 font-mono text-[11px] leading-relaxed whitespace-pre-wrap">
                            {r.detail}
                          </pre>
                        )}
                      </li>
                    ))}
                  </ul>
                )}
              </Card>
            </li>
          )
        })}
      </ul>
      <Confirm
        open={clearing}
        onOpenChange={setClearing}
        title="Bütün hata kayıtları silinsin mi?"
        description="Sorunları düzelttikten sonra temizlersen yeni gelen hataları daha kolay görürsün."
        confirmLabel="Temizle"
        onConfirm={() => clear.mutateAsync()}
      />
    </div>
  )
}
