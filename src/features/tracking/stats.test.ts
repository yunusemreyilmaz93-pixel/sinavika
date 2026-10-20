import { describe, expect, it } from 'vitest'
import { buildActivity, summarize, type LogRow, type SessionRow } from './stats'

let id = 0
const session = (studied_on: string, minutes: number, subject_id = 'tyt-mat'): SessionRow => ({
  id: ++id,
  subject_id,
  topic_id: null,
  minutes,
  studied_on,
  source: 'manual',
  created_at: `${studied_on}T10:00:00Z`,
})
const log = (solved_on: string, correct: number, wrong: number, blank: number, subject_id = 'tyt-mat'): LogRow => ({
  id: ++id,
  subject_id,
  topic_id: null,
  correct,
  wrong,
  blank,
  solved_on,
  created_at: `${solved_on}T10:00:00Z`,
})

const today = '2026-10-21'

describe('buildActivity', () => {
  it('bugün dahil art arda aktif günleri sayar', () => {
    const a = buildActivity([session('2026-10-21', 30), session('2026-10-20', 20)], [log('2026-10-19', 5, 1, 0)], today, 90)
    expect(a.streak).toBe(3)
  })

  it('bugün kayıt yoksa seriyi dünden başlatır', () => {
    const a = buildActivity([session('2026-10-20', 20), session('2026-10-19', 20), session('2026-10-17', 20)], [], today, 90)
    expect(a.streak).toBe(2)
  })

  it('dün de boşsa seri sıfırdır', () => {
    const a = buildActivity([session('2026-10-19', 20)], [], today, 90)
    expect(a.streak).toBe(0)
  })

  it('haftayı pazartesiden sayar ve bugünü ayırır', () => {
    const a = buildActivity(
      [session('2026-10-18', 50), session('2026-10-19', 40), session('2026-10-21', 25)],
      [log('2026-10-21', 10, 2, 3), log('2026-10-18', 20, 0, 0)],
      today,
      90,
    )
    expect(a.weekMinutes).toBe(65)
    expect(a.weekQuestions).toBe(15)
    expect(a.todayMinutes).toBe(25)
    expect(a.todayQuestions).toBe(15)
  })

  it('ders bazında soru ve doğruluk hesaplar', () => {
    const a = buildActivity([session('2026-10-21', 30, 'tyt-fiz')], [log('2026-10-21', 8, 1, 1), log('2026-10-20', 2, 2, 0, 'tyt-fiz')], today, 90)
    const mat = a.bySubject.find((s) => s.subjectId === 'tyt-mat')
    const fiz = a.bySubject.find((s) => s.subjectId === 'tyt-fiz')
    expect(mat).toMatchObject({ questions: 10, accuracy: 0.8, minutes: 0 })
    expect(fiz).toMatchObject({ questions: 4, accuracy: 0.5, minutes: 30 })
    expect(a.bySubject[0].subjectId).toBe('tyt-mat')
  })
})

describe('summarize', () => {
  it('sadece seçilen dönemi toplar', () => {
    const a = buildActivity([session('2026-10-21', 30), session('2026-10-01', 60)], [log('2026-10-15', 6, 2, 2)], today, 90)
    const week = summarize(a, 7)
    expect(week.days).toHaveLength(7)
    expect(week.minutes).toBe(30)
    expect(week.questions).toBe(10)
    expect(week.accuracy).toBe(0.6)
    expect(week.activeDays).toBe(2)
    expect(summarize(a, 30).minutes).toBe(90)
  })
})
