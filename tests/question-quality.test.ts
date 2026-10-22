// @vitest-environment node
import { describe, expect, it } from 'vitest'
import { parseBlocks, parseQuestion, plainText } from '../src/features/lessons/markdown/parse'
import { loadLessons } from './helpers/lessons'

type Item = { lesson: string; key: number; stem: string; solution: string; options: string[] }

// Doğru şık yerleşimi ve şık uzunluğu yanlılığı. Ayrıntı: .claude/skills/soru-yazimi/SKILL.md
const items: Item[] = loadLessons().flatMap((lesson) =>
  parseBlocks(lesson.body)
    .filter((b) => b.type === 'box' && b.name === 'soru')
    .map((b) => {
      const block = b as { text: string; attrs: Record<string, string> }
      const q = parseQuestion(block.text)
      return {
        lesson: `${lesson.subject}/${lesson.topic}`,
        key: 'ABCDE'.indexOf(block.attrs.cevap),
        stem: q.stem,
        solution: q.solution,
        options: q.options.map(plainText),
      }
    }),
)

// Öğrencinin gözüne çarpan bir uzunluk farkı: en uzun şık en az 20 karakter, ikinciden en az %20 ve 8 karakter uzun
const clearlyLongest = (item: Item) => {
  const sorted = item.options.map((o) => o.length).sort((a, b) => b - a)
  const [first, second] = sorted
  if (first < 20 || first < second * 1.2 || first - second < 8) return -1
  return item.options.findIndex((o) => o.length === first)
}

describe('soru kalitesi', () => {
  it('soru bulundu', () => expect(items.length).toBeGreaterThan(100))

  it('anlatım metninde kesme işaretinin önünde ters eğik çizgi kalmamış', () => {
    const bad = loadLessons().filter((l) => l.body.includes("\\'")).map((l) => `${l.subject} / ${l.topic}`)
    expect(bad).toEqual([])
  })

  it('doğru şık A-E arasında dengeli dağılır', () => {
    for (const count of [4, 5]) {
      const group = items.filter((i) => i.options.length === count)
      if (group.length < 30) continue
      const expected = group.length / count
      const counts = Array.from({ length: count }, (_, k) => group.filter((i) => i.key === k).length)
      const chi = counts.reduce((sum, c) => sum + (c - expected) ** 2 / expected, 0)
      // serbestlik derecesi count-1 için p=0,05 sınırı
      expect(chi, `${count} şıklı soruların doğru şık sayıları: ${counts.join(', ')}`).toBeLessThan(count === 4 ? 7.81 : 9.49)
    }
  })

  it('aynı doğru şık üst üste dörtten fazla gelmez', () => {
    let run = 0
    let previous = -1
    for (const item of items) {
      run = item.key === previous ? run + 1 : 1
      previous = item.key
      expect(run, `${item.lesson}`).toBeLessThanOrEqual(3)
    }
  })

  it('en uzun şık çoğunlukla doğru cevap değil', () => {
    const decided = items.filter((i) => clearlyLongest(i) >= 0)
    const hits = decided.filter((i) => clearlyLongest(i) === i.key).length
    expect(hits / Math.max(decided.length, 1), `belirgin en uzun şık doğru: ${hits}/${decided.length}`).toBeLessThanOrEqual(0.4)
  })

  it('hiçbir anlatımda doğru cevap çoğunlukla en uzun şık değil', () => {
    const byLesson = new Map<string, Item[]>()
    for (const item of items) byLesson.set(item.lesson, [...(byLesson.get(item.lesson) ?? []), item])
    for (const [lesson, list] of byLesson) {
      const hits = list.filter((i) => clearlyLongest(i) === i.key).length
      expect(hits, `${lesson}: ${hits}/${list.length} soruda doğru şık belirgin biçimde en uzun`).toBeLessThanOrEqual(Math.floor(list.length / 2))
    }
  })

  it('"hepsi" ya da "hiçbiri" gibi şıklar yok', () => {
    for (const item of items) {
      for (const option of item.options) expect(option, item.lesson).not.toMatch(/^(hepsi|hiçbiri|yukarıdakilerin)/i)
    }
  })

  it('kök öznel ya da zincirleme değil', () => {
    for (const item of items) {
      expect(item.stem, item.lesson).not.toMatch(/\bsizce\b|\bsence\b|\bbence\b/i)
      expect(item.stem, item.lesson).not.toMatch(/önceki soru|yukarıdaki soruda bulduğ/i)
    }
  })

  it('kökte çift olumsuzluk yok, olumsuz kök koyu yazılmış', () => {
    for (const item of items) {
      expect(item.stem, item.lesson).not.toMatch(/(olmadığı|değilse|yanlış olmadığı) söylenemez|söylenemez mi/i)
      if (/\b(değildir|yanlıştır|yoktur|söylenemez)\b\s*\??\s*$/i.test(item.stem)) {
        expect(item.stem, `${item.lesson}: olumsuz kök koyu yazılmalı`).toMatch(/\*\*[^*]*(değildir|yanlıştır|yoktur|söylenemez)[^*]*\*\*/i)
      }
    }
  })

  it('her soruda çözüm var ve her çeldirici ayrı şık', () => {
    for (const item of items) {
      expect(item.solution.length, `${item.lesson}: çözüm boş`).toBeGreaterThan(20)
      expect(new Set(item.options.map((o) => o.toLowerCase())).size, `${item.lesson}: aynı şık iki kez yazılmış`).toBe(item.options.length)
    }
  })
})
