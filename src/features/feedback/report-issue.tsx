import { ImagePlus, MessageSquareWarning, X } from 'lucide-react'
import { useEffect, useMemo, useRef, useState, type FormEvent } from 'react'
import { useLocation } from 'react-router'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Field, Textarea } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { useProfile } from '@/features/auth/session'
import { toWebp } from '@/features/lessons/queries'
import { cn } from '@/lib/cn'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'

const MAX_IMAGES = 3

export function ReportIssueButton({ className, onOpen }: { className?: string; onOpen?: () => void }) {
  const [open, setOpen] = useState(false)
  return (
    <>
      <button
        type="button"
        onClick={() => {
          onOpen?.()
          setOpen(true)
        }}
        className={cn('flex min-h-11 w-full items-center gap-3 rounded-xl px-3 py-2 text-left text-sm font-semibold text-muted transition-colors hover:bg-surface-2 hover:text-fg', className)}
      >
        <MessageSquareWarning className="size-5 shrink-0" aria-hidden />
        Hata bildir
      </button>
      <ReportIssueDialog open={open} onOpenChange={setOpen} />
    </>
  )
}

export function ReportIssueDialog({ open, onOpenChange }: { open: boolean; onOpenChange: (open: boolean) => void }) {
  return (
    <Modal open={open} onOpenChange={onOpenChange} title="Hata bildir" size="sm">
      <ReportForm onDone={() => onOpenChange(false)} />
    </Modal>
  )
}

function ReportForm({ onDone }: { onDone: () => void }) {
  const profile = useProfile()
  const location = useLocation()
  const input = useRef<HTMLInputElement>(null)
  const [message, setMessage] = useState('')
  const [files, setFiles] = useState<File[]>([])
  const [pending, setPending] = useState(false)
  const previews = useMemo(() => files.map((f) => URL.createObjectURL(f)), [files])

  useEffect(() => () => previews.forEach((url) => URL.revokeObjectURL(url)), [previews])

  const addFiles = (list: FileList | null) => {
    const images = Array.from(list ?? []).filter((f) => f.type.startsWith('image/'))
    setFiles((prev) => [...prev, ...images].slice(0, MAX_IMAGES))
    if (input.current) input.current.value = ''
  }

  const submit = async (e: FormEvent) => {
    e.preventDefault()
    if (message.trim().length < 5) return
    setPending(true)
    try {
      const images: string[] = []
      for (const file of files) {
        const blob = await toWebp(file)
        const path = `${profile.id}/${crypto.randomUUID()}.webp`
        const { error } = await supabase.storage.from('bug-reports').upload(path, blob, { contentType: 'image/webp' })
        if (error) throw new AppError('Ekran görüntüsü yüklenemedi. Tekrar deneyin')
        images.push(path)
      }
      unwrap(
        await supabase.from('bug_reports').insert({
          message: message.trim(),
          path: `${location.pathname}${location.search}`.slice(0, 300),
          user_agent: navigator.userAgent.slice(0, 300),
          images,
        }),
      )
      toast.success('Bildirim gönderildi. Teşekkürler')
      onDone()
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setPending(false)
    }
  }

  return (
    <form onSubmit={submit} className="space-y-4">
      <Field label="Ne oldu?" hint="Sayfa adresi ve cihaz bilgisi kendiliğinden eklenir.">
        {(props) => (
          <Textarea
            {...props}
            rows={5}
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            maxLength={2000}
            placeholder="Örnek: Konular sayfasında Anlatım düğmesine basınca sayfa açılmadı"
            autoFocus
          />
        )}
      </Field>

      <div>
        <input ref={input} type="file" accept="image/*" multiple hidden onChange={(e) => addFiles(e.target.files)} />
        {previews.length > 0 && (
          <ul className="mb-3 flex flex-wrap gap-2">
            {previews.map((url, i) => (
              <li key={url} className="relative">
                <img src={url} alt={`Ekran görüntüsü ${i + 1}`} className="size-20 rounded-xl border border-line object-cover" />
                <button
                  type="button"
                  onClick={() => setFiles((prev) => prev.filter((_, j) => j !== i))}
                  aria-label={`Ekran görüntüsü ${i + 1} kaldır`}
                  className="absolute -top-2 -right-2 grid size-7 place-items-center rounded-full border border-line bg-surface text-muted shadow-card hover:text-danger"
                >
                  <X className="size-4" />
                </button>
              </li>
            ))}
          </ul>
        )}
        {files.length < MAX_IMAGES && (
          <Button type="button" variant="secondary" className="min-h-11" onClick={() => input.current?.click()}>
            <ImagePlus />
            Ekran görüntüsü ekle
          </Button>
        )}
      </div>

      <Button type="submit" className="min-h-11 w-full" loading={pending} disabled={message.trim().length < 5}>
        Gönder
      </Button>
    </form>
  )
}
