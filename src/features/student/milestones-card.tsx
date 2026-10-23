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

export function MilestonesCard({ studentId, className }: { studentId: string; className?: string }) {
  const { data } = useMilestones(studentId)
  useNewBadgeToast(studentId, data)
  if (!data) return null
  const earned = earnedIds(data).length
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
