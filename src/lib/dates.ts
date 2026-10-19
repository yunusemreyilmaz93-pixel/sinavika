import { addDays, differenceInCalendarDays, format, parseISO, startOfWeek } from 'date-fns'
import { tr } from 'date-fns/locale'

const istanbul = new Intl.DateTimeFormat('en-CA', { timeZone: 'Europe/Istanbul', year: 'numeric', month: '2-digit', day: '2-digit' })

export function todayISO() {
  return istanbul.format(new Date())
}

export function toISO(date: Date) {
  return format(date, 'yyyy-MM-dd')
}

export function fromISO(iso: string) {
  return parseISO(iso)
}

export function weekStartISO(iso = todayISO()) {
  return toISO(startOfWeek(fromISO(iso), { weekStartsOn: 1 }))
}

export function weekDays(startIso: string) {
  return Array.from({ length: 7 }, (_, i) => toISO(addDays(fromISO(startIso), i)))
}

export function shiftDays(iso: string, days: number) {
  return toISO(addDays(fromISO(iso), days))
}

export function daysBetween(fromIso: string, toIso: string) {
  return differenceInCalendarDays(fromISO(toIso), fromISO(fromIso))
}

export function formatDate(iso: string, pattern = 'd MMMM') {
  return format(fromISO(iso), pattern, { locale: tr })
}

export function formatDay(iso: string) {
  const diff = daysBetween(todayISO(), iso)
  if (diff === 0) return 'Bugün'
  if (diff === -1) return 'Dün'
  if (diff === 1) return 'Yarın'
  return formatDate(iso, 'd MMMM EEEE')
}

export function formatTime(ts: string) {
  return format(new Date(ts), 'HH:mm', { locale: tr })
}

export function formatRelative(ts: string) {
  const diffMin = Math.round((Date.now() - new Date(ts).getTime()) / 60000)
  if (diffMin < 1) return 'şimdi'
  if (diffMin < 60) return `${diffMin} dk önce`
  const diffH = Math.round(diffMin / 60)
  if (diffH < 24) return `${diffH} sa önce`
  const diffD = Math.round(diffH / 24)
  if (diffD < 7) return `${diffD} gün önce`
  return format(new Date(ts), 'd MMM', { locale: tr })
}

export function formatMinutes(total: number) {
  const h = Math.floor(total / 60)
  const m = Math.round(total % 60)
  if (!h) return `${m} dk`
  if (!m) return `${h} sa`
  return `${h} sa ${m} dk`
}

export function greeting() {
  const hour = Number(new Intl.DateTimeFormat('en-US', { timeZone: 'Europe/Istanbul', hour: 'numeric', hour12: false }).format(new Date()))
  if (hour < 6) return 'İyi geceler'
  if (hour < 12) return 'Günaydın'
  if (hour < 18) return 'İyi günler'
  return 'İyi akşamlar'
}
