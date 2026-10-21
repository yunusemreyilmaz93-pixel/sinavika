import { Check, ListPlus } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { useTaskActions } from '@/features/plan/queries'
import { kindLabel } from '@/features/plan/lib'
import { formatDay } from '@/lib/dates'
import { errorMessage } from '@/lib/supabase'
import type { Proposal } from './queries'

export function ProposalCard({ proposal }: { proposal: Proposal }) {
  const { save } = useTaskActions(proposal.studentId)
  const [added, setAdded] = useState(0)
  const done = added >= proposal.tasks.length

  const addAll = async () => {
    let count = added
    try {
      for (const task of proposal.tasks.slice(added)) {
        await save.mutateAsync({
          values: {
            title: task.title,
            kind: task.kind,
            subject_id: task.subject_id,
            topic_id: task.topic_id,
            target_questions: task.target_questions,
            target_minutes: task.target_minutes,
            note: task.note,
            video_id: null,
            video_title: null,
            due_on: task.due_on,
          },
        })
        count++
      }
      setAdded(count)
      toast.success(`${proposal.studentName} için ${proposal.tasks.length} görev eklendi`)
    } catch (err) {
      setAdded(count)
      toast.error(errorMessage(err))
    }
  }

  return (
    <div className="mt-3 rounded-xl border border-line bg-bg p-3">
      <p className="text-sm font-semibold">
        {proposal.studentName} için {proposal.tasks.length} görev taslağı
      </p>
      <ul className="mt-2 divide-y divide-line">
        {proposal.tasks.map((task, i) => (
          <li key={i} className="flex items-start justify-between gap-3 py-2 text-[15px]">
            <span className="min-w-0">
              <span className="block break-words font-medium">{task.title}</span>
              <span className="block text-sm text-muted">
                {[kindLabel[task.kind], task.subjectName, task.topicName].filter(Boolean).join(' · ')}
              </span>
            </span>
            <span className="tabular shrink-0 text-sm text-muted">{formatDay(task.due_on)}</span>
          </li>
        ))}
      </ul>
      {proposal.warnings.length > 0 && <p className="mt-2 rounded-lg bg-warning-soft px-3 py-2 text-sm text-warning-soft-fg">{proposal.warnings.join('. ')}</p>}
      <div className="mt-3 flex items-center gap-3">
        <Button className="min-h-11" onClick={addAll} loading={save.isPending} disabled={done}>
          {done ? <Check /> : <ListPlus />}
          {done ? 'Eklendi' : added > 0 ? 'Kalanları ekle' : 'Görevleri ekle'}
        </Button>
        {!done && <p className="text-sm text-muted">Onaylayana kadar hiçbir şey kaydedilmez.</p>}
      </div>
    </div>
  )
}
