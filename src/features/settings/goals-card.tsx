import { useQueryClient } from '@tanstack/react-query'
import { Target } from 'lucide-react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Field, Input } from '@/components/ui/field'
import { Stepper } from '@/components/ui/stepper'
import { useAuth, type Student } from '@/features/auth/session'
import { keys } from '@/lib/data'
import { formatMinutes } from '@/lib/dates'
import { AppError, errorMessage, supabase, unwrap } from '@/lib/supabase'
import { SettingsCard } from './ui'

export function GoalsCard() {
  const { student } = useAuth()
  if (!student) return null
  return (
    <SettingsCard icon={Target} title="Hedefler" description="Günlük ve haftalık ilerlemen bu hedeflere göre hesaplanır.">
      <GoalsForm key={`${student.daily_minutes_goal}-${student.weekly_questions_goal}-${student.target}`} student={student} />
    </SettingsCard>
  )
}

function GoalsForm({ student }: { student: Student }) {
  const { refresh } = useAuth()
  const queryClient = useQueryClient()
  const [minutes, setMinutes] = useState(student.daily_minutes_goal)
  const [questions, setQuestions] = useState(student.weekly_questions_goal)
  const [target, setTarget] = useState(student.target ?? '')
  const [saving, setSaving] = useState(false)
  const nextTarget = target.trim() || null
  const dirty = minutes !== student.daily_minutes_goal || questions !== student.weekly_questions_goal || nextTarget !== (student.target ?? null)

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault()
    if (!dirty) return
    setSaving(true)
    try {
      const rows = unwrap(
        await supabase
          .from('students')
          .update({ daily_minutes_goal: minutes, weekly_questions_goal: questions, target: nextTarget })
          .eq('id', student.id)
          .select('id'),
      )
      if (!rows.length) throw new AppError('Bu işlem için yetkin yok')
      void queryClient.invalidateQueries({ queryKey: keys.student(student.id) })
      await refresh()
      toast.success('Hedeflerin kaydedildi')
    } catch (err) {
      toast.error(errorMessage(err))
      setSaving(false)
    }
  }

  return (
    <form onSubmit={submit} noValidate className="space-y-4">
      <div className="grid grid-cols-2 gap-2 sm:gap-3">
        <div className="flex flex-col items-center rounded-xl bg-surface-2/60 py-3">
          <Stepper label="Günlük dakika" value={minutes} onChange={setMinutes} min={0} max={960} step={15} />
          <p className="mt-2 text-xs text-muted">{minutes ? `Günde ${formatMinutes(minutes)}` : 'Hedef yok'}</p>
        </div>
        <div className="flex flex-col items-center rounded-xl bg-surface-2/60 py-3">
          <Stepper label="Haftalık soru" value={questions} onChange={setQuestions} min={0} max={10000} step={50} />
          <p className="mt-2 text-xs text-muted">{questions ? `Günde yaklaşık ${Math.round(questions / 7)} soru` : 'Hedef yok'}</p>
        </div>
      </div>
      <Field label="Hedef okul ya da bölüm" hint="Öğretmenin de görür.">
        {(props) => (
          <Input
            {...props}
            value={target}
            onChange={(e) => setTarget(e.target.value)}
            maxLength={120}
            placeholder={student.track === 'lgs' ? 'Örnek: Fen lisesi' : 'Örnek: Tıp fakültesi'}
          />
        )}
      </Field>
      <Button type="submit" loading={saving} disabled={!dirty} className="w-full sm:w-auto">
        Hedefleri kaydet
      </Button>
    </form>
  )
}
