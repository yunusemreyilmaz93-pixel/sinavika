import { describe, expect, it } from 'vitest'
import { computePace } from './pace'

const subjects = [
  { id: 'mat', name: 'Matematik', topicIds: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] },
  { id: 'fen', name: 'Fen', topicIds: [11, 12, 13, 14, 15, 16, 17, 18, 19, 20] },
]
const done = (topic_id: number, updated_at: string) => ({ topic_id, status: 'done', updated_at })

describe('computePace', () => {
  it('son 4 haftadaki hıza göre sınava yetişip yetişmediğini hesaplar', () => {
    const progress = [1, 2, 3, 4, 11, 12, 13, 14].map((id) => done(id, '2026-11-01T10:00:00Z'))
    const pace = computePace({ subjects, progress, today: '2026-11-14', examDate: '2027-01-09' })
    expect(pace.remaining).toBe(12)
    expect(pace.weeklyRate).toBe(2)
    expect(pace.weeksLeft).toBe(8)
    expect(pace.required).toBe(1.5)
    expect(pace.state).toBe('ahead')
  })

  it('hız yetmiyorsa kaç gün geç biteceğini verir', () => {
    const progress = [done(1, '2026-11-10T10:00:00Z'), done(2, '2026-11-10T10:00:00Z')]
    const pace = computePace({ subjects, progress, today: '2026-11-14', examDate: '2026-12-12' })
    expect(pace.state).toBe('behind')
    expect(pace.weeklyRate).toBe(0.5)
    expect(pace.lateDays).toBe(18 * 14 - 28)
  })

  it('4 haftadan eski tamamlamalar hıza sayılmaz', () => {
    const progress = [done(1, '2026-09-01T10:00:00Z')]
    const pace = computePace({ subjects, progress, today: '2026-11-14', examDate: '2027-06-01' })
    expect(pace.done).toBe(1)
    expect(pace.state).toBe('stalled')
  })

  it('bitmiş dersleri listeden çıkarır, en çok konusu kalanı başa alır', () => {
    const progress = subjects[0].topicIds.map((id) => done(id, '2026-11-01T10:00:00Z'))
    const pace = computePace({ subjects, progress, today: '2026-11-14', examDate: '2027-06-01' })
    expect(pace.subjects.map((s) => s.id)).toEqual(['fen'])
  })

  it('her konu bittiyse durum tamamdır', () => {
    const progress = [...subjects[0].topicIds, ...subjects[1].topicIds].map((id) => done(id, '2026-11-01T10:00:00Z'))
    expect(computePace({ subjects, progress, today: '2026-11-14', examDate: '2027-06-01' }).state).toBe('done')
  })
})
