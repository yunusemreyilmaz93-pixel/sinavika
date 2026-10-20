import { NotebookPen } from 'lucide-react'
import { useState, type ReactNode } from 'react'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/cn'
import { formatDate } from '@/lib/dates'
import { dayOf } from '@/features/notifications/lib'
import { visibilityOf, type Note } from './lib'

const LONG = 420

export function NoteCard({ note, showVisibility, actions }: { note: Note; showVisibility?: boolean; actions?: ReactNode }) {
  const [expanded, setExpanded] = useState(false)
  const meeting = note.kind === 'meeting' && note.met_on
  const long = note.body.length > LONG || note.body.split('\n').length > 7
  const visibility = visibilityOf(note.visibility)
  const VisibilityIcon = visibility.icon
  const edited = new Date(note.updated_at).getTime() - new Date(note.created_at).getTime() > 60_000

  return (
    <article className="rounded-2xl border border-line bg-surface p-4 shadow-card sm:p-5">
      <header className="flex items-start gap-3">
        {meeting ? (
          <div className="grid w-12 shrink-0 overflow-hidden rounded-xl border border-accent/25 text-center" aria-hidden>
            <span className="bg-accent-soft py-0.5 text-[11px] font-bold tracking-wide text-accent-soft-fg uppercase">
              {formatDate(note.met_on!, 'MMM')}
            </span>
            <span className="tabular py-1 font-display text-xl leading-none font-extrabold">{formatDate(note.met_on!, 'd')}</span>
          </div>
        ) : (
          <span aria-hidden className="grid size-12 shrink-0 place-items-center rounded-xl bg-warning-soft text-warning">
            <NotebookPen className="size-5" />
          </span>
        )}
        <div className="min-w-0 flex-1">
          <div className="flex flex-wrap items-center gap-1.5">
            <Badge tone={meeting ? 'accent' : 'neutral'}>{meeting ? 'Görüşme' : 'Not'}</Badge>
            {showVisibility && (
              <Badge tone={note.visibility === 'private' ? 'neutral' : 'primary'}>
                <VisibilityIcon />
                {visibility.label}
              </Badge>
            )}
          </div>
          <p className="mt-1.5 text-sm text-muted">
            {meeting ? formatDate(note.met_on!, 'd MMMM yyyy, EEEE') : formatDate(dayOf(note.created_at), 'd MMMM yyyy')}
            {!showVisibility && note.author ? ` · ${note.author.full_name}` : ''}
            {edited ? ' · düzenlendi' : ''}
          </p>
        </div>
        {actions}
      </header>
      <p
        className={cn(
          'mt-3 text-[15px] leading-relaxed break-words whitespace-pre-wrap text-fg',
          long && !expanded && 'line-clamp-6',
        )}
      >
        {note.body}
      </p>
      {long && (
        <button
          type="button"
          onClick={() => setExpanded((v) => !v)}
          aria-expanded={expanded}
          className="-mb-2 inline-flex h-11 items-center text-sm font-semibold text-accent hover:underline"
        >
          {expanded ? 'Daha az göster' : 'Devamını oku'}
        </button>
      )}
    </article>
  )
}
