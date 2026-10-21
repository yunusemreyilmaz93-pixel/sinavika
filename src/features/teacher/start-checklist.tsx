import { useQuery } from '@tanstack/react-query'
import { Check, ChevronRight, X } from 'lucide-react'
import { useState } from 'react'
import { Link } from 'react-router'
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { ProgressBar } from '@/components/ui/progress'
import { useProfile } from '@/features/auth/session'
import { cn } from '@/lib/cn'
import { supabase } from '@/lib/supabase'
import type { OverviewRow } from './overview'

type Step = {
  id: string
  title: string
  text: string
  to: string
  done: boolean
}

function readDismissed(key: string) {
  try {
    return localStorage.getItem(key) === '1'
  } catch {
    return false
  }
}

export function useStartChecklist(rows: OverviewRow[] | undefined, pendingInvites: number) {
  const profile = useProfile()
  const storageKey = `sinavika-start-${profile.id}`
  const [dismissed, setDismissed] = useState(() => readDismissed(storageKey))

  const plannedTasks = useQuery({
    queryKey: ['teacher', 'start', 'tasks', profile.id],
    queryFn: async () => {
      const { count, error } = await supabase
        .from('tasks')
        .select('id', { count: 'exact', head: true })
        .eq('created_by', profile.id)
      if (error) throw error
      return count ?? 0
    },
    enabled: !dismissed,
  })

  const students = rows ?? []
  const steps: Step[] = [
    {
      id: 'invite',
      title: 'İlk öğrencinizi davet edin',
      text: 'Kod oluşturup öğrencinize gönderin.',
      to: '/app/davetler?yeni=1',
      done: pendingInvites > 0 || students.length > 0,
    },
    {
      id: 'join',
      title: 'Öğrencinin katılmasını bekleyin',
      text: 'Öğrenciniz kodu girince listenizde görünür.',
      to: '/app/davetler',
      done: students.length > 0,
    },
    {
      id: 'plan',
      title: 'İlk haftalık programı hazırlayın',
      text: 'Planlayıcıda hazır şablonlardan biriyle hızlıca başlayabilirsiniz.',
      to: '/app/planlayici',
      done: (plannedTasks.data ?? 0) > 0,
    },
    {
      id: 'parent',
      title: 'Veliyi bağlayın',
      text: 'Öğrencinin sayfasından veli kodu oluşturun.',
      to: students[0] ? `/app/ogrenciler/${students[0].id}` : '/app/davetler',
      done: students.some((s) => s.parent_count > 0),
    },
  ]

  const ready = rows !== undefined && plannedTasks.isSuccess
  const visible = !dismissed && ready && steps.some((s) => !s.done)

  const dismiss = () => {
    setDismissed(true)
    try {
      localStorage.setItem(storageKey, '1')
    } catch {
      return
    }
  }

  return { steps, visible, dismiss }
}

export function StartChecklist({ steps, onDismiss }: { steps: Step[]; onDismiss: () => void }) {
  const done = steps.filter((s) => s.done).length
  const next = steps.find((s) => !s.done)

  return (
    <Card className="mb-6 p-4 sm:mb-8 sm:p-5">
      <div className="flex items-start gap-3">
        <div className="min-w-0 flex-1">
          <h2 className="text-lg font-bold">Başlamak için</h2>
          <p className="mt-0.5 text-sm text-muted">
            {steps.length} adımdan {done} tanesi tamam
          </p>
        </div>
        <Button variant="ghost" size="icon" className="-mt-1.5 -mr-2" aria-label="Başlangıç listesini gizleyin" onClick={onDismiss}>
          <X />
        </Button>
      </div>
      <ProgressBar value={done / steps.length} className="mt-3" />
      <ol className="mt-4 space-y-1">
        {steps.map((step) => (
          <li key={step.id}>
            <Link
              to={step.to}
              className={cn(
                'flex min-h-14 items-center gap-3 rounded-xl px-2 py-2 transition-colors hover:bg-surface-2',
                step === next && 'bg-primary-soft/60',
              )}
            >
              <span
                className={cn(
                  'grid size-7 shrink-0 place-items-center rounded-full border-2',
                  step.done ? 'border-primary bg-primary text-primary-fg' : 'border-line-strong',
                )}
              >
                {step.done && <Check className="size-4" strokeWidth={3} />}
              </span>
              <span className="min-w-0 flex-1">
                <span className={cn('block font-semibold', step.done && 'text-muted line-through decoration-line-strong')}>
                  {step.title}
                </span>
                {!step.done && <span className="block text-sm text-muted">{step.text}</span>}
              </span>
              {!step.done && <ChevronRight className="size-5 shrink-0 text-subtle" />}
            </Link>
          </li>
        ))}
      </ol>
    </Card>
  )
}
