import { CircleAlert, Plus, RefreshCw, X } from 'lucide-react'
import { useEffect, useLayoutEffect, useRef, useState, type ClipboardEvent, type KeyboardEvent, type ReactNode } from 'react'
import { Button } from '@/components/ui/button'
import { Field, Input, Textarea } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useVideoInfo } from '@/features/video/video-field'
import { parseYouTubeId, thumbnailUrl } from '@/features/video/youtube'
import { parseAttrs, parseLabSentence, type Attrs } from '../markdown/parse'
import { IMAGE_LINE } from './catalog'
import { composeQuestion, listRows, pairRows, questionFields, type EditorBlock, type QuestionFields } from './model'
import { AutoText, oneLine, RowsForm, useRows } from './rows'

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

type BoxBlock = Extract<EditorBlock, { kind: 'box' }>
type LeafBlock = Extract<EditorBlock, { kind: 'leaf' }>
export type Patch = { text?: string; attrs?: Attrs }

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
        <Field label="Başlık">
          {(props) => <Input {...props} value={block.attrs.baslik ?? ''} onChange={(e) => onPatch({ attrs: { ...block.attrs, baslik: e.target.value } })} />}
        </Field>
      )}
      <Field label="Metin" hint={hint}>
        {(props) => <AutoText {...props} value={block.text} onChange={(text) => onPatch({ text })} className="min-h-24" />}
      </Field>
    </div>
  )
}

const cell = (v: string) => v.trim()

export function ListForm({ block, onPatch, numbered }: { block: BoxBlock; onPatch: (p: Patch) => void; numbered?: boolean }) {
  const parse = (t: string) => { const r = listRows(t).map((x) => [x]); return r.length ? r : [['']] }
  const compose = (rows: string[][]) => rows.map(([x]) => cell(x)).filter(Boolean).map((x, i) => (numbered ? `${i + 1}. ${x}` : `- ${x}`)).join('\n')
  const [rows, setRows] = useRows(block.text, parse, compose)
  const update = (next: string[][]) => {
    setRows(next)
    onPatch({ text: compose(next) })
  }
  return <RowsForm name="Madde" columns={[{ label: 'Madde', basis: '16rem' }]} rows={rows} onChange={update} addLabel="Madde ekleyin" />
}

export function PairsForm({ block, onPatch, labels, numbered }: { block: BoxBlock; onPatch: (p: Patch) => void; labels: [string, string]; numbered?: boolean }) {
  const parse = (t: string): string[][] => { const r = (pairRows(t, '=>') ?? []).map(([a, b]) => [a, b]); return r.length ? r : [['', '']] }
  const compose = (rows: string[][]) =>
    rows.filter(([a, b]) => a.trim() || b.trim()).map(([a, b], i) => `${numbered ? `${i + 1}.` : '-'} ${cell(a)} => ${cell(b)}`).join('\n')
  const [rows, setRows] = useRows(block.text, parse, compose)
  const update = (next: string[][]) => {
    setRows(next)
    onPatch({ text: compose(next) })
  }
  return <RowsForm name="Satır" columns={[{ label: labels[0] }, { label: labels[1] }]} rows={rows} onChange={update} />
}

export function TimelineForm({ block, onPatch }: { block: BoxBlock; onPatch: (p: Patch) => void }) {
  const parse = (t: string): string[][] => {
    const r = listRows(t).map((l): string[] => { const at = l.indexOf('|'); return at === -1 ? ['', l] : [l.slice(0, at).trim(), l.slice(at + 1).trim()] })
    return r.length ? r : [['', '']]
  }
  const compose = (rows: string[][]) => rows.filter(([a, b]) => a.trim() || b.trim()).map(([a, b]) => `- ${cell(a)} | ${cell(b)}`).join('\n')
  const [rows, setRows] = useRows(block.text, parse, compose)
  const update = (next: string[][]) => {
    setRows(next)
    onPatch({ text: compose(next) })
  }
  return (
    <div className="space-y-3">
      <Field label="Başlık">
        {(props) => <Input {...props} value={block.attrs.baslik ?? ''} onChange={(e) => onPatch({ attrs: { ...block.attrs, baslik: e.target.value } })} />}
      </Field>
      <RowsForm name="Olay" columns={[{ label: 'Yıl', placeholder: 'Yıl (1839)', basis: '6rem', numeric: true }, { label: 'Olay', basis: '14rem' }]} rows={rows} onChange={update} addLabel="Olay ekleyin" />
    </div>
  )
}

