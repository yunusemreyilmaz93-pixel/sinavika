import { Sparkles } from 'lucide-react'
import { useState } from 'react'
import { Link } from 'react-router'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input, Select } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { modelHints, providerLabels, useAiStatus, useRemoveAiKey, useSaveAiKey, type AiProvider } from '@/features/assistant/queries'
import { errorMessage } from '@/lib/supabase'
import { SettingsCard } from './ui'

export function AiKeyCard() {
  const status = useAiStatus()
  const save = useSaveAiKey()
  const remove = useRemoveAiKey()
  const [editing, setEditing] = useState(false)
  const [provider, setProvider] = useState<AiProvider>('openai')
  const [model, setModel] = useState('')
  const [apiKey, setApiKey] = useState('')
  const [consent, setConsent] = useState(false)
  const [confirmRemove, setConfirmRemove] = useState(false)

  const key = status.data?.key
  const open = editing || !key
  const ready = status.data?.configured

  const submit = async () => {
    try {
      await save.mutateAsync({ provider, model: model.trim() || modelHints[provider][0], apiKey })
      setApiKey('')
      setConsent(false)
      setEditing(false)
      toast.success('Anahtar doğrulandı ve kaydedildi')
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <SettingsCard
      icon={Sparkles}
      title="Yapay zekâ asistanı"
      description="Kendi yapay zekâ anahtarınla çalışır. Maliyet sağlayıcıdaki hesabına yazılır, Yolumnet bir ücret almaz."
      action={key ? <Badge tone="primary">Bağlı</Badge> : undefined}
    >
      {status.isPending ? (
        <Skeleton className="h-24" />
      ) : status.isError ? (
        <p className="text-sm text-danger">{errorMessage(status.error)}</p>
      ) : !ready ? (
        <p className="text-sm text-muted">Asistan henüz kurulmadı. Yönetici sunucu ayarını yapınca burada anahtarını ekleyebilirsin.</p>
      ) : (
        <>
          {key && !editing && (
            <div className="space-y-3">
              <p className="text-sm">
                <span className="font-semibold">{providerLabels[key.provider]}</span>, model <span className="font-semibold">{key.model}</span>
                <br />
                <span className="text-muted">Anahtar sonu: ····{key.key_last4}. Kayıttan sonra tam anahtar bir daha gösterilmez.</span>
              </p>
              <div className="flex flex-wrap gap-2">
                <Button asChild className="min-h-11">
                  <Link to="/app/asistan">Asistanı aç</Link>
                </Button>
                <Button variant="secondary" className="min-h-11" onClick={() => setEditing(true)}>
                  Anahtarı değiştir
                </Button>
                <Button variant="ghost" className="min-h-11 text-danger" onClick={() => setConfirmRemove(true)}>
                  Anahtarı sil
                </Button>
              </div>
            </div>
          )}

          {open && (
            <form
              className="space-y-4"
              onSubmit={(e) => {
                e.preventDefault()
                if (consent && apiKey.trim()) void submit()
              }}
            >
              <Field label="Sağlayıcı">
                {(props) => (
                  <Select {...props} value={provider} onChange={(e) => { setProvider(e.target.value as AiProvider); setModel('') }}>
                    {(Object.keys(providerLabels) as AiProvider[]).map((p) => (
                      <option key={p} value={p}>
                        {providerLabels[p]}
                      </option>
                    ))}
                  </Select>
                )}
              </Field>
              <Field label="Model" hint="Boş bırakırsan önerilen model kullanılır. Sağlayıcının güncel model adını yazabilirsin">
                {(props) => (
                  <>
                    <Input {...props} list="ai-models" value={model} onChange={(e) => setModel(e.target.value)} placeholder={modelHints[provider][0]} autoComplete="off" />
                    <datalist id="ai-models">
                      {modelHints[provider].map((m) => (
                        <option key={m} value={m} />
                      ))}
                    </datalist>
                  </>
                )}
              </Field>
              <Field label="API anahtarı" hint="Sunucuda şifrelenerek saklanır. Kimse göremez, yönetici bile">
                {(props) => <Input {...props} type="password" value={apiKey} onChange={(e) => setApiKey(e.target.value)} autoComplete="off" spellCheck={false} />}
              </Field>
              <label className="flex items-start gap-3 text-sm leading-relaxed">
                <input type="checkbox" checked={consent} onChange={(e) => setConsent(e.target.checked)} className="mt-1 size-5 shrink-0 accent-primary" />
                <span>
                  Asistanı kullandığımda öğrenci bilgilerinin, adlar yerine takma kimlikle seçtiğim yapay zekâ servisine gönderildiğini biliyorum. Servisin
                  gizlilik koşullarından ben sorumluyum.{' '}
                  <Link to="/kvkk#yapay-zeka" className="font-semibold text-accent underline-offset-4 hover:underline">
                    KVKK metni
                  </Link>
                </span>
              </label>
              <div className="flex flex-wrap gap-2">
                <Button type="submit" className="min-h-11" loading={save.isPending} disabled={!consent || apiKey.trim().length < 16}>
                  Doğrula ve kaydet
                </Button>
                {key && (
                  <Button type="button" variant="ghost" className="min-h-11" onClick={() => setEditing(false)}>
                    Vazgeç
                  </Button>
                )}
              </div>
              <p className="text-sm text-muted">Kaydederken küçük bir deneme isteği gönderilir, çok küçük bir kullanım yazar.</p>
            </form>
          )}
        </>
      )}

      <Confirm
        open={confirmRemove}
        onOpenChange={setConfirmRemove}
        title="Anahtar silinsin mi?"
        description="Kayıtlı şifreli anahtar silinir. Asistanı tekrar kullanmak için yeniden eklemen gerekir."
        confirmLabel="Sil"
        onConfirm={async () => {
          try {
            await remove.mutateAsync()
            toast.success('Anahtar silindi')
          } catch (err) {
            toast.error(errorMessage(err))
            throw err
          }
        }}
      />
    </SettingsCard>
  )
}
