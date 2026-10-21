import { Plus, X } from 'lucide-react'
import { useLayoutEffect, useRef, useState, type KeyboardEvent, type TextareaHTMLAttributes } from 'react'
import { Button } from '@/components/ui/button'
import { Input, Textarea } from '@/components/ui/field'
import { cn } from '@/lib/cn'

const canon = (s: string) => s.split('\n').map((l) => l.trim()).filter(Boolean).join('\n')

// Satırlar yerel tutulur: boş satır ve sondaki boşluk korunur. Metin dışarıdan değişince (geri al gibi) yeniden okunur
export function useRows<T>(text: string, parse: (t: string) => T[], compose: (rows: T[]) => string) {
  const [rows, setRows] = useState(() => parse(text))
  const [seen, setSeen] = useState(text)
  if (text !== seen) {
    setSeen(text)
    if (canon(compose(rows)) !== canon(text)) setRows(parse(text))
  }
  return [rows, setRows] as const
}

export const oneLine = (v: string) => v.replace(/\s*\n\s*/g, ' ')

export function AutoText({ value, onChange, className, ...props }: Omit<TextareaHTMLAttributes<HTMLTextAreaElement>, 'onChange'> & { onChange: (v: string) => void }) {
  const ref = useRef<HTMLTextAreaElement>(null)
  useLayoutEffect(() => {
    const el = ref.current
    if (!el) return
    el.style.height = 'auto'
    el.style.height = `${el.scrollHeight + 2}px`
  }, [value])
  return <Textarea ref={ref} rows={1} value={value} onChange={(e) => onChange(e.target.value)} className={cn('resize-none overflow-hidden', className)} {...props} />
}

export type Column = {
  label: string
  placeholder?: string
  basis?: string
  numeric?: boolean
  options?: { value: string; label: string }[]
}

// Satır tabanlı alan. Enter sonraki kutuya geçer, son kutuda yeni satır açar
export function RowsForm({
  columns,
  rows,
  onChange,
  addLabel = 'Satır ekle',
  name,
  minRows = 1,
}: {
  columns: Column[]
  rows: string[][]
  onChange: (rows: string[][]) => void
  addLabel?: string
  name: string
  minRows?: number
}) {
  const box = useRef<HTMLDivElement>(null)
  const pending = useRef<string | null>(null)
  const reach = (r: number, c: number) => box.current?.querySelector<HTMLElement>(`[data-cell="${r}-${c}"]`)
  // Hedef kutu varsa odak hemen verilir, yoksa satır eklendikten sonra
  const focus = (r: number, c: number) => {
    const target = reach(r, c)
    if (target) target.focus()
    else pending.current = `${r}-${c}`
  }
  useLayoutEffect(() => {
    if (!pending.current) return
    const [r, c] = pending.current.split('-').map(Number)
    const target = reach(r, c)
    if (target) {
      target.focus()
      pending.current = null
    }
  })
  const empty = () => columns.map(() => '')
  const set = (r: number, c: number, value: string) => onChange(rows.map((row, i) => (i === r ? row.map((v, j) => (j === c ? value : v)) : row)))

  const onEnter = (e: KeyboardEvent, r: number, c: number) => {
    if (e.key !== 'Enter' || e.shiftKey || e.nativeEvent.isComposing) return
    e.preventDefault()
    if (c < columns.length - 1) return focus(r, c + 1)
    if (r < rows.length - 1) return focus(r + 1, 0)
    onChange([...rows, empty()])
    focus(r + 1, 0)
  }

  return (
    <div ref={box} className="space-y-2">
      {rows.map((row, r) => (
        <div key={r} className="flex items-start gap-1">
          <div className="flex min-w-0 flex-1 flex-wrap gap-2">
            {columns.map((col, c) => {
              const common = {
                'data-cell': `${r}-${c}`,
                'aria-label': `${col.label} ${r + 1}`,
                placeholder: col.placeholder ?? col.label,
                onKeyDown: (e: KeyboardEvent) => onEnter(e, r, c),
              }
              return (
                <div key={c} className="min-w-0 flex-1" style={{ flexBasis: col.basis ?? '12rem' }}>
                  {col.options ? (
                    <select
                      {...common}
                      value={row[c]}
                      onChange={(e) => set(r, c, e.target.value)}
                      className="h-11 w-full rounded-xl border border-line bg-surface px-3 text-[15px]"
                    >
                      {col.options.map((o) => (
                        <option key={o.value} value={o.value}>
                          {o.label}
                        </option>
                      ))}
                    </select>
                  ) : col.numeric ? (
                    <Input {...common} inputMode="numeric" value={row[c]} onChange={(e) => set(r, c, e.target.value.replace(/\D/g, '').slice(0, 4))} />
                  ) : (
                    <AutoText {...common} value={row[c]} onChange={(v) => set(r, c, oneLine(v))} />
                  )}
                </div>
              )
            })}
          </div>
          <button
            type="button"
            aria-label={`${name} ${r + 1} sil`}
            onClick={() => onChange(rows.length > minRows ? rows.filter((_, i) => i !== r) : [empty()])}
            className="grid size-11 shrink-0 place-items-center rounded-xl text-muted hover:bg-surface-2 hover:text-danger"
          >
            <X className="size-4" />
          </button>
        </div>
      ))}
      <Button
        type="button"
        variant="secondary"
        size="sm"
        className="min-h-11"
        onClick={() => {
          onChange([...rows, empty()])
          focus(rows.length, 0)
        }}
      >
        <Plus />
        {addLabel}
      </Button>
    </div>
  )
}
