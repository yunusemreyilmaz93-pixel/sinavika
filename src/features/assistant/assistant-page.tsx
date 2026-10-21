import { ChevronDown, SendHorizontal, Settings, Sparkles } from 'lucide-react'
import { useEffect, useMemo, useRef, useState } from 'react'
import ReactMarkdown from 'react-markdown'
import { Link } from 'react-router'
import remarkGfm from 'remark-gfm'
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

const starters = ['Hangi öğrencilere bu hafta bakmam gerekiyor?', 'Öğrencilerimin son durumunu kısaca özetle', '@ ile bir öğrenci seçip görev önerisi isteyin']

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
          title="Önce yapay zekâ anahtarınızı ekleyin"
          description={status.data?.configured === false ? 'Asistan henüz kurulmadı.' : 'Anahtarınızı Ayarlar bölümünden ekleyebilirsiniz.'}
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
      <PageHeader title="Asistan" description="Öğrencileriniz hakkında soru sorun, görev taslağı isteyin." />

      <div className="space-y-4 pb-4">
        {messages.length === 0 && (
          <div className="rounded-2xl border border-dashed border-line-strong p-5">
            <div className="flex flex-wrap gap-2">
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
              {m.role === 'user' ? (
                <p className="break-words whitespace-pre-wrap">{m.content}</p>
              ) : (
                <div className="break-words [&_li]:mt-1 [&_ol]:list-decimal [&_ol]:pl-5 [&_p+p]:mt-2 [&_p+ul]:mt-2 [&_strong]:font-semibold [&_table]:my-2 [&_table]:block [&_table]:overflow-x-auto [&_td]:border [&_td]:border-line [&_td]:px-2 [&_td]:py-1 [&_th]:border [&_th]:border-line [&_th]:px-2 [&_th]:py-1 [&_ul]:list-disc [&_ul]:pl-5">
                  <ReactMarkdown remarkPlugins={[remarkGfm]}>{m.content}</ReactMarkdown>
                </div>
              )}
              {m.proposals?.map((p, j) => <ProposalCard key={j} proposal={p} />)}
              {m.sent && (
                <details className="group mt-3 text-sm">
                  <summary className="flex min-h-11 cursor-pointer list-none items-center gap-1 text-muted">
                    Bu istekte gönderilen veri
                    <ChevronDown className="size-4 transition-transform group-open:rotate-180" />
                  </summary>
                  <div className="space-y-2 rounded-lg bg-surface-2 p-3 text-[13px] text-fg">
                    <p className="text-muted">Sağlayıcıya giden metin. Adlar takma kimlikle değiştirilmiştir.</p>
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
            placeholder="Mesajınız. Öğrenci seçmek için @ yazın"
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
