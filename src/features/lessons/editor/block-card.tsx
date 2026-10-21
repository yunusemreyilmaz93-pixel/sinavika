import { useSortable } from '@dnd-kit/sortable'
import { CSS } from '@dnd-kit/utilities'
import { ArrowDown, ArrowUp, Copy, EllipsisVertical, GripVertical, Plus, Trash2 } from 'lucide-react'
import { memo, useEffect, useRef } from 'react'
import { Menu, MenuContent, MenuItem, MenuSeparator, MenuTrigger } from '@/components/ui/menu'
import { cn } from '@/lib/cn'
import { LessonBody } from '../markdown/render'
import { describe, IMAGE_LINE, issuesOf } from './catalog'
import { AffixForm, ImageForm, LifeTimelineForm, ListForm, PairsForm, ProseForm, QuestionForm, RawForm, SentenceLabForm, SimForm, TextBoxForm, TimelineForm, VideoForm } from './forms'
import { fromSource, isEmpty, pairRows, serializeBlock, type EditorBlock } from './model'
import type { BlockEditor } from './use-block-editor'

const Preview = memo(function Preview({ source, offset }: { source: string; offset: number }) {
  return <LessonBody source={source} questionOffset={offset} />
})

type Props = {
  block: EditorBlock
  index: number
  total: number
  offset: number
  optionCount: number
  editor: BlockEditor
  onInsert: (afterId: string) => void
  onSlash: (blockId: string) => void
  onFiles: (files: File[], afterId: string) => void
  onRemove: (id: string) => void
}

function Form({ block, optionCount, editor, onSlash, onFiles }: Pick<Props, 'block' | 'optionCount' | 'editor' | 'onSlash' | 'onFiles'>) {
  const onPatch = (change: { text?: string; attrs?: Record<string, string> }) => editor.patch(block.id, change)
  if (block.kind === 'md') {
    if (IMAGE_LINE.test(block.text.trim())) return <ImageForm text={block.text} onText={(text) => onPatch({ text })} />
    return (
      <ProseForm
        autoFocus
        value={block.text}
        onChange={(text) => onPatch({ text })}
        onSplit={() => editor.insertAfter(block.id, { kind: 'md', text: '' })}
        onSlash={() => onSlash(block.id)}
        onPasteFiles={(files) => onFiles(files, block.id)}
        onPasteBlocks={(text) => editor.insertBlocks(block.id, fromSource(text), block.text.trim() ? undefined : block.id)}
        onPasteVideo={(url) => editor.insertAfter(null, { kind: 'leaf', name: 'video', attrs: { url, baslik: '', kanal: '' } }, block.id)}
      />
    )
  }
  if (block.kind === 'leaf') {
    if (block.name === 'video') return <VideoForm block={block} onPatch={onPatch} />
    if (block.name === 'sim') return <SimForm block={block} onPatch={onPatch} />
    return <RawForm block={block} onPatch={onPatch} />
  }
  switch (block.name) {
    case 'soru':
      return <QuestionForm block={block} onPatch={onPatch} optionCount={optionCount} />
    case 'ipucu':
      return <TextBoxForm block={block} onPatch={onPatch} />
    case 'baglanti':
      return <TextBoxForm block={block} onPatch={onPatch} withTitle={false} />
    case 'hedefler':
      return <ListForm block={block} onPatch={onPatch} numbered />
    case 'neden-sonuc':
      return pairRows(block.text, '=>') ? (
        <PairsForm block={block} onPatch={onPatch} labels={['Neden', 'Sonuç']} />
      ) : (
        <RawForm block={block} onPatch={onPatch} note="Satırlar Neden => Sonuç biçiminde değil, ham metinle düzenleniyor." />
      )
    case 'dene':
      return pairRows(block.text, '=>') ? (
        <PairsForm block={block} onPatch={onPatch} labels={['Soru', 'Cevap']} numbered />
      ) : (
        <RawForm block={block} onPatch={onPatch} note="Satırlar Soru => Cevap biçiminde değil, ham metinle düzenleniyor." />
      )
    case 'cizelge':
      return <TimelineForm block={block} onPatch={onPatch} />
    case 'zaman':
      return <LifeTimelineForm block={block} onPatch={onPatch} />
    case 'formul':
      return <AffixForm block={block} onPatch={onPatch} />
    case 'cumle-lab':
      return <SentenceLabForm block={block} onPatch={onPatch} />
    default:
      return <RawForm block={block} onPatch={onPatch} />
  }
}

