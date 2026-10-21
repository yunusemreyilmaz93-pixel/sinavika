import { shiftDays, todayISO } from '@/lib/dates'
import type { ReadingLog } from './queries'

export type DayPages = { iso: string; pages: number }

export function dailyPages(logs: ReadingLog[], days: number, bookId: number | null, today = todayISO()): DayPages[] {
  const totals = new Map<string, number>()
  for (const log of logs) {
    if (bookId === null || log.book_id === bookId) totals.set(log.read_on, (totals.get(log.read_on) ?? 0) + log.pages)
  }
  return Array.from({ length: days }, (_, i) => {
    const iso = shiftDays(today, i - days + 1)
    return { iso, pages: totals.get(iso) ?? 0 }
  })
}

export function readingStreak(logs: ReadingLog[], today = todayISO()) {
  const read = new Set(logs.map((log) => log.read_on))
  let day = read.has(today) ? today : shiftDays(today, -1)
  let streak = 0
  while (read.has(day)) {
    streak++
    day = shiftDays(day, -1)
  }
  return streak
}
