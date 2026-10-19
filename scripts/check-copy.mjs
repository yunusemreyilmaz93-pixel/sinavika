import { readdirSync, readFileSync, statSync } from 'node:fs'
import { join, relative } from 'node:path'

const root = new URL('..', import.meta.url).pathname
const targets = ['src', 'api', 'index.html']
const exts = new Set(['.ts', '.tsx', '.html', '.css', '.json'])

const banned = [
  'yolculuğ',
  'bir sonraki seviye',
  'seviyeyi atla',
  'sorunsuz',
  'kusursuz',
  'devrim',
  'benzersiz',
  'eşsiz',
  'keşfedin',
  'potansiyelini',
  'güçlendirin',
  'dönüştürün',
  'hemen şimdi',
  'en iyi deneyim',
  'yenilikçi',
  'dünya standartlarında',
  'oyunun kurallarını',
  'lorem ipsum',
]

const stringOrText = /(["'`])((?:\\.|(?!\1)[^\\])*)\1|>([^<>{}]+)</g
const pictographic = /\p{Extended_Pictographic}/u

function walk(path, out) {
  const stat = statSync(path)
  if (stat.isDirectory()) {
    for (const name of readdirSync(path)) walk(join(path, name), out)
  } else if (exts.has(path.slice(path.lastIndexOf('.')))) {
    out.push(path)
  }
  return out
}

const files = targets.flatMap((t) => {
  try {
    return walk(join(root, t), [])
  } catch {
    return []
  }
})

const problems = []

for (const file of files) {
  const lines = readFileSync(file, 'utf8').split('\n')
  lines.forEach((line, i) => {
    if (line.includes('copy-ok')) return
    const where = `${relative(root, file)}:${i + 1}`
    if (/[–—]/.test(line)) problems.push(`${where}  uzun tire`)
    if (pictographic.test(line)) problems.push(`${where}  emoji`)
    for (const m of line.matchAll(stringOrText)) {
      const text = (m[2] ?? m[3] ?? '').toLocaleLowerCase('tr')
      if (!/[a-zçğıöşü]{2,}\s/.test(text)) continue
      if (/;\s/.test(text)) problems.push(`${where}  metinde noktalı virgül`)
      for (const word of banned) {
        if (text.includes(word)) problems.push(`${where}  yasaklı ifade: "${word}"`)
      }
      if (/!{2,}/.test(text)) problems.push(`${where}  art arda ünlem`)
    }
  })
}

if (problems.length) {
  console.error(`Metin kuralı ihlalleri (${problems.length}):\n` + problems.join('\n'))
  process.exit(1)
}
