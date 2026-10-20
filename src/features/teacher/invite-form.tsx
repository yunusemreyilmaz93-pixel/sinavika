import { useMutation, useQueryClient } from '@tanstack/react-query'
import { useId, useState, type FormEvent, type ReactNode } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Field, Input, Select } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { keys } from '@/lib/data'
import { fieldLabel, type Field as YksField, type Track } from '@/lib/exam'
import { errorMessage, supabase } from '@/lib/supabase'
import { InviteShare } from './invite-share'
import { isCapacityError, type Invite } from './invites'

type Grade = 8 | 11 | 12 | 13
type FieldChoice = YksField | 'none'
type Draft = { track: Track; grade: Grade; field: FieldChoice }

const DEFAULTS_KEY = 'sinavika-invite-defaults'
const yksGrades: { value: string; label: string }[] = [
  { value: '11', label: '11. sınıf' },
  { value: '12', label: '12. sınıf' },
  { value: '13', label: 'Mezun' },
]
const fieldOptions: FieldChoice[] = ['say', 'ea', 'soz', 'dil', 'none']

function readDefaults(): Draft {
  try {
    const saved = JSON.parse(localStorage.getItem(DEFAULTS_KEY) ?? 'null') as Draft | null
    if (saved?.track === 'lgs') return { track: 'lgs', grade: 8, field: 'none' }
    if (saved?.track === 'yks' && [11, 12, 13].includes(saved.grade) && fieldOptions.includes(saved.field)) return saved
  } catch {
    /* kayıtlı tercih yoksa varsayılanla başla */
  }
  return { track: 'lgs', grade: 8, field: 'none' }
}

function saveDefaults(draft: Draft) {
  try {
    localStorage.setItem(DEFAULTS_KEY, JSON.stringify(draft))
  } catch {
    /* depolama kapalıysa tercih hatırlanmaz */
  }
}

export type CreateInviteInput = { name: string; track: Track; grade: number; field: YksField | null }

export async function createStudentInvite(input: CreateInviteInput) {
  const { data, error } = await supabase.rpc('create_student_invite', {
    p_student_name: input.name,
    p_track: input.track,
    p_grade: input.grade,
    ...(input.track === 'yks' && input.field ? { p_field: input.field } : {}),
  })
  if (error) throw error
  return data as Invite
}

export function InviteFormModal({ open, onOpenChange }: { open: boolean; onOpenChange: (open: boolean) => void }) {
  const queryClient = useQueryClient()
  const formId = useId()
  const [name, setName] = useState('')
  const [draft, setDraft] = useState<Draft>(readDefaults)
  const [nameError, setNameError] = useState<string | null>(null)
  const [formError, setFormError] = useState<string | null>(null)
  const [created, setCreated] = useState<Invite | null>(null)

  const create = useMutation({
    mutationFn: createStudentInvite,
    onSuccess: (invite) => {
      saveDefaults(draft)
      setCreated(invite)
      void queryClient.invalidateQueries({ queryKey: keys.invites })
    },
    onError: (error) => {
      if (isCapacityError(error)) {
        toast.error(errorMessage(error))
        void queryClient.invalidateQueries({ queryKey: keys.invites })
        void queryClient.invalidateQueries({ queryKey: keys.overview })
        onOpenChange(false)
      } else {
        setFormError(errorMessage(error))
      }
    },
  })

  const submit = (event: FormEvent) => {
    event.preventDefault()
    const trimmed = name.trim().replace(/\s+/g, ' ')
    if (trimmed.length < 2) {
      setNameError('Öğrencinin adını yaz')
      return
    }
    setNameError(null)
    setFormError(null)
    create.mutate({
      name: trimmed,
      track: draft.track,
      grade: draft.grade,
      field: draft.track === 'yks' && draft.field !== 'none' ? draft.field : null,
    })
  }

  const startOver = () => {
    setCreated(null)
    setName('')
    setFormError(null)
  }

  if (created) {
    return (
      <Modal
        open={open}
        onOpenChange={onOpenChange}
        title="Davet hazır"
        description="Kodu öğrencine gönder. Kod 14 gün geçerli ve tek kullanımlık."
        footer={
          <>
            <Button variant="secondary" onClick={startOver}>
              Yeni davet
            </Button>
            <Button onClick={() => onOpenChange(false)}>Tamam</Button>
          </>
        }
      >
        <InviteShare invite={created} />
      </Modal>
    )
  }

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title="Öğrenci davet et"
      description="Kod oluştur, öğrencine gönder. Katılınca listende görünür."
      footer={
        <>
          <Button variant="secondary" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button type="submit" form={formId} loading={create.isPending}>
            Kod oluştur
          </Button>
        </>
      }
    >
      <form id={formId} onSubmit={submit} className="space-y-5" noValidate>
        <Field label="Öğrenci adı" error={nameError} hint="Katılırken bu ad hazır gelir, öğrenci değiştirebilir.">
          {(props) => (
            <Input
              {...props}
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder="Ad Soyad"
              autoFocus
              autoComplete="off"
              autoCapitalize="words"
              maxLength={80}
              enterKeyHint="done"
            />
          )}
        </Field>

        <Choice label="Sınav">
          <Segmented
            options={[
              { value: 'lgs', label: 'LGS' },
              { value: 'yks', label: 'YKS' },
            ]}
            value={draft.track}
            onChange={(track) =>
              setDraft((d) => (track === 'lgs' ? { track, grade: 8, field: 'none' } : { ...d, track, grade: d.grade === 8 ? 12 : d.grade }))
            }
          />
        </Choice>

        {draft.track === 'lgs' ? (
          <Choice label="Sınıf">
            <p className="flex h-11 items-center rounded-xl border border-line bg-surface-2 px-3.5 text-[15px] font-semibold text-muted">
              8. sınıf
            </p>
          </Choice>
        ) : (
          <>
            <Choice label="Sınıf">
              <Segmented
                options={yksGrades}
                value={String(draft.grade)}
                onChange={(grade) => setDraft((d) => ({ ...d, grade: Number(grade) as Grade }))}
              />
            </Choice>
            <Field label="Alan">
              {(props) => (
                <Select {...props} value={draft.field} onChange={(e) => setDraft((d) => ({ ...d, field: e.target.value as FieldChoice }))}>
                  {fieldOptions.map((f) => (
                    <option key={f} value={f}>
                      {f === 'none' ? 'Henüz belli değil' : fieldLabel[f]}
                    </option>
                  ))}
                </Select>
              )}
            </Field>
          </>
        )}

        {formError && (
          <p role="alert" className="rounded-xl bg-danger-soft px-3.5 py-2.5 text-sm font-medium text-danger">
            {formError}
          </p>
        )}
      </form>
    </Modal>
  )
}

function Choice({ label, children }: { label: string; children: ReactNode }) {
  const id = useId()
  return (
    <div role="group" aria-labelledby={id} className="flex flex-col gap-1.5">
      <span id={id} className="text-sm font-semibold text-fg">
        {label}
      </span>
      {children}
    </div>
  )
}
