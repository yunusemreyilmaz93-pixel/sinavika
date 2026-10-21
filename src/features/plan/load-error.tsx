import { RotateCw } from 'lucide-react'
import { Button } from '@/components/ui/button'

export function LoadError({ message, onRetry }: { message: string; onRetry: () => void }) {
  return (
    <div role="alert" className="flex flex-wrap items-center justify-between gap-3 rounded-2xl border border-danger/30 bg-danger-soft px-4 py-3">
      <p className="text-sm font-medium text-danger">{message}</p>
      <Button variant="secondary" size="sm" onClick={onRetry}>
        <RotateCw />
        Tekrar deneyin
      </Button>
    </div>
  )
}
