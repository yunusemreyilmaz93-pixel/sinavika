import { describe, expect, it } from 'vitest'
import { masteryOf, type TopicSignals } from './mastery'

const base: TopicSignals = { status: 'none', correct: 0, total: 0, openWrong: 0, dueWrong: 0, daysSinceUpdate: null }

describe('masteryOf', () => {
  it('hiçbir şey yoksa başlanmadı', () => {
    expect(masteryOf(base).level).toBe('none')
  })
  it('tamam ve yeterli doğrulukta hakim, açık yanlış varsa pekişiyor', () => {
    expect(masteryOf({ ...base, status: 'done', correct: 9, total: 10 }).level).toBe('mastered')
    expect(masteryOf({ ...base, status: 'done', correct: 9, total: 10, openWrong: 1 }).level).toBe('solid')
    expect(masteryOf({ ...base, status: 'done' }).level).toBe('solid')
  })
  it('düşük doğruluk, işaretli tekrar ve bekleyen yanlışlar tekrar gerektirir', () => {
    const low = masteryOf({ ...base, status: 'done', correct: 2, total: 8 })
    expect(low.level).toBe('review')
    expect(low.reasons[0]).toContain('%25')
    expect(masteryOf({ ...base, status: 'review' }).level).toBe('review')
    expect(masteryOf({ ...base, dueWrong: 2 }).level).toBe('review')
  })
  it('az soruda doğruluk tek başına tekrar sayılmaz', () => {
    expect(masteryOf({ ...base, correct: 1, total: 4 }).level).toBe('learning')
  })
  it('uzun süredir dokunulmayan tamam konu hatırlatılır', () => {
    const m = masteryOf({ ...base, status: 'done', correct: 9, total: 10, daysSinceUpdate: 45 })
    expect(m.level).toBe('solid')
    expect(m.priority).toBe(1)
  })
})
