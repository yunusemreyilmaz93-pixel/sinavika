import { parseBlocks, type Attrs } from '../markdown/parse'

export type EditorBlock =
  | { id: string; kind: 'md'; text: string }
  | { id: string; kind: 'box'; name: string; attrs: Attrs; text: string }
  | { id: string; kind: 'leaf'; name: string; attrs: Attrs }

export type BlockInit =
  | { kind: 'md'; text: string }
  | { kind: 'box'; name: string; attrs?: Attrs; text?: string }
  | { kind: 'leaf'; name: string; attrs?: Attrs }

export const makeBlock = (init: BlockInit): EditorBlock => {
  const id = crypto.randomUUID()
  if (init.kind === 'md') return { id, kind: 'md', text: init.text }
  if (init.kind === 'box') return { id, kind: 'box', name: init.name, attrs: init.attrs ?? {}, text: init.text ?? '' }
  return { id, kind: 'leaf', name: init.name, attrs: init.attrs ?? {} }
}

// Boş satırla ayrılan paragraflar ayrı blok olur. $$ ve ``` çitleri tek parça kalır
export function splitProse(text: string): string[] {
  const parts: string[] = []
  let current: string[] = []
  let fenced = false
  const flush = () => {
    const joined = current.join('\n').replace(/^\n+|\s+$/g, '')
    if (joined) parts.push(joined)
    current = []
  }
  for (const line of text.split('\n')) {
    const trimmed = line.trim()
    if (trimmed.startsWith('```') || (trimmed.match(/\$\$/g)?.length ?? 0) % 2 === 1) fenced = !fenced
    if (!fenced && trimmed === '') flush()
    else current.push(line)
  }
  flush()
  return parts
}

export function fromSource(source: string): EditorBlock[] {
  return parseBlocks(source).flatMap((block): EditorBlock[] => {
    if (block.type === 'md') return splitProse(block.text).map((text) => makeBlock({ kind: 'md', text }))
    if (block.type === 'box') return [makeBlock({ kind: 'box', name: block.name, attrs: block.attrs, text: block.text })]
    return [makeBlock({ kind: 'leaf', name: block.name, attrs: block.attrs })]
  })
}

export function attrString(attrs: Attrs) {
  const entries = Object.entries(attrs)
  if (!entries.length) return ''
  return `{${entries.map(([k, v]) => `${k}="${v.replace(/"/g, "'")}"`).join(' ')}}`
}

export function isEmpty(block: EditorBlock) {
  if (block.kind === 'leaf') return false
  if (block.kind === 'box' && block.name === 'soru') return block.text.replace(/^(?:[-*]\s+)?[A-E]\)\s*/gm, '').trim() === ''
  return block.text.trim() === ''
}

export function serializeBlock(block: EditorBlock) {
  if (block.kind === 'md') return block.text.trim()
  if (block.kind === 'leaf') return `::${block.name}${attrString(block.attrs)}`
  return `:::${block.name}${attrString(block.attrs)}\n${block.text.trim()}\n:::`.replace(/\n\n:::$/, '\n:::')
}

export function toSource(blocks: EditorBlock[]) {
  return blocks
    .filter((b) => !isEmpty(b))
    .map(serializeBlock)
    .join('\n\n')
}

export function questionNumberBefore(blocks: EditorBlock[], index: number) {
  return blocks.slice(0, index).filter((b) => b.kind === 'box' && b.name === 'soru').length
}

const norm = (text: string) =>
  text
    .split('\n')
    .map((l) => l.trim().replace(/^-\s+(?=[A-E]\))/, ''))
    .filter(Boolean)
    .join('\n')

export type QuestionFields = { passage: string; stem: string; options: string[]; solution: string }

export function composeQuestion(f: QuestionFields) {
  const letters = 'ABCDE'
  const head = [
    f.passage.trim() && f.passage.trim().split('\n').map((l) => `> ${l}`).join('\n'),
    f.stem.trim(),
    f.options.map((o, i) => `- ${letters[i]}) ${o.trim()}`).join('\n'),
  ].filter(Boolean)
  const solution = f.solution.trim()
  return head.join('\n\n') + (solution ? `\n\n---\n\n${solution}` : '')
}

// Soru metnini form alanlarına ayırır. Düzen standart değilse null döner, blok ham metinle düzenlenir
export function questionFields(text: string): QuestionFields | null {
  const lines = text.split('\n')
  const rule = lines.findIndex((l) => /^-{3,}\s*$/.test(l.trim()))
  const main = rule === -1 ? lines : lines.slice(0, rule)
  const solution = rule === -1 ? '' : lines.slice(rule + 1).join('\n').trim()
  const passage: string[] = []
  const stem: string[] = []
  const options: string[] = []
  for (const raw of main) {
    const line = raw.trim()
    if (!line) {
      if (!options.length && stem.length && stem[stem.length - 1] !== '') stem.push('')
      continue
    }
    const option = /^(?:[-*]\s+)?([A-E])\)\s*(.*)$/.exec(line)
    if (option) {
      if (option[1] !== 'ABCDE'[options.length]) return null
      options.push(option[2])
    } else if (options.length) {
      return null
    } else if (line.startsWith('>')) {
      if (stem.length) return null
      passage.push(line.replace(/^>\s?/, ''))
    } else {
      stem.push(line)
    }
  }
  const fields = { passage: passage.join('\n'), stem: stem.join('\n').trim().replace(/\n\n+/g, '\n\n'), options, solution }
  return norm(composeQuestion(fields)) === norm(text) ? fields : null
}

export function pairRows(text: string, separator: string): [string, string][] | null {
  const rows: [string, string][] = []
  for (const line of text.split('\n')) {
    const item = line.trim().replace(/^(?:[-*+]|\d+[.)])\s+/, '')
    if (!item) continue
    const at = item.indexOf(separator)
    if (at === -1) return null
    rows.push([item.slice(0, at).trim(), item.slice(at + separator.length).trim()])
  }
  return rows
}

export function listRows(text: string): string[] {
  return text
    .split('\n')
    .map((l) => l.trim().replace(/^(?:[-*+]|\d+[.)])\s+/, ''))
    .filter(Boolean)
}
