import { useState } from 'react'
import { Bar, BarChart, CartesianGrid, ResponsiveContainer, Tooltip, XAxis, YAxis } from 'recharts'
import { Card, CardBody } from '@/components/ui/card'
import { Segmented } from '@/components/ui/segmented'
import { formatDate } from '@/lib/dates'
import type { Book, ReadingLog } from './queries'
import { dailyPages, readingStreak } from './stats'

type Range = '7' | '14' | '30'

const axisTick = { fill: 'var(--fg-muted)', fontSize: 11 }
const number = new Intl.NumberFormat('tr-TR', { maximumFractionDigits: 1 })

function Tip({ active, payload }: { active?: boolean; payload?: readonly { payload?: unknown }[] }) {
  const row = payload?.[0]?.payload as { iso: string; pages: number } | undefined
  if (!active || !row) return null
  return (
    <div className="rounded-xl border border-line bg-surface px-3 py-2 text-sm shadow-pop">
      <p className="font-semibold">{formatDate(row.iso, 'd MMMM EEEE')}</p>
      <p className="tabular mt-0.5 text-muted">{row.pages ? `${row.pages} sayfa` : 'Okuma yok'}</p>
    </div>
  )
}

function Figure({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-xl bg-surface-2 px-3 py-2">
      <p className="text-xs text-muted">{label}</p>
      <p className="tabular font-display text-lg font-bold">{value}</p>
    </div>
  )
}

export function ReadingChart({ logs, books }: { logs: ReadingLog[]; books: Book[] }) {
  const [range, setRange] = useState<Range>('14')
  const [bookId, setBookId] = useState<number | null>(null)

  const days = Number(range)
  const rows = dailyPages(logs, days, bookId).map((r) => ({ ...r, label: formatDate(r.iso, days === 7 ? 'EEE' : 'd') }))
  const total = rows.reduce((sum, r) => sum + r.pages, 0)
  const best = rows.reduce((top, r) => (r.pages > top.pages ? r : top), rows[0])
  const scoped = bookId === null ? logs : logs.filter((l) => l.book_id === bookId)

  return (
    <Card>
      <CardBody className="space-y-4">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <h2 className="font-display text-lg font-bold">Günlük okuma</h2>
          <Segmented
            size="sm"
            options={[
              { value: '7', label: '7 gün' },
              { value: '14', label: '14 gün' },
              { value: '30', label: '30 gün' },
            ]}
            value={range}
            onChange={setRange}
          />
        </div>

        {books.length > 1 && (
          <select
            value={bookId ?? ''}
            onChange={(e) => setBookId(e.target.value ? Number(e.target.value) : null)}
            aria-label="Kitap"
            className="h-11 w-full rounded-xl border border-line bg-surface px-3 text-[15px] sm:w-auto"
          >
            <option value="">Tüm kitaplar</option>
            {books.map((b) => (
              <option key={b.id} value={b.id}>
                {b.title}
              </option>
            ))}
          </select>
        )}

        <div className="h-52 w-full sm:h-56" role="img" aria-label={`Son ${days} günde günlük okunan sayfa grafiği, toplam ${total} sayfa`}>
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={rows} margin={{ top: 8, right: 4, left: 0, bottom: 0 }} barCategoryGap="22%">
              <CartesianGrid vertical={false} stroke="var(--line)" strokeDasharray="3 3" />
              <XAxis dataKey="label" tickLine={false} axisLine={false} tick={axisTick} interval="preserveStartEnd" minTickGap={6} />
              <YAxis width={32} tickLine={false} axisLine={false} tick={axisTick} allowDecimals={false} />
              <Tooltip cursor={{ fill: 'var(--surface-2)' }} content={(p) => <Tip active={p.active} payload={p.payload} />} />
              <Bar dataKey="pages" name="Sayfa" fill="var(--primary)" radius={[4, 4, 0, 0]} maxBarSize={32} />
            </BarChart>
          </ResponsiveContainer>
        </div>

        <div className="grid grid-cols-2 gap-2 sm:grid-cols-4">
          <Figure label="Toplam" value={`${total} sayfa`} />
          <Figure label="Günlük ortalama" value={`${number.format(total / days)} sayfa`} />
          <Figure label="En çok okunan gün" value={best.pages ? `${best.pages} sayfa` : '-'} />
          <Figure label="Okuma serisi" value={`${readingStreak(scoped)} gün`} />
        </div>
      </CardBody>
    </Card>
  )
}