const ERA_RE = /^(.*):\s*(\d{3,4})\s*-\s*(\d{3,4})$/

export function LifeTimelineForm({ block, onPatch }: { block: BoxBlock; onPatch: (p: Patch) => void }) {
  const parseEvents = (t: string): string[][] => {
    const r = listRows(t).map((l): string[] => { const [y = '', o = '', d = ''] = l.split('|').map((x) => x.trim()); return [y, o, d] })
    return r.length ? r : [['', '', '']]
  }
  const composeEvents = (rows: string[][]) => rows.filter((r) => r.some((x) => x.trim())).map(([y, o, d]) => `- ${cell(y)} | ${cell(o)}${cell(d) ? ` | ${cell(d)}` : ''}`).join('\n')
  const [events, setEvents] = useRows(block.text, parseEvents, composeEvents)

  const parseEras = (raw: string): string[][] => {
    const r = raw.split(',').map((p) => ERA_RE.exec(p.trim())).filter((m): m is RegExpExecArray => m !== null).map((m) => [m[1].trim(), m[2], m[3]])
    return r
  }
  const composeEras = (rows: string[][]) => rows.filter(([n, a, b]) => n.trim() && a && b).map(([n, a, b]) => `${n.trim().replace(/[,:]/g, ' ')}:${a}-${b}`).join(',')
  const [eras, setEras] = useRows(block.attrs.donemler ?? '', parseEras, composeEras)

  return (
    <div className="space-y-4">
      <Field label="Başlık">
        {(props) => <Input {...props} value={block.attrs.baslik ?? ''} onChange={(e) => onPatch({ attrs: { ...block.attrs, baslik: e.target.value } })} />}
      </Field>
      <div className="space-y-2">
        <p className="text-sm font-semibold">Olaylar</p>
        <RowsForm
          name="Olay"
          columns={[
            { label: 'Yıl', placeholder: 'Yıl', basis: '5.5rem', numeric: true },
            { label: 'Olay', basis: '12rem' },
            { label: 'Ayrıntı', placeholder: 'Ayrıntı (isteğe bağlı)', basis: '12rem' },
          ]}
          rows={events}
          onChange={(next) => {
            setEvents(next)
            onPatch({ text: composeEvents(next) })
          }}
          addLabel="Olay ekleyin"
        />
      </div>
      <div className="space-y-2">
        <p className="text-sm font-semibold">Dönemler</p>
        <RowsForm
          name="Dönem"
          minRows={0}
          columns={[
            { label: 'Dönem adı', basis: '10rem' },
            { label: 'Başlangıç', placeholder: 'Başlangıç yılı', basis: '6rem', numeric: true },
            { label: 'Bitiş', placeholder: 'Bitiş yılı', basis: '6rem', numeric: true },
          ]}
          rows={eras.length ? eras : []}
          onChange={(next) => {
            setEras(next)
            onPatch({ attrs: { ...block.attrs, donemler: composeEras(next) } })
          }}
          addLabel="Dönem ekleyin"
        />
      </div>
    </div>
  )
}

const TONES = [
  { value: 'yesil', label: 'Yeşil' },
  { value: 'mavi', label: 'Mavi' },
  { value: 'sari', label: 'Sarı' },
]

