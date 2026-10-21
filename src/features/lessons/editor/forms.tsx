import { CircleAlert, Plus, RefreshCw, X } from 'lucide-react'
import { useEffect, useLayoutEffect, useRef, useState, type ClipboardEvent, type KeyboardEvent, type ReactNode } from 'react'
import { Button } from '@/components/ui/button'
import { Field, Input, Textarea } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useVideoInfo } from '@/features/video/video-field'
import { parseYouTubeId, thumbnailUrl } from '@/features/video/youtube'
import { parseAttrs, type Attrs } from '../markdown/parse'
import { IMAGE_LINE } from './catalog'
import { composeQuestion, listRows, pairRows, questionFields, type EditorBlock, type QuestionFields } from './model'

type BoxBlock = Extract<EditorBlock, { kind: 'box' }>
type LeafBlock = Extract<EditorBlock, { kind: 'leaf' }>
export type Patch = { text?: string; attrs?: Attrs }

// Form satırları boş kalabilsin diye yerel tutulur, metin değişince (geri al gibi) yeniden okunur
function useRows<T>(text: string, parse: (t: string) => T[], compose: (rows: T[]) => string) {
  const [rows, setRows] = useState(() => parse(text))
  const [seen, setSeen] = useState(text)
  if (text !== seen) {
    setSeen(text)
    if (compose(rows) !== text.trim()) setRows(parse(text))
  }
  return [rows, setRows] as const
}

function AutoText({ value, onChange, className, ...props }: Omit<React.TextareaHTMLAttributes<HTMLTextAreaElement>, 'onChange'> & { onChange: (v: string) => void }) {
  const ref = useRef<HTMLTextAreaElement>(null)
  useLayoutEffect(() => {
    const el = ref.current
    if (!el) return
    el.style.height = 'auto'
    el.style.height = `${el.scrollHeight + 2}px`
  }, [value])
  return <Textarea ref={ref} rows={1} value={value} onChange={(e) => onChange(e.target.value)} className={cn('resize-none overflow-hidden', className)} {...props} />
}

function RowButtons({ onAdd, addLabel }: { onAdd: () => void; addLabel: string }) {
  return (
    <Button type="button" variant="secondary" size="sm" className="min-h-11" onClick={onAdd}>
      <Plus />
      {addLabel}
    </Button>
  )
}

function Remove({ onClick, label }: { onClick: () => void; label: string }) {
  return (
    <button type="button" onClick={onClick} aria-label={label} className="grid size-11 shrink-0 place-items-center rounded-xl text-muted hover:bg-surface-2 hover:text-danger">
      <X className="size-4" />
    </button>
  )
}

export function RawForm({ block, onPatch, note }: { block: BoxBlock | LeafBlock; onPatch: (p: Patch) => void; note?: ReactNode }) {
  const source = Object.entries(block.attrs).map(([k, v]) => `${k}="${v}"`).join(' ')
  const [attrs, setAttrs] = useState(source)
  const [seen, setSeen] = useState(source)
  if (source !== seen) {
    setSeen(source)
    setAttrs(source)
  }
  return (
    <div className="space-y-3">
      {note && <p className="text-sm text-muted">{note}</p>}
      <Field label="Özellikler" hint={'Örnek: baslik="Başlık" cevap="C"'}>
        {(props) => (
          <Input {...props} value={attrs} onChange={(e) => setAttrs(e.target.value)} onBlur={() => onPatch({ attrs: parseAttrs(`{${attrs}}`) })} className="font-mono text-[14px]" />
        )}
      </Field>
      {block.kind === 'box' && (
        <Field label="İçerik">
          {(props) => <AutoText {...props} value={block.text} onChange={(text) => onPatch({ text })} className="min-h-24 font-mono text-[14px]" />}
        </Field>
      )}
    </div>
  )
}

export function TextBoxForm({ block, onPatch, withTitle = true, hint }: { block: BoxBlock; onPatch: (p: Patch) => void; withTitle?: boolean; hint?: string }) {
  return (
    <div className="space-y-3">
      {withTitle && (
        <Field label="Başlık" hint="İsteğe bağlı">
          {(props) => <Input {...props} value={block.attrs.baslik ?? ''} onChange={(e) => onPatch({ attrs: { ...block.attrs, baslik: e.target.value } })} />}
        </Field>
      )}
      <Field label="Metin" hint={hint}>
        {(props) => <AutoText {...props} value={block.text} onChange={(text) => onPatch({ text })} className="min-h-24" />}
      </Field>
    </div>
  )
}

