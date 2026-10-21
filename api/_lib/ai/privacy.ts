import { pseudonym } from './crypto.js'

export type Person = { id: string; name: string; kind: 'student' | 'parent' }

const FOLD: Record<string, string> = { ı: 'i', İ: 'i', I: 'i', ş: 's', Ş: 's', ç: 'c', Ç: 'c', ğ: 'g', Ğ: 'g', ö: 'o', Ö: 'o', ü: 'u', Ü: 'u' }

// Her karakter bire bir eşlenir, böylece katlanmış metindeki konum özgün metinle aynı kalır
export function fold(text: string) {
  let out = ''
  for (const ch of text) {
    const mapped = FOLD[ch] ?? ch.toLowerCase()
    out += mapped.length === 1 ? mapped : ch
  }
  return out
}

const SUFFIX = "(?:['’][\\p{L}]{1,8}|n?in|n?un|[dt][ae]n?|[yn]?[aeiu]|[yn]?l[ae]|l[ae]r[a-z]{0,3}|[iu]m|[iu]z|s[iu])?"
const escape = (s: string) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')

function namePattern(name: string) {
  const words = fold(name).trim().split(/\s+/).map(escape)
  return new RegExp(`(?<![\\p{L}\\p{N}])${words.join('\\s+')}${SUFFIX}(?![\\p{L}\\p{N}])`, 'gu')
}

const PII: [RegExp, string][] = [
  [/[\w.+-]+@[\w-]+(?:\.[\w-]+)+/g, '[e-posta]'],
  [/\bTR\d{2}(?:\s?\d{4}){5}\s?\d{2}\b/gi, '[iban]'],
  [/(?<!\d)(?:\+?90[\s-]?)?0?\(?5\d{2}\)?[\s-]?\d{3}[\s-]?\d{2}[\s-]?\d{2}(?!\d)/g, '[telefon]'],
  [/(?<!\d)\d{11}(?!\d)/g, '[kimlik no]'],
]

export function scrubPii(text: string) {
  return PII.reduce((acc, [pattern, label]) => acc.replace(pattern, label), text)
}

export function makePrivacy(teacherId: string, people: Person[]) {
  const tokens = new Map<string, string>()
  const owners = new Map<string, Person>()
  for (const person of [...people].sort((a, b) => a.id.localeCompare(b.id))) {
    const prefix = person.kind === 'student' ? 'OGR' : 'VELI'
    let attempt = 0
    let token = pseudonym(prefix, teacherId, person.id, attempt)
    while (owners.has(token)) token = pseudonym(prefix, teacherId, person.id, ++attempt)
    tokens.set(person.id, token)
    owners.set(token, person)
  }

  const firstNameCount = new Map<string, number>()
  for (const p of people) {
    const first = fold(p.name.split(/\s+/)[0] ?? '')
    firstNameCount.set(first, (firstNameCount.get(first) ?? 0) + 1)
  }
  const display = (p: Person) => {
    const first = p.name.split(/\s+/)[0] ?? p.name
    return (firstNameCount.get(fold(first)) ?? 0) > 1 ? p.name : first
  }

  // Önce tam adlar, sonra ilk adlar. Uzun ad önce, kısa ad sonra eşleşir
  const rules: { pattern: RegExp; token: string }[] = []
  for (const p of people) rules.push({ pattern: namePattern(p.name), token: tokens.get(p.id)! })
  for (const p of people) {
    const first = p.name.split(/\s+/)[0]
    if (first && first.length >= 2) rules.push({ pattern: namePattern(first), token: tokens.get(p.id)! })
  }
  const surnames = [...new Set(people.map((p) => p.name.split(/\s+/).slice(1).join(' ')).filter((s) => s.length >= 3))]
  const surnamePatterns = surnames.map(namePattern)

  const scrub = (text: string) => {
    let out = scrubPii(text)
    for (const { pattern, token } of rules) {
      const lowered = fold(out)
      let result = ''
      let last = 0
      for (const m of lowered.matchAll(pattern)) {
        const start = m.index ?? 0
        const tail = out.slice(start, start + m[0].length).match(/['’][\p{L}]{1,8}$/u)?.[0] ?? ''
        result += out.slice(last, start) + token + tail
        last = start + m[0].length
      }
      out = result + out.slice(last)
    }
    for (const pattern of surnamePatterns) {
      const lowered = fold(out)
      let result = ''
      let last = 0
      for (const m of lowered.matchAll(pattern)) {
        const start = m.index ?? 0
        result += out.slice(last, start) + '[soyad]'
        last = start + m[0].length
      }
      out = result + out.slice(last)
    }
    return out
  }

  const restore = (text: string) =>
    text.replace(/\b(OGR|VELI)-(\d{6})\b/gi, (whole, prefix: string, digits: string) => {
      const owner = owners.get(`${prefix.toUpperCase()}-${digits}`)
      return owner ? display(owner) : whole
    })

  return {
    tokenOf: (id: string) => tokens.get(id),
    personOf: (token: string) => owners.get(token.trim().toUpperCase()),
    scrub,
    restore,
  }
}

export type Privacy = ReturnType<typeof makePrivacy>
