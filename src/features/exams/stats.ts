import { formatNet, maxQuestions, net, subjectsFor, type ExamKind, type Field, type Subject } from '@/lib/exam'
import type { Score } from './queries'

export function examMax(subjects: Subject[], kind: ExamKind, field: Field | null) {
  const total = subjectsFor(subjects, kind, field).reduce((sum, s) => sum + s.question_count, 0)
  return total || maxQuestions(kind)
}

export function round2(value: number) {
  return Math.round(value * 100) / 100
}

export function signed(value: number) {
  const v = round2(value)
  if (v === 0) return '0'
  return `${v > 0 ? '+' : '-'}${formatNet(Math.abs(v))}`
}

export function accuracy(correct: number, wrong: number) {
  const answered = correct + wrong
  return answered ? Math.round((correct / answered) * 100) : null
}

export function bySubjectOrder(subjectById: Map<string, Subject>) {
  return (a: { subject_id: string }, b: { subject_id: string }) =>
    (subjectById.get(a.subject_id)?.sort ?? 99) - (subjectById.get(b.subject_id)?.sort ?? 99)
}

export function subjectAverages(scores: Score[], kind: ExamKind, subjectById: Map<string, Subject>) {
  const groups = new Map<string, number[]>()
  for (const s of scores) {
    const list = groups.get(s.subject_id) ?? []
    list.push(net(s.correct, s.wrong, kind))
    groups.set(s.subject_id, list)
  }
  return [...groups.entries()]
    .map(([subject_id, nets]) => ({
      subject_id,
      subject: subjectById.get(subject_id),
      average: round2(nets.reduce((a, b) => a + b, 0) / nets.length),
      count: nets.length,
    }))
    .sort(bySubjectOrder(subjectById))
}
