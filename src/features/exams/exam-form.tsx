import { useCallback, useMemo, useRef, useState, type FormEvent } from 'react'
import { useBeforeUnload, useBlocker } from 'react-router'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardHeader } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { cn } from '@/lib/cn'
import { todayISO } from '@/lib/dates'
import { examKindsFor, examLabel, formatNet, net, subjectsFor, type ExamKind, type Field as YksField, type Subject, type Track } from '@/lib/exam'
import { errorMessage } from '@/lib/supabase'
import { useCreateExam, type ExamResult } from './queries'
import { resolveEntry, scoreGrid, ScoreRow, type Entry } from './score-row'

type Props = {
  studentId: string
  student: { track: Track; field: YksField | null }
  subjects: Subject[]
  recent: ExamResult[]
  initialKind: ExamKind | null
  onSaved: (examId: number) => void
}

export function ExamForm({ studentId, student, subjects: allSubjects, recent, initialKind, onSaved }: Props) {
  const create = useCreateExam()
  const kinds = examKindsFor(student)
  const [kind, setKind] = useState<ExamKind>(() => {
    if (initialKind && kinds.includes(initialKind)) return initialKind
    return recent.find((e) => kinds.includes(e.kind))?.kind ?? kinds[0]
  })
  const [title, setTitle] = useState('')
  const [takenOn, setTakenOn] = useState(todayISO)
  const [entries, setEntries] = useState<Record<string, Entry>>({})
  const [errors, setErrors] = useState<{ title?: string; date?: string }>({})
  const titleRef = useRef<HTMLInputElement>(null)
  const savedRef = useRef(false)

  const subjects = subjectsFor(allSubjects, kind, student.field)
  const rows = subjects.map((subject) => ({ subject, r: resolveEntry(entries[subject.id], subject, kind) }))
  const filled = rows.filter((x) => x.r.filled)
  const hasOver = rows.some((x) => x.r.over)
  const sum = filled.reduce((acc, x) => ({ c: acc.c + x.r.c, w: acc.w + x.r.w, b: acc.b + x.r.b }), { c: 0, w: 0, b: 0 })
  const totalNet = net(sum.c, sum.w, kind)
  const dirty = title.trim() !== '' || Object.values(entries).some((e) => e.c || e.w || e.b)

  const suggestions = useMemo(() => {
    const seen = new Set<string>()
    const out: string[] = []
    for (const e of recent) {
      const t = e.title.trim()
      const key = t.toLocaleLowerCase('tr')
      if (e.kind !== kind || !t || seen.has(key)) continue
      seen.add(key)
      out.push(t)
      if (out.length === 5) break
    }
    return out
  }, [recent, kind])

  const blocker = useBlocker(
    ({ currentLocation, nextLocation }) => dirty && !savedRef.current && currentLocation.pathname !== nextLocation.pathname,
  )
  useBeforeUnload(
    useCallback(
      (e: BeforeUnloadEvent) => {
        if (dirty && !savedRef.current) e.preventDefault()
      },
      [dirty],
    ),
  )

  const submit = async (e: FormEvent) => {
    e.preventDefault()
    const cleanTitle = title.trim()
    const next: typeof errors = {}
    if (!cleanTitle) next.title = 'Deneme adını yaz'
    if (!takenOn || takenOn > todayISO()) next.date = 'Bugün ya da daha önceki bir tarih seç'
    setErrors(next)
    if (next.title) return titleRef.current?.focus()
    if (next.date || hasOver) return
    if (!filled.length) return void toast.error('En az bir dersin sonucunu gir')
    try {
      const id = await create.mutateAsync({
        studentId,
        kind,
        title: cleanTitle,
        takenOn,
        scores: filled.map(({ subject, r }) => ({ subject_id: subject.id, correct: r.c, wrong: r.w, blank: r.b })),
      })
      savedRef.current = true
      toast.success('Deneme kaydedildi')
      onSaved(id)
    } catch (err) {
      toast.error(errorMessage(err))
    }
  }

  return (
    <form onSubmit={submit} noValidate className="space-y-4">
      <Card className="space-y-4 p-4 sm:p-5">
        {kinds.length > 1 && (
          <div className="space-y-1.5">
            <p className="text-sm font-semibold">
              Sınav türü
            </p>
            <Segmented
              options={kinds.map((k) => ({ value: k, label: examLabel[k] }))}
              value={kind}
              onChange={setKind}
              className="sm:max-w-xs"
            />
          </div>
        )}
        <div className="grid gap-4 sm:grid-cols-[minmax(0,1fr)_12rem]">
          <div className="space-y-2">
            <Field label="Deneme adı" hint={errors.title ? undefined : 'Yayın adı ve deneme numarası'} error={errors.title}>
              {(props) => (
                <Input
                  {...props}
                  ref={titleRef}
                  value={title}
                  maxLength={80}
                  autoComplete="off"
                  enterKeyHint="next"
                  placeholder={`Örneğin 3D ${examLabel[kind]} 4`}
                  className="text-base"
                  onChange={(e) => {
                    setTitle(e.target.value)
                    if (errors.title) setErrors((x) => ({ ...x, title: undefined }))
                  }}
                />
              )}
            </Field>
            {suggestions.length > 0 && (
              <div className="flex flex-wrap gap-1.5" role="group" aria-label="Son kullanılan adlar">
                {suggestions.map((s) => (
                  <button
                    key={s}
                    type="button"
                    aria-pressed={title.trim() === s}
                    onClick={() => {
                      setTitle(s)
                      setErrors((x) => ({ ...x, title: undefined }))
                      titleRef.current?.focus()
                    }}
                    className={cn(
                      'min-h-11 max-w-full truncate rounded-full border px-3.5 text-sm font-medium transition-colors',
                      title.trim() === s
                        ? 'border-primary bg-primary-soft text-primary-soft-fg'
                        : 'border-line bg-surface text-muted hover:border-line-strong hover:text-fg',
                    )}
                  >
                    {s}
                  </button>
                ))}
              </div>
            )}
          </div>
          <Field label="Tarih" error={errors.date}>
            {(props) => (
              <Input
                {...props}
                type="date"
                value={takenOn}
                max={todayISO()}
                className="text-base"
                onChange={(e) => {
                  setTakenOn(e.target.value)
                  if (errors.date) setErrors((x) => ({ ...x, date: undefined }))
                }}
              />
            )}
          </Field>
        </div>
      </Card>

      <Card className="overflow-hidden">
        <CardHeader title={`${examLabel[kind]} sonuçları`} description="Girilmeyen dersler kaydedilmez. Boş sayısı kendiliğinden hesaplanır." />
        <div className={cn(scoreGrid, 'mt-3 border-b border-line px-3 pb-2 text-xs font-semibold text-muted sm:px-5')} aria-hidden>
          <span>Ders</span>
          <span className="text-center">Doğru</span>
          <span className="text-center">Yanlış</span>
          <span className="text-center">Boş</span>
          <span className="text-right">Net</span>
        </div>
        <ul className="divide-y divide-line">
          {subjects.map((subject) => (
            <ScoreRow
              key={subject.id}
              subject={subject}
              kind={kind}
              entry={entries[subject.id]}
              onChange={(entry) => setEntries((all) => ({ ...all, [subject.id]: entry }))}
            />
          ))}
        </ul>
      </Card>

      <div className="sticky bottom-[calc(4.75rem+env(safe-area-inset-bottom))] z-20 lg:bottom-4">
        <div className="flex items-center gap-3 rounded-2xl border border-line bg-surface p-2.5 pl-4 shadow-pop">
          <div className="min-w-0 flex-1" aria-live="polite">
            <p className="text-xs font-semibold text-muted">Toplam net</p>
            <p className="flex flex-wrap items-baseline gap-x-2">
              <span className={cn('tabular font-display text-2xl leading-tight font-extrabold', hasOver && 'text-danger')}>{formatNet(totalNet)}</span>
              <span className="tabular text-xs text-muted">
                D {sum.c} · Y {sum.w} · B {sum.b}
              </span>
            </p>
          </div>
          <Button type="submit" size="lg" loading={create.isPending} disabled={hasOver}>
            Kaydet
          </Button>
        </div>
        {hasOver && <p className="sr-only">Soru sayısını aşan dersler var</p>}
      </div>

      <Confirm
        open={blocker.state === 'blocked'}
        onOpenChange={(open) => {
          if (!open && blocker.state === 'blocked') blocker.reset()
        }}
        title="Sayfadan çıkılsın mı?"
        description="Kaydedilmemiş deneme sonuçları silinir."
        confirmLabel="Çık"
        onConfirm={() => blocker.proceed?.()}
      />
    </form>
  )
}