export function BlockCard(props: Props) {
  const { block, index, total, offset, editor, onInsert } = props
  const active = editor.activeId === block.id
  const { attributes, listeners, setNodeRef, setActivatorNodeRef, transform, transition, isDragging } = useSortable({ id: block.id })
  const node = useRef<HTMLLIElement | null>(null)
  const { label, icon: Icon } = describe(block)
  const source = serializeBlock(block)
  const issues = issuesOf(block)
  const empty = isEmpty(block)

  useEffect(() => {
    if (editor.revealId !== block.id) return
    node.current?.scrollIntoView({ block: 'center' })
    requestAnimationFrame(() =>
      node.current?.querySelector<HTMLElement>('input:not([type=radio]):not([type=file]):not([type=checkbox]), textarea, select')?.focus({ preventScroll: true }),
    )
    editor.clearReveal()
  }, [editor, block.id])

  useEffect(() => {
    if (active) node.current?.scrollIntoView({ block: 'nearest' })
  }, [active])

  const activate = () => editor.setActive(block.id)
  const showPreview = block.kind !== 'md' || !active

  return (
    <li
      ref={(el) => {
        node.current = el
        setNodeRef(el)
      }}
      style={{ transform: CSS.Translate.toString(transform), transition }}
      data-block-id={block.id}
      className={cn('relative list-none', isDragging && 'z-20 opacity-80')}
    >
      <div
        onFocusCapture={() => !active && activate()}
        className={cn(
          'rounded-2xl border bg-surface transition-colors',
          active ? 'border-accent ring-3 ring-accent/15' : 'border-transparent bg-transparent hover:border-line',
        )}
      >
        {active && (
          <div className="flex items-center gap-1 border-b border-line px-2 py-1">
            <button
              ref={setActivatorNodeRef}
              type="button"
              {...attributes}
              {...listeners}
              aria-label={`${label} bloğunu sürükle`}
              className="grid size-11 cursor-grab touch-none place-items-center rounded-xl text-muted hover:bg-surface-2 active:cursor-grabbing"
            >
              <GripVertical className="size-5" />
            </button>
            <span className="flex min-w-0 items-center gap-2 text-sm font-semibold">
              <Icon className="size-4 shrink-0 text-muted" />
              <span className="truncate">{label}</span>
            </span>
            <div className="ml-auto flex items-center">
              <button
                type="button"
                onClick={() => onInsert(block.id)}
                aria-label="Altına blok ekle"
                className="grid size-11 place-items-center rounded-xl text-muted hover:bg-surface-2 hover:text-fg"
              >
                <Plus className="size-5" />
              </button>
              <Menu>
                <MenuTrigger asChild>
                  <button type="button" aria-label="Blok işlemleri" className="grid size-11 place-items-center rounded-xl text-muted hover:bg-surface-2 hover:text-fg">
                    <EllipsisVertical className="size-5" />
                  </button>
                </MenuTrigger>
                <MenuContent>
                  <MenuItem onSelect={() => editor.move(block.id, -1)}>
                    <ArrowUp />
                    Yukarı taşı
                  </MenuItem>
                  <MenuItem onSelect={() => editor.move(block.id, 1)}>
                    <ArrowDown />
                    Aşağı taşı
                  </MenuItem>
                  <MenuItem onSelect={() => editor.duplicate(block.id)}>
                    <Copy />
                    Çoğalt
                  </MenuItem>
                  <MenuSeparator />
                  <MenuItem tone="danger" onSelect={() => props.onRemove(block.id)}>
                    <Trash2 />
                    Sil
                  </MenuItem>
                </MenuContent>
              </Menu>
            </div>
          </div>
        )}

        {active && (
          <div className="space-y-3 p-3 sm:p-4">
            {issues.length > 0 && <p className="rounded-lg bg-warning-soft px-3 py-2 text-sm text-warning-soft-fg">{issues.join('. ')}</p>}
            <Form block={block} optionCount={props.optionCount} editor={editor} onSlash={props.onSlash} onFiles={props.onFiles} />
          </div>
        )}

        {showPreview && (
          <div
            role={active ? undefined : 'button'}
            tabIndex={active ? undefined : 0}
            aria-label={active ? undefined : `${label} bloğunu düzenle`}
            onClick={active ? undefined : activate}
            onKeyDown={
              active
                ? undefined
                : (e) => {
                    if (e.key === 'Enter' || e.key === ' ') {
                      e.preventDefault()
                      activate()
                    }
                  }
            }
            className={cn(active ? 'border-t border-line bg-bg p-3 sm:p-4' : 'cursor-text p-3 sm:p-4', !active && 'min-h-11')}
          >
            {empty && !active ? (
              <p className="text-[15px] text-subtle">
                {label} bloğu boş. Düzenlemek için dokun.
              </p>
            ) : block.kind === 'box' && block.name === 'soru' && issues.length > 0 ? (
              <p className="text-[15px] text-subtle">Soru tamamlanınca önizleme görünür.</p>
            ) : (
              <div className={cn(!active && 'pointer-events-none')}>
                <Preview source={source} offset={offset} />
              </div>
            )}
          </div>
        )}
      </div>
      <span className="sr-only">
        {index + 1} / {total}
      </span>
    </li>
  )
}
