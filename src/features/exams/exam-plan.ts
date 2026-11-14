import { shiftDays } from '@/lib/dates'
import type { TaskKind } from '@/features/plan/lib'

export type PlanTopic = { id: number; name: string; subjectId: string; misses: number }
export type PlanSubject = { id: string; name: string; loss: number }

export type PlanDraft = {
  key: string
  due_on: string
  title: string
  kind: TaskKind
  subject_id: string
  topic_id: number | null
  target_questions: number | null
  target_minutes: number | null
}

const MAX_TOPICS = 6
const PER_DAY = 2
const DAYS = 6

// Denemeden haftalık plan taslağı: en çok takılınan konular için önce konu tekrarı, ertesi gün soru çözümü.
// Konu analizi yoksa en çok net kaybedilen derslerden karışık soru görevi çıkar. Görevler 6 güne, günde en fazla 2 olacak şekilde yayılır.
export function planFromExam({ topics, subjects, start }: { topics: PlanTopic[]; subjects: PlanSubject[]; start: string }): PlanDraft[] {
  const chosen = [...topics].filter((t) => t.misses > 0).sort((a, b) => b.misses - a.misses).slice(0, MAX_TOPICS)
  const pairs: Omit<PlanDraft, 'key' | 'due_on'>[][] = chosen.length
    ? chosen.map((t) => [
        { title: `${t.name} · Konu tekrarı`, kind: 'review', subject_id: t.subjectId, topic_id: t.id, target_questions: null, target_minutes: 40 },
        {
          title: `${t.name} · ${t.misses >= 3 ? 30 : 20} soru`,
          kind: 'questions',
          subject_id: t.subjectId,
          topic_id: t.id,
          target_questions: t.misses >= 3 ? 30 : 20,
          target_minutes: null,
        },
      ])
    : [...subjects]
        .filter((s) => s.loss > 0)
        .sort((a, b) => b.loss - a.loss)
        .slice(0, 3)
        .map((s) => [
          { title: `${s.name} · Karışık 30 soru`, kind: 'questions', subject_id: s.id, topic_id: null, target_questions: 30, target_minutes: null },
          { title: `${s.name} · Yanlışların tekrarı`, kind: 'review', subject_id: s.id, topic_id: null, target_questions: null, target_minutes: 30 },
        ])

  const load = new Array<number>(DAYS).fill(0)
  const firstFree = (from: number) => {
    for (let d = from; d < DAYS; d++) if (load[d] < PER_DAY) return d
    for (let d = 0; d < DAYS; d++) if (load[d] < PER_DAY) return d
    return load.indexOf(Math.min(...load))
  }
  const out: PlanDraft[] = []
  pairs.forEach((pair, i) => {
    let day = firstFree(i % DAYS)
    pair.forEach((task, j) => {
      if (j > 0) day = firstFree(Math.min(day + 1, DAYS - 1))
      load[day]++
      out.push({ ...task, key: `${i}-${j}`, due_on: shiftDays(start, day) })
    })
  })
  return out.sort((a, b) => a.due_on.localeCompare(b.due_on) || a.key.localeCompare(b.key))
}
