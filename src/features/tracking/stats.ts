import { useQuery, type QueryClient } from '@tanstack/react-query'
import { useMemo } from 'react'
import { keys } from '@/lib/data'
import { shiftDays, todayISO, weekStartISO } from '@/lib/dates'
import { supabase, unwrap, type Tables } from '@/lib/supabase'

export type SessionRow = Pick<
  Tables<'study_sessions'>,
  'id' | 'subject_id' | 'topic_id' | 'minutes' | 'studied_on' | 'source' | 'created_at'
>
export type LogRow = Pick<
  Tables<'question_logs'>,
  'id' | 'subject_id' | 'topic_id' | 'correct' | 'wrong' | 'blank' | 'solved_on' | 'created_at'
>

export type DayStat = { minutes: number; questions: number; correct: number; wrong: number; blank: number }

export type SubjectStat = {
  subjectId: string
  minutes: number
  questions: number
  correct: number
  wrong: number
  blank: number
  accuracy: number | null
}

export type StudyActivity = {
  from: string
  today: string
  days: string[]
  sessions: SessionRow[]
  logs: LogRow[]
  byDay: Map<string, DayStat>
  streak: number
  todayMinutes: number
  todayQuestions: number
  weekMinutes: number
  weekQuestions: number
  bySubject: SubjectStat[]
  isEmpty: boolean
}

export type PeriodSummary = {
  from: string
  days: string[]
  minutes: number
  questions: number
  correct: number
  wrong: number
  blank: number
  accuracy: number | null
  activeDays: number
  bySubject: SubjectStat[]
}

const PAGE = 1000
const SESSION_COLUMNS = 'id, subject_id, topic_id, minutes, studied_on, source, created_at'
const LOG_COLUMNS = 'id, subject_id, topic_id, correct, wrong, blank, solved_on, created_at'

async function fetchSessions(studentId: string, from: string) {
  const rows: SessionRow[] = []
  for (let offset = 0; ; offset += PAGE) {
    const page = unwrap(
      await supabase
        .from('study_sessions')
        .select(SESSION_COLUMNS)
        .eq('student_id', studentId)
        .gte('studied_on', from)
        .order('studied_on')
        .order('id')
        .range(offset, offset + PAGE - 1),
    )
    rows.push(...page)
    if (page.length < PAGE) return rows
  }
}

async function fetchLogs(studentId: string, from: string) {
  const rows: LogRow[] = []
  for (let offset = 0; ; offset += PAGE) {
    const page = unwrap(
      await supabase
        .from('question_logs')
        .select(LOG_COLUMNS)
        .eq('student_id', studentId)
        .gte('solved_on', from)
        .order('solved_on')
        .order('id')
        .range(offset, offset + PAGE - 1),
    )
    rows.push(...page)
    if (page.length < PAGE) return rows
  }
}

export function emptyDay(): DayStat {
  return { minutes: 0, questions: 0, correct: 0, wrong: 0, blank: 0 }
}

export function isActive(day: DayStat | undefined) {
  return !!day && (day.minutes > 0 || day.questions > 0)
}

export function dateRange(from: string, to: string) {
  const out: string[] = []
  for (let d = from; d <= to; d = shiftDays(d, 1)) out.push(d)
  return out
}

export function accuracyOf(correct: number, total: number) {
  return total > 0 ? correct / total : null
}

export function subjectStats(sessions: SessionRow[], logs: LogRow[], from = '0000-01-01'): SubjectStat[] {
  const map = new Map<string, SubjectStat>()
  const get = (id: string) => {
    let s = map.get(id)
    if (!s) {
      s = { subjectId: id, minutes: 0, questions: 0, correct: 0, wrong: 0, blank: 0, accuracy: null }
      map.set(id, s)
    }
    return s
  }
  for (const row of sessions) {
    if (!row.subject_id || row.studied_on < from) continue
    get(row.subject_id).minutes += row.minutes
  }
  for (const row of logs) {
    if (row.solved_on < from) continue
    const s = get(row.subject_id)
    s.correct += row.correct
    s.wrong += row.wrong
    s.blank += row.blank
    s.questions += row.correct + row.wrong + row.blank
  }
  for (const s of map.values()) s.accuracy = accuracyOf(s.correct, s.questions)
  return [...map.values()].sort((a, b) => b.questions - a.questions || b.minutes - a.minutes)
}

