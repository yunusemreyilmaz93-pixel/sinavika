import { CopyPlus, Pencil, Plus, Trash2 } from 'lucide-react'
import { useEffect, useMemo, useRef, useState, type FormEvent } from 'react'
import { useBlocker, useNavigate, useParams } from 'react-router'
import { toast } from 'sonner'
import { PageHeader } from '@/components/app/page-header'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { Confirm } from '@/components/ui/confirm'
import { Field, Input, Select } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { Skeleton } from '@/components/ui/skeleton'
import { cn } from '@/lib/cn'
import { useCurriculum } from '@/lib/data'
import { errorMessage } from '@/lib/supabase'
import { LoadError } from '@/features/plan/load-error'
import { useOpenSession } from '@/features/plan/hooks'
import { weekdayLong, weekdayShort, type TaskKind, type TemplateItem } from '@/features/plan/lib'
import { TaskFields, draftSuggestion, type TaskDraft } from '@/features/plan/task-fields'
import { MAX_ITEMS, MAX_WEEKS, useSaveTemplate, useTemplate, type TemplateDraft } from './queries'
import { templateWeeks } from './starters'
import { ItemLine } from './week-view'

const kinds: TaskKind[] = ['study', 'questions', 'reading', 'review', 'other']

const blank: TemplateDraft = { name: '', description: '', track: null, items: [] }

export default function TemplateEditorPage() {
  const { key } = useParams()
  const template = useTemplate(key)

  if (key && template.isPending) {
    return (
      <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-10 w-64" />
        <Skeleton className="h-72" />
      </div>
    )
  }
  if (key && template.error) return <LoadError message={errorMessage(template.error)} onRetry={() => void template.refetch()} />
  if (key && (!template.data || template.data.source !== 'own')) {
    return <PageHeader title="Şablon bulunamadı" back={{ to: '/app/sablonlar?sekme=benim', label: 'Şablonlar' }} />
  }
  const initial = template.data
    ? { name: template.data.name, description: template.data.description ?? '', track: template.data.track, items: template.data.items }
    : blank
  return <Editor id={template.data?.id ?? null} initial={initial} />
}

