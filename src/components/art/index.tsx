import type { ReactNode } from 'react'
import { cn } from '@/lib/cn'

// Tek çizim stili: 2 px yuvarlak uçlu birincil çizgi, kâğıt zemin, yumuşak birincil dolgu, tek sarı işaretleyici vurgusu.
// Renkler yalnızca tema token'larından gelir, bu yüzden vurgu rengi ve koyu tema kendiliğinden uyar.
function Art({ children, className }: { children: ReactNode; className?: string }) {
  return (
    <svg
      viewBox="0 0 160 120"
      aria-hidden
      className={cn('h-28 w-auto max-w-full fill-none stroke-primary [stroke-linecap:round] [stroke-linejoin:round] [stroke-width:2]', className)}
    >
      <ellipse cx="80" cy="108" rx="52" ry="5" className="fill-surface-2 stroke-none" />
      {children}
    </svg>
  )
}

const paper = 'fill-surface'
const soft = 'fill-primary-soft'
const mark = 'fill-marker stroke-none'
const dot = 'fill-accent stroke-none'

export function ArtTasks({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <rect x="42" y="12" width="76" height="92" rx="8" className={paper} />
      <rect x="56" y="8" width="48" height="12" rx="6" className={soft} />
      <rect x="54" y="38" width="12" height="12" rx="3" className={soft} />
      <path d="m57 44 3 3 5-6" />
      <path d="M74 44h30" className="stroke-line-strong" />
      <rect x="54" y="60" width="12" height="12" rx="3" className={paper} />
      <path d="M74 66h24" className="stroke-line-strong" />
      <rect x="54" y="82" width="12" height="12" rx="3" className={paper} />
      <path d="M74 88h28" className="stroke-line-strong" />
      <rect x="72" y="41" width="34" height="6" rx="3" className={mark} opacity=".55" />
      <circle cx="132" cy="30" r="4" className={dot} />
      <circle cx="26" cy="74" r="3" className={dot} />
    </Art>
  )
}

export function ArtNotes({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <rect x="40" y="14" width="70" height="90" rx="8" className={paper} />
      <path d="M52 14v90" className="stroke-line-strong" />
      <path d="M62 38h36M62 52h30M62 66h34" className="stroke-line-strong" />
      <rect x="60" y="34" width="26" height="7" rx="3.5" className={mark} opacity=".7" />
      <path d="m104 92 24-44 8 4-24 44-12 4z" className={soft} />
      <path d="m128 48 4-8 8 4-4 8" />
      <circle cx="30" cy="40" r="3" className={dot} />
    </Art>
  )
}

export function ArtExams({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <rect x="34" y="14" width="92" height="88" rx="8" className={paper} />
      <path d="M48 88h64" className="stroke-line-strong" />
      <rect x="52" y="66" width="12" height="22" rx="3" className={soft} />
      <rect x="74" y="50" width="12" height="38" rx="3" className={soft} />
      <rect x="96" y="32" width="12" height="56" rx="3" className={soft} />
      <path d="m52 56 22-12 22-14" className="stroke-accent" strokeDasharray="1 6" />
      <circle cx="108" cy="26" r="6" className={mark} />
      <circle cx="136" cy="70" r="3" className={dot} />
    </Art>
  )
}

export function ArtBooks({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <rect x="36" y="76" width="88" height="22" rx="5" className={soft} />
      <path d="M48 76v22" />
      <rect x="44" y="52" width="76" height="22" rx="5" className={paper} />
      <path d="M56 52v22" />
      <rect x="52" y="28" width="64" height="22" rx="5" className={soft} />
      <path d="M64 28v22" />
      <rect x="72" y="34" width="28" height="6" rx="3" className={mark} opacity=".8" />
      <circle cx="132" cy="44" r="3" className={dot} />
      <circle cx="28" cy="60" r="4" className={dot} />
    </Art>
  )
}

export function ArtMessages({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <path d="M34 22h64a8 8 0 0 1 8 8v28a8 8 0 0 1-8 8H62l-14 12V66h-14a8 8 0 0 1-8-8V30a8 8 0 0 1 8-8z" className={paper} />
      <path d="M44 38h44M44 50h28" className="stroke-line-strong" />
      <path d="M78 60h50a8 8 0 0 1 8 8v20a8 8 0 0 1-8 8h-8v10l-12-10H78a8 8 0 0 1-8-8V68a8 8 0 0 1 8-8z" className={soft} />
      <circle cx="86" cy="78" r="2.5" className="fill-primary stroke-none" />
      <circle cx="98" cy="78" r="2.5" className="fill-primary stroke-none" />
      <circle cx="110" cy="78" r="2.5" className="fill-primary stroke-none" />
      <circle cx="130" cy="30" r="4" className={mark} />
    </Art>
  )
}

export function ArtPeople({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <circle cx="58" cy="44" r="14" className={soft} />
      <path d="M32 98c0-16 11-28 26-28s26 12 26 28z" className={soft} />
      <circle cx="104" cy="50" r="12" className={paper} />
      <path d="M82 98c0-14 9-24 22-24s22 10 22 24z" className={paper} />
      <path d="M126 30v12M120 36h12" className="stroke-accent" />
      <circle cx="34" cy="30" r="3" className={mark} />
    </Art>
  )
}

export function ArtSearch({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <rect x="40" y="16" width="64" height="84" rx="8" className={paper} />
      <path d="M52 34h40M52 48h26" className="stroke-line-strong" />
      <circle cx="96" cy="72" r="20" className={soft} />
      <path d="m111 87 18 18" strokeWidth="4" />
      <path d="M88 66l16 12M104 66 88 78" className="stroke-accent" />
      <circle cx="132" cy="32" r="3" className={mark} />
    </Art>
  )
}

export function ArtCalendar({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <rect x="36" y="22" width="88" height="80" rx="8" className={paper} />
      <path d="M36 44h88" />
      <path d="M58 14v14M102 14v14" />
      <rect x="36" y="22" width="88" height="22" rx="8" className={soft} />
      <path d="M52 60h8M76 60h8M100 60h8M52 76h8M76 76h8" className="stroke-line-strong" />
      <circle cx="104" cy="78" r="9" className={mark} />
      <path d="m100 78 3 3 5-6" />
      <circle cx="134" cy="52" r="3" className={dot} />
    </Art>
  )
}

export function ArtBell({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <path d="M52 82V56a28 28 0 0 1 56 0v26l8 8H44z" className={soft} />
      <path d="M72 96a8 8 0 0 0 16 0" />
      <path d="M80 22v6" />
      <circle cx="108" cy="30" r="6" className={mark} />
      <path d="M126 50l8-4M126 62l10 2" className="stroke-accent" />
    </Art>
  )
}

export function ArtGeneric({ className }: { className?: string }) {
  return (
    <Art className={className}>
      <path d="M36 52 80 30l44 22v40L80 112 36 92z" className={soft} transform="translate(0 -12)" />
      <path d="M36 40 80 62l44-22M80 62v40" transform="translate(0 -0)" />
      <circle cx="128" cy="26" r="4" className={mark} />
      <circle cx="30" cy="70" r="3" className={dot} />
    </Art>
  )
}
