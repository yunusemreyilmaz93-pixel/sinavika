import { describe, expect, it } from 'vitest'
import { badges, badgeState, earnedIds, type Milestones } from './milestones'

const none: Milestones = { streak: 0, best_streak: 0, tasks_done: 0, questions: 0, minutes: 0, exams: 0, topics_done: 0 }

describe('rozetler', () => {
  it('kayıt yokken hiçbiri kazanılmamıştır', () => {
    expect(earnedIds(none)).toEqual([])
  })

  it('eşiğe ulaşınca kazanılır, ilerleme hedefi aşmaz', () => {
    const m = { ...none, questions: 520, tasks_done: 1, best_streak: 7 }
    expect(earnedIds(m)).toEqual(['task-1', 'q-100', 'q-500', 'streak-3', 'streak-7'])
    const q1000 = badges.find((b) => b.id === 'q-1000')!
    expect(badgeState(q1000, m)).toEqual({ earned: false, value: 520 })
    expect(badgeState(badges.find((b) => b.id === 'q-100')!, m)).toEqual({ earned: true, value: 100 })
  })

  it('kimlikler tekrarsız ve ad ile ipucunda yasak karakter yok', () => {
    expect(new Set(badges.map((b) => b.id)).size).toBe(badges.length)
    for (const b of badges) expect(`${b.title}${b.hint}`).not.toMatch(/[\u2014\u2013;]/u)
  })
})
