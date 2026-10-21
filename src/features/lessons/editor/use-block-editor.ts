import { arrayMove } from '@dnd-kit/sortable'
import { useMemo, useRef, useState } from 'react'
import type { Attrs } from '../markdown/parse'
import { fromSource, makeBlock, toSource, type BlockInit, type EditorBlock } from './model'

const HISTORY = 50

export function useBlockEditor(initialBody: string) {
  const [blocks, setBlocks] = useState(() => fromSource(initialBody))
  const [base, setBase] = useState(() => toSource(blocks))
  const [activeId, setActiveId] = useState<string | null>(null)
  const [revealId, setRevealId] = useState<string | null>(null)
  const [undoable, setUndoable] = useState(0)
  const ref = useRef(blocks)
  const past = useRef<EditorBlock[][]>([])
  const lastEdit = useRef<string | null>(null)

  const commit = (next: EditorBlock[], opts: { record?: boolean } = { record: true }) => {
    if (opts.record !== false) {
      past.current.push(ref.current)
      if (past.current.length > HISTORY) past.current.shift()
      setUndoable(past.current.length)
    }
    ref.current = next
    setBlocks(next)
  }

  const body = useMemo(() => toSource(blocks), [blocks])

  const indexOf = (id: string | null) => (id ? ref.current.findIndex((b) => b.id === id) : -1)

  return {
    blocks,
    body,
    dirty: body !== base,
    activeId,
    revealId,
    canUndo: undoable > 0,
    markSaved: () => setBase(body),
    setActive: (id: string | null) => {
      if (id !== activeId) lastEdit.current = null
      setActiveId(id)
    },
    clearReveal: () => setRevealId(null),
    patch: (id: string, change: { text?: string; attrs?: Attrs }) => {
      const record = lastEdit.current !== id
      lastEdit.current = id
      commit(
        ref.current.map((b) => {
          if (b.id !== id) return b
          if (b.kind === 'md') return change.text === undefined ? b : { ...b, text: change.text }
          return { ...b, ...(change.attrs ? { attrs: change.attrs } : {}), ...(b.kind === 'box' && change.text !== undefined ? { text: change.text } : {}) } as EditorBlock
        }),
        { record },
      )
    },
    insertAfter: (afterId: string | null, init: BlockInit, replaceId?: string) => {
      lastEdit.current = null
      const block = makeBlock(init)
      const list = ref.current
      if (replaceId) {
        commit(list.map((b) => (b.id === replaceId ? block : b)))
      } else {
        const at = afterId ? indexOf(afterId) + 1 : list.length
        commit([...list.slice(0, at), block, ...list.slice(at)])
      }
      setActiveId(block.id)
      setRevealId(block.id)
      return block.id
    },
    insertBlocks: (afterId: string | null, inits: BlockInit[], replaceId?: string) => {
      if (!inits.length) return
      lastEdit.current = null
      const blocks = inits.map(makeBlock)
      const list = ref.current
      const replaceAt = replaceId ? list.findIndex((b) => b.id === replaceId) : -1
      const at = replaceAt >= 0 ? replaceAt : afterId ? list.findIndex((b) => b.id === afterId) + 1 : list.length
      commit([...list.slice(0, at), ...blocks, ...list.slice(replaceAt >= 0 ? at + 1 : at)])
      setActiveId(blocks[blocks.length - 1].id)
      setRevealId(blocks[blocks.length - 1].id)
    },
    remove: (id: string) => {
      lastEdit.current = null
      const at = indexOf(id)
      const next = ref.current.filter((b) => b.id !== id)
      commit(next)
      setActiveId(next[Math.min(at, next.length - 1)]?.id ?? null)
    },
    move: (id: string, delta: -1 | 1) => {
      const from = indexOf(id)
      const to = from + delta
      if (from < 0 || to < 0 || to >= ref.current.length) return
      lastEdit.current = null
      commit(arrayMove(ref.current, from, to))
      setRevealId(id)
    },
    reorder: (fromId: string, toId: string) => {
      const from = indexOf(fromId)
      const to = indexOf(toId)
      if (from < 0 || to < 0 || from === to) return
      lastEdit.current = null
      commit(arrayMove(ref.current, from, to))
    },
    duplicate: (id: string) => {
      const at = indexOf(id)
      if (at < 0) return
      lastEdit.current = null
      const source = ref.current[at]
      const copy = { ...source, id: crypto.randomUUID() } as EditorBlock
      commit([...ref.current.slice(0, at + 1), copy, ...ref.current.slice(at + 1)])
      setActiveId(copy.id)
      setRevealId(copy.id)
    },
    undo: () => {
      const previous = past.current.pop()
      if (!previous) return
      lastEdit.current = null
      setUndoable(past.current.length)
      ref.current = previous
      setBlocks(previous)
    },
    replaceAll: (source: string) => {
      lastEdit.current = null
      commit(fromSource(source))
      setActiveId(null)
    },
  }
}

export type BlockEditor = ReturnType<typeof useBlockEditor>
