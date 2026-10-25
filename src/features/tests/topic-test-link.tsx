import { ArrowRight, ListChecks } from 'lucide-react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card, CardBody } from '@/components/ui/card'
import { useTestSets } from './queries'

// Konunun testi varsa anlatımın sonunda bağlantı gösterir
export function TopicTestLink({ topicId }: { topicId: number }) {
  const set = useTestSets().data?.find((s) => s.kind === 'konu' && s.topic_id === topicId)
  if (!set) return null
  return (
    <Card className="mt-8">
      <CardBody className="flex flex-wrap items-center gap-3">
        <span className="bg-primary-soft text-primary-soft-fg grid size-10 shrink-0 place-items-center rounded-xl">
          <ListChecks className="size-5" aria-hidden />
        </span>
        <div className="min-w-0 flex-1">
          <p className="font-display font-bold">Konu testi</p>
          <p className="text-muted text-sm">{set.question_count} soru</p>
        </div>
        <Button asChild>
          <Link to={`/app/testler/${set.id}`}>
            Testi çöz
            <ArrowRight />
          </Link>
        </Button>
      </CardBody>
    </Card>
  )
}