export function computeStreak(byDay: Map<string, DayStat>, today: string, from: string) {
  let day = isActive(byDay.get(today)) ? today : shiftDays(today, -1)
  let streak = 0
  while (day >= from && isActive(byDay.get(day))) {
    streak += 1
    day = shiftDays(day, -1)
  }
  return streak
}

export function buildActivity(sessions: SessionRow[], logs: LogRow[], today: string, days: number): StudyActivity {
  const from = shiftDays(today, -(days - 1))
  const byDay = new Map<string, DayStat>()
  const day = (iso: string) => {
    let d = byDay.get(iso)
    if (!d) {
      d = emptyDay()
      byDay.set(iso, d)
    }
    return d
  }
  for (const row of sessions) day(row.studied_on).minutes += row.minutes
  for (const row of logs) {
    const d = day(row.solved_on)
    d.correct += row.correct
    d.wrong += row.wrong
    d.blank += row.blank
    d.questions += row.correct + row.wrong + row.blank
  }

  const weekStart = weekStartISO(today)
  let weekMinutes = 0
  let weekQuestions = 0
  for (const [iso, d] of byDay) {
    if (iso < weekStart || iso > today) continue
    weekMinutes += d.minutes
    weekQuestions += d.questions
  }
  const todayStat = byDay.get(today) ?? emptyDay()

  return {
    from,
    today,
    days: dateRange(from, today),
    sessions,
    logs,
    byDay,
    streak: computeStreak(byDay, today, from),
    todayMinutes: todayStat.minutes,
    todayQuestions: todayStat.questions,
    weekMinutes,
    weekQuestions,
    bySubject: subjectStats(sessions, logs),
    isEmpty: sessions.length === 0 && logs.length === 0,
  }
}

export function summarize(activity: StudyActivity, periodDays: number): PeriodSummary {
  const from = shiftDays(activity.today, -(periodDays - 1))
  const days = activity.days.filter((d) => d >= from)
  const total = emptyDay()
  let activeDays = 0
  for (const iso of days) {
    const d = activity.byDay.get(iso)
    if (!d) continue
    total.minutes += d.minutes
    total.questions += d.questions
    total.correct += d.correct
    total.wrong += d.wrong
    total.blank += d.blank
    if (isActive(d)) activeDays += 1
  }
  return {
    from,
    days,
    ...total,
    accuracy: accuracyOf(total.correct, total.questions),
    activeDays,
    bySubject: subjectStats(activity.sessions, activity.logs, from),
  }
}

export function useStudyActivity(studentId: string, days = 90) {
  const today = todayISO()
  const from = shiftDays(today, -(days - 1))
  const sessions = useQuery({
    queryKey: [...keys.sessions(studentId), 'since', from],
    queryFn: () => fetchSessions(studentId, from),
    enabled: Boolean(studentId),
  })
  const logs = useQuery({
    queryKey: [...keys.questions(studentId), 'since', from],
    queryFn: () => fetchLogs(studentId, from),
    enabled: Boolean(studentId),
  })
  const data = useMemo(
    () => (sessions.data && logs.data ? buildActivity(sessions.data, logs.data, today, days) : undefined),
    [sessions.data, logs.data, today, days],
  )
  return {
    data,
    isPending: sessions.isPending || logs.isPending,
    isError: sessions.isError || logs.isError,
    error: sessions.error ?? logs.error,
    refetch: () => Promise.all([sessions.refetch(), logs.refetch()]),
  }
}

export function invalidateActivity(queryClient: QueryClient, studentId: string) {
  void queryClient.invalidateQueries({ queryKey: keys.sessions(studentId) })
  void queryClient.invalidateQueries({ queryKey: keys.questions(studentId) })
  void queryClient.invalidateQueries({ queryKey: ['activity', studentId] })
  void queryClient.invalidateQueries({ queryKey: keys.overview })
}

const numberFormat = new Intl.NumberFormat('tr-TR')
const percentFormat = new Intl.NumberFormat('tr-TR', { style: 'percent', maximumFractionDigits: 0 })

export function formatCount(value: number) {
  return numberFormat.format(value)
}

export function formatPercent(value: number | null) {
  return value == null ? '-' : percentFormat.format(value)
}
