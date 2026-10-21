import { useQueryClient } from '@tanstack/react-query'
import { useState, type FormEvent, type ReactNode } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Card, CardBody, CardHeader } from '@/components/ui/card'
import { Field, Input } from '@/components/ui/field'
import { Skeleton } from '@/components/ui/skeleton'
import { Stepper } from '@/components/ui/stepper'
import { Switch } from '@/components/ui/switch'
import { cn } from '@/lib/cn'
import type { Json } from '@/lib/database.types'
import { keys, useSettings, type Settings } from '@/lib/data'
import { daysBetween, formatDate, todayISO } from '@/lib/dates'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'
import { useAdminOverview } from './queries'
import { LoadError } from './ui'

type ExamKey = 'LGS' | 'YKS'
const examKeys: ExamKey[] = ['LGS', 'YKS']

async function saveSetting(key: string, value: NonNullable<Json>) {
  const rows = unwrap(
    await supabase.from('app_settings').update({ value, updated_at: new Date().toISOString() }).eq('key', key).select('key'),
  )
  if (!rows.length) throw new AppError('Bu işlem için yetkiniz yok')
}

export function AppSettingsSection() {
  const settings = useSettings()
  const overview = useAdminOverview()

  if (settings.isPending) {
    return (
      <div className="space-y-4" aria-busy="true" aria-label="Yükleniyor">
        <Skeleton className="h-64" />
        <Skeleton className="h-56" />
      </div>
    )
  }
  if (settings.isError) return <LoadError error={settings.error} onRetry={() => void settings.refetch()} />

  return <SettingsForm key={JSON.stringify(settings.data)} initial={settings.data} activeTeachers={overview.data?.teachers_active} />
}

function Row({ title, hint, control, inline }: { title: ReactNode; hint?: ReactNode; control: ReactNode; inline?: boolean }) {
  return (
    <div className={cn('flex gap-3 py-4 first:pt-0 last:pb-0 sm:flex-row sm:items-center sm:justify-between', inline ? 'items-center justify-between' : 'flex-col')}>
      <div className="min-w-0">
        <p className="font-semibold">{title}</p>
        {hint && <p className="mt-0.5 text-sm text-muted">{hint}</p>}
      </div>
      <div className="shrink-0">{control}</div>
    </div>
  )
}

