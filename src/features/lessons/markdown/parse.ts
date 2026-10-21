export type Attrs = Record<string, string>

export type Block =
  | { type: 'md'; text: string }
  | { type: 'box'; name: string; attrs: Attrs; text: string }
  | { type: 'leaf'; name: string; attrs: Attrs }

const NAME = '[a-zA-ZçğıöşüÇĞİÖŞÜ][a-zA-Z0-9çğıöşüÇĞİÖŞÜ-]*'
const BOX_OPEN = new RegExp(`^:::(${NAME})\\s*(\\{.*\\})?\\s*$`)
const BOX_CLOSE = /^:::\s*$/
const LEAF = new RegExp(`^::(${NAME})\\s*(\\{.*\\})?\\s*$`)

export function parseAttrs(raw: string | undefined): Attrs {
  const attrs: Attrs = {}
  if (!raw) return attrs
  const inner = raw.trim().replace(/^\{/, '').replace(/\}$/, '')
  for (const m of inner.matchAll(/([a-zA-ZçğıöşüÇĞİÖŞÜ][\w-çğıöşüÇĞİÖŞÜ]*)(?:\s*=\s*"([^"]*)")?/g)) {
    attrs[m[1]] = m[2] ?? ''
  }
  return attrs
}

export function parseBlocks(source: string): Block[] {
  const blocks: Block[] = []
  let buffer: string[] = []
  let box: { name: string; attrs: Attrs; lines: string[] } | null = null

  const flush = () => {
    const text = buffer.join('\n').trim()
    if (text) blocks.push({ type: 'md', text })
    buffer = []
  }

  for (const line of source.replace(/\r\n?/g, '\n').split('\n')) {
    if (box) {
      if (BOX_CLOSE.test(line)) {
        blocks.push({ type: 'box', name: box.name, attrs: box.attrs, text: box.lines.join('\n').trim() })
        box = null
      } else {
        box.lines.push(line)
      }
      continue
    }
    const open = BOX_OPEN.exec(line)
    if (open) {
      flush()
      box = { name: open[1], attrs: parseAttrs(open[2]), lines: [] }
      continue
    }
    const leaf = LEAF.exec(line)
    if (leaf) {
      flush()
      blocks.push({ type: 'leaf', name: leaf[1], attrs: parseAttrs(leaf[2]) })
      continue
    }
    buffer.push(line)
  }
  if (box) blocks.push({ type: 'box', name: box.name, attrs: box.attrs, text: box.lines.join('\n').trim() })
  flush()
  return blocks
}

const turkish: Record<string, string> = { ç: 'c', ğ: 'g', ı: 'i', ö: 'o', ş: 's', ü: 'u' }

export function slug(text: string) {
  return text
    .toLocaleLowerCase('tr')
    .replace(/[çğıöşü]/g, (c) => turkish[c])
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
}

export function plainText(markdown: string) {
  return markdown
    .replace(/\[([^\]]*)\]\([^)]*\)/g, '$1')
    .replace(/[*_`]/g, '')
    .trim()
}

export type OutlineItem = { id: string; title: string }

export function outlineOf(source: string): OutlineItem[] {
  const seen = new Map<string, number>()
  const items: OutlineItem[] = []
  for (const block of parseBlocks(source)) {
    if (block.type !== 'md') continue
    for (const line of block.text.split('\n')) {
      const m = /^##\s+(.+?)\s*$/.exec(line)
      if (!m) continue
      const title = plainText(m[1])
      const base = slug(title) || 'bolum'
      const n = seen.get(base) ?? 0
      seen.set(base, n + 1)
      items.push({ id: n ? `${base}-${n + 1}` : base, title })
    }
  }
  return items
}

export function listItems(text: string) {
  return text
    .split('\n')
    .map((l) => l.trim())
    .filter(Boolean)
    .map((l) => l.replace(/^(?:[-*+]|\d+[.)])\s+/, ''))
}

export function splitPipes(line: string) {
  return line.split('|').map((p) => p.trim())
}

export function parseQuestion(text: string) {
  const lines = text.split('\n')
  const rule = lines.findIndex((l) => /^-{3,}\s*$/.test(l.trim()))
  const main = rule === -1 ? lines : lines.slice(0, rule)
  const solution = rule === -1 ? '' : lines.slice(rule + 1).join('\n').trim()
  const passage: string[] = []
  const stem: string[] = []
  const options: string[] = []
  for (const raw of main) {
    const line = raw.trim()
    if (!line) continue
    const option = /^(?:[-*]\s+)?([A-E])\)\s*(.+)$/.exec(line)
    if (option) options.push(option[2])
    else if (line.startsWith('>')) passage.push(line.replace(/^>\s?/, ''))
    else stem.push(line)
  }
  return { passage: passage.join(' '), stem: stem.join(' '), options, solution }
}

export type LabToken = { text: string; kind?: 'isim' | 'sifat' | 'zarf' | 'yuklem'; note?: string }

export function parseLabSentence(line: string): LabToken[] {
  return line
    .replace(/^(?:[-*+]|\d+[.)])\s+/, '')
    .split(/\s\/\s/)
    .map((raw) => {
      const m = /^(.*?)\[(isim|sifat|zarf|yuklem)\|(.*)\]$/.exec(raw.trim())
      return m ? { text: m[1], kind: m[2] as LabToken['kind'], note: m[3] } : { text: raw.trim() }
    })
}

export function parseEras(raw: string | undefined) {
  if (!raw) return []
  return raw
    .split(',')
    .map((part) => {
      const m = /^(.*):\s*(\d{3,4})\s*-\s*(\d{3,4})$/.exec(part.trim())
      return m ? { label: m[1].trim(), from: Number(m[2]), to: Number(m[3]) } : null
    })
    .filter((e): e is { label: string; from: number; to: number } => e !== null)
}
