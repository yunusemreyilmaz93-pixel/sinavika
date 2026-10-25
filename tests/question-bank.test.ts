// @vitest-environment node
import { describe, expect, it } from 'vitest'
import { loadQuestionSets, type BankQuestion } from './helpers/question-sets'

const sets = loadQuestionSets()
const questions = sets.flatMap((s) => s.questions.map((q) => ({ ...q, where: `${s.exam}/${s.label}/${q.position}` })))
const plain = (s: string) => s.replace(/\$[^$]*\$/g, '').replace(/`[^`]*`/g, '')
const length = (o: string) => o.replace(/\$/g, '').replace(/\\[a-z]+/g, 'x').length

const clearlyLongest = (q: BankQuestion) => {
  const sorted = q.options.map(length).sort((a, b) => b - a)
  const [first, second] = sorted
  if (first < 20 || first < second * 1.2 || first - second < 8) return -1
  return q.options.findIndex((o) => length(o) === first)
}

describe('soru bankası', () => {
  it('setler okunur', () => {
    for (const s of sets) expect(s.questions.length, `${s.label}: soru okunamadı`).toBeGreaterThan(0)
  })

  it('şık sayısı sınava uygun, cevap şıkların içinde, sıra numaraları ardışık', () => {
    const count: Record<string, number> = { LGS: 4, TYT: 5, AYT: 5, YDT: 5 }
    for (const s of sets) {
      s.questions.forEach((q, i) => {
        expect(q.position, `${s.label}`).toBe(i + 1)
        expect(q.options.length, `${s.label}/${q.position}: şık sayısı`).toBe(count[s.exam.toUpperCase()])
        expect(q.correct).toBeLessThan(q.options.length)
        expect(new Set(q.options.map((o) => o.toLowerCase())).size, `${s.label}/${q.position}: aynı şık iki kez`).toBe(q.options.length)
      })
    }
  })

  it('metin kuralları: noktalı virgül, uzun tire, hepsi/hiçbiri yok, çözüm yeterince uzun', () => {
    for (const q of questions) {
      const text = [q.stem, ...q.options, q.explanation].map(plain).join('\n')
      expect(text, q.where).not.toMatch(/[;–—]/)
      for (const o of q.options) expect(o, q.where).not.toMatch(/^(hepsi|hiçbiri|yukarıdakilerin)/i)
      expect(q.explanation.length, q.where).toBeGreaterThan(20)
    }
  })

  it('olumsuz kök koyu yazılmış', () => {
    for (const q of questions) {
      if (/\b(değildir|yanlıştır|yoktur|söylenemez)\b\s*\??\s*$/i.test(q.stem.trim())) expect(q.stem, q.where).toMatch(/\*\*[^*]*(değildir|yanlıştır|yoktur|söylenemez)[^*]*\*\*/i)
    }
  })

  it('her setin doğru şık dağılımı dengeli, aynı harf üst üste dörtten fazla gelmez', () => {
    for (const s of sets) {
      const n = s.questions[0].options.length
      if (s.questions.length >= 8) {
        const counts = Array.from({ length: n }, (_, k) => s.questions.filter((q) => q.correct === k).length)
        const expected = s.questions.length / n
        expect(Math.max(...counts) - Math.min(...counts), `${s.label}: ${counts.join(', ')}`).toBeLessThanOrEqual(Math.ceil(expected * 0.8))
      }
      let run = 0
      let prev = -1
      for (const q of s.questions) {
        run = q.correct === prev ? run + 1 : 1
        prev = q.correct
        expect(run, `${s.label}/${q.position}`).toBeLessThanOrEqual(3)
      }
    }
  })

  it('doğru şık çoğunlukla en uzun şık değil', () => {
    const decided = questions.filter((q) => clearlyLongest(q) >= 0)
    const hits = decided.filter((q) => clearlyLongest(q) === q.correct).length
    expect(hits / Math.max(decided.length, 1), `${hits}/${decided.length}`).toBeLessThanOrEqual(0.4)
    for (const s of sets) {
      const own = s.questions.filter((q) => clearlyLongest(q) === q.correct).length
      expect(own, `${s.label}: ${own}/${s.questions.length} soruda doğru şık en uzun`).toBeLessThanOrEqual(Math.floor(s.questions.length / 2))
    }
  })
})
