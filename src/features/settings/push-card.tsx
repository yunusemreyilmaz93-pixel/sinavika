import { BellRing } from 'lucide-react'
import { useEffect, useState } from 'react'
import { toast } from 'sonner'
import { Switch } from '@/components/ui/switch'
import { callApi } from '@/lib/api'
import { SettingsCard } from './ui'

type State = 'loading' | 'unsupported' | 'ios-install' | 'blocked' | 'off' | 'on'

function supported() {
  return 'serviceWorker' in navigator && 'PushManager' in window && 'Notification' in window
}

function needsIosInstall() {
  const ua = navigator.userAgent
  const ios = /iphone|ipad|ipod/i.test(ua) || (ua.includes('Macintosh') && navigator.maxTouchPoints > 1)
  const standalone = (navigator as Navigator & { standalone?: boolean }).standalone === true
  return ios && !standalone
}

function toKey(base64: string) {
  const padded = (base64 + '='.repeat((4 - (base64.length % 4)) % 4)).replace(/-/g, '+').replace(/_/g, '/')
  return Uint8Array.from(atob(padded), (c) => c.charCodeAt(0))
}

async function currentSubscription() {
  const reg = await navigator.serviceWorker.ready
  return reg.pushManager.getSubscription()
}

export function PushCard() {
  const [state, setState] = useState<State>('loading')
  const [busy, setBusy] = useState(false)

  useEffect(() => {
    let cancelled = false
    async function check() {
      if (needsIosInstall()) return setState('ios-install')
      if (!supported()) return setState('unsupported')
      if (Notification.permission === 'denied') return setState('blocked')
      const sub = await currentSubscription().catch(() => null)
      if (!cancelled) setState(sub ? 'on' : 'off')
    }
    void check()
    return () => {
      cancelled = true
    }
  }, [])

  async function enable() {
    setBusy(true)
    try {
      const permission = await Notification.requestPermission()
      if (permission !== 'granted') {
        setState(permission === 'denied' ? 'blocked' : 'off')
        return
      }
      const { key } = await callApi<{ key: string }>('push', { action: 'key' })
      const reg = await navigator.serviceWorker.ready
      const sub = await reg.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey: toKey(key) })
      const json = sub.toJSON()
      await callApi('push', { action: 'subscribe', endpoint: json.endpoint, keys: json.keys })
      setState('on')
      toast.success('Bildirimler açıldı')
    } catch (error) {
      toast.error(error instanceof Error ? error.message : 'Bildirimler açılamadı, tekrar dene')
    } finally {
      setBusy(false)
    }
  }

  async function disable() {
    setBusy(true)
    try {
      const sub = await currentSubscription()
      if (sub) {
        await callApi('push', { action: 'unsubscribe', endpoint: sub.endpoint }).catch(() => undefined)
        await sub.unsubscribe()
      }
      setState('off')
    } finally {
      setBusy(false)
    }
  }

  if (state === 'loading' || state === 'unsupported') return null

  const description = {
    'ios-install': "iPhone ve iPad'de bildirim almak için önce Yolumnet'i ana ekrana ekle, sonra buradan aç.",
    blocked: 'Bildirimlere bu tarayıcıda izin verilmemiş. Tarayıcının site ayarlarından Yolumnet için bildirimlere izin ver.',
    off: 'Yeni görev, mesaj, hatırlatma ve haftalık rapor geldiğinde telefonuna bildirim gelsin.',
    on: 'Bu cihaza bildirim gönderiliyor.',
  }[state]

  return (
    <SettingsCard icon={BellRing} title="Telefona bildirim" description={description}>
      {(state === 'off' || state === 'on') && (
        <div className="flex min-h-11 items-center justify-between gap-4">
          <span className="font-semibold">Bu cihazda bildirimler</span>
          <Switch
            label="Bu cihazda bildirimler"
            checked={state === 'on'}
            disabled={busy}
            onCheckedChange={(on) => void (on ? enable() : disable())}
          />
        </div>
      )}
    </SettingsCard>
  )
}
