import { Check, ExternalLink, Sparkles } from 'lucide-react'
import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router'
import { toast } from 'sonner'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { fetchModels, useAiStatus, useRemoveAiKey, useSaveAiKey } from '@/features/assistant/queries'
import { providerById, providers, type AiProvider } from '@/features/assistant/providers'
import { cn } from '@/lib/cn'
import { errorMessage } from '@/lib/supabase'
import { fold } from '@/lib/text'
import { SettingsCard } from './ui'

function ProviderStrip({ value, onChange }: { value: AiProvider; onChange: (p: AiProvider) => void }) {
  return (
    <div role="radiogroup" aria-label="Sağlayıcı" className="scrollbar-none -mx-5 flex snap-x snap-mandatory gap-2 overflow-x-auto px-5 pb-1 sm:mx-0 sm:flex-wrap sm:px-0">
      {providers.map((p) => {
        const selected = p.id === value
        return (
          <button
            key={p.id}
            type="button"
            role="radio"
            aria-checked={selected}
            onClick={() => onChange(p.id)}
            className={cn(
              'flex min-h-20 w-24 shrink-0 snap-start flex-col items-center justify-center gap-2 rounded-2xl border px-2 text-sm font-semibold transition-colors',
              selected ? 'border-primary bg-primary-soft text-primary-soft-fg' : 'border-line text-muted hover:border-line-strong hover:text-fg',
            )}
          >
            <p.icon className="size-7" />
            {p.label}
          </button>
        )
      })}
    </div>
  )
}

function ModelList({ models, value, onChange }: { models: string[]; value: string; onChange: (m: string) => void }) {
  const [query, setQuery] = useState('')
  const shown = useMemo(() => (query ? models.filter((m) => fold(m).includes(fold(query))) : models), [models, query])
  return (
    <div className="space-y-2">
      {models.length > 10 && <Input value={query} onChange={(e) => setQuery(e.target.value)} placeholder="Model ara" aria-label="Model ara" />}
      <div role="radiogroup" aria-label="Model" className="max-h-60 divide-y divide-line overflow-y-auto rounded-xl border border-line">
        {shown.map((m) => (
          <button
            key={m}
            type="button"
            role="radio"
            aria-checked={m === value}
            onClick={() => onChange(m)}
            className={cn('flex min-h-11 w-full items-center justify-between gap-3 px-3 text-left text-[15px] hover:bg-surface-2', m === value && 'bg-primary-soft font-semibold text-primary-soft-fg')}
          >
            <span className="min-w-0 break-all">{m}</span>
            {m === value && <Check className="size-4 shrink-0" />}
          </button>
        ))}
        {shown.length === 0 && <p className="px-3 py-3 text-sm text-muted">Eşleşen model yok</p>}
      </div>
    </div>
  )
}

