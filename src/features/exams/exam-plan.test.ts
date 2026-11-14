import { describe, expect, it } from 'vitest'
import { planFromExam } from './exam-plan'

const start = '2026-11-16'

describe('planFromExam', () => {
  it('en çok takılınan konular için tekrar ve ardından soru görevi çıkarır', () => {
    const plan = planFromExam({
      topics: [
        { id: 1, name: 'Üslü İfadeler', subjectId: 'mat', misses: 4 },
        { id: 2, name: 'Basınç', subjectId: 'fen', misses: 1 },
        { id: 3, name: 'Hiç kaçırılmadı', subjectId: 'fen', misses: 0 },
      ],
      subjects: [],
      start,
    })
    expect(plan.map((t) => t.title)).toEqual(['Üslü İfadeler · Konu tekrarı', 'Üslü İfadeler · 30 soru', 'Basınç · Konu tekrarı', 'Basınç · 20 soru'])
    const uslu = plan.filter((t) => t.topic_id === 1)
    expect(uslu[0].due_on < uslu[1].due_on).toBe(true)
  })

  it('günde en fazla iki görev koyar ve altı güne yayar', () => {
    const topics = Array.from({ length: 6 }, (_, i) => ({ id: i + 1, name: `Konu ${i + 1}`, subjectId: 'mat', misses: 6 - i }))
    const plan = planFromExam({ topics, subjects: [], start })
    expect(plan).toHaveLength(12)
    const perDay = new Map<string, number>()
    for (const t of plan) perDay.set(t.due_on, (perDay.get(t.due_on) ?? 0) + 1)
    expect(Math.max(...perDay.values())).toBeLessThanOrEqual(2)
    expect([...perDay.keys()].every((d) => d >= start && d <= '2026-11-21')).toBe(true)
  })

  it('konu analizi yoksa en çok net kaybedilen derslerden görev çıkarır', () => {
    const plan = planFromExam({
      topics: [],
      subjects: [
        { id: 'tr', name: 'Türkçe', loss: 2 },
        { id: 'mat', name: 'Matematik', loss: 8 },
        { id: 'fen', name: 'Fen', loss: 0 },
      ],
      start,
    })
    expect(plan.map((t) => t.subject_id)).not.toContain('fen')
    expect(plan[0].title).toBe('Matematik · Karışık 30 soru')
  })
})
