import { useMutation, useQueryClient } from '@tanstack/react-query'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Stepper } from '@/components/ui/stepper'
import { formatMinutes, todayISO } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { ChoiceChip, DatePicker, FormSkeleton, Group, SubjectPicker, TopicSelect } from './form-parts'
import { invalidateActivity } from './stats'
import { rememberSubject, useStudentSubjects } from './subjects'

const QUICK = [25, 40, 60, 90]

export function StudySessionForm({ studentId, onDone }: { studentId: string; onDone?: () => void }) {
  const queryClient = useQueryClient()
  const { subjects, multiExam, recent, curriculum, isPending, error } = useStudentSubjects(studentId)
  const [picked, setPicked] = useState<string | null>(null)
  const [topicId, setTopicId] = useState<number | null>(null)
  const [minutes, setMinutes] = useState(40)
  const [date, setDate] = useState(todayISO)

  const subjectId = picked ?? recent

  const save = useMutation({
    mutationFn: async () => {
      if (!subjectId) throw new Error('Ders seç')
      unwrap(
        await supabase.from('study_sessions').insert({
          student_id: studentId,
          subject_id: subjectId,
          topic_id: topicId,
          minutes,
          studied_on: date,
          source: 'manual',
        }),
      )
    },
    onSuccess: () => {
      if (subjectId) rememberSubject(studentId, subjectId)
      invalidateActivity(queryClient, studentId)
      toast.success(`${formatMinutes(minutes)} çalışma kaydedildi`)
      onDone?.()
    },
    onError: (err) => toast.error(errorMessage(err)),
  })

  if (isPending) return <FormSkeleton />
  if (error) return <p className="py-6 text-center text-sm text-danger">{errorMessage(error)}</p>

  const submit = (e: FormEvent) => {
    e.preventDefault()
    if (subjectId && minutes > 0 && !save.isPending) save.mutate()
  }

  return (
    <form onSubmit={submit} className="flex flex-col gap-5">
      <SubjectPicker
        subjects={subjects}
        value={subjectId}
        multiExam={multiExam}
        onChange={(id) => {
          setPicked(id)
          if (id !== subjectId) setTopicId(null)
        }}
      />
      <TopicSelect curriculum={curriculum} subjectId={subjectId} value={topicId} onChange={setTopicId} />

      <Group label="Süre" hint={formatMinutes(minutes)}>
        <div role="radiogroup" aria-label="Hazır süreler" className="grid grid-cols-4 gap-2">
          {QUICK.map((m) => (
            <ChoiceChip key={m} selected={minutes === m} onClick={() => setMinutes(m)} className="justify-center px-0">
              {m} dk
            </ChoiceChip>
          ))}
        </div>
        <Stepper
          label="Dakika"
          value={minutes}
          onChange={setMinutes}
          min={1}
          max={600}
          step={5}
          className="flex-row justify-between rounded-xl bg-surface-2 py-1 pr-1 pl-4 [&>span:first-child]:text-[13px]"
        />
      </Group>

      <DatePicker value={date} onChange={setDate} />

      <Button type="submit" size="lg" loading={save.isPending} disabled={!subjectId || minutes < 1}>
        {formatMinutes(minutes)} kaydet
      </Button>
    </form>
  )
}
