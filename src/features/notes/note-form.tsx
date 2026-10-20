import { useMutation, useQueryClient } from '@tanstack/react-query'
import { Check } from 'lucide-react'
import { RadioGroup } from 'radix-ui'
import { useId, useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Field, Input, Textarea } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { Segmented } from '@/components/ui/segmented'
import { keys } from '@/lib/data'
import { todayISO } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { visibilityOptions, type Note, type NoteKind, type NoteVisibility } from './lib'

const MAX = 4000

export function NoteForm({
  open,
  onOpenChange,
  studentId,
  note,
  parentCount,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  studentId: string
  note: Note | null
  parentCount: number
}) {
  const formId = useId()
  const queryClient = useQueryClient()
  const [kind, setKind] = useState<NoteKind>(note?.kind ?? 'note')
  const [metOn, setMetOn] = useState(note?.met_on ?? todayISO())
  const [body, setBody] = useState(note?.body ?? '')
  const [visibility, setVisibility] = useState<NoteVisibility>(note?.visibility ?? 'private')
  const [error, setError] = useState<string | null>(null)

  const sharesWithParent = visibility === 'parent' || visibility === 'both'
  const willNotify = visibility !== 'private' && visibility !== note?.visibility

  const save = useMutation({
    mutationFn: async () => {
      const values = { kind, visibility, body: body.trim(), met_on: kind === 'meeting' ? metOn : null }
      if (note) unwrap(await supabase.from('notes').update(values).eq('id', note.id))
      else unwrap(await supabase.from('notes').insert({ ...values, student_id: studentId }))
    },
    onSuccess: () => {
      void queryClient.invalidateQueries({ queryKey: keys.notes(studentId) })
      toast.success(willNotify ? 'Not kaydedildi ve paylaşıldı' : 'Not kaydedildi')
      onOpenChange(false)
    },
    onError: (e) => toast.error(errorMessage(e)),
  })

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title={note ? 'Notu düzenle' : 'Yeni not'}
      footer={
        <>
          <Button type="button" variant="secondary" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button type="submit" form={formId} loading={save.isPending}>
            Kaydet
          </Button>
        </>
      }
    >
      <form
        id={formId}
        className="space-y-5"
        onSubmit={(e) => {
          e.preventDefault()
          if (!body.trim()) return setError('Notu yazmayı unutma')
          save.mutate()
        }}
      >
        <Segmented
          options={[
            { value: 'note', label: 'Not' },
            { value: 'meeting', label: 'Görüşme' },
          ]}
          value={kind}
          onChange={setKind}
        />

        {kind === 'meeting' && (
          <Field label="Görüşme tarihi">
            {(p) => (
              <Input {...p} type="date" required max={todayISO()} value={metOn} onChange={(e) => setMetOn(e.target.value)} />
            )}
          </Field>
        )}

        <Field
          label={kind === 'meeting' ? 'Neler konuşuldu' : 'Not'}
          error={error}
          hint={body.length > MAX - 400 ? `${body.length}/${MAX}` : undefined}
        >
          {(p) => (
            <Textarea
              {...p}
              rows={6}
              maxLength={MAX}
              value={body}
              onChange={(e) => {
                setBody(e.target.value)
                if (error) setError(null)
              }}
              placeholder={kind === 'meeting' ? 'Konuşulanlar, kararlar, bir sonraki adım' : 'Öğrenciyle ilgili aklında tutmak istediğin şey'}
            />
          )}
        </Field>

        <fieldset>
          <legend className="mb-1.5 text-sm font-semibold">Kim görsün</legend>
          <RadioGroup.Root
            value={visibility}
            onValueChange={(v) => setVisibility(v as NoteVisibility)}
            className="grid gap-2 sm:grid-cols-2"
            aria-label="Kim görsün"
          >
            {visibilityOptions.map((o) => {
              const Icon = o.icon
              return (
                <RadioGroup.Item
                  key={o.value}
                  value={o.value}
                  className="group flex min-h-14 items-center gap-3 rounded-xl border border-line bg-surface px-3 py-2.5 text-left transition-colors hover:border-line-strong data-[state=checked]:border-primary data-[state=checked]:bg-primary-soft/50"
                >
                  <span className="grid size-9 shrink-0 place-items-center rounded-lg bg-surface-2 text-muted transition-colors group-data-[state=checked]:bg-primary group-data-[state=checked]:text-primary-fg">
                    <Icon className="size-4" />
                  </span>
                  <span className="min-w-0 flex-1">
                    <span className="block text-sm font-semibold">{o.label}</span>
                    <span className="block text-xs text-muted">{o.hint}</span>
                  </span>
                  <span className="grid size-5 shrink-0 place-items-center rounded-full border-2 border-line-strong transition-colors group-data-[state=checked]:border-primary group-data-[state=checked]:bg-primary">
                    <RadioGroup.Indicator>
                      <Check className="size-3 text-primary-fg" strokeWidth={3} />
                    </RadioGroup.Indicator>
                  </span>
                </RadioGroup.Item>
              )
            })}
          </RadioGroup.Root>
          {sharesWithParent && parentCount === 0 ? (
            <p className="mt-2 text-sm text-muted">Henüz bağlı veli yok. Veli bağlandığında bu notu görür.</p>
          ) : willNotify ? (
            <p className="mt-2 text-sm text-muted">Kaydedince paylaştığın kişilere bildirim gider.</p>
          ) : null}
        </fieldset>
      </form>
    </Modal>
  )
}
