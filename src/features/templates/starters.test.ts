import { describe, expect, it } from 'vitest'
import { templateItemSchema } from '@/features/plan/lib'
import { MAX_ITEMS, MAX_WEEKS, starterRecords, templateRows } from './queries'

const subjects = new Set([
  'lgs-tr', 'lgs-mat', 'lgs-fen', 'lgs-ink', 'lgs-din', 'lgs-ing',
  'tyt-tr', 'tyt-mat', 'tyt-fiz', 'tyt-kim', 'tyt-bio', 'tyt-tar', 'tyt-cog', 'tyt-fel', 'tyt-din',
  'ayt-mat', 'ayt-fiz', 'ayt-kim', 'ayt-bio', 'ayt-edb', 'ayt-tar1', 'ayt-cog1', 'ayt-tar2', 'ayt-cog2', 'ayt-fel', 'ayt-din',
  'ydt-dil',
])

describe('hazır şablonlar', () => {
  it('kimlikler tekrarsız, ad ve açıklama sınırları içinde', () => {
    expect(new Set(starterRecords.map((t) => t.key)).size).toBe(starterRecords.length)
    for (const t of starterRecords) {
      expect(t.name.length, t.name).toBeLessThanOrEqual(60)
      expect((t.description ?? '').length, t.name).toBeLessThanOrEqual(200)
    }
  })

  it('her görev şemaya uyar, hafta ve gün sınırları içinde, dersler gerçek', () => {
    for (const t of starterRecords) {
      expect(t.items.length, t.name).toBeGreaterThan(0)
      expect(t.items.length, t.name).toBeLessThanOrEqual(MAX_ITEMS)
      expect(t.weeks, t.name).toBeLessThanOrEqual(MAX_WEEKS)
      for (const item of t.items) {
        expect(templateItemSchema.safeParse(item).success, `${t.name}: ${item.title}`).toBe(true)
        expect(item.week).toBeLessThan(t.weeks)
        if (item.subject_id) expect(subjects.has(item.subject_id), `${t.name}: ${item.subject_id}`).toBe(true)
        if (t.track === 'lgs' && item.subject_id) expect(item.subject_id.startsWith('lgs-'), t.name).toBe(true)
        if (t.track === 'yks' && item.subject_id) expect(item.subject_id.startsWith('lgs-'), t.name).toBe(false)
      }
    }
  })

  it('her haftada en az bir görev var', () => {
    for (const t of starterRecords) {
      for (let w = 0; w < t.weeks; w++) expect(t.items.some((i) => i.week === w), `${t.name} hafta ${w + 1}`).toBe(true)
    }
  })

  it('metinlerde uzun tire, noktalı virgül ve emoji yok', () => {
    for (const t of starterRecords) {
      for (const text of [t.name, t.description ?? '', ...t.items.map((i) => i.title)]) {
        expect(text, text).not.toMatch(/[\u2014\u2013;]/u)
        expect(text, text).not.toMatch(/\p{Extended_Pictographic}/u)
      }
    }
  })

  it('en az 20 şablon, LGS ve YKS için birden fazla haftalık seçenek var', () => {
    expect(starterRecords.length).toBeGreaterThanOrEqual(20)
    expect(starterRecords.some((t) => t.track === 'lgs' && t.weeks >= 3)).toBe(true)
    expect(starterRecords.some((t) => t.track === 'yks' && t.weeks >= 4)).toBe(true)
  })
})

describe('templateRows', () => {
  it('hafta ve gün ofsetini başlangıç haftasına ekler, öğrenci başına çoğaltır', () => {
    const items = [
      { week: 0, weekday: 0, title: 'a', kind: 'study' as const, subject_id: null, topic_id: null, target_questions: null, target_minutes: null, note: null },
      { week: 2, weekday: 6, title: 'b', kind: 'study' as const, subject_id: null, topic_id: null, target_questions: null, target_minutes: null, note: null },
    ]
    const rows = templateRows(items, ['s1', 's2'], '2026-10-19')
    expect(rows).toHaveLength(4)
    expect(rows[0]).toMatchObject({ student_id: 's1', due_on: '2026-10-19', title: 'a' })
    expect(rows[1]).toMatchObject({ student_id: 's1', due_on: '2026-11-08', title: 'b' })
    expect(rows[2]).toMatchObject({ student_id: 's2', due_on: '2026-10-19' })
    expect(rows[0]).not.toHaveProperty('week')
    expect(rows[0]).not.toHaveProperty('weekday')
  })
})
