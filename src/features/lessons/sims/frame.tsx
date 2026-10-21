import type { ReactNode } from 'react'

export const decimal = new Intl.NumberFormat('tr-TR', { maximumFractionDigits: 2 })

export function SimFrame({ title, hint, children }: { title: string; hint: string; children: ReactNode }) {
  return (
    <figure className="my-6 rounded-2xl border border-line bg-surface p-4 sm:p-5">
      <figcaption className="font-display text-base font-bold">{title}</figcaption>
      <p className="mt-1 text-sm text-muted">{hint}</p>
      {children}
    </figure>
  )
}

export function Slider({
  label,
  value,
  display,
  min,
  max,
  step,
  onChange,
}: {
  label: string
  value: number
  display: string
  min: number
  max: number
  step: number
  onChange: (value: number) => void
}) {
  return (
    <label className="block text-sm font-semibold">
      {label}: <span className="tabular">{display}</span>
      <input
        type="range"
        min={min}
        max={max}
        step={step}
        value={value}
        onChange={(e) => onChange(Number(e.target.value))}
        className="mt-2 block h-11 w-full cursor-pointer accent-primary"
      />
    </label>
  )
}

export function Stat({ label, value, highlight }: { label: string; value: string; highlight?: boolean }) {
  return (
    <div className="rounded-xl bg-surface-2 px-3 py-2">
      <p className="text-xs text-muted">{label}</p>
      <p className={highlight ? 'tabular font-display text-lg font-bold text-primary' : 'tabular font-display text-lg font-bold'}>
        {value}
      </p>
    </div>
  )
}
