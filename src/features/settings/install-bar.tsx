import { Download, X } from 'lucide-react'
import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { LogoMark } from '@/components/ui/logo'
import { Modal } from '@/components/ui/modal'
import { useInstallState } from '@/lib/install'
import { detectInstall, InstallSteps, runInstallPrompt } from './install-card'

const KEY = 'izlek-kurulum-gizle'
const HIDE_DAYS = 14

function hiddenRecently() {
  try {
    const at = Number(localStorage.getItem(KEY))
    return at > 0 && Date.now() - at < HIDE_DAYS * 86_400_000
  } catch {
    return false
  }
}

// Telefonda, uygulama ana ekrana eklenmemişse alt menünün üstünde çıkar. Kapatılınca iki hafta görünmez
export function InstallBar() {
  const { prompt, done } = useInstallState()
  const [env] = useState(detectInstall)
  const [hidden, setHidden] = useState(hiddenRecently)
  const [steps, setSteps] = useState(false)
  const [busy, setBusy] = useState(false)

  if (!env.mobile || env.standalone || done || hidden) return null

  function hide() {
    try {
      localStorage.setItem(KEY, String(Date.now()))
    } catch {
      // Kaydedilemezse yalnızca bu açılışta gizlenir
    }
    setHidden(true)
  }

  async function add() {
    if (!prompt) return setSteps(true)
    setBusy(true)
    try {
      await runInstallPrompt()
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <div
        role="region"
        aria-label="Uygulamayı ana ekrana ekleyin"
        className="animate-fade-in fixed inset-x-3 bottom-[calc(4.75rem+env(safe-area-inset-bottom))] z-[45] mx-auto flex max-w-md items-center gap-3 rounded-2xl border border-line bg-surface py-1.5 pr-1.5 pl-3 shadow-pop lg:hidden"
      >
        <LogoMark className="size-9" />
        <p className="min-w-0 flex-1 text-sm leading-snug font-semibold">İzlek'i ana ekrana ekleyin</p>
        <Button size="sm" className="min-h-11 shrink-0" onClick={() => void add()} loading={busy}>
          {!busy && prompt && <Download />}
          {prompt ? 'Ekle' : 'Nasıl?'}
        </Button>
        <button type="button" onClick={hide} aria-label="Kapat" className="grid size-11 shrink-0 place-items-center rounded-xl text-muted hover:bg-surface-2">
          <X className="size-5" />
        </button>
      </div>
      <Modal open={steps} onOpenChange={setSteps} title="Ana ekrana ekleyin" size="sm">
        <InstallSteps ios={env.ios} />
      </Modal>
    </>
  )
}
