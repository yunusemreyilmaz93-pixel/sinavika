import { useReducedMotion } from 'motion/react'
import { Bar, BarChart, CartesianGrid, Cell, LabelList, ReferenceLine, ResponsiveContainer, XAxis, YAxis } from 'recharts'
import { formatNet } from '@/lib/exam'

export type SubjectBar = { id: string; name: string; net: number; color: string }

export function SubjectNetChart({ rows }: { rows: SubjectBar[] }) {
  const reduce = useReducedMotion()
  const min = Math.min(0, ...rows.map((r) => r.net))
  const max = Math.max(1, ...rows.map((r) => r.net))
  const height = rows.length * 36 + 12
  const summary = rows.map((r) => `${r.name} ${formatNet(r.net)}`).join(', ')

  return (
    <div className="w-full min-w-0" style={{ height }} role="img" aria-label={`Ders netleri: ${summary}`}>
      <ResponsiveContainer width="100%" height="100%" initialDimension={{ width: 320, height }}>
        <BarChart data={rows} layout="vertical" margin={{ top: 0, right: 44, bottom: 0, left: 0 }} barCategoryGap={8}>
          <CartesianGrid horizontal={false} stroke="var(--line)" strokeDasharray="3 4" />
          <XAxis type="number" domain={[min, Math.ceil(max)]} hide />
          <YAxis
            type="category"
            dataKey="name"
            width={78}
            tick={{ fill: 'var(--fg-muted)', fontSize: 12, fontWeight: 600 }}
            axisLine={false}
            tickLine={false}
          />
          {min < 0 && <ReferenceLine x={0} stroke="var(--line-strong)" />}
          <Bar dataKey="net" radius={[0, 6, 6, 0]} isAnimationActive={!reduce} animationDuration={400} maxBarSize={22}>
            {rows.map((r) => (
              <Cell key={r.id} fill={r.color} />
            ))}
            <LabelList
              dataKey="net"
              position="right"
              formatter={(v) => formatNet(Number(v))}
              fill="var(--fg)"
              fontSize={12}
              fontWeight={700}
            />
          </Bar>
        </BarChart>
      </ResponsiveContainer>
    </div>
  )
}
