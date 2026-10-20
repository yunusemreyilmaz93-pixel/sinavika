import type { KeyboardEvent } from 'react'
import { cn } from '@/lib/cn'
import { formatNet, net, type ExamKind, type Subject } from '@/lib/exam'

export type Entry = { c: string; w: string; b: string; bManual: boolean }

const empty: Entry = { c: '', w: '', b: '', bManual: false }

export function resolveEntry(entry: Entry | undefined, subject: Subject, kind: ExamKind) {
  const e = entry ?? empty
  const c = e.c === '' ? 0 : Number(e.c)
  const w = e.w === '' ? 0 : Number(e.w)
  const typed = e.c !== '' || e.w !== ''
  const filled = typed || (e.bManual && e.b !== '')
  const b = e.bManual ? (e.b === '' ? 0 : Number(e.b)) : typed ? Math.max(0, subject.question_count - c - w) : 0
  return {
    c,
    w,
    b,
    filled,
    autoBlank: !e.bManual && typed,
    over: c + w + b > subject.question_count,
    net: net(c, w, kind),
  }
}

export const scoreGrid = 'grid grid-cols-[minmax(0,1fr)_3rem_3rem_3rem_3.25rem] items-center gap-1.5 sm:grid-cols-[minmax(0,1fr)_4.5rem_4.5rem_4.5rem_4.5rem] sm:gap-3'

function focusNext(e: KeyboardEvent<HTMLInputElement>) {
  if (e.key !== 'Enter') return
  e.preventDefault()
  const current = e.currentTarget
  const inputs = Array.from(current.form?.querySelectorAll<HTMLInputElement>('input[data-score]') ?? []).filter(
    (el) => el === current || !el.dataset.auto,
  )
  const next = inputs[inputs.indexOf(current) + 1]
  if (next) next.focus()
  else current.blur()
}

function ScoreInput({
  label,
  value,
  onChange,
  tone,
  invalid,
  auto,
}: {
  label: string
  value: string
  onChange: (value: string) => void
  tone: string
  invalid?: boolean
  auto?: boolean
}) {
  return (
    <input
      data-score
      data-auto={auto || undefined}
      aria-label={label}
      aria-invalid={invalid || undefined}
      inputMode="numeric"
      pattern="[0-9]*"
      enterKeyHint="next"
      autoComplete="off"
      maxLength={3}
      value={value}
      onChange={(e) => onChange(e.target.value.replace(/\D/g, '').replace(/^0+(?=\d)/, '').slice(0, 3))}
      onFocus={(e) => e.target.select()}
      onKeyDown={focusNext}
      className={cn(
        'tabular h-11 w-full min-w-0 rounded-xl border border-line bg-surface text-center font-display text-base font-bold transition-[border-color,box-shadow] duration-150 outline-none placeholder:font-sans placeholder:font-normal placeholder:text-subtle focus:border-accent focus:ring-3 focus:ring-accent/15',
        auto ? 'border-dashed text-muted' : tone,
        invalid && 'border-danger focus:border-danger focus:ring-danger/15',
      )}
    />
  )
}

export function ScoreRow({
  subject,
  kind,
  entry,
  onChange,
}: {
  subject: Subject
  kind: ExamKind
  entry: Entry | undefined
  onChange: (entry: Entry) => void
}) {
  const e = entry ?? empty
  const r = resolveEntry(entry, subject, kind)
  const set = (patch: Partial<Entry>) => onChange({ ...e, ...patch })

  return (
    <li className={cn(scoreGrid, 'px-3 py-2.5 transition-colors sm:px-5', r.over && 'bg-danger-soft')}>
      <div className="min-w-0">
        <p className="truncate text-[15px] font-semibold">
          <span className="sm:hidden">{subject.short}</span>
          <span className="hidden sm:inline">{subject.name}</span>
        </p>
        <p className={cn('text-xs', r.over ? 'font-semibold text-danger' : 'text-muted')}>
          {r.over ? `En fazla ${subject.question_count}` : `${subject.question_count} soru`}
        </p>
      </div>
      <ScoreInput label={`${subject.name} doğru`} value={e.c} onChange={(c) => set({ c })} tone="text-success" invalid={r.over} />
      <ScoreInput label={`${subject.name} yanlış`} value={e.w} onChange={(w) => set({ w })} tone="text-danger" invalid={r.over} />
      <ScoreInput
        label={`${subject.name} boş`}
        value={r.autoBlank ? String(r.b) : e.b}
        onChange={(b) => set({ b, bManual: b !== '' })}
        tone="text-fg"
        invalid={r.over}
        auto={r.autoBlank}
      />
      <p className={cn('tabular text-right font-display text-base font-bold', !r.filled && 'text-subtle', r.over && 'text-danger')}>
        {r.filled ? formatNet(r.net) : '-'}
        <span className="sr-only"> net</span>
      </p>
    </li>
  )
}