export function AiKeyCard() {
  const status = useAiStatus()
  const save = useSaveAiKey()
  const remove = useRemoveAiKey()
  const [editing, setEditing] = useState(false)
  const [provider, setProvider] = useState<AiProvider>('openai')
  const [apiKey, setApiKey] = useState('')
  const [models, setModels] = useState<string[] | null>(null)
  const [loadingModels, setLoadingModels] = useState(false)
  const [listError, setListError] = useState<string | null>(null)
  const [model, setModel] = useState('')
  const [manual, setManual] = useState(false)
  const [consent, setConsent] = useState(false)
  const [confirmRemove, setConfirmRemove] = useState(false)

  const key = status.data?.key
  const open = editing || !key
  const ready = status.data?.configured
  const info = providerById[provider]
  const trimmed = apiKey.trim()

  const load = async (p: AiProvider, k: string) => {
    setLoadingModels(true)
    setListError(null)
    try {
      const list = await fetchModels(p, k)
      setModels(list)
      setModel(list[0] ?? '')
      setManual(list.length === 0)
    } catch (err) {
      setModels(null)
      setListError(errorMessage(err))
    } finally {
      setLoadingModels(false)
    }
  }

  // Anahtar yazılıp ya da yapıştırılıp durunca modeller kendiliğinden gelir
  useEffect(() => {
    if (!open || trimmed.length < 16 || /\s/.test(trimmed)) return
    const timer = setTimeout(() => void load(provider, trimmed), 700)
    return () => clearTimeout(timer)
  }, [open, provider, trimmed])

  const pickProvider = (p: AiProvider) => {
    setProvider(p)
    setApiKey('')
    setModels(null)
    setModel('')
    setListError(null)
    setManual(false)
  }

  const submit = async () => {
    try {
      await save.mutateAsync({ provider, model: model.trim(), apiKey: trimmed })
      setApiKey('')
      setModels(null)
      setModel('')
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
      description="Kendi yapay zekâ anahtarınızla çalışır. Maliyet sağlayıcıdaki hesabınıza yazılır."
      action={key ? <Badge tone="primary">Bağlı</Badge> : undefined}
    >
      {status.isPending ? (
        <Skeleton className="h-24" />
      ) : status.isError ? (
        <p className="text-sm text-danger">{errorMessage(status.error)}</p>
      ) : !ready ? (
        <p className="text-sm text-muted">Asistan henüz kurulmadı.</p>
      ) : (
        <>
          {key && !editing && (
            <div className="space-y-3">
              <div className="flex items-center gap-3">
                <span className="grid size-11 shrink-0 place-items-center rounded-xl bg-primary-soft text-primary-soft-fg">
                  {(() => {
                    const Icon = providerById[key.provider].icon
                    return <Icon className="size-6" />
                  })()}
                </span>
                <p className="min-w-0 text-sm">
                  <span className="block font-semibold">{providerById[key.provider].label}</span>
                  <span className="block break-all text-muted">
                    {key.model} · ····{key.key_last4}
                  </span>
                </p>
              </div>
              <div className="flex flex-wrap gap-2">
                <Button asChild className="min-h-11">
                  <Link to="/app/asistan">Asistanı aç</Link>
                </Button>
                <Button variant="secondary" className="min-h-11" onClick={() => setEditing(true)}>
                  Değiştir
                </Button>
                <Button variant="ghost" className="min-h-11 text-danger" onClick={() => setConfirmRemove(true)}>
                  Sil
                </Button>
              </div>
            </div>
          )}

          {open && (
            <form
              className="space-y-5"
              onSubmit={(e) => {
                e.preventDefault()
                if (consent && trimmed && model.trim()) void submit()
              }}
            >
              <ProviderStrip value={provider} onChange={pickProvider} />

              <Field label="API anahtarı" error={listError}>
                {(props) => <Input {...props} type="password" value={apiKey} onChange={(e) => setApiKey(e.target.value)} autoComplete="off" spellCheck={false} />}
              </Field>
              <a href={info.keyUrl} target="_blank" rel="noreferrer noopener" className="-mt-3 inline-flex min-h-11 items-center gap-1.5 text-sm font-semibold text-accent underline-offset-4 hover:underline">
                {info.label} anahtarı al
                <ExternalLink className="size-3.5" />
              </a>

              {loadingModels && <Skeleton className="h-24" />}
              {models && !loadingModels && (
                <div className="space-y-2">
                  <p className="text-sm font-semibold">Model</p>
                  {manual ? (
                    <Input value={model} onChange={(e) => setModel(e.target.value)} placeholder="Model adı" aria-label="Model adı" autoComplete="off" />
                  ) : (
                    <ModelList models={models} value={model} onChange={setModel} />
                  )}
                  {models.length > 0 && (
                    <Button type="button" variant="ghost" size="sm" className="min-h-11" onClick={() => setManual((m) => !m)}>
                      {manual ? 'Listeden seç' : 'Model adını elle yaz'}
                    </Button>
                  )}
                </div>
              )}

              <label className="flex items-start gap-3 text-sm leading-relaxed">
                <input type="checkbox" checked={consent} onChange={(e) => setConsent(e.target.checked)} className="mt-1 size-5 shrink-0 accent-primary" />
                <span>
                  Asistanı kullandığımda öğrenci bilgilerinin, adlar yerine takma kimlikle, seçtiğim yapay zekâ servisine gönderildiğini biliyorum.
                  Servisin gizlilik koşullarından ben sorumluyum.{' '}
                  <Link to="/kvkk#yapay-zeka" className="font-semibold text-accent underline-offset-4 hover:underline">
                    KVKK metni
                  </Link>
                </span>
              </label>
              <div className="flex flex-wrap gap-2">
                <Button type="submit" className="min-h-11" loading={save.isPending} disabled={!consent || trimmed.length < 16 || !model.trim()}>
                  Doğrula ve kaydet
                </Button>
                {key && (
                  <Button type="button" variant="ghost" className="min-h-11" onClick={() => setEditing(false)}>
                    Vazgeç
                  </Button>
                )}
              </div>
            </form>
          )}
        </>
      )}

      <Confirm
        open={confirmRemove}
        onOpenChange={setConfirmRemove}
        title="Anahtar silinsin mi?"
        description="Kayıtlı anahtar silinir."
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