function Editor({ id, initial }: { id: number | null; initial: TemplateDraft }) {
  const navigate = useNavigate()
  const save = useSaveTemplate()
  const [name, setName] = useState(initial.name)
  const [description, setDescription] = useState(initial.description ?? '')
  const [track, setTrack] = useState(initial.track)
  const [items, setItems] = useState(initial.items)
  const [weeks, setWeeks] = useState(Math.max(1, templateWeeks(initial.items)))
  const [week, setWeek] = useState(0)
  const [dialog, setDialog] = useState<{ index: number | null; weekday: number } | null>(null)
  const [removeWeek, setRemoveWeek] = useState(false)
  const [nameError, setNameError] = useState<string | null>(null)
  const [dirty, setDirty] = useState(false)
  const leaving = useRef(false)

  const blocker = useBlocker(({ currentLocation, nextLocation }) => dirty && !leaving.current && currentLocation.pathname !== nextLocation.pathname)

  useEffect(() => {
    if (!dirty) return
    const handler = (event: BeforeUnloadEvent) => event.preventDefault()
    window.addEventListener('beforeunload', handler)
    return () => window.removeEventListener('beforeunload', handler)
  }, [dirty])

  const change = <T,>(set: (value: T) => void) => (value: T) => {
    set(value)
    setDirty(true)
  }
  const changeItems = (next: TemplateItem[]) => {
    setItems(next)
    setDirty(true)
  }

  const indexed = useMemo(() => items.map((item, index) => ({ item, index })), [items])
  const weekCount = items.filter((i) => i.week === week).length

  const addWeek = (copyFrom?: number) => {
    if (weeks >= MAX_WEEKS) return toast.error(`En fazla ${MAX_WEEKS} hafta eklenebilir`)
    const copied = copyFrom === undefined ? [] : items.filter((i) => i.week === copyFrom).map((i) => ({ ...i, week: weeks }))
    if (items.length + copied.length > MAX_ITEMS) return toast.error(`Şablona en fazla ${MAX_ITEMS} görev sığar`)
    changeItems([...items, ...copied])
    setWeeks(weeks + 1)
    setWeek(weeks)
  }

  const deleteWeek = () => {
    changeItems(items.filter((i) => i.week !== week).map((i) => (i.week > week ? { ...i, week: i.week - 1 } : i)))
    setWeeks(weeks - 1)
    setWeek(Math.max(0, week - 1))
  }

  const submit = async (event: FormEvent) => {
    event.preventDefault()
    if (!name.trim()) return setNameError('Şablona bir ad verin')
    try {
      const saved = await save.mutateAsync({ id, draft: { name, description, track, items } })
      toast.success('Şablon kaydedildi')
      leaving.current = true
      navigate(`/app/sablonlar/${saved}`, { replace: true })
    } catch (error) {
      toast.error(errorMessage(error))
    }
  }

  return (
    <form onSubmit={submit} noValidate>
      <PageHeader
        title={id === null ? 'Yeni şablon' : 'Şablonu düzenle'}
        back={{ to: id === null ? '/app/sablonlar?sekme=benim' : `/app/sablonlar/${id}`, label: id === null ? 'Şablonlar' : 'Şablona dön' }}
        actions={
          <Button type="submit" loading={save.isPending}>
            Kaydet
          </Button>
        }
      />

      <div className="space-y-6">
        <Card className="grid gap-4 p-4 sm:grid-cols-2 sm:p-5">
          <Field label="Ad" error={nameError}>
            {(props) => (
              <Input
                {...props}
                value={name}
                maxLength={60}
                placeholder="Örnek: TYT 4 haftalık yaz programı"
                onChange={(e) => {
                  change(setName)(e.target.value)
                  setNameError(null)
                }}
              />
            )}
          </Field>
          <Field label="Sınav türü">
            {(props) => (
              <Select {...props} value={track ?? ''} onChange={(e) => change(setTrack)((e.target.value || null) as typeof track)}>
                <option value="">Fark etmez</option>
                <option value="lgs">LGS</option>
                <option value="yks">YKS (TYT, AYT, YDT)</option>
              </Select>
            )}
          </Field>
          <Field label="Açıklama" hint="İsteğe bağlı" className="sm:col-span-2">
            {(props) => (
              <Input {...props} value={description} maxLength={200} onChange={(e) => change(setDescription)(e.target.value)} />
            )}
          </Field>
        </Card>

        <section className="space-y-4">
          <div className="flex flex-wrap items-center justify-between gap-3">
            <Segmented
              size="sm"
              options={Array.from({ length: weeks }, (_, i) => ({ value: String(i), label: `Hafta ${i + 1}` }))}
              value={String(week)}
              onChange={(v) => setWeek(Number(v))}
            />
            <div className="flex flex-wrap gap-2">
              <Button type="button" variant="secondary" size="sm" onClick={() => addWeek()} disabled={weeks >= MAX_WEEKS}>
                <Plus />
                Boş hafta
              </Button>
              <Button type="button" variant="secondary" size="sm" onClick={() => addWeek(week)} disabled={weeks >= MAX_WEEKS || !weekCount}>
                <CopyPlus />
                Bu haftayı çoğalt
              </Button>
              {weeks > 1 && (
                <Button type="button" variant="ghost" size="sm" onClick={() => (weekCount ? setRemoveWeek(true) : deleteWeek())}>
                  <Trash2 className="text-muted" />
                  Haftayı sil
                </Button>
              )}
            </div>
          </div>

          <div className="space-y-3">
            {weekdayLong.map((dayName, weekday) => {
              const list = indexed.filter(({ item }) => item.week === week && item.weekday === weekday)
              return (
                <section key={dayName}>
                  <div className="mb-1 flex items-center justify-between gap-2">
                    <h3 className="text-sm font-bold">{dayName}</h3>
                    <button
                      type="button"
                      className="-my-2 inline-flex h-11 items-center gap-1 px-1 text-sm font-semibold text-accent"
                      onClick={() => setDialog({ index: null, weekday })}
                    >
                      <Plus className="size-4" />
                      Görev ekle
                    </button>
                  </div>
                  {list.length ? (
                    <ul className="divide-y divide-line rounded-2xl border border-line bg-surface">
                      {list.map(({ item, index }) => (
                        <ItemLine
                          key={index}
                          item={item}
                          actions={
                            <>
                              <Button type="button" variant="ghost" size="icon" aria-label={`${item.title} görevini düzenle`} onClick={() => setDialog({ index, weekday })}>
                                <Pencil className="text-muted" />
                              </Button>
                              <Button
                                type="button"
                                variant="ghost"
                                size="icon"
                                aria-label={`${item.title} görevini sil`}
                                onClick={() => changeItems(items.filter((_, i) => i !== index))}
                              >
                                <Trash2 className="text-muted" />
                              </Button>
                            </>
                          }
                        />
                      ))}
                    </ul>
                  ) : (
                    <p className={cn('rounded-2xl border border-dashed border-line px-3 py-2.5 text-sm text-subtle')}>Görev yok</p>
                  )}
                </section>
              )
            })}
          </div>
          <p className="tabular text-sm text-muted">
            Toplam {items.length} görev, {weeks} hafta
          </p>
        </section>
      </div>

      {dialog && (
        <ItemDialog
          open
          onOpenChange={(open) => !open && setDialog(null)}
          track={track}
          item={dialog.index === null ? null : items[dialog.index]}
          weekday={dialog.weekday}
          onSave={(item) => {
            if (dialog.index === null) {
              if (items.length >= MAX_ITEMS) return toast.error(`Şablona en fazla ${MAX_ITEMS} görev sığar`)
              changeItems([...items, { ...item, week }])
            } else {
              changeItems(items.map((it, i) => (i === dialog.index ? { ...item, week: it.week } : it)))
            }
            setDialog(null)
          }}
        />
      )}

      <Confirm
        open={removeWeek}
        onOpenChange={setRemoveWeek}
        title="Hafta silinsin mi?"
        description={`Hafta ${week + 1} ve içindeki ${weekCount} görev şablondan çıkar.`}
        confirmLabel="Sil"
        onConfirm={deleteWeek}
      />

      <Confirm
        open={blocker.state === 'blocked'}
        onOpenChange={(open) => !open && blocker.state === 'blocked' && blocker.reset()}
        title="Değişiklikler kaydedilmedi"
        description="Ayrılırsanız yaptığınız değişiklikler kaybolur."
        confirmLabel="Ayrıl"
        onConfirm={() => blocker.state === 'blocked' && blocker.proceed()}
      />
    </form>
  )
}

