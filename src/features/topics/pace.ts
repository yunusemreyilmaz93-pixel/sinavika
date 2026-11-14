import { daysBetween, shiftDays } from '@/lib/dates'

export type PaceInput = {
  subjects: { id: string; name: string; topicIds: number[] }[]
  progress: { topic_id: number; status: string; updated_at: string }[]
  today: string
  examDate: string
}

export type SubjectPace = { id: string; name: string; total: number; done: number; remaining: number; doneRecent: number }

export type Pace = {
  total: number
  done: number
  remaining: number
  weeksLeft: number
  // Son 4 haftada haftada ortalama tamamlanan konu
  weeklyRate: number
  // Sınava kadar bitmesi için haftada gereken konu
  required: number
  state: 'done' | 'ahead' | 'behind' | 'stalled' | 'past'
  // Bu hızla bitişin sınav gününden kaç gün sonraya kaldığı (geride ise)
  lateDays: number | null
  subjects: SubjectPace[]
}

const WINDOW_DAYS = 28

export function computePace({ subjects, progress, today, examDate }: PaceInput): Pace {
  const doneAt = new Map<number, string>()
  for (const row of progress) if (row.status === 'done') doneAt.set(row.topic_id, row.updated_at.slice(0, 10))
  const since = shiftDays(today, -WINDOW_DAYS)

  const list: SubjectPace[] = subjects.map((s) => {
    let done = 0
    let doneRecent = 0
    for (const id of s.topicIds) {
      const at = doneAt.get(id)
      if (!at) continue
      done++
      if (at > since) doneRecent++
    }
    return { id: s.id, name: s.name, total: s.topicIds.length, done, remaining: s.topicIds.length - done, doneRecent }
  })

  const total = list.reduce((n, s) => n + s.total, 0)
  const done = list.reduce((n, s) => n + s.done, 0)
  const remaining = total - done
  const daysLeft = daysBetween(today, examDate)
  const weeksLeft = Math.max(daysLeft, 0) / 7
  const weeklyRate = list.reduce((n, s) => n + s.doneRecent, 0) / (WINDOW_DAYS / 7)
  const required = weeksLeft > 0 ? remaining / weeksLeft : remaining

  let state: Pace['state']
  let lateDays: number | null = null
  if (remaining === 0) state = 'done'
  else if (daysLeft <= 0) state = 'past'
  else if (weeklyRate === 0) state = 'stalled'
  else {
    const daysNeeded = Math.ceil((remaining / weeklyRate) * 7)
    state = daysNeeded <= daysLeft ? 'ahead' : 'behind'
    if (state === 'behind') lateDays = daysNeeded - daysLeft
  }

  return {
    total,
    done,
    remaining,
    weeksLeft,
    weeklyRate,
    required,
    state,
    lateDays,
    subjects: list.filter((s) => s.remaining > 0).sort((a, b) => b.remaining - a.remaining),
  }
}
