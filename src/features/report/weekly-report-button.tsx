import { FileDown } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Field, Select, Textarea } from '@/components/ui/field'
import { Modal } from '@/components/ui/modal'
import { useAuth } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { useCurriculum, useSettings } from '@/lib/data'
import { formatDate, shiftDays, weekStartISO } from '@/lib/dates'
import { errorMessage, supabase } from '@/lib/supabase'
import type { ReportStudent, ReportViewer } from './weekly-data'

const WEEKS = 8

function weekOptions() {
  const current = weekStartISO()
  return Array.from({ length: WEEKS }, (_, i) => {
    const start = shiftDays(current, -7 * i)
    const range = `${formatDate(start, 'd MMM')} - ${formatDate(shiftDays(start, 6), 'd MMM')}`
    return { value: start, label: i === 0 ? `Bu hafta (${range})` : i === 1 ? `Geçen hafta (${range})` : range }
  })
}

function slug(text: string) {
  return text
    .toLocaleLowerCase('tr')
    .replace(/ı/g, 'i')
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '')
}

async function teacherNameOf(student: ReportStudent, viewer: ReportViewer, own: string | undefined) {
  if (viewer === 'teacher') return own ?? null
  const { data } = await supabase.from('profiles').select('full_name').eq('id', student.teacher_id).maybeSingle()
  return data?.full_name ?? null
}

// Haftalık PDF rapor. Öğrenci, öğretmen ve veli kendi ekranından indirir. Koç indirmeden önce kısa bir yorum ekleyebilir, yorum kaydedilmez
export function WeeklyReportButton({ student, viewer, className }: { student: ReportStudent; viewer: ReportViewer; className?: string }) {
  const { profile } = useAuth()
  const curriculum = useCurriculum()
  const settings = useSettings()
  const [open, setOpen] = useState(false)
  const [options] = useState(weekOptions)
  const [week, setWeek] = useState(options[0].value)
  const [comment, setComment] = useState('')
  const [busy, setBusy] = useState(false)

  async function download() {
    if (!curriculum.data) return
    setBusy(true)
    try {
      const [{ pdf }, { WeeklyReportDocument }, { loadWeeklyReport }] = await Promise.all([
        import('@react-pdf/renderer'),
        import('./weekly-pdf'),
        import('./weekly-data'),
      ])
      const report = await loadWeeklyReport({
        student,
        teacherName: await teacherNameOf(student, viewer, profile?.full_name),
        weekStart: week,
        viewer,
        comment: viewer === 'teacher' ? comment : '',
        curriculum: curriculum.data,
        settings: settings.data,
      })
      const blob = await pdf(<WeeklyReportDocument report={report} />).toBlob()
      const url = URL.createObjectURL(blob)
      const link = document.createElement('a')
      link.href = url
      link.download = `izlek-haftalik-rapor-${slug(student.name)}-${week}.pdf`
      document.body.append(link)
      link.click()
      link.remove()
      window.setTimeout(() => URL.revokeObjectURL(url), 60_000)
      setOpen(false)
    } catch (error) {
      toast.error(`Rapor oluşturulamadı. ${errorMessage(error)}`)
    } finally {
      setBusy(false)
    }
  }

  return (
    <>
      <Button variant="secondary" className={cn(className)} onClick={() => setOpen(true)}>
        <FileDown />
        Haftalık rapor
      </Button>
      <Modal
        open={open}
        onOpenChange={(o) => !busy && setOpen(o)}
        title="Haftalık rapor"
        description={`${student.name} için seçilen haftanın PDF raporu.`}
        size="sm"
        footer={
          <>
            <Button variant="secondary" onClick={() => setOpen(false)} disabled={busy}>
              Vazgeçin
            </Button>
            <Button onClick={() => void download()} loading={busy} disabled={!curriculum.data}>
              <FileDown />
              PDF indir
            </Button>
          </>
        }
      >
        <div className="space-y-4">
          <Field label="Hafta">
            {(props) => (
              <Select {...props} value={week} onChange={(e) => setWeek(e.target.value)}>
                {options.map((o) => (
                  <option key={o.value} value={o.value}>
                    {o.label}
                  </option>
                ))}
              </Select>
            )}
          </Field>
          {viewer === 'teacher' && (
            <Field label="Koçun yorumu" hint="İsteğe bağlı. Raporun sonuna eklenir, kaydedilmez.">
              {(props) => <Textarea {...props} rows={4} maxLength={600} value={comment} onChange={(e) => setComment(e.target.value)} placeholder="Bu haftanın değerlendirmesi ve gelecek hafta için öneriniz" />}
            </Field>
          )}
        </div>
      </Modal>
    </>
  )
}