export function ListForm({ block, onPatch, numbered }: { block: BoxBlock; onPatch: (p: Patch) => void; numbered?: boolean }) {
  const compose = (rows: string[]) => rows.filter((r) => r.trim()).map((r, i) => (numbered ? `${i + 1}. ${r}` : `- ${r}`)).join('\n')
  const [rows, setRows] = useRows(block.text, (t) => { const r = listRows(t); return r.length ? r : [''] }, compose)
  const update = (next: string[]) => {
    setRows(next)
    onPatch({ text: compose(next) })
  }
  return (
    <div className="space-y-2">
      {rows.map((row, i) => (
        <div key={i} className="flex items-start gap-1">
          <span className="tabular grid h-11 w-6 shrink-0 place-items-center text-sm text-muted">{i + 1}</span>
          <AutoText value={row} onChange={(v) => update(rows.map((r, j) => (j === i ? v : r)))} aria-label={`Madde ${i + 1}`} />
          <Remove label={`Madde ${i + 1} sil`} onClick={() => update(rows.length > 1 ? rows.filter((_, j) => j !== i) : [''])} />
        </div>
      ))}
      <RowButtons onAdd={() => update([...rows, ''])} addLabel="Madde ekle" />
    </div>
  )
}

export function PairsForm({
  block,
  onPatch,
  labels,
  numbered,
}: {
  block: BoxBlock
  onPatch: (p: Patch) => void
  labels: [string, string]
  numbered?: boolean
}) {
  const parse = (t: string): [string, string][] => { const r = pairRows(t, '=>') ?? []; return r.length ? r : [['', '']] }
  const compose = (rows: [string, string][]) =>
    rows.filter(([a, b]) => a.trim() || b.trim()).map(([a, b], i) => `${numbered ? `${i + 1}.` : '-'} ${a} => ${b}`).join('\n')
  const [rows, setRows] = useRows(block.text, parse, compose)
  const update = (next: [string, string][]) => {
    setRows(next)
    onPatch({ text: compose(next) })
  }
  return (
    <div className="space-y-3">
      {rows.map(([a, b], i) => (
        <div key={i} className="flex items-start gap-1 rounded-xl border border-line p-2">
          <div className="grid min-w-0 flex-1 gap-2 sm:grid-cols-2">
            <AutoText value={a} placeholder={labels[0]} aria-label={`${labels[0]} ${i + 1}`} onChange={(v) => update(rows.map((r, j) => (j === i ? [v, r[1]] : r)))} />
            <AutoText value={b} placeholder={labels[1]} aria-label={`${labels[1]} ${i + 1}`} onChange={(v) => update(rows.map((r, j) => (j === i ? [r[0], v] : r)))} />
          </div>
          <Remove label={`Satır ${i + 1} sil`} onClick={() => update(rows.length > 1 ? rows.filter((_, j) => j !== i) : [['', '']])} />
        </div>
      ))}
      <RowButtons onAdd={() => update([...rows, ['', '']])} addLabel="Satır ekle" />
    </div>
  )
}

export function TimelineForm({ block, onPatch }: { block: BoxBlock; onPatch: (p: Patch) => void }) {
  const parse = (t: string): [string, string][] => {
    const r = listRows(t).map((l): [string, string] => { const at = l.indexOf('|'); return at === -1 ? ['', l] : [l.slice(0, at).trim(), l.slice(at + 1).trim()] })
    return r.length ? r : [['', '']]
  }
  const compose = (rows: [string, string][]) => rows.filter(([a, b]) => a.trim() || b.trim()).map(([a, b]) => `- ${a} | ${b}`).join('\n')
  const [rows, setRows] = useRows(block.text, parse, compose)
  const update = (next: [string, string][]) => {
    setRows(next)
    onPatch({ text: compose(next) })
  }
  return (
    <div className="space-y-3">
      <Field label="Başlık" hint="İsteğe bağlı">
        {(props) => <Input {...props} value={block.attrs.baslik ?? ''} onChange={(e) => onPatch({ attrs: { ...block.attrs, baslik: e.target.value } })} />}
      </Field>
      {rows.map(([year, event], i) => (
        <div key={i} className="flex items-start gap-1">
          <Input value={year} placeholder="Yıl" aria-label={`Yıl ${i + 1}`} className="w-24 shrink-0" onChange={(e) => update(rows.map((r, j) => (j === i ? [e.target.value, r[1]] : r)))} />
          <AutoText value={event} placeholder="Olay" aria-label={`Olay ${i + 1}`} onChange={(v) => update(rows.map((r, j) => (j === i ? [r[0], v] : r)))} />
          <Remove label={`Satır ${i + 1} sil`} onClick={() => update(rows.length > 1 ? rows.filter((_, j) => j !== i) : [['', '']])} />
        </div>
      ))}
      <RowButtons onAdd={() => update([...rows, ['', '']])} addLabel="Satır ekle" />
    </div>
  )
}

