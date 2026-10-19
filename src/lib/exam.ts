import type { Enums, Tables } from './supabase'

export type ExamKind = Enums<'exam_kind'>
export type Track = Enums<'exam_track'>
export type Field = Enums<'yks_field'>
export type Subject = Tables<'subjects'>
export type Topic = Tables<'topics'>

export const trackLabel: Record<Track, string> = { lgs: 'LGS', yks: 'YKS' }

export const gradeLabel: Record<number, string> = { 8: '8. sınıf', 11: '11. sınıf', 12: '12. sınıf', 13: 'Mezun' }

export const fieldLabel: Record<Field, string> = { say: 'Sayısal', ea: 'Eşit ağırlık', soz: 'Sözel', dil: 'Dil' }

export const examLabel: Record<ExamKind, string> = { LGS: 'LGS', TYT: 'TYT', AYT: 'AYT', YDT: 'YDT' }

export function studentLabel(s: { track: Track; grade: number; field: Field | null }) {
  const parts = [trackLabel[s.track], gradeLabel[s.grade]]
  if (s.field) parts.push(fieldLabel[s.field])
  return parts.join(' · ')
}

export function examKindsFor(s: { track: Track; field: Field | null }): ExamKind[] {
  if (s.track === 'lgs') return ['LGS']
  if (s.field === 'dil') return ['TYT', 'YDT']
  if (s.field) return ['TYT', 'AYT']
  return ['TYT', 'AYT', 'YDT']
}

export function subjectsFor(subjects: Subject[], kind: ExamKind, field: Field | null) {
  return subjects
    .filter((s) => s.exam === kind && (!field || !s.fields || s.fields.includes(field)))
    .sort((a, b) => a.sort - b.sort)
}

export function studentSubjects(subjects: Subject[], s: { track: Track; field: Field | null }) {
  return examKindsFor(s).flatMap((kind) => subjectsFor(subjects, kind, s.field))
}

export function wrongDivisor(kind: ExamKind) {
  return kind === 'LGS' ? 3 : 4
}

export function net(correct: number, wrong: number, kind: ExamKind) {
  return Math.round((correct - wrong / wrongDivisor(kind)) * 100) / 100
}

const netFormat = new Intl.NumberFormat('tr-TR', { minimumFractionDigits: 0, maximumFractionDigits: 2 })
export function formatNet(value: number | null | undefined) {
  return value == null ? '-' : netFormat.format(Number(value))
}

export function maxQuestions(kind: ExamKind) {
  return { LGS: 90, TYT: 120, AYT: 160, YDT: 80 }[kind]
}

export const subjectColors: Record<string, string> = {
  coral: '#e0634f',
  sea: '#3a6fe0',
  pine: '#1e9b6e',
  amber: '#d99a1e',
  teal: '#1a9aa6',
  violet: '#7c5cd6',
  lime: '#6fa52b',
  orange: '#e07b2a',
  rose: '#d2508a',
  slate: '#64748b',
}

export function subjectColor(subject: Pick<Subject, 'color'> | undefined | null) {
  return subjectColors[subject?.color ?? 'slate'] ?? subjectColors.slate
}