function draftFromItem(item: TemplateItem | null): TaskDraft {
  return {
    title: item?.title ?? '',
    kind: item?.kind && kinds.includes(item.kind) ? item.kind : 'questions',
    subjectId: item?.subject_id ?? '',
    topicId: item?.topic_id ? String(item.topic_id) : '',
    dueOn: '',
    targetQuestions: item?.target_questions ?? 0,
    targetMinutes: item?.target_minutes ?? 0,
    note: item?.note ?? '',
    videoUrl: '',
    videoTitle: null,
  }
}

function ItemDialog(props: {
  open: boolean
  onOpenChange: (open: boolean) => void
  track: 'lgs' | 'yks' | null
  item: TemplateItem | null
  weekday: number
  onSave: (item: TemplateItem) => void
}) {
  const session = useOpenSession(props.open)
  return <ItemForm key={session} {...props} />
}

function ItemForm({
  open,
  onOpenChange,
  track,
  item,
  weekday: initialWeekday,
  onSave,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  track: 'lgs' | 'yks' | null
  item: TemplateItem | null
  weekday: number
  onSave: (item: TemplateItem) => void
}) {
  const curriculum = useCurriculum()
  const [draft, setDraft] = useState(() => draftFromItem(item))
  const [weekday, setWeekday] = useState(initialWeekday)
  const [titleError, setTitleError] = useState<string | null>(null)

  const subjects = useMemo(() => {
    const all = curriculum.data?.subjects ?? []
    return track === 'lgs' ? all.filter((s) => s.exam === 'LGS') : track === 'yks' ? all.filter((s) => s.exam !== 'LGS') : all
  }, [curriculum.data, track])

  const submit = (event: FormEvent) => {
    event.preventDefault()
    event.stopPropagation()
    const title = (draft.title.trim() || draftSuggestion(draft, curriculum.data)).slice(0, 140)
    if (!title) return setTitleError('Başlık yazın ya da bir ders seçin')
    onSave({
      week: item?.week ?? 0,
      weekday,
      title,
      kind: draft.kind,
      subject_id: draft.subjectId || null,
      topic_id: draft.topicId ? Number(draft.topicId) : null,
      target_questions: draft.targetQuestions > 0 ? Math.min(draft.targetQuestions, 2000) : null,
      target_minutes: draft.targetMinutes > 0 ? Math.min(draft.targetMinutes, 600) : null,
      note: draft.note.trim() || null,
    })
  }

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title={item ? 'Görevi düzenle' : 'Görev ekle'}
      footer={
        <>
          <Button type="button" variant="secondary" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button type="submit" form="template-item-form">
            {item ? 'Güncelle' : 'Ekle'}
          </Button>
        </>
      }
    >
      <form id="template-item-form" onSubmit={submit} noValidate className="space-y-5">
        <fieldset>
          <legend className="mb-1.5 text-sm font-semibold">Gün</legend>
          <div role="radiogroup" aria-label="Gün" className="grid grid-cols-7 gap-0.5 sm:gap-1.5">
            {weekdayShort.map((short, i) => (
              <button
                key={short}
                type="button"
                role="radio"
                aria-checked={weekday === i}
                aria-label={weekdayLong[i]}
                onClick={() => setWeekday(i)}
                className={cn(
                  'h-11 min-w-0 rounded-xl border text-xs font-semibold transition-colors',
                  weekday === i ? 'border-primary bg-primary text-primary-fg' : 'border-line bg-surface text-muted hover:border-line-strong',
                )}
              >
                {short}
              </button>
            ))}
          </div>
        </fieldset>
        <TaskFields
          draft={draft}
          onChange={(patch) => {
            setDraft((d) => ({ ...d, ...patch }))
            setTitleError(null)
          }}
          subjects={subjects}
          curriculum={curriculum.data}
          showDate={false}
          titleError={titleError}
          kinds={kinds}
        />
      </form>
    </Modal>
  )
}
