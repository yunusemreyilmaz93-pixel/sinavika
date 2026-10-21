import { useSyncExternalStore } from 'react'
import { supabase, unwrap } from '@/lib/supabase'

export type FocusRun = {
  id: string
  studentId: string
  subjectId: string
  topicId: number | null
  durationSec: number
  startedAt: number
  pausedAt: number | null
  pausedMs: number
  savingAt: number | null
  methodId?: string | null
}

export type BreakRun = { studentId: string; startedAt: number; durationSec: number }

export type TimerState = { focus: FocusRun | null; rest: BreakRun | null }

const KEY = 'sinavika-focus-timer'
const PREFS_KEY = 'sinavika-timer-prefs'
const SAVE_LOCK_MS = 20_000
const empty: TimerState = { focus: null, rest: null }
const listeners = new Set<() => void>()

let memory: string | null = null
let cachedRaw: string | null | undefined
let cached: TimerState = empty

function load() {
  try {
    return localStorage.getItem(KEY)
  } catch {
    return memory
  }
}

function persist(raw: string | null) {
  memory = raw
  try {
    if (raw == null) localStorage.removeItem(KEY)
    else localStorage.setItem(KEY, raw)
  } catch {
    /* depolama kapalıysa sayaç bu sekmede bellekte tutulur */
  }
}

const num = (v: unknown): v is number => typeof v === 'number' && Number.isFinite(v)

function parse(raw: string | null): TimerState {
  if (!raw) return empty
  try {
    const value = JSON.parse(raw) as Partial<TimerState>
    const f = value.focus as FocusRun | null | undefined
    const r = value.rest as BreakRun | null | undefined
    const focus =
      f && typeof f.id === 'string' && typeof f.studentId === 'string' && typeof f.subjectId === 'string' && num(f.durationSec) && num(f.startedAt) && num(f.pausedMs)
        ? { ...f, topicId: num(f.topicId) ? f.topicId : null, pausedAt: num(f.pausedAt) ? f.pausedAt : null, savingAt: num(f.savingAt) ? f.savingAt : null }
        : null
    const rest = r && typeof r.studentId === 'string' && num(r.startedAt) && num(r.durationSec) ? r : null
    return { focus, rest }
  } catch {
    return empty
  }
}

export function readTimer(): TimerState {
  const raw = load()
  if (raw !== cachedRaw) {
    cachedRaw = raw
    cached = parse(raw)
  }
  return cached
}

export function writeTimer(next: TimerState) {
  persist(next.focus || next.rest ? JSON.stringify(next) : null)
  listeners.forEach((l) => l())
}

export function updateTimer(fn: (state: TimerState) => TimerState) {
  writeTimer(fn(readTimer()))
}

function subscribe(cb: () => void) {
  listeners.add(cb)
  const onStorage = (e: StorageEvent) => {
    if (e.key === KEY || e.key === null) cb()
  }
  window.addEventListener('storage', onStorage)
  return () => {
    listeners.delete(cb)
    window.removeEventListener('storage', onStorage)
  }
}

export function useTimerState() {
  return useSyncExternalStore(subscribe, readTimer, () => empty)
}

export function workedMs(run: FocusRun, now: number) {
  const end = run.pausedAt ?? now
  return Math.min(run.durationSec * 1000, Math.max(0, end - run.startedAt - run.pausedMs))
}

export function remainingMs(run: FocusRun, now: number) {
  return run.durationSec * 1000 - workedMs(run, now)
}

export function breakRemainingMs(rest: BreakRun, now: number) {
  return rest.durationSec * 1000 - (now - rest.startedAt)
}

export function isSaving(run: FocusRun, now: number) {
  return run.savingAt != null && now - run.savingAt < SAVE_LOCK_MS
}

export function newRunId() {
  return typeof crypto !== 'undefined' && 'randomUUID' in crypto ? crypto.randomUUID() : `${Date.now()}-${Math.random()}`
}

const istanbulDay = new Intl.DateTimeFormat('en-CA', { timeZone: 'Europe/Istanbul', year: 'numeric', month: '2-digit', day: '2-digit' })

export function clearFocus(runId: string) {
  updateTimer((s) => (s.focus?.id === runId ? { ...s, focus: null } : s))
}

export async function saveFocusRun(
  runId: string,
  workedSec: number,
  clear = true,
): Promise<{ minutes: number; subjectId: string; topicId: number | null; methodId: string | null } | null> {
  const now = Date.now()
  const state = readTimer()
  const run = state.focus
  if (!run || run.id !== runId || isSaving(run, now) || workedSec < 60) return null
  writeTimer({ ...state, focus: { ...run, savingAt: now } })

  const minutes = Math.min(600, Math.max(1, Math.round(workedSec / 60)))
  const endedAt = run.startedAt + run.pausedMs + workedSec * 1000
  try {
    unwrap(
      await supabase.from('study_sessions').insert({
        student_id: run.studentId,
        subject_id: run.subjectId,
        topic_id: run.topicId,
        minutes,
        studied_on: istanbulDay.format(new Date(Math.min(endedAt, now))),
        source: 'timer',
      }),
    )
  } catch (err) {
    updateTimer((s) => (s.focus?.id === runId ? { ...s, focus: { ...s.focus, savingAt: null } } : s))
    throw err
  }
  if (clear) clearFocus(runId)
  return { minutes, subjectId: run.subjectId, topicId: run.topicId, methodId: run.methodId ?? null }
}

export type TimerPrefs = { minutes: number; custom: number; method: string }

export function readPrefs(): TimerPrefs {
  try {
    const value = JSON.parse(localStorage.getItem(PREFS_KEY) ?? '{}') as Partial<TimerPrefs>
    return {
      minutes: num(value.minutes) && value.minutes >= 1 && value.minutes <= 240 ? value.minutes : 25,
      custom: num(value.custom) && value.custom >= 5 && value.custom <= 240 ? value.custom : 30,
      method: typeof value.method === 'string' ? value.method : 'serbest',
    }
  } catch {
    return { minutes: 25, custom: 30, method: 'serbest' }
  }
}

export function writePrefs(prefs: TimerPrefs) {
  try {
    localStorage.setItem(PREFS_KEY, JSON.stringify(prefs))
  } catch {
    /* depolama kapalı */
  }
}
