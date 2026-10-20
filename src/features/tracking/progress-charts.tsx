import { Bar, BarChart, CartesianGrid, ReferenceLine, ResponsiveContainer, Tooltip, XAxis, YAxis } from 'recharts'
import type { ReactNode } from 'react'
import { formatDate, formatMinutes, weekStartISO } from '@/lib/dates'
import type { PeriodSummary, StudyActivity } from './stats'
import { emptyDay, formatCount, formatPercent } from './stats'

export type ChartRow = {
  key: string
  label: string
  title: string
  minutes: number
  questions: number
  correct: number
  wrong: number
  blank: number
}

export function chartRows(activity: StudyActivity, summary: PeriodSummary, weekly: boolean): ChartRow[] {
  if (!weekly) {
    const short = summary.days.length <= 7
    return summary.days.map((iso) => ({
      key: iso,
      label: formatDate(iso, short ? 'EEE' : 'd'),
      title: formatDate(iso, 'd MMMM EEEE'),
      ...(activity.byDay.get(iso) ?? emptyDay()),
    }))
  }
  const groups = new Map<string, ChartRow & { last: string }>()
  for (const iso of summary.days) {
    const week = weekStartISO(iso)
    const d = activity.byDay.get(iso) ?? emptyDay()
    let row = groups.get(week)
    if (!row) {
      row = { key: week, label: formatDate(week, 'd MMM'), title: '', last: iso, ...emptyDay() }
      row.title = formatDate(iso, 'd MMM')
      groups.set(week, row)
    }
    row.last = iso
    row.minutes += d.minutes
    row.questions += d.questions
    row.correct += d.correct
    row.wrong += d.wrong
    row.blank += d.blank
  }
  return [...groups.values()].map(({ last, ...row }) => ({ ...row, title: `${row.title} - ${formatDate(last, 'd MMM')}` }))
}

const axisTick = { fill: 'var(--fg-muted)', fontSize: 11 }
const hours = new Intl.NumberFormat('tr-TR', { maximumFractionDigits: 1 })

const STEPS = [15, 30, 60, 90, 120, 180, 240, 360, 480, 600, 900, 1200, 1800, 2400, 3600]

function minuteTicks(max: number) {
  const step = STEPS.find((s) => max / s <= 4) ?? Math.ceil(max / 4 / 60) * 60
  const top = Math.max(step, Math.ceil(max / step) * step)
  return Array.from({ length: top / step + 1 }, (_, i) => i * step)
}

function minuteTick(v: number) {
  if (!v) return '0'
  return v < 60 ? `${v} dk` : `${hours.format(v / 60)} sa`
}

type TipProps = { active?: boolean; payload?: readonly { payload?: unknown }[]; kind: 'minutes' | 'questions' }

function TipBox({ active, payload, kind }: TipProps) {
  const row = payload?.[0]?.payload as ChartRow | undefined
  if (!active || !row) return null
  return (
    <div className="rounded-xl border border-line bg-surface px-3 py-2 text-sm shadow-pop">
      <p className="font-semibold">{row.title}</p>
      {kind === 'minutes' ? (
        <p className="tabular mt-0.5 text-muted">{row.minutes ? formatMinutes(row.minutes) : 'Çalışma yok'}</p>
      ) : row.questions ? (
        <div className="tabular mt-1 space-y-0.5 text-muted">
          <p>
            <span className="font-semibold text-fg">{formatCount(row.questions)}</span> soru, {formatPercent(row.correct / row.questions)} doğru
          </p>
          <p>
            <span className="text-success">{formatCount(row.correct)} D</span> · <span className="text-danger">{formatCount(row.wrong)} Y</span> ·{' '}
            {formatCount(row.blank)} B
          </p>
        </div>
      ) : (
        <p className="mt-0.5 text-muted">Soru yok</p>
      )}
    </div>
  )
}

function Frame({ rows, children }: { rows: ChartRow[]; children: ReactNode }) {
  return (
    <div className="h-52 w-full sm:h-56" role="img" aria-label="Grafik">
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={rows} margin={{ top: 8, right: 4, left: 0, bottom: 0 }} barCategoryGap="22%">
          {children}
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}

export function MinutesChart({ rows, goal }: { rows: ChartRow[]; goal: number | null }) {
  const ticks = minuteTicks(Math.max(goal ?? 0, ...rows.map((r) => r.minutes)))
  return (
    <Frame rows={rows}>
      <CartesianGrid vertical={false} stroke="var(--line)" strokeDasharray="3 3" />
      <XAxis dataKey="label" tickLine={false} axisLine={false} tick={axisTick} interval="preserveStartEnd" minTickGap={6} />
      <YAxis
        width={44}
        tickLine={false}
        axisLine={false}
        tick={axisTick}
        ticks={ticks}
        domain={[0, ticks[ticks.length - 1]]}
        interval={0}
        tickFormatter={minuteTick}
      />
      <Tooltip cursor={{ fill: 'var(--surface-2)' }} content={(p) => <TipBox active={p.active} payload={p.payload} kind="minutes" />} />
      {goal ? (
        <ReferenceLine
          y={goal}
          stroke="var(--warning)"
          strokeDasharray="4 4"
                    label={{ value: 'Hedef', position: 'insideTopRight', fill: 'var(--warning)', fontSize: 11 }}
        />
      ) : null}
      <Bar dataKey="minutes" name="Süre" fill="var(--primary)" radius={[4, 4, 0, 0]} maxBarSize={32} />
    </Frame>
  )
}

export function QuestionsChart({ rows }: { rows: ChartRow[] }) {
  return (
    <Frame rows={rows}>
      <CartesianGrid vertical={false} stroke="var(--line)" strokeDasharray="3 3" />
      <XAxis dataKey="label" tickLine={false} axisLine={false} tick={axisTick} interval="preserveStartEnd" minTickGap={6} />
      <YAxis width={44} tickLine={false} axisLine={false} tick={axisTick} allowDecimals={false} />
      <Tooltip cursor={{ fill: 'var(--surface-2)' }} content={(p) => <TipBox active={p.active} payload={p.payload} kind="questions" />} />
      <Bar dataKey="correct" name="Doğru" stackId="q" fill="var(--success)" maxBarSize={32} />
      <Bar dataKey="wrong" name="Yanlış" stackId="q" fill="var(--danger)" maxBarSize={32} />
      <Bar dataKey="blank" name="Boş" stackId="q" fill="var(--line-strong)" radius={[4, 4, 0, 0]} maxBarSize={32} />
    </Frame>
  )
}

export function Legend() {
  const items = [
    { label: 'Doğru', className: 'bg-success' },
    { label: 'Yanlış', className: 'bg-danger' },
    { label: 'Boş', className: 'bg-line-strong' },
  ]
  return (
    <div className="flex flex-wrap gap-x-4 gap-y-1 text-xs font-medium text-muted">
      {items.map((i) => (
        <span key={i.label} className="inline-flex items-center gap-1.5">
          <span aria-hidden className={`size-2.5 rounded-sm ${i.className}`} />
          {i.label}
        </span>
      ))}
    </div>
  )
}
