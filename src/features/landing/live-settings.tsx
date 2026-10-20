import { motion } from 'motion/react'
import { Badge } from '@/components/ui/badge'
import { useSettings } from '@/lib/data'
import { daysBetween, formatDate, todayISO } from '@/lib/dates'
import { isConfigured } from '@/lib/supabase'

const DEFAULT_CAPACITY = 10

export function StudentCapacity() {
  return isConfigured ? <LiveCapacity /> : <>{DEFAULT_CAPACITY}</>
}

function LiveCapacity() {
  const { data } = useSettings()
  const value = data?.studentCapacity
  return <>{value && Number.isFinite(value) && value > 0 ? value : DEFAULT_CAPACITY}</>
}

export function ExamCountdown({ exam }: { exam: 'LGS' | 'YKS' }) {
  return isConfigured ? <LiveCountdown exam={exam} /> : null
}

function LiveCountdown({ exam }: { exam: 'LGS' | 'YKS' }) {
  const { data, isError } = useSettings()
  const entry = data?.examDates?.[exam]
  if (isError || !entry?.date) return null
  const days = daysBetween(todayISO(), entry.date)
  if (!Number.isFinite(days) || days < 0) return null

  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      transition={{ duration: 0.3 }}
      className="shrink-0 text-right"
    >
      {days === 0 ? (
        <p className="font-display text-xl leading-none font-extrabold text-primary">Sınav bugün</p>
      ) : (
        <>
          <p className="font-display text-[2rem] leading-none font-extrabold tabular">{days}</p>
          <p className="mt-1 text-[13px] font-semibold text-muted">gün kaldı</p>
        </>
      )}
      <p className="mt-1.5 flex items-center justify-end gap-1.5 text-xs text-subtle">
        {formatDate(entry.date, 'd MMMM yyyy')}
        {!entry.official && <Badge className="px-1.5 py-0 text-[11px]">tahmini</Badge>}
      </p>
    </motion.div>
  )
}
