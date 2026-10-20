import { SendHorizontal } from 'lucide-react'
import { useEffect, useRef, useState, type ReactNode } from 'react'
import { createPortal } from 'react-dom'
import { Button } from '@/components/ui/button'
import { Textarea } from '@/components/ui/field'
import { cn } from '@/lib/cn'
import { MAX_LENGTH } from './lib'

function useKeyboardInset(active: boolean) {
  const [inset, setInset] = useState(0)
  useEffect(() => {
    const vv = window.visualViewport
    if (!vv || !active) return
    const update = () => {
      const value = window.innerHeight - vv.height - vv.offsetTop
      setInset(value > 80 ? Math.round(value) : 0)
    }
    vv.addEventListener('resize', update)
    vv.addEventListener('scroll', update)
    return () => {
      vv.removeEventListener('resize', update)
      vv.removeEventListener('scroll', update)
    }
  }, [active])
  return active ? inset : 0
}

export function ComposerDock({ children, onHeight, inset = 0 }: { children: ReactNode; onHeight: (h: number) => void; inset?: number }) {
  const ref = useRef<HTMLDivElement>(null)
  useEffect(() => {
    const el = ref.current
    if (!el) return
    const observer = new ResizeObserver(() => onHeight(el.offsetHeight + inset))
    observer.observe(el)
    onHeight(el.offsetHeight + inset)
    return () => observer.disconnect()
  }, [onHeight, inset])

  return createPortal(
    <div
      ref={ref}
      style={inset ? { bottom: inset } : undefined}
      className={cn(
        'fixed inset-x-0 z-30 border-t border-line bg-bg/95 backdrop-blur-md lg:left-[248px]',
        !inset && 'bottom-[calc(4rem+env(safe-area-inset-bottom))] lg:bottom-0',
      )}
    >
      <div className="mx-auto max-w-5xl px-4 py-2.5 sm:px-6">{children}</div>
    </div>,
    document.body,
  )
}

export function Composer({
  onSend,
  onHeight,
  placeholder,
}: {
  onSend: (body: string) => void
  onHeight: (h: number) => void
  placeholder: string
}) {
  const [text, setText] = useState('')
  const coarse = typeof window !== 'undefined' && window.matchMedia('(pointer: coarse)').matches
  const [focused, setFocused] = useState(false)
  const inputRef = useRef<HTMLTextAreaElement>(null)
  const inset = useKeyboardInset(focused)
  const trimmed = text.trim()

  const resize = (el: HTMLTextAreaElement) => {
    el.style.height = 'auto'
    el.style.height = `${Math.min(el.scrollHeight, 160)}px`
  }

  const send = () => {
    if (!trimmed) return
    onSend(trimmed.slice(0, MAX_LENGTH))
    setText('')
    const el = inputRef.current
    if (el) {
      el.style.height = 'auto'
      el.focus()
    }
  }

  return (
    <ComposerDock onHeight={onHeight} inset={inset}>
      <form
        className="flex items-end gap-2"
        onSubmit={(e) => {
          e.preventDefault()
          send()
        }}
      >
        <div className="min-w-0 flex-1">
          <Textarea
            ref={inputRef}
            rows={1}
            value={text}
            maxLength={MAX_LENGTH}
            placeholder={placeholder}
            aria-label="Mesaj"
            enterKeyHint={coarse ? 'enter' : 'send'}
            onFocus={() => setFocused(true)}
            onBlur={() => setFocused(false)}
            onChange={(e) => {
              setText(e.target.value)
              resize(e.target)
            }}
            onKeyDown={(e) => {
              if (e.key === 'Enter' && !e.shiftKey && !coarse && !e.nativeEvent.isComposing) {
                e.preventDefault()
                send()
              }
            }}
            className="block max-h-40 min-h-11 resize-none bg-surface"
          />
          {text.length > MAX_LENGTH - 200 && (
            <p className={cn('tabular mt-1 text-right text-xs', text.length >= MAX_LENGTH ? 'text-danger' : 'text-muted')}>
              {text.length}/{MAX_LENGTH}
            </p>
          )}
        </div>
        <Button
          type="submit"
          size="icon"
          aria-label="Gönder"
          disabled={!trimmed}
          onMouseDown={(e) => e.preventDefault()}
        >
          <SendHorizontal />
        </Button>
      </form>
    </ComposerDock>
  )
}