export function QuestionForm({ block, onPatch, optionCount }: { block: BoxBlock; onPatch: (p: Patch) => void; optionCount: number }) {
  const parse = (t: string): QuestionFields[] => {
    const f = questionFields(t)
    if (!f) return []
    while (f.options.length < optionCount && !t.trim()) f.options.push('')
    return [f]
  }
  const compose = (rows: QuestionFields[]) => (rows[0] ? composeQuestion(rows[0]) : '')
  const [rows, setRows] = useRows(block.text, parse, compose)
  const f = rows[0]
  const [passageOpen, setPassageOpen] = useState(false)

  if (!f) {
    return (
      <RawForm
        block={block}
        onPatch={onPatch}
        note="Bu sorunun düzeni standart dışı, o yüzden ham metinle düzenleniyor. Şıkları A) ile başlat, çözümden önce --- koy."
      />
    )
  }

  const update = (next: QuestionFields, attrs?: Attrs) => {
    setRows([next])
    onPatch({ text: composeQuestion(next), ...(attrs ? { attrs } : {}) })
  }
  const answer = Math.max('ABCDE'.indexOf((block.attrs.cevap || 'A').toUpperCase()), 0)
  const letters = 'ABCDE'

  return (
    <div className="space-y-3">
      {(f.passage || passageOpen) && (
        <Field label="Alıntı" hint="İsteğe bağlı, sorunun üstünde gösterilir">
          {(props) => <AutoText {...props} value={f.passage} onChange={(passage) => update({ ...f, passage })} />}
        </Field>
      )}
      <Field label="Soru kökü" hint="Formül için $x^2$ yazabilirsin">
        {(props) => <AutoText {...props} value={f.stem} onChange={(stem) => update({ ...f, stem })} className="min-h-16" />}
      </Field>
      {!f.passage && !passageOpen && (
        <Button type="button" variant="ghost" size="sm" className="min-h-11" onClick={() => setPassageOpen(true)}>
          <Plus />
          Alıntı ekle
        </Button>
      )}
      <fieldset className="space-y-2">
        <legend className="mb-1.5 text-sm font-semibold">Şıklar ve doğru cevap</legend>
        {f.options.map((option, i) => (
          <div key={i} className="flex items-start gap-1">
            <label className={cn('grid h-11 w-11 shrink-0 cursor-pointer place-items-center rounded-xl border text-sm font-bold', answer === i ? 'border-primary bg-primary text-primary-fg' : 'border-line text-muted hover:border-line-strong')}>
              <input
                type="radio"
                name={`cevap-${block.id}`}
                className="sr-only"
                checked={answer === i}
                onChange={() => update(f, { ...block.attrs, cevap: letters[i] })}
                aria-label={`${letters[i]} şıkkı doğru cevap`}
              />
              {letters[i]}
            </label>
            <AutoText value={option} aria-label={`${letters[i]} şıkkı`} onChange={(v) => update({ ...f, options: f.options.map((o, j) => (j === i ? v : o)) })} />
            {f.options.length > 2 && i === f.options.length - 1 && (
              <Remove
                label={`${letters[i]} şıkkını sil`}
                onClick={() => update({ ...f, options: f.options.slice(0, -1) }, answer >= f.options.length - 1 ? { ...block.attrs, cevap: letters[f.options.length - 2] } : undefined)}
              />
            )}
          </div>
        ))}
        {f.options.length < 5 && (
          <RowButtons onAdd={() => update({ ...f, options: [...f.options, ''] })} addLabel={`${letters[f.options.length]} şıkkı ekle`} />
        )}
        <p className="text-sm text-muted">Doğru cevabı soldaki harfe dokunarak seç. LGS'de 4, lisede 5 şık olur.</p>
      </fieldset>
      <Field label="Çözüm" hint="İsteğe bağlı. Her adımı ayrı satıra yazabilirsin">
        {(props) => <AutoText {...props} value={f.solution} onChange={(solution) => update({ ...f, solution })} className="min-h-16" />}
      </Field>
    </div>
  )
}