export function AffixForm({ block, onPatch }: { block: BoxBlock; onPatch: (p: Patch) => void }) {
  const parse = (t: string): string[][] => {
    const r = listRows(t).map((l): string[] => { const [a = '', b = '', c = '', d = '', e = 'yesil'] = l.split('|').map((x) => x.trim()); return [a, b, c, d, TONES.some((t) => t.value === e) ? e : 'yesil'] })
    return r.length ? r : [['', '', '', '', 'yesil']]
  }
  const compose = (rows: string[][]) => rows.filter((r) => r.slice(0, 4).some((x) => x.trim())).map((r) => `- ${r.map(cell).join(' | ')}`).join('\n')
  const [rows, setRows] = useRows(block.text, parse, compose)
  return (
    <div className="space-y-2">
      <RowsForm
        name="Örnek"
        columns={[
          { label: 'Kök', basis: '6rem' },
          { label: 'Ek', basis: '6rem' },
          { label: 'Sonuç', basis: '7rem' },
          { label: 'Tür', placeholder: 'Tür (İsim-fiil)', basis: '8rem' },
          { label: 'Renk', basis: '6rem', options: TONES },
        ]}
        rows={rows}
        onChange={(next) => {
          setRows(next)
          onPatch({ text: compose(next) })
        }}
        addLabel="Örnek ekleyin"
      />
    </div>
  )
}

const LAB_KINDS = [
  { value: '', label: 'Düz metin' },
  { value: 'isim', label: 'İsim-fiil' },
  { value: 'sifat', label: 'Sıfat-fiil' },
  { value: 'zarf', label: 'Zarf-fiil' },
  { value: 'yuklem', label: 'Yüklem' },
]

