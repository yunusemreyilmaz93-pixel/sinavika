import { readdirSync, readFileSync } from 'node:fs'
import { join } from 'node:path'

export type BankQuestion = { position: number; stem: string; options: string[]; correct: number; explanation: string; difficulty: number }
export type BankSet = { file: string; exam: string; kind: string; subject: string; label: string; questions: BankQuestion[] }

const dir = join(process.cwd(), 'supabase/migrations')
const row =
  /\(\s*(\d+),\s*(?:'[\w-]+'|null),\s*(?:null::integer|\(select[\s\S]*?\$n\$\)),\s*\$q\$([\s\S]*?)\$q\$,\s*array\[((?:\s*\$o\$[\s\S]*?\$o\$\s*,?)+)\s*\],\s*(\d),\s*\$e\$([\s\S]*?)\$e\$,\s*(\d)\s*\)/g

// build-sets.mjs ile üretilen soru migration'larını okur
export function loadQuestionSets(): BankSet[] {
  const sets: BankSet[] = []
  for (const file of readdirSync(dir).filter((f) => f.endsWith('.sql')).sort()) {
    const sql = readFileSync(join(dir, file), 'utf8')
    if (!sql.includes('public.question_sets')) continue
    const parts = sql.split(/^-- (?=[a-z]+ \| (?:konu|brans|deneme) \| )/m).slice(1)
    for (const part of parts) {
      const [header, ...rest] = part.split('\n')
      const [exam, kind, subject, label] = header.split('|').map((s) => s.trim())
      const questions = [...rest.join('\n').matchAll(row)].map((m) => ({
        position: Number(m[1]),
        stem: m[2],
        options: [...m[3].matchAll(/\$o\$([\s\S]*?)\$o\$/g)].map((o) => o[1]),
        correct: Number(m[4]),
        explanation: m[5],
        difficulty: Number(m[6]),
      }))
      sets.push({ file, exam, kind, subject, label, questions })
    }
  }
  return sets
}
