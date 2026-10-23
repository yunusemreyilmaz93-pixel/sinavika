import type { ReactNode } from 'react'
import { useCurriculum } from '@/lib/data'
import { subjectColor } from '@/lib/exam'
import { kindLabel, targetsText, weekdayLong, type TemplateItem } from '@/features/plan/lib'

export function useSubjectName() {
  const curriculum = useCurriculum()
  return (id: string | null) => (id ? (curriculum.data?.subjectById.get(id)?.name ?? '') : '')
}

export function ItemLine({ item, actions, dimmed }: { item: TemplateItem; actions?: ReactNode; dimmed?: boolean }) {
  const subjectName = useSubjectName()
  const curriculum = useCurriculum()
  const subject = item.subject_id ? curriculum.data?.subjectById.get(item.subject_id) : undefined
  const meta = [kindLabel[item.kind], subjectName(item.subject_id), ...targetsText(item)].filter(Boolean).join(' · ')
  return (
    <li className={`flex items-center gap-2 py-2 pr-1 pl-3 ${dimmed ? 'opacity-45' : ''}`}>
      <span aria-hidden className="h-8 w-1 shrink-0 rounded-full" style={{ backgroundColor: subjectColor(subject) }} />
      <div className="min-w-0 flex-1">
        <p className="truncate text-[15px] font-semibold">{item.title}</p>
        {meta && <p className="truncate text-sm text-muted">{meta}</p>}
      </div>
      {actions}
    </li>
  )
}

export function WeekView({
  items,
  week,
  excluded,
  onToggle,
}: {
  items: TemplateItem[]
  week: number
  excluded?: Set<number>
  onToggle?: (index: number) => void
}) {
  const inWeek = items.map((item, index) => ({ item, index })).filter(({ item }) => item.week === week)
  return (
    <div className="space-y-3">
      {weekdayLong.map((name, weekday) => {
        const list = inWeek.filter(({ item }) => item.weekday === weekday)
        return (
          <section key={name}>
            <h3 className="mb-1 text-sm font-bold">{name}</h3>
            {list.length ? (
              <ul className="divide-y divide-line rounded-2xl border border-line bg-surface">
                {list.map(({ item, index }) => (
                  <ItemLine
                    key={index}
                    item={item}
                    dimmed={excluded?.has(index)}
                    actions={
                      onToggle && (
                        <label className="grid size-11 shrink-0 cursor-pointer place-items-center">
                          <input
                            type="checkbox"
                            className="size-5 accent-primary"
                            checked={!excluded?.has(index)}
                            onChange={() => onToggle(index)}
                            aria-label={`${item.title} uygulansın`}
                          />
                        </label>
                      )
                    }
                  />
                ))}
              </ul>
            ) : (
              <p className="rounded-2xl border border-dashed border-line px-3 py-2.5 text-sm text-subtle">Görev yok</p>
            )}
          </section>
        )
      })}
    </div>
  )
}
