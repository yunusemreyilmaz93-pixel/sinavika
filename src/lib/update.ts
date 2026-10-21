import { toast } from 'sonner'

function editing() {
  const el = document.activeElement
  if (el instanceof HTMLInputElement || el instanceof HTMLTextAreaElement || el instanceof HTMLSelectElement) return true
  return Boolean(document.querySelector('[role="dialog"]'))
}

export function watchForUpdates() {
  if (!('serviceWorker' in navigator)) return
  const hadController = Boolean(navigator.serviceWorker.controller)
  const loadedAt = Date.now()
  let handled = false

  navigator.serviceWorker.addEventListener('controllerchange', () => {
    if (!hadController || handled) return
    handled = true
    if (Date.now() - loadedAt < 90_000 && !editing()) {
      window.location.reload()
      return
    }
    toast('Yolumnet güncellendi', {
      description: 'Yeni sürümü kullanmak için sayfayı yenileyin.',
      duration: Infinity,
      action: { label: 'Yenile', onClick: () => window.location.reload() },
    })
  })

  document.addEventListener('visibilitychange', () => {
    if (document.visibilityState !== 'visible') return
    void navigator.serviceWorker.getRegistration().then((reg) => reg?.update())
  })
}
