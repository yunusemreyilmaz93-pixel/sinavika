import { useReducedMotion } from 'motion/react'
import { CartesianGrid, Line, LineChart, ReferenceLine, ResponsiveContainer, Tooltip, XAxis, YAxis, type TooltipContentProps } from 'recharts'
import { formatDate } from '@/lib/dates'
import { formatNet } from '@/lib/exam'
import type { ExamResult } from './queries'

type Point = Pick<ExamResult, 'id' | 'title' | 'taken_on' | 'net'>

function domainFor(values: number[], max: number): [number, number] {
  const lo = Math.min(...values)
  const hi = Math.max(...values)
  const pad = Math.max(3, (hi - lo) * 0.2)
  const start = lo >= 0 ? Math.max(0, Math.floor((lo - pad) / 5) * 5) : Math.floor((lo - pad) / 5) * 5
  const end = Math.min(max, Math.ceil((hi + pad) / 5) * 5)
  return [start, Math.max(end, start + 5)]
}

function TrendTooltip({ active, payload }: TooltipContentProps) {
  const point = payload?.[0]?.payload as Point | undefined
  if (!active || !point) return null
  return (
    <div className="max-w-56 rounded-xl border border-line bg-surface px-3 py-2 shadow-pop">
      <p className="truncate text-sm font-semibold">{point.title}</p>
      <p className="text-xs text-muted">{formatDate(point.taken_on, 'd MMMM yyyy')}</p>
      <p className="tabular mt-1 font-display text-lg leading-none font-bold">
        {formatNet(point.net)} <span className="text-xs font-semibold text-muted">net</span>
      </p>
    </div>
  )
}

export function NetTrendChart({ points, target, max }: { points: Point[]; target: number | null; max: number }) {
  const reduce = useReducedMotion()
  const [start, end] = domainFor(target != null ? [...points.map((p) => p.net), target] : points.map((p) => p.net), max)
  const step = [5, 10, 20, 40].find((s) => (end - start) / s <= 5) ?? 40
  const ticks = Array.from({ length: Math.floor((end - start) / step) + 1 }, (_, i) => start + i * step)
  const dateById = new Map(points.map((p) => [p.id, formatDate(p.taken_on, 'd MMM')]))
  const first = points[0]
  const last = points[points.length - 1]
  const summary =
    first && last
      ? `Son ${points.length} denemede net ${formatNet(first.net)} ile ${formatNet(last.net)} arasında değişti`
      : 'Net grafiği'

  return (
    <div className="h-56 w-full min-w-0 sm:h-64" role="img" aria-label={summary}>
      <ResponsiveContainer width="100%" height="100%" initialDimension={{ width: 320, height: 224 }}>
        <LineChart data={points} margin={{ top: 16, right: 12, bottom: 0, left: 0 }}>
          <CartesianGrid vertical={false} stroke="var(--line)" strokeDasharray="3 4" />
          <XAxis
            dataKey="id"
            tickFormatter={(id: number) => dateById.get(id) ?? ''}
            tick={{ fill: 'var(--fg-muted)', fontSize: 12 }}
            axisLine={false}
            tickLine={false}
            interval="preserveStartEnd"
            minTickGap={18}
            tickMargin={8}
          />
          <YAxis
            domain={[start, end]}
            width={36}
            tick={{ fill: 'var(--fg-muted)', fontSize: 12 }}
            tickFormatter={(v: number) => formatNet(v)}
            axisLine={false}
            tickLine={false}
            ticks={ticks}
          />
          {target != null && (
            <ReferenceLine
              y={target}
              stroke="var(--marker)"
              strokeWidth={5}
              strokeOpacity={0.85}
              strokeLinecap="round"
              label={{ value: `Hedef ${formatNet(target)}`, position: 'insideTopRight', fill: 'var(--fg)', fontSize: 12, fontWeight: 600 }}
            />
          )}
          <Tooltip content={TrendTooltip} cursor={{ stroke: 'var(--line-strong)', strokeDasharray: '3 3' }} isAnimationActive={false} />
          <Line
            type="monotone"
            dataKey="net"
            stroke="var(--primary)"
            strokeWidth={2.5}
            dot={{ r: 4, fill: 'var(--surface)', stroke: 'var(--primary)', strokeWidth: 2 }}
            activeDot={{ r: 6, fill: 'var(--primary)', stroke: 'var(--surface)', strokeWidth: 2 }}
            isAnimationActive={!reduce}
            animationDuration={400}
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  )
}
