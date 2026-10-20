import { useMutation, useQueryClient } from '@tanstack/react-query'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Field, Input, Select } from '@/components/ui/field'
import { Segmented } from '@/components/ui/segmented'
import { fieldLabel, gradeLabel, type Field as YksField, type Track } from '@/lib/exam'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'
import { refreshStudent, type StudentDetail } from './queries'

type Draft = {
  track: Track
  grade: number
  field: YksField | ''
  target: string
  daily: string
  weekly: string
}

const yksGrades = [11, 12, 13]

function toDraft(s: StudentDetail): Draft {
  return {
    track: s.track,
    grade: s.grade,
    field: s.field ?? '',
    target: s.target ?? '',
    daily: String(s.daily_minutes_goal),
    weekly: String(s.weekly_questions_goal),
  }
}

function intIn(value: string, min: number, max: number) {
  if (!/^\d+$/.test(value.trim())) return null
  const n = Number(value)
  return n >= min && n <= max ? n : null
}

export function ExamInfoForm({ student }: { student: StudentDetail }) {
  const queryClient = useQueryClient()
  const [draft, setDraft] = useState(() => toDraft(student))
  const [touched, setTouched] = useState(false)
  const set = (patch: Partial<Draft>) => setDraft((d) => ({ ...d, ...patch }))

  const daily = intIn(draft.daily, 0, 960)
  const weekly = intIn(draft.weekly, 0, 10000)
  const initial = toDraft(student)
  const dirty = (Object.keys(initial) as (keyof Draft)[]).some((k) => String(initial[k]).trim() !== String(draft[k]).trim())

  const save = useMutation({
    mutationFn: async () => {
      const lgs = draft.track === 'lgs'
      const rows = unwrap(
        await supabase
          .from('students')
          .update({
            track: draft.track,
            grade: lgs ? 8 : draft.grade,
            field: lgs || !draft.field ? null : draft.field,
            target: draft.target.trim() || null,
            daily_minutes_goal: daily!,
            weekly_questions_goal: weekly!,
          })
          .eq('id', student.id)
          .select('id'),
      )
      if (!rows.length) throw new AppError('Bu öğrencinin bilgilerini değiştirme yetkin yok')
    },
    onSuccess: async () => {
      await refreshStudent(queryClient, student.id)
      toast.success('Bilgiler kaydedildi')
    },
    onError: (e) => toast.error(errorMessage(e)),
  })

  const submit = (e: FormEvent) => {
    e.preventDefault()
    setTouched(true)
    if (daily == null || weekly == null) return
    save.mutate()
  }

  const changeTrack = (track: Track) =>
    set(track === 'lgs' ? { track, grade: 8, field: '' } : { track, grade: yksGrades.includes(draft.grade) ? draft.grade : 12 })

  return (
    <Card>
      <CardHeader title="Sınav bilgisi" description="Dersler, deneme türleri ve konu listesi buna göre gelir." />
      <CardBody>
        <form onSubmit={submit} className="space-y-4" noValidate>
          <div className="flex flex-col gap-1.5">
            <span className="text-sm font-semibold">Sınav</span>
            <Segmented
              options={[
                { value: 'lgs', label: 'LGS' },
                { value: 'yks', label: 'YKS' },
              ]}
              value={draft.track}
              onChange={changeTrack}
              className="sm:max-w-56"
            />
          </div>

          {draft.track === 'yks' && (
            <div className="grid gap-4 sm:grid-cols-2">
              <Field label="Sınıf">
                {(p) => (
                  <Select {...p} value={draft.grade} onChange={(e) => set({ grade: Number(e.target.value) })}>
                    {yksGrades.map((g) => (
                      <option key={g} value={g}>
                        {gradeLabel[g]}
                      </option>
                    ))}
                  </Select>
                )}
              </Field>
              <Field label="Alan">
                {(p) => (
                  <Select {...p} value={draft.field} onChange={(e) => set({ field: e.target.value as YksField | '' })}>
                    <option value="">Henüz seçmedi</option>
                    {(Object.keys(fieldLabel) as YksField[]).map((f) => (
                      <option key={f} value={f}>
                        {fieldLabel[f]}
                      </option>
                    ))}
                  </Select>
                )}
              </Field>
            </div>
          )}

          <Field label="Hedef" hint="İsteğe bağlı. Öğrenci ve velisi görür.">
            {(p) => (
              <Input
                {...p}
                value={draft.target}
                maxLength={120}
                placeholder={draft.track === 'lgs' ? 'Örneğin: Fen lisesi' : 'Örneğin: Tıp fakültesi'}
                onChange={(e) => set({ target: e.target.value })}
              />
            )}
          </Field>

          <div className="grid grid-cols-2 gap-3 sm:gap-4">
            <Field label="Günlük süre (dk)" error={touched && daily == null ? '0 ile 960 arası' : null}>
              {(p) => (
                <Input {...p} inputMode="numeric" value={draft.daily} onChange={(e) => set({ daily: e.target.value.replace(/\D/g, '') })} />
              )}
            </Field>
            <Field label="Haftalık soru" error={touched && weekly == null ? '0 ile 10.000 arası' : null}>
              {(p) => (
                <Input {...p} inputMode="numeric" value={draft.weekly} onChange={(e) => set({ weekly: e.target.value.replace(/\D/g, '') })} />
              )}
            </Field>
          </div>

          <div className="flex flex-wrap items-center gap-2 pt-1">
            <Button type="submit" loading={save.isPending} disabled={!dirty} className="w-full sm:w-auto">
              Kaydet
            </Button>
            {dirty && !save.isPending && (
              <Button type="button" variant="ghost" className="w-full sm:w-auto" onClick={() => setDraft(initial)}>
                Vazgeç
              </Button>
            )}
          </div>
        </form>
      </CardBody>
    </Card>
  )
}
