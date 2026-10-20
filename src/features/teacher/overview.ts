import { useQuery } from '@tanstack/react-query'
import { keys } from '@/lib/data'
import { daysBetween, fromISO, todayISO } from '@/lib/dates'
import { formatNet, type ExamKind, type Field, type Track } from '@/lib/exam'
import { supabase, unwrap } from '@/lib/supabase'

export type OverviewRow = {
  id: string
  full_name: string
  username: string | null
  track: Track
  grade: number
  field: Field | null
  target: string | null
  archived_at: string | null
  last_seen_at: string | null
  last_activity_on: string | null
  minutes_7d: number
  questions_7d: number
  tasks_week: number
  tasks_week_done: number
  tasks_overdue: number
  last_exam_kind: ExamKind | null
  last_net: number | null
  prev_net: number | null
  parent_count: number
}

export type RiskLevel = 'ok' | 'watch' | 'risk'
export type RiskSignals = { level: RiskLevel; reasons: string[] }

const toNumber = (value: unknown) => (value == null ? null : Number(value))

export function useTeacherOverview() {
  return useQuery({
    queryKey: keys.overview,
    queryFn: async (): Promise<OverviewRow[]> => {
      const rows = unwrap(await supabase.rpc('teacher_overview')) as unknown as OverviewRow[]
      return rows.map((r) => ({ ...r, last_net: toNumber(r.last_net), prev_net: toNumber(r.prev_net) }))
    },
  })
}

function isoWeekday(iso: string) {
  return ((fromISO(iso).getDay() + 6) % 7) + 1
}

export function riskSignals(
  row: Pick<
    OverviewRow,
    'archived_at' | 'last_activity_on' | 'tasks_overdue' | 'tasks_week' | 'tasks_week_done' | 'last_net' | 'prev_net'
  >,
  today = todayISO(),
): RiskSignals {
  if (row.archived_at) return { level: 'ok', reasons: [] }
  const reasons: string[] = []
  let severe = false

  if (!row.last_activity_on) {
    reasons.push('Henüz kayıt yok')
  } else {
    const idle = daysBetween(row.last_activity_on, today)
    if (idle >= 3) reasons.push(`${idle} gündür kayıt yok`)
    if (idle >= 5) severe = true
  }

  if (row.tasks_overdue >= 3) reasons.push(`${row.tasks_overdue} gecikmiş görev`)

  if (row.tasks_week > 0 && isoWeekday(today) >= 3 && row.tasks_week_done / row.tasks_week < 0.5) {
    reasons.push(`Bu hafta ${row.tasks_week_done}/${row.tasks_week} görev tamam`)
  }

  if (row.last_net != null && row.prev_net != null) {
    const drop = Math.round((Number(row.prev_net) - Number(row.last_net)) * 100) / 100
    if (drop >= 3) reasons.push(`Net ${formatNet(drop)} düştü`)
  }

  const level: RiskLevel = severe || reasons.length >= 2 ? 'risk' : reasons.length ? 'watch' : 'ok'
  return { level, reasons }
}

const levelRank: Record<RiskLevel, number> = { risk: 0, watch: 1, ok: 2 }

export type RankedStudent = OverviewRow & { signals: RiskSignals }

export function rankByAttention(rows: OverviewRow[], today = todayISO()): RankedStudent[] {
  return rows
    .map((row) => ({ ...row, signals: riskSignals(row, today) }))
    .sort(
      (a, b) =>
        levelRank[a.signals.level] - levelRank[b.signals.level] ||
        b.signals.reasons.length - a.signals.reasons.length ||
        a.full_name.localeCompare(b.full_name, 'tr'),
    )
}
