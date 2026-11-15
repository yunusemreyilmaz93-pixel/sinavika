import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase, unwrap } from '@/lib/supabase'

export type Meeting = {
  id: string
  teacher_id: string
  student_id: string
  mode: 'app' | 'link'
  starts_at: string
  link: string | null
  started_at: string | null
  ended_at: string | null
  cancelled_at: string | null
}

export const MEETING_MINUTES = 40
export const EARLY_JOIN_MINUTES = 10
const START_WINDOW_MINUTES = 30
const MIN = 60_000
const columns = 'id, teacher_id, student_id, mode, starts_at, link, started_at, ended_at, cancelled_at'
const listKey = ['meetings'] as const

// RLS kime ne görüneceğini belirler: öğretmen kendi öğrencilerininkini, öğrenci kendininkini görür
export function useMeetings() {
  return useQuery({
    queryKey: listKey,
    queryFn: async (): Promise<Meeting[]> =>
      unwrap(
        await supabase
          .from('meetings')
          .select(columns)
          .gte('starts_at', new Date(Date.now() - 60 * 24 * 60 * MIN).toISOString())
          .order('starts_at', { ascending: true })
          .limit(200),
      ) as Meeting[],
    refetchInterval: 60_000,
  })
}

export function useMeeting(id: string) {
  return useQuery({
    queryKey: ['meeting', id],
    queryFn: async () => unwrap(await supabase.from('meetings').select(columns).eq('id', id).maybeSingle()) as Meeting | null,
  })
}

export type MeetingDraft = {
  studentId: string
  mode: 'app' | 'link'
  startsAt: string
  link: string | null
}

export function useCreateMeeting() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (d: MeetingDraft) =>
      unwrap(
        await supabase.from('meetings').insert({
          student_id: d.studentId,
          mode: d.mode,
          starts_at: d.startsAt,
          link: d.mode === 'link' ? d.link : null,
        }),
      ),
    onSuccess: () => qc.invalidateQueries({ queryKey: listKey }),
  })
}

export function useCancelMeeting() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (id: string) =>
      unwrap(await supabase.from('meetings').update({ cancelled_at: new Date().toISOString() }).eq('id', id)),
    onSuccess: () => qc.invalidateQueries({ queryKey: listKey }),
  })
}

export type MeetingPhase = 'upcoming' | 'open' | 'live' | 'done' | 'missed' | 'cancelled'

// Listede ve odada aynı kural: uygulama içi görüşme 10 dk önce açılır, başlamazsa 30 dk sonra kapanır, başlarsa 40 dk sürer
export function phaseOf(m: Meeting, now = Date.now()): MeetingPhase {
  if (m.cancelled_at) return 'cancelled'
  const starts = Date.parse(m.starts_at)
  if (m.mode === 'link') {
    if (now < starts - EARLY_JOIN_MINUTES * MIN) return 'upcoming'
    return now < starts + 2 * 60 * MIN ? 'open' : 'done'
  }
  if (m.ended_at) return m.started_at ? 'done' : 'missed'
  if (m.started_at) return now < Date.parse(m.started_at) + MEETING_MINUTES * MIN ? 'live' : 'done'
  if (now < starts - EARLY_JOIN_MINUTES * MIN) return 'upcoming'
  return now < starts + START_WINDOW_MINUTES * MIN ? 'open' : 'missed'
}

export function durationMinutes(m: Meeting) {
  if (!m.started_at) return null
  const end = m.ended_at ? Date.parse(m.ended_at) : Math.min(Date.now(), Date.parse(m.started_at) + MEETING_MINUTES * MIN)
  return Math.max(1, Math.round((end - Date.parse(m.started_at)) / MIN))
}
