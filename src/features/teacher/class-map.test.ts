import { describe, expect, it } from 'vitest'
import { groupCandidates, masteryGrid, type ClassSignals } from './class-map'

const signals: ClassSignals = {
  progress: [
    { student_id: 'a', topic_id: 1, status: 'review', updated_at: '2026-11-10T00:00:00Z' },
    { student_id: 'b', topic_id: 1, status: 'done', updated_at: '2026-11-10T00:00:00Z' },
    { student_id: 'c', topic_id: 2, status: 'done', updated_at: '2026-11-10T00:00:00Z' },
  ],
  logs: [
    { student_id: 'b', topic_id: 1, correct: 4, wrong: 6, blank: 0 },
    { student_id: 'c', topic_id: 2, correct: 18, wrong: 2, blank: 0 },
  ],
  wrong: [{ student_id: 'c', topic_id: 3, learned_at: null, next_review_on: '2026-11-01' }, { student_id: 'c', topic_id: 3, learned_at: null, next_review_on: '2026-11-02' }],
}

describe('sınıf haritası', () => {
  it('konu durumu, doğruluk ve bekleyen yanlışlardan hakimiyet çıkarır', () => {
    const level = masteryGrid(signals, '2026-11-14')
    expect(level('a', 1)).toBe('review')
    expect(level('b', 1)).toBe('review')
    expect(level('c', 2)).toBe('mastered')
    expect(level('c', 3)).toBe('review')
    expect(level('a', 9)).toBe('none')
  })

  it('en az iki öğrencide tekrar gereken konuları toplu anlatım adayı sayar', () => {
    const level = masteryGrid(signals, '2026-11-14')
    expect(groupCandidates(level, ['a', 'b', 'c'], [1, 2, 3])).toEqual([{ topicId: 1, studentIds: ['a', 'b'] }])
  })
})
