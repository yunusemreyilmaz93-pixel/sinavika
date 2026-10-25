import { ArrowRight, ListChecks } from 'lucide-react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { useTestSets } from './queries'

// Konunun testi varsa anlatımın sonunda bağlantı gösterir
export function TopicTestLink({ topicId }: { topicId: number }) {
  const sets = (useTestSets().data ?? []).filter((s) => s.kind === 'konu' && s.topic_id === topicId)
  if (!sets.length) return null
  return (
    <div className="mt-8 space-y-3">
      {sets.map((set) => (
        <Card key={set.id}>
          <CardBody className="flex flex-wrap items-center gap-3">
            <span className="bg-primary-soft text-primary-soft-fg grid size-10 shrink-0 place-items-center rounded-xl">
              <ListChecks className="size-5" aria-hidden />
            </span>
            <div className="min-w-0 flex-1">
              <p className="font-display font-bold">{set.title}</p>
              <p className="text-muted text-sm">
                {set.question_count} soru{set.duration_min ? `, ${set.duration_min} dakika` : ''}
              </p>
            </div>
            <Button asChild>
              <Link to={`/app/testler/${set.id}`}>
                Testi çöz
                <ArrowRight />
              </Link>
            </Button>
          </CardBody>
        </Card>
      ))}
    </div>
  )
}
