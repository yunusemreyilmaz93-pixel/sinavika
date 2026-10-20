import { useMutation, useQueryClient } from '@tanstack/react-query'
import { motion } from 'motion/react'
import { useState, type FormEvent } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { Stepper } from '@/components/ui/stepper'
import { todayISO } from '@/lib/dates'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { DatePicker, FormSkeleton, SubjectPicker, TopicSelect } from './form-parts'
import { formatCount, formatPercent, invalidateActivity } from './stats'
import { rememberSubject, useStudentSubjects } from './subjects'

const stepperRow =
  'flex-row justify-between rounded-xl bg-surface-2 py-1 pr-1 pl-4 sm:flex-col sm:justify-start sm:bg-transparent sm:p-0 [&>span:first-child]:text-[13px]'

export function QuestionLogForm({ studentId, onDone }: { studentId: string; onDone?: () => void }) {
  const queryClient = useQueryClient()
  const { subjects, multiExam, recent, curriculum, isPending, error } = useStudentSubjects(studentId)
  const [picked, setPicked] = useState<string | null>(null)
  const [topicId, setTopicId] = useState<number | null>(null)
  const [correct, setCorrect] = useState(0)
  const [wrong, setWrong] = useState(0)
  const [blank, setBlank] = useState(0)
  const [date, setDate] = useState(todayISO)

  const subjectId = picked ?? recent
  const total = correct + wrong + blank
  const accuracy = total > 0 ? correct / total : null

  const save = useMutation({
    mutationFn: async () => {
      if (!subjectId) throw new Error('Ders seç')
      unwrap(
        await supabase.from('question_logs').insert({
          student_id: studentId,
          subject_id: subjectId,
          topic_id: topicId,
          correct,
          wrong,
          blank,
          solved_on: date,
        }),
      )
    },
    onSuccess: () => {
      if (subjectId) rememberSubject(studentId, subjectId)
      invalidateActivity(queryClient, studentId)
      toast.success(`${formatCount(total)} soru kaydedildi`)
      onDone?.()
    },
    onError: (err) => toast.error(errorMessage(err)),
  })

  if (isPending) return <FormSkeleton />
  if (error) return <p className="py-6 text-center text-sm text-danger">{errorMessage(error)}</p>

  const submit = (e: FormEvent) => {
    e.preventDefault()
    if (subjectId && total > 0 && !save.isPending) save.mutate()
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

      <div className="flex flex-col gap-2">
        <div className="grid gap-2 sm:grid-cols-3 sm:gap-3">
          <Stepper label="Doğru" tone="success" value={correct} onChange={setCorrect} max={1000} className={stepperRow} />
          <Stepper label="Yanlış" tone="danger" value={wrong} onChange={setWrong} max={1000} className={stepperRow} />
          <Stepper label="Boş" tone="muted" value={blank} onChange={setBlank} max={1000} className={stepperRow} />
        </div>
        <Summary total={total} correct={correct} wrong={wrong} blank={blank} accuracy={accuracy} />
      </div>

      <DatePicker value={date} onChange={setDate} />

      <Button type="submit" size="lg" loading={save.isPending} disabled={!subjectId || total === 0}>
        {total > 0 ? `${formatCount(total)} soruyu kaydet` : 'Kaydet'}
      </Button>
    </form>
  )
}

function Summary({
  total,
  correct,
  wrong,
  blank,
  accuracy,
}: {
  total: number
  correct: number
  wrong: number
  blank: number
  accuracy: number | null
}) {
  const share = (n: number) => (total > 0 ? `${(n / total) * 100}%` : '0%')
  return (
    <div className="rounded-xl border border-line px-4 py-3" aria-live="polite">
      <div className="flex items-baseline justify-between gap-3">
        <p className="text-sm text-muted">
          <span className="tabular font-display text-xl font-bold text-fg">{formatCount(total)}</span> soru
        </p>
        <p className="text-sm text-muted">
          Başarı <span className="tabular font-display text-xl font-bold text-fg">{formatPercent(accuracy)}</span>
        </p>
      </div>
      <div className="mt-2 flex h-1.5 overflow-hidden rounded-full bg-surface-2" aria-hidden>
        <motion.div className="h-full bg-success" animate={{ width: share(correct) }} transition={{ duration: 0.25 }} />
        <motion.div className="h-full bg-danger" animate={{ width: share(wrong) }} transition={{ duration: 0.25 }} />
        <motion.div className="h-full bg-line-strong" animate={{ width: share(blank) }} transition={{ duration: 0.25 }} />
      </div>
    </div>
  )
}
