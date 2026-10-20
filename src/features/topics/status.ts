import { BookOpen, Circle, CircleCheck, RotateCcw, type LucideIcon } from 'lucide-react'
import type { Enums } from '@/lib/supabase'

export type TopicState = Enums<'topic_status'> | 'none'
export type TopicFilter = 'all' | 'missing' | 'review'

export const statusCycle: TopicState[] = ['none', 'learning', 'done', 'review']

export function nextStatus(status: TopicState): TopicState {
  return statusCycle[(statusCycle.indexOf(status) + 1) % statusCycle.length]
}

type Meta = { label: string; icon: LucideIcon; chip: string; hover: string; iconTone: string }

export const statusMeta: Record<TopicState, Meta> = {
  none: {
    label: 'Başlanmadı',
    icon: Circle,
    chip: 'border-line bg-surface text-fg',
    hover: 'hover:border-line-strong hover:bg-surface-2',
    iconTone: 'text-subtle',
  },
  learning: {
    label: 'Çalışıyorum',
    icon: BookOpen,
    chip: 'border-accent/30 bg-accent-soft text-accent-soft-fg',
    hover: 'hover:border-accent/50',
    iconTone: 'text-accent',
  },
  done: {
    label: 'Tamam',
    icon: CircleCheck,
    chip: 'border-primary/30 bg-primary-soft text-primary-soft-fg',
    hover: 'hover:border-primary/50',
    iconTone: 'text-primary',
  },
  review: {
    label: 'Tekrar lazım',
    icon: RotateCcw,
    chip: 'border-warning/40 bg-warning-soft text-fg',
    hover: 'hover:border-warning/60',
    iconTone: 'text-warning',
  },
}

export function matchesFilter(filter: TopicFilter, status: TopicState) {
  if (filter === 'missing') return status !== 'done'
  if (filter === 'review') return status === 'review'
  return true
}

const percent = new Intl.NumberFormat('tr-TR', { style: 'percent', maximumFractionDigits: 0 })
export function formatPercent(value: number) {
  return percent.format(value)
}
