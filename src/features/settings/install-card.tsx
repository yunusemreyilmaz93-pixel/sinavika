import { Download, EllipsisVertical, Share, Smartphone, SquarePlus } from 'lucide-react'
import { useState, type ReactNode } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { takeInstallPrompt, useInstallState } from '@/lib/install'
import { SettingsCard } from './ui'

function detect() {
  const ua = navigator.userAgent
  const standalone =
    window.matchMedia('(display-mode: standalone)').matches || (navigator as Navigator & { standalone?: boolean }).standalone === true
  const ios = /iphone|ipad|ipod/i.test(ua) || (ua.includes('Macintosh') && navigator.maxTouchPoints > 1)
  const android = /android/i.test(ua)
  return { standalone, ios, android, mobile: ios || android }
}

function Step({ n, children }: { n: number; children: ReactNode }) {
  return (
    <li className="flex items-start gap-3">
      <span className="tabular grid size-6 shrink-0 place-items-center rounded-full bg-primary-soft text-xs font-bold text-primary-soft-fg">{n}</span>
      <span className="pt-0.5 text-sm leading-relaxed">{children}</span>
    </li>
  )
}

const inlineIcon = 'mx-0.5 inline size-4 -translate-y-px align-middle text-accent'

export function InstallCard() {
  const { prompt, done } = useInstallState()
  const [env] = useState(detect)
  const [busy, setBusy] = useState(false)

  if (env.standalone || done) return null
  if (!prompt && !env.mobile) return null

  async function install() {
    const event = takeInstallPrompt()
    if (!event) return
    setBusy(true)
    try {
      await event.prompt()
      const choice = await event.userChoice
      if (choice.outcome === 'accepted') toast.success('Yolumnet ana ekrana eklendi')
    } finally {
      setBusy(false)
    }
  }

  return (
    <SettingsCard
      icon={Smartphone}
      title={env.mobile ? 'Uygulamayı telefona ekle' : 'Uygulamayı yükle'}
      description="Yolumnet'i ana ekrandan tek dokunuşla aç."
    >
      {prompt ? (
        <Button onClick={() => void install()} loading={busy} className="w-full sm:w-auto">
          {!busy && <Download />}
          {env.mobile ? 'Ana ekrana ekle' : 'Yükle'}
        </Button>
      ) : env.ios ? (
        <ol className="space-y-2.5">
          <Step n={1}>
            Safari'de alttaki <Share className={inlineIcon} aria-label="Paylaş" /> <b className="font-semibold">Paylaş</b> düğmesine dokun.
          </Step>
          <Step n={2}>
            <SquarePlus className={inlineIcon} aria-hidden /> <b className="font-semibold">Ana Ekrana Ekle</b> seçeneğini bul.
          </Step>
          <Step n={3}>
            Sağ üstteki <b className="font-semibold">Ekle</b> düğmesine dokun.
          </Step>
        </ol>
      ) : (
        <ol className="space-y-2.5">
          <Step n={1}>
            Tarayıcının sağ üstündeki <EllipsisVertical className={inlineIcon} aria-label="menü" /> menüye dokun.
          </Step>
          <Step n={2}>
            <b className="font-semibold">Ana ekrana ekle</b> ya da <b className="font-semibold">Uygulamayı yükle</b> seçeneğine dokun.
          </Step>
        </ol>
      )}
    </SettingsCard>
  )
}
