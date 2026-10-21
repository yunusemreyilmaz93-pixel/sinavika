import { net, type ExamKind } from '@/lib/exam'

export type Status = 'correct' | 'wrong' | 'blank' | 'nokey'
export type Item = { number: number; key: string | null; answer: string | null; status: Status }

// Boş bırakılan soru işaretleri. Boşluk işaret değildir, yapıştırılan metindeki aralıklar yok sayılır
const BLANK = /[-_.·*•]/

export const choices = (kind: ExamKind) => (kind === 'LGS' ? 'ABCD' : 'ABCDE')

export function normalizeKey(text: string, kind: ExamKind, max: number) {
  const allowed = choices(kind)
  return [...text.toUpperCase()]
    .filter((c) => allowed.includes(c))
    .slice(0, max)
    .join('')
}

export function normalizeAnswers(text: string, kind: ExamKind, max: number) {
  const allowed = choices(kind)
  return [...text.toUpperCase()]
    .map((c) => (allowed.includes(c) ? c : BLANK.test(c) ? '-' : ''))
    .filter(Boolean)
    .slice(0, max)
    .join('')
}

export function evaluate(key: string, answers: string, count: number, kind: ExamKind) {
  const items: Item[] = Array.from({ length: count }, (_, i) => {
    const k = key[i] ?? null
    const a = answers[i] && answers[i] !== '-' ? answers[i] : null
    const status: Status = a === null ? 'blank' : k === null ? 'nokey' : a === k ? 'correct' : 'wrong'
    return { number: i + 1, key: k, answer: a, status }
  })
  const c = items.filter((x) => x.status === 'correct').length
  const w = items.filter((x) => x.status === 'wrong').length
  return {
    items,
    correct: c,
    wrong: w,
    blank: count - c - w,
    net: net(c, w, kind),
    filled: key.length > 0 || answers.length > 0,
    // Cevabı olup anahtarı olmayan soru değerlendirilemez
    missingKey: items.filter((x) => x.status === 'nokey').length,
  }
}
