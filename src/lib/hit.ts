import { useEffect } from 'react'
import { useLocation } from 'react-router'
import { useAuth } from '@/features/auth/session'
import { isTestTab } from './supabase'

type Event = 'basvuru-gonderildi' | 'davetle-katildi'

function send(payload: Record<string, unknown>) {
  try {
    const body = JSON.stringify(payload)
    if (navigator.sendBeacon?.('/api/hit', new Blob([body], { type: 'text/plain' }))) return
    void fetch('/api/hit', { method: 'POST', body, keepalive: true }).catch(() => undefined)
  } catch {
    /* sayaç hiçbir zaman sayfayı bozmamalı */
  }
}

// Üye olmayan ziyaretçilerin sayfa görüntülemesi. Uygulama içi (/app) kullanım ayrıca usage_ping ile ölçülür
const SKIP = /^\/(app|rapor|test-giris)(\/|$)/

export function useSiteHit() {
  const { pathname } = useLocation()
  const { ready, session } = useAuth()
  const signedIn = Boolean(session)

  useEffect(() => {
    if (!ready || signedIn || isTestTab || SKIP.test(pathname)) return
    const utm = new URLSearchParams(window.location.search).get('utm_source')
    send({ path: pathname, ref: document.referrer, utm })
  }, [ready, signedIn, pathname])
}

export function trackEvent(event: Event) {
  if (isTestTab) return
  send({ event })
}
