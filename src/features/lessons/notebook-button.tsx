import { NotebookTabs } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { Button } from '@/components/ui/button'
import { useAddWrong } from '@/features/wrong/lib'
import { errorMessage } from '@/lib/supabase'

export function NotebookButton({ studentId, subjectId, topicId, source, note }: { studentId: string; subjectId: string; topicId: number; source: string; note: string }) {
  const add = useAddWrong(studentId)
  const [added, setAdded] = useState(false)
  if (added) return <p className="text-sm font-semibold text-muted">Yanlış defterine eklendi. Birkaç gün sonra tekrar karşına çıkar.</p>
  return (
    <Button
      variant="secondary"
      size="sm"
      className="min-h-11"
      loading={add.isPending}
      onClick={() =>
        add.mutate(
          { subject_id: subjectId, topic_id: topicId, note, source, photo: null },
          {
            onSuccess: () => setAdded(true),
            onError: (error) => toast.error(errorMessage(error)),
          },
        )
      }
    >
      <NotebookTabs />
      Yanlış defterime ekle
    </Button>
  )
}
