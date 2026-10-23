import { useQueryClient } from '@tanstack/react-query'
import { Check, ImagePlus, Trash2 } from 'lucide-react'
import { useCallback, useRef, useState } from 'react'
import { toast } from 'sonner'
import { Avatar } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { useOpenSession } from '@/features/plan/hooks'
import { uploadAvatar } from '@/lib/api'
import { avatarKeys, avatarUrl, presetIds } from '@/lib/avatars'
import { cn } from '@/lib/cn'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { useAuth } from '@/features/auth/session'
import { checkInput } from './crop'
import { PhotoCropper } from './photo-cropper'

type Props = { open: boolean; onOpenChange: (open: boolean) => void; name: string; userId: string; current: string | null; pending: boolean }

export function AvatarDialog(props: Props) {
  const session = useOpenSession(props.open)
  return <Dialog key={session} {...props} />
}

function Dialog({ open, onOpenChange, name, userId, current, pending }: Props) {
  const qc = useQueryClient()
  const { refresh } = useAuth()
  const [tab, setTab] = useState<'hazir' | 'foto'>('hazir')
  const [file, setFile] = useState<File | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const input = useRef<HTMLInputElement>(null)

  const done = async () => {
    await Promise.all([qc.invalidateQueries({ queryKey: avatarKeys.all }), qc.invalidateQueries({ queryKey: ['avatar', 'pending'] }), refresh()])
  }

  const choosePreset = async (preset: string | null) => {
    setBusy(true)
    setError(null)
    try {
      unwrap(await supabase.rpc('set_avatar_preset', { p_preset: preset }))
      await done()
      toast.success(preset ? 'Avatar güncellendi' : 'Avatar kaldırıldı')
      onOpenChange(false)
    } catch (err) {
      setError(errorMessage(err))
    } finally {
      setBusy(false)
    }
  }

  const pick = (selected: File | undefined) => {
    if (!selected) return
    const invalid = checkInput(selected)
    if (invalid) return setError(invalid)
    setError(null)
    setFile(selected)
  }

  const upload = async (blob: Blob) => {
    setBusy(true)
    setError(null)
    try {
      const result = await uploadAvatar(blob)
      await done()
      toast.success(result.status === 'approved' ? 'Fotoğraf güncellendi' : 'Fotoğraf incelemeye alındı. Onaylanınca görünür')
      onOpenChange(false)
    } catch (err) {
      setError(errorMessage(err))
      setFile(null)
    } finally {
      setBusy(false)
    }
  }

  const cropError = useCallback((message: string) => {
    setError(message)
    setFile(null)
  }, [])

  return (
    <Modal open={open} onOpenChange={onOpenChange} title="Avatar" size="md">
      <div className="space-y-5">
        <div className="flex items-center gap-3">
          <Avatar name={name} userId={userId} className="size-16 text-xl" />
          <div className="min-w-0 flex-1">
            <p className="truncate font-semibold">{name}</p>
            {pending && <p className="text-sm text-muted">Yüklediğiniz fotoğraf incelemede</p>}
          </div>
          {current && (
            <Button variant="ghost" onClick={() => void choosePreset(null)} disabled={busy}>
              <Trash2 className="text-muted" />
              Kaldır
            </Button>
          )}
        </div>

        {!file && (
          <Segmented
            size="sm"
            options={[
              { value: 'hazir' as const, label: 'Hazır avatarlar' },
              { value: 'foto' as const, label: 'Fotoğraf yükle' },
            ]}
            value={tab}
            onChange={(v) => {
              setTab(v)
              setError(null)
            }}
          />
        )}

        {error && (
          <p role="alert" className="text-sm font-medium text-danger">
            {error}
          </p>
        )}

        {file ? (
          <PhotoCropper file={file} busy={busy} onCancel={() => setFile(null)} onConfirm={(b) => void upload(b)} onError={cropError} />
        ) : tab === 'hazir' ? (
          <div role="radiogroup" aria-label="Hazır avatarlar" className="grid grid-cols-4 gap-2.5 sm:grid-cols-6">
            {presetIds.map((id) => {
              const active = current === `preset:${id}`
              return (
                <button
                  key={id}
                  type="button"
                  role="radio"
                  aria-checked={active}
                  aria-label={`Avatar ${Number(id.slice(1))}`}
                  disabled={busy}
                  onClick={() => void choosePreset(id)}
                  className={cn(
                    'relative aspect-square min-h-11 overflow-hidden rounded-full border-2 transition-transform active:scale-95',
                    active ? 'border-primary' : 'border-transparent hover:border-line-strong',
                  )}
                >
                  <img src={avatarUrl(`preset:${id}`)!} alt="" loading="lazy" className="size-full object-cover" />
                  {active && (
                    <span className="absolute inset-0 grid place-items-center bg-primary/25 text-primary-fg">
                      <Check className="size-6 drop-shadow" />
                    </span>
                  )}
                </button>
              )
            })}
          </div>
        ) : (
          <div className="space-y-3">
            <input
              ref={input}
              type="file"
              accept="image/jpeg,image/png,image/webp"
              className="sr-only"
              aria-label="Fotoğraf seç"
              onChange={(e) => {
                pick(e.target.files?.[0])
                e.target.value = ''
              }}
            />
            <Button variant="secondary" className="w-full" onClick={() => input.current?.click()}>
              <ImagePlus />
              Fotoğraf seç
            </Button>
            <p className="text-sm text-muted">En fazla 5 MB. Fotoğraf kırpılıp küçültülür. Uygunsuz görüntüler kabul edilmez</p>
          </div>
        )}
      </div>
    </Modal>
  )
}
