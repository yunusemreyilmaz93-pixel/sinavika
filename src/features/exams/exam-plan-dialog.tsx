import { useQueryClient } from '@tanstack/react-query'
import { Check } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Modal } from '@/components/ui/modal'
import { kindLabel, targetsText, dayTitle } from '@/features/plan/lib'
import { invalidateTasks } from '@/features/plan/queries'
import { cn } from '@/lib/cn'
import { formatDay } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import type { PlanDraft } from './exam-plan'

export function ExamPlanDialog({
  open,
  onOpenChange,
  studentId,
  drafts,
  forTeacher,
}: {
  open: boolean
  onOpenChange: (open: boolean) => void
  studentId: string
  drafts: PlanDraft[]
  forTeacher: boolean
}) {
  const qc = useQueryClient()
  const [skipped, setSkipped] = useState<ReadonlySet<string>>(() => new Set())
  const [busy, setBusy] = useState(false)
  const chosen = drafts.filter((d) => !skipped.has(d.key))
  const days = [...new Set(drafts.map((d) => d.due_on))]

  const toggle = (key: string) =>
    setSkipped((prev) => {
      const next = new Set(prev)
      if (next.has(key)) next.delete(key)
      else next.add(key)
      return next
    })

  const save = async () => {
    setBusy(true)
    try {
      const rows = chosen.map(({ key: _key, ...d }) => ({ ...d, student_id: studentId, note: null, video_id: null, video_title: null }))
      unwrap(await supabase.from('tasks').insert(rows))
      await invalidateTasks(qc, [studentId])
      toast.success(`${rows.length} görev plana eklendi`)
      onOpenChange(false)
    } catch (err) {
      toast.error(errorMessage(err))
    } finally {
      setBusy(false)
    }
  }

  return (
    <Modal
      open={open}
      onOpenChange={onOpenChange}
      title="Haftalık plan taslağı"
      description={forTeacher ? 'İstemediğiniz görevin işaretini kaldırın, kalanlar öğrencinin planına eklenir.' : 'İstemediğin görevin işaretini kaldır, kalanlar planına eklenir.'}
      size="md"
      footer={
        <>
          <Button variant="secondary" onClick={() => onOpenChange(false)}>
            Vazgeç
          </Button>
          <Button onClick={() => void save()} loading={busy} disabled={!chosen.length}>
            {chosen.length} görevi ekle
          </Button>
        </>
      }
    >
      <div className="space-y-4">
        {days.map((day) => (
          <section key={day}>
            <h3 className="mb-1.5 text-sm font-semibold text-muted">
              {['Bugün', 'Yarın'].includes(formatDay(day)) ? `${formatDay(day)} · ${dayTitle(day)}` : dayTitle(day)}
            </h3>
            <ul className="space-y-1.5">
              {drafts
                .filter((d) => d.due_on === day)
                .map((d) => {
                  const on = !skipped.has(d.key)
                  const meta = [kindLabel[d.kind], ...targetsText(d)].join(' · ')
                  return (
                    <li key={d.key}>
                      <button
                        type="button"
                        role="checkbox"
                        aria-checked={on}
                        onClick={() => toggle(d.key)}
                        className={cn(
                          'flex min-h-12 w-full items-center gap-3 rounded-xl border px-3 py-2 text-left transition-colors',
                          on ? 'border-line bg-surface' : 'border-dashed border-line bg-surface-2 text-muted',
                        )}
                      >
                        <span
                          className={cn(
                            'grid size-6 shrink-0 place-items-center rounded-lg border-2 transition-colors',
                            on ? 'border-primary bg-primary text-primary-fg' : 'border-line-strong',
                          )}
                          aria-hidden
                        >
                          {on && <Check className="size-4" strokeWidth={3} />}
                        </span>
                        <span className="min-w-0 flex-1">
                          <span className={cn('block text-sm font-semibold', !on && 'line-through')}>{d.title}</span>
                          <span className="block text-xs text-muted">{meta}</span>
                        </span>
                      </button>
                    </li>
                  )
                })}
            </ul>
          </section>
        ))}
      </div>
    </Modal>
  )
}
