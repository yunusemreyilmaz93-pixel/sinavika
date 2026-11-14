import { Flame, Lock } from 'lucide-react'
import { useEffect } from 'react'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Card, CardHeader } from '@/components/ui/card'
import { cn } from '@/lib/cn'
import { badges, badgeState, earnedIds, useMilestones, type Milestones } from './milestones'

const seenKey = (studentId: string) => `sinavika-badges-${studentId}`

function readSeen(studentId: string): string[] | null {
  try {
    const raw = localStorage.getItem(seenKey(studentId))
    return raw ? (JSON.parse(raw) as string[]) : null
  } catch {
    return null
  }
}

// İlk açılışta mevcut rozetler sessizce işaretlenir, sonradan kazanılanlar için bir kez bildirim çıkar
function useNewBadgeToast(studentId: string, m: Milestones | undefined) {
  useEffect(() => {
    if (!m) return
    const earned = earnedIds(m)
    const seen = readSeen(studentId)
    if (seen) {
      const fresh = badges.filter((b) => earned.includes(b.id) && !seen.includes(b.id))
      if (fresh.length) toast.success(`Yeni rozet: ${fresh.map((b) => b.title).join(', ')}`)
    }
    try {
      localStorage.setItem(seenKey(studentId), JSON.stringify(earned))
    } catch {
      /* depolama kapalı */
    }
  }, [studentId, m])
}

export function StreakChip({ studentId }: { studentId: string }) {
  const { data } = useMilestones(studentId)
  if (!data || data.streak < 2) return null
  return (
    <Badge tone="marker" className="py-1 text-[13px]">
      <Flame aria-hidden />
      {data.streak} gün üst üste
    </Badge>
  )
}

export function MilestonesCard({ studentId, className, compact }: { studentId: string; className?: string; compact?: boolean }) {
  const { data } = useMilestones(studentId)
  useNewBadgeToast(studentId, data)
  if (!data) return null
  const earned = earnedIds(data).length
  if (compact) {
    const states = badges.map((b) => ({ b, ...badgeState(b, data) }))
    const won = states.filter((x) => x.earned)
    const next = states.filter((x) => !x.earned).sort((a, b) => b.value / b.b.goal - a.value / a.b.goal)[0]
    return (
      <Card className={className}>
        <CardHeader title="Rozetler" action={<span className="tabular text-sm text-muted">{earned} / {badges.length}</span>} />
        <div className="space-y-4 p-4 sm:p-5">
          {won.length > 0 && (
            <ul className="flex flex-wrap gap-2" aria-label="Kazanılan rozetler">
              {won.map(({ b }) => (
                <li key={b.id} title={b.title} className="grid size-11 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg">
                  <b.icon aria-hidden className="size-5" />
                  <span className="sr-only">{b.title}</span>
                </li>
              ))}
            </ul>
          )}
          {next && (
            <div className="rounded-2xl bg-bg p-3">
              <div className="flex items-center gap-3">
                <span aria-hidden className="grid size-10 shrink-0 place-items-center rounded-xl bg-surface text-subtle">
                  <next.b.icon className="size-5" />
                </span>
                <div className="min-w-0 flex-1">
                  <p className="text-xs text-muted">Sıradaki rozet</p>
                  <p className="truncate font-semibold">{next.b.title}</p>
                </div>
                <span className="tabular text-sm font-semibold">
                  {next.value}/{next.b.goal}
                </span>
              </div>
              <div className="mt-2.5 h-1.5 rounded-full bg-surface-2">
                <div className="h-1.5 rounded-full bg-primary" style={{ width: `${(next.value / next.b.goal) * 100}%` }} />
              </div>
              <p className="mt-2 text-xs text-muted">{next.b.hint}</p>
            </div>
          )}
        </div>
      </Card>
    )
  }
  return (
    <Card className={className}>
      <CardHeader title="Rozetler" description={`${earned} / ${badges.length} kazanıldı`} />
      <ul className="grid grid-cols-2 gap-2.5 p-4 sm:grid-cols-3 sm:p-5">
        {badges.map((b) => {
          const state = badgeState(b, data)
          const Icon = b.icon
          return (
            <li
              key={b.id}
              className={cn(
                'flex items-center gap-2.5 rounded-xl border p-2.5',
                state.earned ? 'border-primary/30 bg-primary-soft/50' : 'border-line bg-surface-2/50',
              )}
            >
              <span
                aria-hidden
                className={cn(
                  'grid size-10 shrink-0 place-items-center rounded-full',
                  state.earned ? 'bg-primary text-primary-fg ring-2 ring-marker ring-offset-2 ring-offset-surface' : 'bg-surface text-subtle',
                )}
              >
                {state.earned ? <Icon className="size-5" /> : <Lock className="size-4" />}
              </span>
              <span className="min-w-0">
                <span className={cn('block truncate text-[13px] leading-tight font-bold', !state.earned && 'text-muted')}>{b.title}</span>
                <span className="tabular block truncate text-xs text-muted">
                  {state.earned ? 'Kazanıldı' : `${state.value} / ${b.goal}`}
                </span>
              </span>
              <span className="sr-only">{state.earned ? 'Kazanıldı' : b.hint}</span>
            </li>
          )
        })}
      </ul>
    </Card>
  )
}
