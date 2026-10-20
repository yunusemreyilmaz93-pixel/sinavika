import { useQueryClient } from '@tanstack/react-query'
import { useCallback, useEffect, useLayoutEffect, useRef, useState } from 'react'
import { keys } from '@/lib/data'
import { supabase, type Tables } from '@/lib/supabase'
import { markThreadRead, patchThread, upsertMessage, type Channel, type Message } from './lib'

let channelSeq = 0

export function useLiveMessages(studentId: string, channel: Channel, me: string, enabled: boolean) {
  const queryClient = useQueryClient()
  useEffect(() => {
    if (!enabled) return
    let joined = false
    const sub = supabase
      .channel(`messages:${studentId}:${channel}:${++channelSeq}`)
      .on<Tables<'messages'>>(
        'postgres_changes',
        { event: 'INSERT', schema: 'public', table: 'messages', filter: `student_id=eq.${studentId}` },
        (payload) => {
          const row = payload.new
          if (row.channel !== channel) return
          patchThread(queryClient, studentId, channel, (l) => upsertMessage(l, row))
        },
      )
      .subscribe((status) => {
        if (status !== 'SUBSCRIBED') return
        if (joined) void queryClient.invalidateQueries({ queryKey: keys.messages(studentId, channel) })
        joined = true
      })
    const onVisible = () => {
      if (document.visibilityState === 'visible') {
        void queryClient.invalidateQueries({ queryKey: keys.messages(studentId, channel) })
      }
    }
    document.addEventListener('visibilitychange', onVisible)
    return () => {
      document.removeEventListener('visibilitychange', onVisible)
      void supabase.removeChannel(sub)
    }
  }, [studentId, channel, me, enabled, queryClient])
}

export function useMarkRead(studentId: string, channel: Channel, me: string, list: Message[]) {
  const queryClient = useQueryClient()
  const marked = useRef<string | null>(null)
  const latest = [...list].reverse().find((m) => !m.status)?.created_at

  useEffect(() => {
    if (!latest) return
    const run = () => {
      if (document.visibilityState !== 'visible' || marked.current === latest) return
      marked.current = latest
      void markThreadRead(me, studentId, channel, latest).then(() => {
        void queryClient.invalidateQueries({ queryKey: keys.inbox })
        void queryClient.invalidateQueries({ queryKey: keys.notifications })
      })
    }
    run()
    document.addEventListener('visibilitychange', run)
    return () => document.removeEventListener('visibilitychange', run)
  }, [latest, me, studentId, channel, queryClient])
}

export function useThreadScroll(
  list: Message[],
  me: string,
  query: { hasNextPage: boolean; isFetchingNextPage: boolean; fetchNextPage: () => Promise<unknown> },
) {
  const [stuck, setStuck] = useState(true)
  const stuckRef = useRef(true)
  const [leftAt, setLeftAt] = useState<string | number | null>(null)
  const topRef = useRef<HTMLDivElement>(null)
  const ready = useRef(false)
  const anchor = useRef<number | null>(null)
  const lastKey = useRef<string | number | null>(null)
  const last = list[list.length - 1]
  const lastId = last ? (last.clientKey ?? last.id) : null
  const first = list[0]?.id
  const lastSender = last?.sender_id

  const scrollToBottom = useCallback((behavior: ScrollBehavior = 'auto') => {
    window.scrollTo({ top: document.documentElement.scrollHeight, behavior })
  }, [])

  useEffect(() => {
    lastKey.current = lastId
  }, [lastId])

  useEffect(() => {
    const onScroll = () => {
      const distance = document.documentElement.scrollHeight - window.scrollY - window.innerHeight
      const atBottom = distance < 120
      if (stuckRef.current && !atBottom) setLeftAt(lastKey.current)
      stuckRef.current = atBottom
      setStuck(atBottom)
    }
    window.addEventListener('scroll', onScroll, { passive: true })
    return () => window.removeEventListener('scroll', onScroll)
  }, [])

  useLayoutEffect(() => {
    if (!lastId) return
    if (!ready.current) {
      scrollToBottom()
      requestAnimationFrame(() => {
        scrollToBottom()
        ready.current = true
      })
      return
    }
    const mine = lastSender === me
    const distance = document.documentElement.scrollHeight - window.scrollY - window.innerHeight
    if (mine || distance < 320) requestAnimationFrame(() => scrollToBottom('smooth'))
  }, [lastId, lastSender, me, scrollToBottom])

  useLayoutEffect(() => {
    if (anchor.current === null) return
    window.scrollTo({ top: document.documentElement.scrollHeight - anchor.current })
    anchor.current = null
  }, [first])

  const { hasNextPage, isFetchingNextPage, fetchNextPage } = query
  useEffect(() => {
    const el = topRef.current
    if (!el || !hasNextPage) return
    const observer = new IntersectionObserver(
      (entries) => {
        if (!entries[0]?.isIntersecting || !ready.current || isFetchingNextPage) return
        anchor.current = document.documentElement.scrollHeight - window.scrollY
        void fetchNextPage()
      },
      { rootMargin: '300px 0px 0px 0px' },
    )
    observer.observe(el)
    return () => observer.disconnect()
  }, [hasNextPage, isFetchingNextPage, fetchNextPage])

  return { stuck, showNew: !stuck && leftAt !== lastId && last?.sender_id !== me, scrollToBottom, topRef }
}

