import { useQuery } from '@tanstack/react-query'
import { masteryOf, type MasteryLevel } from '@/features/topics/mastery'
import type { TopicState } from '@/features/topics/status'
import { daysBetween, todayISO } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'

export type ClassSignals = {
  progress: { student_id: string; topic_id: number; status: TopicState; updated_at: string }[]
  logs: { student_id: string; topic_id: number | null; correct: number; wrong: number; blank: number }[]
  wrong: { student_id: string; topic_id: number | null; learned_at: string | null; next_review_on: string }[]
}

const PAGE = 1000

async function paged<T>(fetch: (from: number, to: number) => PromiseLike<{ data: T[] | null; error: unknown }>) {
  const out: T[] = []
  for (let from = 0; ; from += PAGE) {
    const rows = unwrap((await fetch(from, from + PAGE - 1)) as never) as T[]
    out.push(...rows)
    if (rows.length < PAGE) return out
  }
}

export function useClassSignals(studentIds: string[]) {
  return useQuery({
    queryKey: ['class-map', studentIds.join(',')],
    enabled: studentIds.length > 0,
    queryFn: async (): Promise<ClassSignals> => {
      const [progress, logs, wrong] = await Promise.all([
        paged((a, b) => supabase.from('topic_progress').select('student_id, topic_id, status, updated_at').in('student_id', studentIds).order('topic_id').range(a, b)),
        paged((a, b) =>
          supabase
            .from('question_logs')
            .select('student_id, topic_id, correct, wrong, blank')
            .in('student_id', studentIds)
            .not('topic_id', 'is', null)
            .order('id')
            .range(a, b),
        ),
        paged((a, b) =>
          supabase
            .from('wrong_questions')
            .select('student_id, topic_id, learned_at, next_review_on')
            .in('student_id', studentIds)
            .is('learned_at', null)
            .order('id')
            .range(a, b),
        ),
      ])
      return { progress, logs, wrong } as ClassSignals
    },
  })
}

// Öğrenci ve konu başına hakimiyet düzeyi
export function masteryGrid(signals: ClassSignals, today = todayISO()) {
  type Acc = { status: TopicState; updated: string | null; correct: number; total: number; open: number; due: number }
  const cells = new Map<string, Acc>()
  const at = (s: string, t: number) => {
    const key = `${s}:${t}`
    let cell = cells.get(key)
    if (!cell) cells.set(key, (cell = { status: 'none', updated: null, correct: 0, total: 0, open: 0, due: 0 }))
    return cell
  }
  for (const p of signals.progress) Object.assign(at(p.student_id, p.topic_id), { status: p.status, updated: p.updated_at.slice(0, 10) })
  for (const l of signals.logs) {
    if (l.topic_id == null) continue
    const c = at(l.student_id, l.topic_id)
    c.correct += l.correct
    c.total += l.correct + l.wrong + l.blank
  }
  for (const w of signals.wrong) {
    if (w.topic_id == null || w.learned_at) continue
    const c = at(w.student_id, w.topic_id)
    c.open++
    if (w.next_review_on <= today) c.due++
  }
  const levels = new Map<string, MasteryLevel>()
  for (const [key, c] of cells) {
    levels.set(
      key,
      masteryOf({
        status: c.status,
        correct: c.correct,
        total: c.total,
        openWrong: c.open,
        dueWrong: c.due,
        daysSinceUpdate: c.updated ? daysBetween(c.updated, today) : null,
      }).level,
    )
  }
  return (studentId: string, topicId: number): MasteryLevel => levels.get(`${studentId}:${topicId}`) ?? 'none'
}

export type Candidate = { topicId: number; studentIds: string[] }

// Birden çok öğrencide tekrar gereken konular: toplu anlatım için
export function groupCandidates(
  level: (studentId: string, topicId: number) => MasteryLevel,
  studentIds: string[],
  topicIds: number[],
  min = 2,
): Candidate[] {
  return topicIds
    .map((topicId) => ({ topicId, studentIds: studentIds.filter((s) => level(s, topicId) === 'review') }))
    .filter((c) => c.studentIds.length >= min)
    .sort((a, b) => b.studentIds.length - a.studentIds.length || a.topicId - b.topicId)
}
