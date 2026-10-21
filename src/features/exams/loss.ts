import { wrongDivisor, type ExamKind } from '@/lib/exam'
import type { Score } from './queries'

export type SubjectLoss = { subject_id: string; wrongLoss: number; blankLoss: number; total: number }

// Mükemmel netten ne kadar uzak kalındığı: boş ve girilmeyen soru 1 net, yanlış 1 + ceza kadar net götürür.
export function lossOf(scores: Score[], kind: ExamKind, questionCount: (subjectId: string) => number | undefined) {
  const divisor = wrongDivisor(kind)
  const rows: SubjectLoss[] = scores.map((s) => {
    const entered = s.correct + s.wrong + s.blank
    const unentered = Math.max(0, (questionCount(s.subject_id) ?? entered) - entered)
    const wrongLoss = s.wrong * (1 + 1 / divisor)
    const blankLoss = s.blank + unentered
    return { subject_id: s.subject_id, wrongLoss, blankLoss, total: wrongLoss + blankLoss }
  })
  const wrongLoss = rows.reduce((sum, r) => sum + r.wrongLoss, 0)
  const blankLoss = rows.reduce((sum, r) => sum + r.blankLoss, 0)
  return { total: wrongLoss + blankLoss, wrongLoss, blankLoss, rows: rows.sort((a, b) => b.total - a.total) }
}