export function VideoForm({ block, onPatch }: { block: LeafBlock; onPatch: (p: Patch) => void }) {
  const value = block.attrs.url || (block.attrs.id ?? '')
  const id = parseYouTubeId(value)
  const info = useVideoInfo(id)
  const invalid = value.trim() !== '' && !id
  const { attrs } = block

  useEffect(() => {
    const data = info.data
    if (!data || (attrs.baslik && attrs.kanal)) return
    onPatch({ attrs: { ...attrs, baslik: attrs.baslik || data.title || '', kanal: attrs.kanal || data.author || '' } })
    // Yalnızca bilgi geldiğinde, boş alanları doldurur
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [info.data])

  const setUrl = (url: string) => {
    const { id: _legacy, ...rest } = attrs
    void _legacy
    onPatch({ attrs: { ...rest, url } })
  }

  return (
    <div className="space-y-3">
      <Field label="YouTube bağlantısı" hint="Bağlantıyı yapıştır, başlık ve kanal kendiliğinden dolar" error={invalid ? 'Geçerli bir YouTube bağlantısı değil' : null}>
        {(props) => <Input {...props} inputMode="url" value={value} onChange={(e) => setUrl(e.target.value)} placeholder="https://www.youtube.com/watch?v=" />}
      </Field>
      {id && (
        <div className="flex gap-3 rounded-xl border border-line p-2">
          {info.isPending ? <Skeleton className="h-16 w-28 shrink-0 rounded-lg" /> : <img src={thumbnailUrl(id)} alt="" className="h-16 w-28 shrink-0 rounded-lg object-cover" />}
          <div className="min-w-0 text-sm">
            {info.isPending ? (
              <p className="text-muted">Video bilgisi getiriliyor</p>
            ) : info.data?.embeddable === false ? (
              <p className="flex items-start gap-1.5 text-danger">
                <CircleAlert className="mt-0.5 size-4 shrink-0" />
                Bu video sitede oynatılamıyor olabilir. Sahibi gömmeyi kapatmış.
              </p>
            ) : (
              <p className="truncate font-semibold">{info.data?.title ?? 'Başlık alınamadı'}</p>
            )}
            {info.data?.author && <p className="truncate text-muted">{info.data.author}</p>}
          </div>
        </div>
      )}
      <div className="grid gap-3 sm:grid-cols-2">
        <Field label="Başlık">{(props) => <Input {...props} value={attrs.baslik ?? ''} onChange={(e) => onPatch({ attrs: { ...attrs, baslik: e.target.value } })} />}</Field>
        <Field label="Kanal">{(props) => <Input {...props} value={attrs.kanal ?? ''} onChange={(e) => onPatch({ attrs: { ...attrs, kanal: e.target.value } })} />}</Field>
      </div>
      <Field label="Etiket" hint="İsteğe bağlı, örneğin Konu anlatımı videosu">
        {(props) => <Input {...props} value={attrs.etiket ?? ''} onChange={(e) => onPatch({ attrs: { ...attrs, etiket: e.target.value } })} />}
      </Field>
      {id && info.data && (
        <Button type="button" variant="ghost" size="sm" className="min-h-11" onClick={() => onPatch({ attrs: { ...attrs, baslik: info.data?.title ?? attrs.baslik ?? '', kanal: info.data?.author ?? attrs.kanal ?? '' } })}>
          <RefreshCw />
          Başlık ve kanalı yeniden getir
        </Button>
      )}
    </div>
  )
}

export function SimForm({ block, onPatch }: { block: LeafBlock; onPatch: (p: Patch) => void }) {
  return (
    <Field label="Simülasyon">
      {(props) => (
        <select {...props} value={block.attrs.tur ?? 'gaz'} onChange={(e) => onPatch({ attrs: { ...block.attrs, tur: e.target.value } })} className="h-11 w-full rounded-xl border border-line bg-surface px-3 text-[15px]">
          <option value="gaz">Gaz parçacıkları (basınç, sıcaklık, hacim)</option>
        </select>
      )}
    </Field>
  )
}

export function ImageForm({ text, onText }: { text: string; onText: (t: string) => void }) {
  const m = IMAGE_LINE.exec(text.trim())
  const [caption = '', source = ''] = (m?.[3] ?? '').split(/\s\|\s/)
  if (!m) return null
  const compose = (alt: string, c: string, s: string) => {
    const title = [c.trim(), s.trim()].filter(Boolean).join(' | ')
    return `![${alt}](${m[2]}${title ? ` "${title.replace(/"/g, "'")}"` : ''})`
  }
  return (
    <div className="space-y-3">
      <img src={m[2]} alt="" className="max-h-48 rounded-xl border border-line object-contain" />
      <Field label="Alt metin" hint="Görmeyen öğrenciler için görselin ne gösterdiği">
        {(props) => <Input {...props} value={m[1]} onChange={(e) => onText(compose(e.target.value.replace(/[\]\n]/g, ' '), caption, source))} />}
      </Field>
      <div className="grid gap-3 sm:grid-cols-2">
        <Field label="Açıklama">{(props) => <Input {...props} value={caption} onChange={(e) => onText(compose(m[1], e.target.value.replace(/\|/g, '/'), source))} />}</Field>
        <Field label="Kaynak ve lisans">{(props) => <Input {...props} value={source} onChange={(e) => onText(compose(m[1], caption, e.target.value))} />}</Field>
      </div>
    </div>
  )
}

