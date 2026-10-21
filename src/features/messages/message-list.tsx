import { AnimatePresence, motion } from 'motion/react'
import { AlertCircle, Clock } from 'lucide-react'
import type { ReactNode } from 'react'
import { dayOf } from '@/features/notifications/lib'
import { cn } from '@/lib/cn'
import { formatDay, formatTime } from '@/lib/dates'
import type { Message } from './lib'

const GROUP_GAP = 5 * 60 * 1000
const urlPattern = /(https?:\/\/[^\s<]+[^\s<.,:;"')\]}!?])/g

function linkify(text: string, mine: boolean): ReactNode[] {
  return text.split(urlPattern).map((part, i) =>
    i % 2 === 1 ? (
      <a
        key={i}
        href={part}
        target="_blank"
        rel="noopener noreferrer"
        className={cn('underline underline-offset-2 break-all', mine ? 'text-primary-fg' : 'text-accent')}
      >
        {part}
      </a>
    ) : (
      part
    ),
  )
}

export function MessageList({
  messages,
  me,
  nameOf,
  showNames,
  onRetry,
}: {
  messages: Message[]
  me: string
  nameOf: (id: string) => string
  showNames: boolean
  onRetry: (m: Message) => void
}) {
  return (
    <ol className="flex flex-col" aria-label="Mesajlar">
      <AnimatePresence initial={false}>
        {messages.map((m, i) => {
          const prev = messages[i - 1]
          const next = messages[i + 1]
          const day = dayOf(m.created_at)
          const newDay = !prev || dayOf(prev.created_at) !== day
          const start = newDay || prev.sender_id !== m.sender_id || Date.parse(m.created_at) - Date.parse(prev.created_at) > GROUP_GAP
          const end =
            !next ||
            next.sender_id !== m.sender_id ||
            dayOf(next.created_at) !== day ||
            Date.parse(next.created_at) - Date.parse(m.created_at) > GROUP_GAP
          const mine = m.sender_id === me
          return (
            <motion.li
              key={m.clientKey ?? m.id}
              initial={{ opacity: 0, y: 8, scale: 0.98 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              transition={{ duration: 0.2, ease: 'easeOut' }}
              className={cn('flex flex-col', mine ? 'items-end' : 'items-start', start ? 'mt-3' : 'mt-0.5')}
            >
              {newDay && (
                <span className="my-3 flex w-full justify-center">
                  <span className="rounded-full bg-surface-2 px-3 py-1 text-xs font-semibold text-muted">{formatDay(day)}</span>
                </span>
              )}
                {start && !mine && showNames && (
                  <span className="mb-1 px-3 text-xs font-semibold text-muted">{nameOf(m.sender_id)}</span>
                )}
                <div
                  className={cn(
                    'max-w-[85%] rounded-2xl px-3.5 pt-2 pb-1.5 text-[15px] leading-snug sm:max-w-[70%]',
                    mine ? 'bg-primary text-primary-fg' : 'border border-line bg-surface text-fg',
                    end && (mine ? 'rounded-br-md' : 'rounded-bl-md'),
                    m.status === 'sending' && 'opacity-70',
                    m.status === 'failed' && 'bg-danger-soft text-fg ring-1 ring-danger/40',
                  )}
                >
                  <p className="break-words whitespace-pre-wrap">{linkify(m.body, mine && m.status !== 'failed')}</p>
                  <span
                    className={cn(
                      'tabular mt-0.5 flex items-center justify-end gap-1 text-[11px]',
                      mine && m.status !== 'failed' ? 'text-primary-fg/75' : 'text-subtle',
                    )}
                  >
                    {m.status === 'sending' && <Clock className="size-3" aria-label="Gönderiliyor" />}
                    {m.status === 'failed' && <AlertCircle className="size-3 text-danger" aria-hidden />}
                    {formatTime(m.created_at)}
                  </span>
                </div>
                {m.status === 'failed' && (
                  <button
                    type="button"
                    onClick={() => onRetry(m)}
                    className="mt-0.5 inline-flex h-9 items-center px-2 text-xs font-semibold text-danger hover:underline"
                  >
                    Gönderilemedi. Tekrar deneyin
                  </button>
                )}
            </motion.li>
          )
        })}
      </AnimatePresence>
    </ol>
  )
}
