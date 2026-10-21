import type { TopicState } from './status'

export type MasteryLevel = 'none' | 'learning' | 'solid' | 'mastered' | 'review'

export type TopicSignals = {
  status: TopicState
  correct: number
  total: number
  openWrong: number
  dueWrong: number
  daysSinceUpdate: number | null
}

export type Mastery = { level: MasteryLevel; reasons: string[]; priority: number }

const percent = new Intl.NumberFormat('tr-TR', { style: 'percent', maximumFractionDigits: 0 })

export const levelLabel: Record<MasteryLevel, string> = {
  mastered: 'Hakim',
  solid: 'Pekişiyor',
  learning: 'Öğreniyor',
  review: 'Tekrar lazım',
  none: 'Başlanmadı',
}

export function masteryOf(s: TopicSignals): Mastery {
  const accuracy = s.total > 0 ? s.correct / s.total : null
  const reasons: string[] = []
  let priority = 0

  if (s.status === 'review') {
    reasons.push('Tekrar lazım olarak işaretli')
    priority += 3
  }
  if (accuracy !== null && s.total >= 5 && accuracy < 0.6) {
    reasons.push(`Doğruluk ${percent.format(accuracy)} (${s.total} soru)`)
    priority += 3 + (0.6 - accuracy)
  }
  if (s.dueWrong >= 2) {
    reasons.push(`${s.dueWrong} yanlış soru tekrar bekliyor`)
    priority += Math.min(s.dueWrong, 5)
  }
  if (priority > 0) return { level: 'review', reasons, priority }

  if (s.status === 'done' && s.daysSinceUpdate !== null && s.daysSinceUpdate >= 30) {
    return { level: 'solid', reasons: ['Konuya en son 30 günden önce dokundun'], priority: 1 }
  }
  if (s.status === 'done' && s.total >= 10 && accuracy !== null && accuracy >= 0.75 && s.openWrong === 0) {
    return { level: 'mastered', reasons: [], priority: 0 }
  }
  if (s.status === 'done' || (accuracy !== null && s.total >= 10 && accuracy >= 0.75)) {
    return { level: 'solid', reasons: [], priority: 0 }
  }
  if (s.status === 'learning' || s.total > 0 || s.openWrong > 0) return { level: 'learning', reasons: [], priority: 0 }
  return { level: 'none', reasons: [], priority: 0 }
}
