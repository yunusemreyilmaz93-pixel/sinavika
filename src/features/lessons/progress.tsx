import { useQuery, useQueryClient } from '@tanstack/react-query'
import { createContext, useCallback, useContext, useEffect, useMemo, useRef, type ReactNode } from 'react'
import { useProfile } from '@/features/auth/session'
import { supabase, unwrap, type RpcReturn } from '@/lib/supabase'

const BUCKET_SECONDS = 5
const FLUSH_MS = 15_000
const IDLE_MS = 30_000

export type Completion = RpcReturn<'lesson_completion'>[number]

export const completionKey = (studentId: string) => ['lesson-completion', studentId] as const

export function useLessonCompletion(studentId: string) {
  return useQuery({
    queryKey: completionKey(studentId),
    queryFn: async () => new Map(unwrap(await supabase.rpc('lesson_completion', { p_student: studentId })).map((row) => [row.topic_id, row])),
  })
}

export function useTopicCompletion(studentId: string, topicId: number) {
  return useQuery({
    queryKey: [...completionKey(studentId), topicId],
    queryFn: async () => unwrap(await supabase.rpc('lesson_completion', { p_student: studentId, p_topic: topicId }))[0] ?? null,
  })
}

type VideoState = { duration: number; last: number | null; ticks: Map<number, number>; credited: Set<number>; fresh: Set<number> }

type Reporter = { reportVideo: (id: string, time: number, duration: number) => void }

const ProgressContext = createContext<Reporter | null>(null)

export function useLessonProgress() {
  return useContext(ProgressContext)
}

// Öğrencinin bu sayfada gerçekten okuduğunu ve izlediğini sunucuya bildirir. Sunucu artışı geçen gerçek süreyle sınırlar.
export function LessonProgressProvider({ topicId, sectionIds, children }: { topicId: number; sectionIds: string[]; children: ReactNode }) {
  const studentId = useProfile().id
  const queryClient = useQueryClient()
  const state = useRef({
    seconds: 0,
    sections: new Set<string>(),
    sentSections: 0,
    videos: new Map<string, VideoState>(),
    inFlight: false,
    lastInput: 0,
    videoUntil: 0,
  })

  const flush = useCallback(async () => {
    const p = state.current
    if (p.inFlight) return
    const seconds = Math.min(p.seconds, 120)
    const videos: Record<string, { duration: number; buckets: number[] }> = {}
    for (const [id, v] of p.videos) if (v.fresh.size) videos[id] = { duration: Math.round(v.duration), buckets: [...v.fresh].slice(0, 400) }
    const sections = p.sections.size
    if (!seconds && !Object.keys(videos).length && sections <= p.sentSections) return
    p.inFlight = true
    p.seconds -= seconds
    try {
      const { error } = await supabase.rpc('record_lesson_progress', { p_topic: topicId, p_seconds: seconds, p_sections: sections, p_videos: videos })
      if (error) throw error
      p.sentSections = sections
      for (const [id, sent] of Object.entries(videos)) for (const bucket of sent.buckets) p.videos.get(id)?.fresh.delete(bucket)
      void queryClient.invalidateQueries({ queryKey: completionKey(studentId) })
    } catch {
      p.seconds += seconds
    } finally {
      p.inFlight = false
    }
  }, [topicId, studentId, queryClient])

  useEffect(() => {
    const p = state.current
    p.lastInput = Date.now()
    const touch = () => {
      p.lastInput = Date.now()
    }
    const events = ['pointerdown', 'pointermove', 'keydown', 'wheel', 'touchstart'] as const
    for (const name of events) window.addEventListener(name, touch, { passive: true })
    window.addEventListener('scroll', touch, { passive: true, capture: true })
    const tick = window.setInterval(() => {
      if (document.visibilityState !== 'visible' || !document.hasFocus()) return
      const now = Date.now()
      if (now - p.lastInput < IDLE_MS || now < p.videoUntil) p.seconds++
    }, 1000)
    const send = window.setInterval(() => void flush(), FLUSH_MS)
    const onHide = () => {
      if (document.visibilityState === 'hidden') void flush()
    }
    document.addEventListener('visibilitychange', onHide)
    return () => {
      for (const name of events) window.removeEventListener(name, touch)
      window.removeEventListener('scroll', touch, { capture: true })
      window.clearInterval(tick)
      window.clearInterval(send)
      document.removeEventListener('visibilitychange', onHide)
      void flush()
    }
  }, [flush])

  useEffect(() => {
    const p = state.current
    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) if (entry.isIntersecting) p.sections.add(entry.target.id)
      },
      { rootMargin: '0px 0px -20% 0px' },
    )
    for (const id of sectionIds) {
      const el = document.getElementById(id)
      if (el) observer.observe(el)
    }
    return () => observer.disconnect()
  }, [sectionIds])

  // Her saniye çağrılır. Atlanan (3 saniyeden büyük sıçrayan) kısım sayılmaz, bir dilim için en az iki saniye oynatma gerekir.
  const reportVideo = useCallback((id: string, time: number, duration: number) => {
    if (!(duration > 0)) return
    const p = state.current
    p.videoUntil = Date.now() + 2500
    let v = p.videos.get(id)
    if (!v) {
      v = { duration, last: null, ticks: new Map(), credited: new Set(), fresh: new Set() }
      p.videos.set(id, v)
    }
    v.duration = duration
    const jumped = v.last !== null && Math.abs(time - v.last) > 3
    v.last = time
    if (jumped) return
    const bucket = Math.floor(time / BUCKET_SECONDS)
    const count = (v.ticks.get(bucket) ?? 0) + 1
    v.ticks.set(bucket, count)
    if (count >= 2 && !v.credited.has(bucket)) {
      v.credited.add(bucket)
      v.fresh.add(bucket)
    }
  }, [])

  const value = useMemo<Reporter>(() => ({ reportVideo }), [reportVideo])
  return <ProgressContext.Provider value={value}>{children}</ProgressContext.Provider>
}
