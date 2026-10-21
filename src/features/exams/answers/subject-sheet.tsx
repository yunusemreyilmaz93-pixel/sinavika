import { ChevronDown } from 'lucide-react'
import { useMemo, useState } from 'react'
import { Select } from '@/components/ui/field'
import { cn } from '@/lib/cn'
import { formatNet, subjectColor, type ExamKind, type Subject, type Topic } from '@/lib/exam'
import { choices, evaluate, normalizeAnswers, normalizeKey, type Status } from './sheet'

// topics: soru numarası -> konu kimliği
export type SheetState = { key: string; answers: string; topics: Record<number, number> }
export const emptySheet: SheetState = { key: '', answers: '', topics: {} }

const cell: Record<Status, string> = {
  correct: 'bg-primary-soft text-primary-soft-fg',
  wrong: 'bg-danger-soft text-danger',
  blank: 'bg-surface-2 text-muted',
  nokey: 'border border-dashed border-danger text-danger',
}

export function SubjectSheet({
  subject,
  kind,
  topics,
  value,
  onChange,
  defaultOpen = false,
}: {
  subject: Subject
  kind: ExamKind
  topics: Topic[]
  value: SheetState
  onChange?: (next: SheetState) => void
  defaultOpen?: boolean
}) {
  const [open, setOpen] = useState(defaultOpen)
  const r = useMemo(() => evaluate(value.key, value.answers, subject.question_count, kind), [value, subject.question_count, kind])
  const missed = r.items.filter((x) => x.status === 'wrong' || x.status === 'blank')
  const readOnly = !onChange
  const set = (patch: Partial<SheetState>) => onChange?.({ ...value, ...patch })

  return (
    <div className="rounded-xl border border-line">
      <button type="button" onClick={() => setOpen(!open)} className="flex min-h-12 w-full items-center gap-3 px-3 text-left" aria-expanded={open}>
        <span className="size-2.5 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(subject) }} aria-hidden />
        <span className="min-w-0 flex-1 truncate font-semibold">{subject.name}</span>
        <span className="tabular text-sm text-muted">
          {r.filled ? (
            <>
              D {r.correct} · Y {r.wrong} · B {r.blank} · <span className="font-semibold text-fg">{formatNet(r.net)}</span>
            </>
          ) : (
            `${subject.question_count} soru`
          )}
        </span>
        <ChevronDown className={cn('size-4 shrink-0 text-subtle transition-transform', open && 'rotate-180')} />
      </button>

      {open && (
        <div className="space-y-3 border-t border-line p-3">
          {!readOnly && (
            <div className="grid gap-3 sm:grid-cols-2">
              <TextRow
                label="Cevap anahtarı"
                value={value.key}
                max={subject.question_count}
                placeholder={choices(kind).repeat(3).slice(0, 8)}
                onChange={(text) => set({ key: normalizeKey(text, kind, subject.question_count) })}
              />
              <TextRow
                label="Öğrenci cevapları"
                hint="Boş soru için tire"
                value={value.answers}
                max={subject.question_count}
                placeholder="AB-DC"
                onChange={(text) => set({ answers: normalizeAnswers(text, kind, subject.question_count) })}
              />
            </div>
          )}

          {r.filled && (
            <ol className="flex flex-wrap gap-1" aria-label={`${subject.name} soru durumu`}>
              {r.items.map((x) => (
                <li
                  key={x.number}
                  title={`${x.number}. soru${x.answer ? `, cevap ${x.answer}` : ', boş'}${x.key ? `, doğru ${x.key}` : ''}`}
                  className={cn('tabular grid size-8 place-items-center rounded-lg text-xs font-semibold', cell[x.status])}
                >
                  {x.number}
                </li>
              ))}
            </ol>
          )}
          {r.missingKey > 0 && <p className="text-sm text-danger">{r.missingKey} sorunun cevabı var ama anahtarı yok</p>}

          {missed.length > 0 && topics.length > 0 && (
            <div>
              <p className="mb-1.5 text-xs font-bold tracking-wide text-muted uppercase">Yanlış ve boş sorular</p>
              <ul className="divide-y divide-line rounded-xl border border-line">
                {missed.map((x) => {
                  const topic = topics.find((t) => t.id === value.topics[x.number])
                  return (
                    <li key={x.number} className="flex items-center gap-3 px-3 py-2">
                      <span className="tabular w-24 shrink-0 text-sm">
                        <span className="font-semibold">{x.number}.</span>{' '}
                        <span className="text-muted">
                          {x.answer ?? 'Boş'}
                          {x.key ? ` / ${x.key}` : ''}
                        </span>
                      </span>
                      {readOnly ? (
                        <span className="min-w-0 truncate text-sm">{topic?.name ?? <span className="text-muted">Konu yok</span>}</span>
                      ) : (
                        <Select
                          aria-label={`${x.number}. sorunun konusu`}
                          value={value.topics[x.number] ?? ''}
                          onChange={(e) => {
                            const next = { ...value.topics }
                            if (e.target.value) next[x.number] = Number(e.target.value)
                            else delete next[x.number]
                            set({ topics: next })
                          }}
                          className="h-10 text-sm"
                        >
                          <option value="">Konu seçin</option>
                          {topics.map((t) => (
                            <option key={t.id} value={t.id}>
                              {t.name}
                            </option>
                          ))}
                        </Select>
                      )}
                    </li>
                  )
                })}
              </ul>
            </div>
          )}
        </div>
      )}
    </div>
  )
}

function TextRow({
  label,
  hint,
  value,
  max,
  placeholder,
  onChange,
}: {
  label: string
  hint?: string
  value: string
  max: number
  placeholder: string
  onChange: (text: string) => void
}) {
  return (
    <label className="flex min-w-0 flex-col gap-1.5">
      <span className="flex items-baseline justify-between gap-2 text-sm font-semibold">
        {label}
        <span className="tabular text-xs font-normal text-muted">
          {value.length}/{max}
        </span>
      </span>
      <input
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        autoComplete="off"
        autoCapitalize="characters"
        spellCheck={false}
        enterKeyHint="next"
        className="h-11 w-full min-w-0 rounded-xl border border-line bg-surface px-3 font-mono text-[15px] tracking-wider uppercase outline-none placeholder:text-subtle focus:border-accent focus:ring-3 focus:ring-accent/15"
      />
      {hint && <span className="text-xs text-muted">{hint}</span>}
    </label>
  )
}
