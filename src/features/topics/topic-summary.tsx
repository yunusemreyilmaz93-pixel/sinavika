import { ChevronRight, Layers, type LucideIcon } from 'lucide-react'
import { ProgressRing } from '@/components/ui/progress'
import { cn } from '@/lib/cn'
import { formatPercent, statusCycle, statusMeta } from './status'

export type TopicCounts = { total: number; done: number; learning: number; review: number }

export function TopicSummary({
  counts,
  canEdit,
  showAccuracyHint,
}: {
  counts: TopicCounts
  canEdit: boolean
  showAccuracyHint: boolean
}) {
  const ratio = counts.total ? counts.done / counts.total : 0
  return (
    <section aria-label="Konu özeti" className="rounded-2xl border border-line bg-surface p-4 shadow-card sm:p-5">
      <div className="flex items-center gap-4 sm:gap-6">
        <ProgressRing value={ratio} size={92} stroke={9}>
          <div className="text-center leading-none">
            <div className="tabular font-display text-xl font-extrabold">{formatPercent(ratio)}</div>
            <div className="mt-1 text-[11px] font-semibold text-muted">tamam</div>
          </div>
        </ProgressRing>
        <dl className="grid min-w-0 flex-1 grid-cols-2 gap-x-3 gap-y-3 sm:grid-cols-4">
          <Stat label="Toplam konu" value={counts.total} icon={Layers} iconTone="text-muted" />
          <Stat label={statusMeta.done.label} value={counts.done} icon={statusMeta.done.icon} iconTone={statusMeta.done.iconTone} />
          <Stat
            label={statusMeta.learning.label}
            value={counts.learning}
            icon={statusMeta.learning.icon}
            iconTone={statusMeta.learning.iconTone}
          />
          <Stat
            label={statusMeta.review.label}
            value={counts.review}
            icon={statusMeta.review.icon}
            iconTone={statusMeta.review.iconTone}
          />
        </dl>
      </div>
      <div className="mt-4 border-t border-line pt-3.5">
        <p className="sr-only">
          {canEdit ? 'Konuya her dokunduğunda durum bu sırayla değişir' : 'Durumlar'}
        </p>
        <ul className="flex flex-wrap items-center gap-x-1.5 gap-y-2 text-xs font-medium">
          {statusCycle.map((status, i) => {
            const meta = statusMeta[status]
            const Icon = meta.icon
            return (
              <li key={status} className="inline-flex items-center gap-1.5">
                <span className={cn('inline-flex h-7 items-center gap-1.5 rounded-lg border px-2', meta.chip)}>
                  <Icon aria-hidden className={cn('size-3.5', meta.iconTone)} strokeWidth={2.25} />
                  {meta.label}
                </span>
                {canEdit && i < statusCycle.length - 1 && <ChevronRight aria-hidden className="size-3.5 text-subtle" />}
              </li>
            )
          })}
        </ul>
        {showAccuracyHint && (
          <p className="mt-2.5 text-xs text-muted">Konunun yanındaki yüzde, o konuda çözülen soruların doğru oranı.</p>
        )}
      </div>
    </section>
  )
}

function Stat({ label, value, icon: Icon, iconTone }: { label: string; value: number; icon: LucideIcon; iconTone: string }) {
  return (
    <div className="min-w-0">
      <dt className="flex items-center gap-1.5 text-xs font-medium text-muted">
        <Icon aria-hidden className={cn('size-3.5 shrink-0', iconTone)} strokeWidth={2.25} />
        <span className="truncate">{label}</span>
      </dt>
      <dd className="tabular mt-0.5 font-display text-2xl leading-tight font-bold">{value}</dd>
    </div>
  )
}
