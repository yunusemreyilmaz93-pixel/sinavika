import { ChevronDown, SendHorizontal, Settings, Sparkles } from 'lucide-react'
import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { EmptyState } from '@/components/ui/empty-state'
import { Textarea } from '@/components/ui/field'
import { PageSkeleton } from '@/components/ui/skeleton'
import { useTeacherOverview } from '@/features/teacher/overview'
import { cn } from '@/lib/cn'
import { errorMessage } from '@/lib/supabase'
import { fold } from '@/lib/text'
import { ProposalCard } from './proposal-card'
import { askAssistant, useAiStatus, type ChatMessage } from './queries'

const starters = ['Hangi öğrencilere bu hafta bakmam gerekiyor?', 'Öğrencilerimin son durumunu kısaca özetle', 'Bir öğrenciyi @ ile seçip ona görev öner']

export default function AssistantPage() {
  const status = useAiStatus()
  const overview = useTeacherOverview()
  const [messages, setMessages] = useState<ChatMessage[]>([])
  const [text, setText] = useState('')
  const [pending, setPending] = useState(false)
  const [caret, setCaret] = useState(0)
  const input = useRef<HTMLTextAreaElement>(null)
  const end = useRef<HTMLDivElement>(null)

  const students = useMemo(() => (overview.data ?? []).filter((s) => !s.archived_at), [overview.data])
  const mention = /@([\p{L}]*)$/u.exec(text.slice(0, caret))
  const matches = mention ? students.filter((s) => fold(s.full_name).includes(fold(mention[1]))).slice(0, 5) : []

  useEffect(() => {
    end.current?.scrollIntoView({ block: 'end' })
  }, [messages.length, pending])

  if (status.isPending) return <PageSkeleton />

  if (!status.data?.key) {
    return (
      <div className="max-w-2xl">
        <PageHeader title="Asistan" />
        <EmptyState
          icon={Sparkles}
          title="Önce yapay zekâ anahtarını ekle"
          description={
            status.data?.configured === false
              ? 'Asistan henüz kurulmadı. Yönetici sunucu ayarını yapınca anahtarını Ayarlar bölümünden ekleyebilirsin.'
              : 'Asistan kendi yapay zekâ anahtarınla çalışır. Ayarlar bölümünden ekleyebilirsin.'
          }
          action={
            <Button asChild className="min-h-11">
              <Link to="/app/ayarlar">
                <Settings />
                Ayarlara git
              </Link>
            </Button>
          }
        />
      </div>
    )
  }

  const pick = (name: string) => {
    if (!mention) return
    const before = text.slice(0, caret).replace(/@[\p{L}]*$/u, '')
    const next = `${before}${name} ${text.slice(caret)}`
    setText(next)
    requestAnimationFrame(() => {
      input.current?.focus()
      const at = before.length + name.length + 1
      input.current?.setSelectionRange(at, at)
      setCaret(at)
    })
  }

  const send = async (content: string) => {
    const value = content.trim()
    if (!value || pending) return
    const history = [...messages, { role: 'user' as const, content: value }]
    setMessages(history)
    setText('')
    setPending(true)
    try {
      const reply = await askAssistant(history.slice(-20).map(({ role, content }) => ({ role, content })))
      setMessages([...history, { role: 'assistant', content: reply.text, proposals: reply.proposals, sent: reply.sent }])
    } catch (err) {
      toast.error(errorMessage(err))
      setMessages(messages)
      setText(value)
    } finally {
      setPending(false)
    }
  }

  return (
    <div className="mx-auto flex max-w-2xl flex-col">
      <PageHeader title="Asistan" description="Öğrencilerin hakkında soru sor, görev taslağı iste. Hiçbir şey sen onaylamadan kaydedilmez." />

      <div className="space-y-4 pb-4">
        {messages.length === 0 && (
          <div className="rounded-2xl border border-dashed border-line-strong p-5">
            <p className="text-[15px] text-muted">Mesajını yazarken adları olduğu gibi yazabilirsin. Gönderilmeden önce adlar takma kimliğe çevrilir.</p>
            <div className="mt-3 flex flex-wrap gap-2">
              {starters.map((s) => (
                <Button key={s} variant="secondary" size="sm" className="h-auto min-h-11 whitespace-normal py-2 text-left" onClick={() => setText(s)}>
                  {s}
                </Button>
              ))}
            </div>
          </div>
        )}

        {messages.map((m, i) => (
          <div key={i} className={cn('flex', m.role === 'user' ? 'justify-end' : 'justify-start')}>
            <div className={cn('max-w-[92%] rounded-2xl px-4 py-3 text-[15px] leading-relaxed', m.role === 'user' ? 'bg-primary text-primary-fg' : 'border border-line bg-surface')}>
              <p className="break-words whitespace-pre-wrap">{m.content}</p>
              {m.proposals?.map((p, j) => <ProposalCard key={j} proposal={p} />)}
              {m.sent && (
                <details className="group mt-3 text-sm">
                  <summary className="flex min-h-11 cursor-pointer list-none items-center gap-1 text-muted">
                    Bu istekte gönderilen veri
                    <ChevronDown className="size-4 transition-transform group-open:rotate-180" />
                  </summary>
                  <div className="space-y-2 rounded-lg bg-surface-2 p-3 text-[13px] text-fg">
                    <p className="text-muted">Sağlayıcıya giden metin tam olarak şudur. Adların yerinde takma kimlik görünür.</p>
                    {m.sent.turns.map((t, k) => (
                      <p key={k} className="break-words whitespace-pre-wrap">
                        <span className="font-semibold">{t.rol}: </span>
                        {t.metin}
                      </p>
                    ))}
                  </div>
                </details>
              )}
            </div>
          </div>
        ))}
        {pending && <p className="text-sm text-muted">Düşünüyor</p>}
        <div ref={end} />
      </div>

      <form
        className="sticky bottom-[calc(4.5rem+env(safe-area-inset-bottom))] z-10 rounded-2xl border border-line bg-surface p-2 lg:bottom-4"
        onSubmit={(e) => {
          e.preventDefault()
          void send(text)
        }}
      >
        {matches.length > 0 && (
          <ul className="mb-2 overflow-hidden rounded-xl border border-line" role="listbox" aria-label="Öğrenciler">
            {matches.map((s) => (
              <li key={s.id}>
                <button type="button" role="option" aria-selected={false} onClick={() => pick(s.full_name)} className="flex min-h-11 w-full items-center px-3 text-left text-[15px] hover:bg-surface-2">
                  {s.full_name}
                </button>
              </li>
            ))}
          </ul>
        )}
        <div className="flex items-end gap-2">
          <Textarea
            ref={input}
            rows={2}
            value={text}
            onChange={(e) => {
              setText(e.target.value)
              setCaret(e.target.selectionStart)
            }}
            onSelect={(e) => setCaret(e.currentTarget.selectionStart)}
            onKeyDown={(e) => {
              if (e.key === 'Enter' && !e.shiftKey && !e.nativeEvent.isComposing) {
                e.preventDefault()
                void send(text)
              }
            }}
            maxLength={4000}
            placeholder="Bir şey sor. Öğrenci seçmek için @ yaz"
            aria-label="Mesaj"
            className="min-h-12 resize-none border-0 shadow-none focus:ring-0"
          />
          <Button type="submit" size="icon" aria-label="Gönder" loading={pending} disabled={!text.trim()}>
            <SendHorizontal />
          </Button>
        </div>
      </form>
    </div>
  )
}
