import { describe, expect, it } from 'vitest'
import type { ReadingLog } from './queries'
import { dailyPages, readingStreak } from './stats'

const log = (id: number, book_id: number, pages: number, read_on: string): ReadingLog => ({ id, book_id, pages, read_on })

describe('dailyPages', () => {
  const logs = [log(1, 1, 10, '2026-10-20'), log(2, 1, 5, '2026-10-20'), log(3, 2, 20, '2026-10-18')]

  it('gün gün toplar, okunmayan günler sıfır', () => {
    const rows = dailyPages(logs, 4, null, '2026-10-21')
    expect(rows.map((r) => r.iso)).toEqual(['2026-10-18', '2026-10-19', '2026-10-20', '2026-10-21'])
    expect(rows.map((r) => r.pages)).toEqual([20, 0, 15, 0])
  })

  it('kitaba göre süzer', () => {
    expect(dailyPages(logs, 4, 2, '2026-10-21').map((r) => r.pages)).toEqual([20, 0, 0, 0])
  })
})

describe('readingStreak', () => {
  it('bugün okunmadıysa dünden sayar', () => {
    expect(readingStreak([log(1, 1, 5, '2026-10-20'), log(2, 1, 5, '2026-10-19')], '2026-10-21')).toBe(2)
  })

  it('bir gün atlanırsa seri biter', () => {
    expect(readingStreak([log(1, 1, 5, '2026-10-21'), log(2, 1, 5, '2026-10-19')], '2026-10-21')).toBe(1)
  })

  it('iki gündür okunmadıysa sıfır', () => {
    expect(readingStreak([log(1, 1, 5, '2026-10-18')], '2026-10-21')).toBe(0)
  })
})