export function SentenceLabForm({ block, onPatch }: { block: BoxBlock; onPatch: (p: Patch) => void }) {
  const parse = (t: string): string[][][] => {
    const lines = t.split('\n').filter((l) => l.trim())
    const sentences = lines.map((l) => parseLabSentence(l).map((x): string[] => [x.text, x.kind ?? '', x.note ?? '']))
    return sentences.length ? sentences : [[['', '', '']]]
  }
  const seg = (r: string[]) => `${cell(r[0]).replace(/\s\/\s/g, ' - ')}${r[1] ? `[${r[1]}|${cell(r[2]).replace(/[\]|]/g, ' ')}]` : ''}`
  const compose = (sentences: string[][][]) =>
    sentences.map((s) => s.filter((r) => cell(r[0])).map(seg).join(' / ')).filter(Boolean).map((l, i) => `${i + 1}. ${l}`).join('\n')
  const [sentences, setSentences] = useRows(block.text, (t) => parse(t), compose)
  const update = (next: string[][][]) => {
    setSentences(next)
    onPatch({ text: compose(next) })
  }
  return (
    <div className="space-y-4">
      {sentences.map((sentence, i) => (
        <div key={i} className="space-y-2 rounded-xl border border-line p-3">
          <div className="flex items-center justify-between">
            <p className="text-sm font-semibold">Cümle {i + 1}</p>
            <button
              type="button"
              aria-label={`Cümle ${i + 1} silin`}
              onClick={() => update(sentences.length > 1 ? sentences.filter((_, j) => j !== i) : [[['', '', '']]])}
              className="grid size-9 place-items-center rounded-lg text-muted hover:bg-surface-2 hover:text-danger"
            >
              <X className="size-4" />
            </button>
          </div>
          <RowsForm
            name={`Cümle ${i + 1} parçası`}
            columns={[
              { label: 'Parça', placeholder: 'Cümle parçası', basis: '10rem' },
              { label: 'Tür', basis: '7rem', options: LAB_KINDS },
              { label: 'Not', placeholder: 'Not (tür seçildiyse)', basis: '10rem' },
            ]}
            rows={sentence}
            onChange={(next) => update(sentences.map((s, j) => (j === i ? next : s)))}
            addLabel="Parça ekleyin"
          />
        </div>
      ))}
      <Button type="button" variant="secondary" size="sm" className="min-h-11" onClick={() => update([...sentences, [['', '', '']]])}>
        <Plus />
        Cümle ekleyin
      </Button>
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
  const box = useRef<HTMLDivElement>(null)
  const wanted = useRef<string | null>(null)
  const focusNow = (selector: string) => {
    const target = box.current?.querySelector<HTMLElement>(selector)
    if (target) target.focus()
    else wanted.current = selector
  }
  useLayoutEffect(() => {
    if (!wanted.current) return
    const target = box.current?.querySelector<HTMLElement>(wanted.current)
    if (target) {
      target.focus()
      wanted.current = null
    }
  })

  if (!f) {
    return (
      <RawForm
        block={block}
        onPatch={onPatch}
        note="Bu sorunun düzeni standart dışı, o yüzden ham metinle düzenleniyor. Şıkları A) ile başlatın, çözümden önce --- koyun."
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
    <div ref={box} className="space-y-3">
      {(f.passage || passageOpen) && (
        <Field label="Alıntı">
          {(props) => <AutoText {...props} value={f.passage} onChange={(passage) => update({ ...f, passage })} />}
        </Field>
      )}
      <Field label="Soru kökü">
        {(props) => <AutoText {...props} value={f.stem} onChange={(stem) => update({ ...f, stem })} className="min-h-16" />}
      </Field>
      {!f.passage && !passageOpen && (
        <Button type="button" variant="ghost" size="sm" className="min-h-11" onClick={() => setPassageOpen(true)}>
          <Plus />
          Alıntı ekleyin
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
            <AutoText
              data-opt={i}
              value={option}
              aria-label={`${letters[i]} şıkkı`}
              onChange={(v) => update({ ...f, options: f.options.map((o, j) => (j === i ? oneLine(v) : o)) })}
              onKeyDown={(e) => {
                if (e.key !== 'Enter' || e.shiftKey || e.nativeEvent.isComposing) return
                e.preventDefault()
                if (i < f.options.length - 1) focusNow(`[data-opt="${i + 1}"]`)
                else if (f.options.length < 5) {
                  update({ ...f, options: [...f.options, ''] })
                  focusNow(`[data-opt="${i + 1}"]`)
                } else focusNow('[data-solution]')
              }}
            />
            {f.options.length > 2 && i === f.options.length - 1 && (
              <Remove
                label={`${letters[i]} şıkkını silin`}
                onClick={() => update({ ...f, options: f.options.slice(0, -1) }, answer >= f.options.length - 1 ? { ...block.attrs, cevap: letters[f.options.length - 2] } : undefined)}
              />
            )}
          </div>
        ))}
        {f.options.length < 5 && (
          <RowButtons onAdd={() => update({ ...f, options: [...f.options, ''] })} addLabel={`${letters[f.options.length]} şıkkını ekleyin`} />
        )}
      </fieldset>
      <Field label="Çözüm">
        {(props) => <AutoText {...props} data-solution value={f.solution} onChange={(solution) => update({ ...f, solution })} className="min-h-16" />}
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
      <Field label="YouTube bağlantısı" error={invalid ? 'Geçerli bir YouTube bağlantısı değil' : null}>
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
                Bu video sitede oynatılamayabilir, sahibi gömmeyi kapatmış.
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
      <Field label="Etiket">
        {(props) => <Input {...props} value={attrs.etiket ?? ''} onChange={(e) => onPatch({ attrs: { ...attrs, etiket: e.target.value } })} />}
      </Field>
      {id && info.data && (
        <Button type="button" variant="ghost" size="sm" className="min-h-11" onClick={() => onPatch({ attrs: { ...attrs, baslik: info.data?.title ?? attrs.baslik ?? '', kanal: info.data?.author ?? attrs.kanal ?? '' } })}>
          <RefreshCw />
          Başlık ve kanalı yeniden getirin
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
      <Field label="Alt metin">
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
  onPasteBlocks: (text: string) => void
  autoFocus?: boolean
}

export function ProseForm({ value, onChange, onSplit, onSlash, onPasteFiles, onPasteVideo, onPasteBlocks, autoFocus }: ProseProps) {
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
      return
    }
    // Birden çok paragraf ya da blok söz dizimi içeren metin bloklara ayrılır
    if (/\n\s*\n/.test(text) || /^:{2,3}[\w-]+/m.test(text)) {
      e.preventDefault()
      onPasteBlocks(e.clipboardData.getData('text'))
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
        placeholder="Yazın ya da blok eklemek için / yazın"
        className="min-h-12 resize-none overflow-hidden text-[16px]"
      />
    </div>
  )
}
