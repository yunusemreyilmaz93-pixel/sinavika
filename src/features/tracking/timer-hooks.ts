import { useQueryClient } from '@tanstack/react-query'
import { useEffect, useRef, useState } from 'react'
import { toast } from 'sonner'
import { formatMinutes } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import { invalidateActivity } from './stats'
import { breakRemainingMs, remainingMs, saveFocusRun, updateTimer, useTimerState } from './timer-store'

export function useNow(active: boolean, interval = 250) {
  const [now, setNow] = useState(() => Date.now())
  useEffect(() => {
    if (!active) return
    const tick = () => setNow(Date.now())
    const id = window.setInterval(tick, interval)
    document.addEventListener('visibilitychange', tick)
    const first = window.setTimeout(tick, 0)
    return () => {
      window.clearInterval(id)
      window.clearTimeout(first)
      document.removeEventListener('visibilitychange', tick)
    }
  }, [active, interval])
  return now
}

export function useWakeLock(active: boolean) {
  useEffect(() => {
    if (!active || !('wakeLock' in navigator)) return
    let lock: WakeLockSentinel | null = null
    let disposed = false
    const request = async () => {
      if (document.visibilityState !== 'visible' || (lock && !lock.released)) return
      try {
        const next = await navigator.wakeLock.request('screen')
        if (disposed) void next.release()
        else lock = next
      } catch {
        /* pil tasarrufu ya da izin yüzünden reddedilebilir */
      }
    }
    void request()
    document.addEventListener('visibilitychange', request)
    return () => {
      disposed = true
      document.removeEventListener('visibilitychange', request)
      if (lock && !lock.released) void lock.release().catch(() => {})
    }
  }, [active])
}

export function useDocumentTitle(title: string | null) {
  useEffect(() => {
    if (!title) return
    const previous = document.title
    document.title = title
    return () => {
      document.title = previous
    }
  }, [title])
}

export function vibrate(pattern: number[]) {
  try {
    if (navigator.userActivation?.hasBeenActive === false) return
    navigator.vibrate?.(pattern)
  } catch {
    /* desteklenmiyor */
  }
}

export function useTimerWatcher(studentId: string | undefined, enabled: boolean) {
  const queryClient = useQueryClient()
  const attempted = useRef(new Set<string>())
  const { focus, rest } = useTimerState()
  const run = enabled && focus && focus.studentId === studentId && focus.pausedAt == null ? focus : null
  const restRun = enabled && rest && rest.studentId === studentId ? rest : null

  useEffect(() => {
    if (!run) return
    let handled = false
    const check = () => {
      if (handled || attempted.current.has(run.id) || remainingMs(run, Date.now()) > 0) return
      handled = true
      attempted.current.add(run.id)
      vibrate([180, 80, 180])
      saveFocusRun(run.id, run.durationSec).then(
        (result) => {
          if (!result) return
          invalidateActivity(queryClient, run.studentId)
          toast.success('Odak oturumu bitti', { description: `${formatMinutes(result.minutes)} çalışma kaydedildi` })
        },
        (err) => toast.error('Oturum kaydedilemedi', { description: errorMessage(err) }),
      )
    }
    const id = window.setTimeout(check, Math.max(0, remainingMs(run, Date.now())) + 50)
    document.addEventListener('visibilitychange', check)
    check()
    return () => {
      window.clearTimeout(id)
      document.removeEventListener('visibilitychange', check)
    }
  }, [run, queryClient])

  useEffect(() => {
    if (!restRun) return
    const finish = () => {
      if (breakRemainingMs(restRun, Date.now()) > 0) return
      updateTimer((s) => (s.rest?.startedAt === restRun.startedAt ? { ...s, rest: null } : s))
      if (breakRemainingMs(restRun, Date.now()) > -60_000) {
        vibrate([120, 60, 120])
        toast('Mola bitti', { description: 'Hazırsan yeni bir oturum başlat' })
      }
    }
    const id = window.setTimeout(finish, Math.max(0, breakRemainingMs(restRun, Date.now())) + 50)
    document.addEventListener('visibilitychange', finish)
    finish()
    return () => {
      window.clearTimeout(id)
      document.removeEventListener('visibilitychange', finish)
    }
  }, [restRun])
}