type ProseProps = {
  value: string
  onChange: (v: string) => void
  onSplit: () => void
  onSlash: () => void
  onPasteFiles: (files: File[]) => void
  onPasteVideo: (url: string) => void
  autoFocus?: boolean
}

export function ProseForm({ value, onChange, onSplit, onSlash, onPasteFiles, onPasteVideo, autoFocus }: ProseProps) {
  const ref = useRef<HTMLTextAreaElement>(null)
  useLayoutEffect(() => {
    const el = ref.current
    if (!el) return
    el.style.height = 'auto'
    el.style.height = `${el.scrollHeight + 2}px`
  }, [value])
  useEffect(() => {
    if (autoFocus) {
      const el = ref.current
      el?.focus({ preventScroll: true })
      el?.setSelectionRange(el.value.length, el.value.length)
    }
  }, [autoFocus])

  const edit = (before: string, after: string, placeholder: string) => {
    const el = ref.current
    if (!el) return
    const { selectionStart: start, selectionEnd: end } = el
    const selected = value.slice(start, end) || placeholder
    onChange(value.slice(0, start) + before + selected + after + value.slice(end))
    requestAnimationFrame(() => {
      el.focus({ preventScroll: true })
      el.setSelectionRange(start + before.length, start + before.length + selected.length)
    })
  }

  const onKeyDown = (e: KeyboardEvent<HTMLTextAreaElement>) => {
    const mod = e.metaKey || e.ctrlKey
    if (mod && e.key.toLowerCase() === 'b') {
      e.preventDefault()
      edit('**', '**', 'önemli')
    } else if (mod && e.key.toLowerCase() === 'i') {
      e.preventDefault()
      edit('*', '*', 'vurgu')
    } else if (e.key === 'Enter' && !e.shiftKey && !mod) {
      const el = e.currentTarget
      if (el.selectionStart === value.length && /\n$/.test(value)) {
        e.preventDefault()
        onChange(value.replace(/\n+$/, ''))
        onSplit()
      }
    } else if (e.key === 'Enter' && mod) {
      e.preventDefault()
      onSplit()
    }
  }

  const onPaste = (e: ClipboardEvent<HTMLTextAreaElement>) => {
    const files = Array.from(e.clipboardData.files).filter((f) => f.type.startsWith('image/'))
    if (files.length) {
      e.preventDefault()
      onPasteFiles(files)
      return
    }
    const text = e.clipboardData.getData('text').trim()
    if (!value.trim() && parseYouTubeId(text) && /^https?:\/\//.test(text)) {
      e.preventDefault()
      onPasteVideo(text)
    }
  }

  const tool = 'min-h-11 min-w-11 px-3 text-sm font-semibold'
  return (
    <div className="space-y-2">
      <div className="scrollbar-none -mx-1 flex gap-1 overflow-x-auto px-1" role="toolbar" aria-label="Yazı biçimi">
        <Button type="button" variant="ghost" size="sm" className={tool} onClick={() => edit('**', '**', 'önemli')} aria-label="Kalın">
          <strong>K</strong>
        </Button>
        <Button type="button" variant="ghost" size="sm" className={tool} onClick={() => edit('*', '*', 'vurgu')} aria-label="Eğik">
          <em>E</em>
        </Button>
        <Button type="button" variant="ghost" size="sm" className={tool} onClick={() => edit('[', '](adres)', 'bağlantı metni')}>
          Bağlantı
        </Button>
        <Button type="button" variant="ghost" size="sm" className={tool} onClick={() => edit('$', '$', 'x^2')}>
          Formül
        </Button>
      </div>
      <Textarea
        ref={ref}
        rows={1}
        lang="tr"
        spellCheck
        value={value}
        onChange={(e) => {
          if (e.target.value === '/') {
            onSlash()
            return
          }
          onChange(e.target.value)
        }}
        onKeyDown={onKeyDown}
        onPaste={onPaste}
        aria-label="Yazı bloğu"
        placeholder="Yaz ya da blok eklemek için / yaz"
        className="min-h-12 resize-none overflow-hidden text-[16px]"
      />
      <p className="text-xs text-subtle">Yeni paragraf için Enter'a iki kez bas. Blok eklemek için boş satıra / yaz.</p>
    </div>
  )
}
