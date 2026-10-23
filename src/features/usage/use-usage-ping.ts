import { useEffect } from 'react'
import { useLocation } from 'react-router'
import { isTestTab, supabase } from '@/lib/supabase'

const INTERVAL_MS = 60_000

// Kimlik ve sayı içeren yol parçaları tek bir kalıba indirilir: /app/konular/12 -> /app/konular/:id
export function usagePath(pathname: string) {
  return pathname
    .split('/')
    .map((part) => (/^\d+$/.test(part) || /^[0-9a-f-]{32,36}$/i.test(part) ? ':id' : part))
    .join('/')
    .slice(0, 80)
}

export function useUsagePing(enabled = true) {
  const { pathname } = useLocation()
  const path = usagePath(pathname)

  useEffect(() => {
    if (!enabled || isTestTab) return
    const ping = () => {
      if (document.visibilityState !== 'visible') return
      void supabase.rpc('usage_ping', { p_path: path }).then(undefined, () => undefined)
    }
    ping()
    const timer = window.setInterval(ping, INTERVAL_MS)
    document.addEventListener('visibilitychange', ping)
    return () => {
      window.clearInterval(timer)
      document.removeEventListener('visibilitychange', ping)
    }
  }, [enabled, path])
}
