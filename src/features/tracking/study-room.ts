import type { RealtimeChannel } from '@supabase/supabase-js'
import { useEffect, useRef, useState, useSyncExternalStore } from 'react'
import { supabase } from '@/lib/supabase'

// Sanal etüt: aynı öğretmenin öğrencileri sayaç çalışırken birbirini görür. Yalnızca ilk ad, ders ve başlama saati paylaşılır
export type Peer = { id: string; name: string; subject: string; since: number }

const PREF = 'izlek-etut-gorun'
const listeners = new Set<() => void>()

function readVisible() {
  try {
    return localStorage.getItem(PREF) !== '0'
  } catch {
    return true
  }
}

export function setStudyRoomVisible(visible: boolean) {
  try {
    localStorage.setItem(PREF, visible ? '1' : '0')
  } catch {
    // Kaydedilemezse yalnızca bu açılışta geçerli
  }
  listeners.forEach((l) => l())
}

export function useStudyRoomVisible() {
  return useSyncExternalStore(
    (l) => {
      listeners.add(l)
      return () => listeners.delete(l)
    },
    readVisible,
    () => true,
  )
}

export function useStudyRoom(teacherId: string | null | undefined, selfId: string, me: Peer | null) {
  const [peers, setPeers] = useState<Peer[]>([])
  const channelRef = useRef<RealtimeChannel | null>(null)
  const meRef = useRef(me)
  useEffect(() => {
    meRef.current = me
  })

  useEffect(() => {
    if (!teacherId) return
    let alive = true
    const channel = supabase.channel(`etut:${teacherId}`, { config: { private: true, presence: { key: selfId } } })
    channelRef.current = channel
    channel.on('presence', { event: 'sync' }, () => {
      const state = channel.presenceState<Peer>()
      const list = Object.values(state)
        .map((entries) => entries[entries.length - 1])
        .filter((p): p is Peer & { presence_ref: string } => Boolean(p?.id))
        .map(({ id, name, subject, since }) => ({ id, name, subject, since }))
        .sort((a, b) => a.since - b.since)
      if (alive) setPeers(list)
    })
    void supabase.realtime.setAuth().then(() =>
      channel.subscribe((status) => {
        if (status === 'SUBSCRIBED' && meRef.current) void channel.track(meRef.current)
      }),
    )
    return () => {
      alive = false
      channelRef.current = null
      void supabase.removeChannel(channel)
    }
  }, [teacherId, selfId])

  const key = me ? `${me.subject}:${me.since}` : ''
  useEffect(() => {
    const channel = channelRef.current
    if (!channel || channel.state !== 'joined') return
    if (meRef.current) void channel.track(meRef.current)
    else void channel.untrack()
  }, [key])

  return peers.filter((p) => p.id !== selfId)
}