function SettingsForm({ initial, activeTeachers }: { initial: Settings; activeTeachers?: number }) {
  const queryClient = useQueryClient()
  const [studentCapacity, setStudentCapacity] = useState(initial.studentCapacity)
  const [teacherCapacity, setTeacherCapacity] = useState(String(initial.teacherCapacity))
  const [applicationsOpen, setApplicationsOpen] = useState(initial.applicationsOpen)
  const [examDates, setExamDates] = useState(initial.examDates)
  const [saving, setSaving] = useState(false)
  const [errors, setErrors] = useState<Partial<Record<'teacher' | ExamKey, string>>>({})

  const teacherCap = Number(teacherCapacity)
  const changes: [string, NonNullable<Json>][] = []
  if (studentCapacity !== initial.studentCapacity) changes.push(['student_capacity', studentCapacity])
  if (teacherCap !== initial.teacherCapacity) changes.push(['teacher_capacity', teacherCap])
  if (applicationsOpen !== initial.applicationsOpen) changes.push(['applications_open', applicationsOpen])
  if (examKeys.some((k) => examDates[k].date !== initial.examDates[k].date || examDates[k].official !== initial.examDates[k].official)) {
    changes.push(['exam_dates', examDates])
  }
  const dirty = changes.length > 0

  function setExam(key: ExamKey, patch: Partial<Settings['examDates'][ExamKey]>) {
    setExamDates((prev) => ({ ...prev, [key]: { ...prev[key], ...patch } }))
    setErrors((prev) => ({ ...prev, [key]: undefined }))
  }

  function reset() {
    setStudentCapacity(initial.studentCapacity)
    setTeacherCapacity(String(initial.teacherCapacity))
    setApplicationsOpen(initial.applicationsOpen)
    setExamDates(initial.examDates)
    setErrors({})
  }

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    const nextErrors: typeof errors = {}
    if (!Number.isInteger(teacherCap) || teacherCap < 1 || teacherCap > 100000) nextErrors.teacher = '1 ile 100000 arasında bir sayı girin'
    for (const k of examKeys) {
      if (!/^\d{4}-\d{2}-\d{2}$/.test(examDates[k].date)) nextErrors[k] = 'Geçerli bir tarih seçin'
    }
    setErrors(nextErrors)
    if (Object.keys(nextErrors).length || !dirty) return
    setSaving(true)
    try {
      await Promise.all(changes.map(([key, value]) => saveSetting(key, value)))
      await queryClient.invalidateQueries({ queryKey: keys.settings })
      toast.success('Ayarlar kaydedildi')
    } catch (err) {
      toast.error(errorMessage(err))
      setSaving(false)
    }
  }

  const today = todayISO()

  return (
    <form onSubmit={submit} noValidate className="space-y-4">
      <Card>
        <CardHeader title="Kontenjan ve başvurular" />
        <CardBody className="divide-y divide-line">
          <Row
            title="Öğretmen başına öğrenci"
            hint="Sınırı düşürürseniz mevcut öğrenciler silinmez, öğretmen yeni davet oluşturamaz."
            control={<Stepper label="Öğrenci" value={studentCapacity} onChange={setStudentCapacity} min={1} max={50} />}
          />
          <div className="py-4">
            <Field
              label="Toplam öğretmen kontenjanı"
              error={errors.teacher}
              hint={
                activeTeachers != null
                  ? teacherCap > 0 && teacherCap < activeTeachers
                    ? `Şu an ${activeTeachers} aktif öğretmen var. Mevcut hesaplar etkilenmez, yeni onay yapılamaz.`
                    : `Şu an ${activeTeachers} aktif öğretmen var.`
                  : undefined
              }
            >
              {(props) => (
                <Input
                  {...props}
                  inputMode="numeric"
                  pattern="[0-9]*"
                  value={teacherCapacity}
                  onChange={(e) => {
                    setTeacherCapacity(e.target.value.replace(/\D/g, '').slice(0, 6))
                    setErrors((prev) => ({ ...prev, teacher: undefined }))
                  }}
                  className="tabular sm:max-w-40"
                />
              )}
            </Field>
          </div>
          <Row
            inline
            title="Öğretmen başvuruları açık"
            hint={applicationsOpen ? 'Başvuru formu herkese açık.' : 'Başvuru formu kapalı. Bekleyen başvurular yine de burada kalır.'}
            control={<Switch label="Öğretmen başvuruları açık" checked={applicationsOpen} onCheckedChange={setApplicationsOpen} />}
          />
        </CardBody>
      </Card>

      <Card>
        <CardHeader title="Sınav tarihleri" description="Öğrencilerin geri sayımı bu tarihlere göre hesaplanır." />
        <CardBody className="grid gap-3 sm:grid-cols-2">
          {examKeys.map((k) => {
            const value = examDates[k]
            const valid = /^\d{4}-\d{2}-\d{2}$/.test(value.date)
            const left = valid ? daysBetween(today, value.date) : null
            return (
              <div key={k} className="rounded-xl border border-line p-3.5">
                <Field
                  label={`${k} tarihi`}
                  error={errors[k]}
                  hint={
                    left == null
                      ? undefined
                      : left < 0
                        ? 'Bu tarih geçti. Yeni dönemin tarihini girin.'
                        : `${formatDate(value.date, 'd MMMM yyyy EEEE')}, ${left} gün kaldı`
                  }
                >
                  {(props) => <Input {...props} type="date" value={value.date} onChange={(e) => setExam(k, { date: e.target.value })} />}
                </Field>
                <div className="mt-3 flex min-h-11 items-center justify-between gap-3">
                  <div className="min-w-0">
                    <p className="text-sm font-semibold">Resmi tarih</p>
                    <p className="text-xs text-muted">{value.official ? `${k === 'LGS' ? 'MEB' : 'ÖSYM'} açıkladı` : 'Tahmini olarak gösterilir'}</p>
                  </div>
                  <Switch label={`${k} tarihi resmi`} checked={value.official} onCheckedChange={(official) => setExam(k, { official })} />
                </div>
              </div>
            )
          })}
        </CardBody>
      </Card>

      <div className="flex flex-col-reverse gap-2 sm:flex-row sm:justify-end">
        {dirty && (
          <Button type="button" variant="ghost" onClick={reset} disabled={saving}>
            Değişiklikleri geri al
          </Button>
        )}
        <Button type="submit" loading={saving} disabled={!dirty}>
          Kaydet
        </Button>
      </div>
    </form>
  )
}
