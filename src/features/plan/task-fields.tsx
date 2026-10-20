import { Field, Input, Select, Textarea } from '@/components/ui/field'
import { Stepper } from '@/components/ui/stepper'
import { cn } from '@/lib/cn'
import type { Curriculum } from '@/lib/data'
import { examLabel, type Subject } from '@/lib/exam'
import { suggestTitle, taskKinds, type Task, type TaskKind, type TaskValues } from './lib'

export type TaskDraft = {
  title: string
  kind: TaskKind
  subjectId: string
  topicId: string
  dueOn: string
  targetQuestions: number
  targetMinutes: number
  note: string
}

export function draftFromTask(task: Task | null | undefined, dueOn: string): TaskDraft {
  return {
    title: task?.title ?? '',
    kind: task?.kind ?? 'study',
    subjectId: task?.subject_id ?? '',
    topicId: task?.topic_id ? String(task.topic_id) : '',
    dueOn: task?.due_on ?? dueOn,
    targetQuestions: task?.target_questions ?? 0,
    targetMinutes: task?.target_minutes ?? 0,
    note: task?.note ?? '',
  }
}

export function draftSuggestion(draft: TaskDraft, curriculum: Curriculum | undefined) {
  return suggestTitle({
    kind: draft.kind,
    subject: curriculum?.subjectById.get(draft.subjectId),
    topic: draft.topicId ? curriculum?.topicById.get(Number(draft.topicId)) : null,
    targetQuestions: draft.targetQuestions,
  })
}

export function draftValues(draft: TaskDraft, curriculum: Curriculum | undefined): TaskValues | null {
  const title = (draft.title.trim() || draftSuggestion(draft, curriculum)).slice(0, 140)
  if (!title) return null
  return {
    title,
    kind: draft.kind,
    subject_id: draft.subjectId || null,
    topic_id: draft.topicId ? Number(draft.topicId) : null,
    target_questions: draft.targetQuestions > 0 ? Math.min(draft.targetQuestions, 2000) : null,
    target_minutes: draft.targetMinutes > 0 ? Math.min(draft.targetMinutes, 600) : null,
    note: draft.note.trim() || null,
  }
}

export function TaskFields({
  draft,
  onChange,
  subjects,
  curriculum,
  showDate = true,
  titleError,
}: {
  draft: TaskDraft
  onChange: (patch: Partial<TaskDraft>) => void
  subjects: Subject[]
  curriculum: Curriculum | undefined
  showDate?: boolean
  titleError?: string | null
}) {
  const suggestion = draftSuggestion(draft, curriculum)
  const topics = draft.subjectId ? (curriculum?.topicsBySubject.get(draft.subjectId) ?? []) : []
  const options = withCurrent(subjects, draft.subjectId, curriculum)
  const groups = groupByExam(options)
  const questionsFirst = draft.kind === 'questions'

  const questions = (
    <Stepper
      key="q"
      label="Hedef soru"
      value={draft.targetQuestions}
      onChange={(v) => onChange({ targetQuestions: v })}
      max={2000}
      step={5}
      tone={draft.targetQuestions ? 'default' : 'muted'}
    />
  )
  const minutes = (
    <Stepper
      key="m"
      label="Hedef dakika"
      value={draft.targetMinutes}
      onChange={(v) => onChange({ targetMinutes: v })}
      max={600}
      step={5}
      tone={draft.targetMinutes ? 'default' : 'muted'}
    />
  )

  return (
    <div className="space-y-5">
      <Field
        label="Başlık"
        error={titleError}
        hint={suggestion && !draft.title.trim() ? `Boş bırakırsan: ${suggestion}` : undefined}
      >
        {(props) => (
          <Input
            {...props}
            value={draft.title}
            maxLength={140}
            placeholder={suggestion || 'Örnek: Paragraf 30 soru'}
            onChange={(e) => onChange({ title: e.target.value })}
            enterKeyHint="done"
          />
        )}
      </Field>

      <fieldset>
        <legend className="mb-1.5 text-sm font-semibold">Tür</legend>
        <div role="radiogroup" aria-label="Tür" className="grid grid-cols-3 gap-2">
          {taskKinds.map(({ value, label, icon: Icon }) => {
            const active = draft.kind === value
            return (
              <button
                key={value}
                type="button"
                role="radio"
                aria-checked={active}
                onClick={() => onChange({ kind: value })}
                className={cn(
                  'flex h-16 flex-col items-center justify-center gap-1 rounded-xl border px-1 text-[13px] leading-tight font-semibold transition-colors',
                  active
                    ? 'border-primary bg-primary-soft text-primary-soft-fg'
                    : 'border-line bg-surface text-muted hover:border-line-strong hover:text-fg',
                )}
              >
                <Icon className="size-[18px]" aria-hidden />
                {label}
              </button>
            )
          })}
        </div>
      </fieldset>

      <div className="grid gap-4 sm:grid-cols-2">
        <Field label="Ders">
          {(props) => (
            <Select
              {...props}
              value={draft.subjectId}
              onChange={(e) => onChange({ subjectId: e.target.value, topicId: '' })}
            >
              <option value="">Ders yok</option>
              {groups.length > 1
                ? groups.map(([exam, list]) => (
                    <optgroup key={exam} label={examLabel[exam]}>
                      {list.map((s) => (
                        <option key={s.id} value={s.id}>
                          {s.name}
                        </option>
                      ))}
                    </optgroup>
                  ))
                : options.map((s) => (
                    <option key={s.id} value={s.id}>
                      {s.name}
                    </option>
                  ))}
            </Select>
          )}
        </Field>
        <Field label="Konu" hint={draft.subjectId ? 'İsteğe bağlı' : 'Önce ders seç'}>
          {(props) => (
            <Select
              {...props}
              value={draft.topicId}
              disabled={!topics.length}
              onChange={(e) => onChange({ topicId: e.target.value })}
            >
              <option value="">{topics.length ? 'Konu seç' : 'Konu yok'}</option>
              {topics.map((t) => (
                <option key={t.id} value={t.id}>
                  {t.name}
                </option>
              ))}
            </Select>
          )}
        </Field>
      </div>

      <div
        className={cn(
          'flex flex-wrap justify-center gap-x-4 gap-y-3 rounded-2xl border border-line p-3 sm:justify-start',
          questionsFirst && 'border-primary/30 bg-primary-soft/40',
        )}
      >
        {questionsFirst ? [questions, minutes] : [minutes, questions]}
      </div>

      {showDate && (
        <Field label="Tarih">
          {(props) => (
            <Input
              {...props}
              type="date"
              required
              value={draft.dueOn}
              onChange={(e) => e.target.value && onChange({ dueOn: e.target.value })}
            />
          )}
        </Field>
      )}

      <Field label="Not" hint="İsteğe bağlı">
        {(props) => (
          <Textarea
            {...props}
            rows={2}
            maxLength={500}
            value={draft.note}
            placeholder="Kaynak, sayfa aralığı ya da kısa bir hatırlatma"
            onChange={(e) => onChange({ note: e.target.value })}
          />
        )}
      </Field>
    </div>
  )
}

function withCurrent(subjects: Subject[], currentId: string, curriculum: Curriculum | undefined) {
  if (!currentId || subjects.some((s) => s.id === currentId)) return subjects
  const current = curriculum?.subjectById.get(currentId)
  return current ? [...subjects, current] : subjects
}

function groupByExam(subjects: Subject[]) {
  const map = new Map<Subject['exam'], Subject[]>()
  for (const s of subjects) map.set(s.exam, [...(map.get(s.exam) ?? []), s])
  return [...map.entries()]
}
