// Soru setlerini (Markdown) tek bir migration dosyasına çevirir.
// Kullanım: node scripts/questions/build-sets.mjs <migration-adı> <klasör>
// Her .md dosyası bir settir. İlk satır: <sınav> | <tür> | <ders> | <konu ya da başlık> | <süre dk, ops.>
//   lgs | konu | lgs-mat | Çarpanlar ve Katlar | 32 | (ikinci test için "2")
//   lgs | brans | lgs-mat | Matematik branş denemesi 1 | 40
//   lgs | deneme | - | LGS genel deneme 1 | 155
// Sorular: :::soru{cevap="B" zorluk="2" konu="Konu adı"} ... --- çözüm ... :::
// Soru kökünde satır sonları korunur (tablo, liste, görsel). Seçenekler "A) ..." satırlarıdır.
import { readdirSync, readFileSync, writeFileSync } from 'node:fs'
import { join } from 'node:path'

const [name, dir] = process.argv.slice(2)
if (!name || !dir) {
  console.error('Kullanım: node scripts/questions/build-sets.mjs <migration-adı> <klasör>')
  process.exit(1)
}

const optionCount = { lgs: 4, tyt: 5, ayt: 5, ydt: 5 }
const kinds = ['konu', 'brans', 'deneme']
const q = (s) => {
  if (/\$(q|o|e|n|t)\$/.test(s)) throw new Error(`Metin ayırıcı içeriyor: ${s.slice(0, 60)}`)
  return s
}
const errors = []
let sql = `-- ${name}. Soru setleri. Doğru cevap istemciye inmez, puanlama submit_test ile sunucuda yapılır.\n\n`
let sets = 0
let total = 0

for (const file of readdirSync(dir).filter((f) => f.endsWith('.md')).sort()) {
  const raw = readFileSync(join(dir, file), 'utf8').replace(/\r/g, '')
  const nl = raw.indexOf('\n')
  const [exam, kind, subject, label, duration, suffix] = raw.slice(0, nl).split('|').map((s) => s.trim())
  const title = kind === 'konu' ? `${label} konu testi${suffix ? ` ${suffix}` : ''}` : label
  const fail = (msg) => errors.push(`${file}: ${msg}`)
  if (!optionCount[exam]) fail(`bilinmeyen sınav ${exam}`)
  if (!kinds.includes(kind)) fail(`bilinmeyen tür ${kind}`)
  const body = raw.slice(nl + 1)
  const blocks = [...body.matchAll(/^:::soru\{([^}]*)\}\n([\s\S]*?)\n:::\s*$/gm)]
  if (!blocks.length) fail('soru yok')

  const rows = []
  const keys = []
  blocks.forEach((m, i) => {
    const attrs = Object.fromEntries([...m[1].matchAll(/(\w+)="([^"]*)"/g)].map((a) => [a[1], a[2]]))
    const rule = m[2].search(/^-{3,}\s*$/m)
    const main = (rule === -1 ? m[2] : m[2].slice(0, rule)).trim()
    const explanation = rule === -1 ? '' : m[2].slice(rule).replace(/^-{3,}\s*\n?/, '').trim()
    const options = []
    const stem = []
    for (const line of main.split('\n')) {
      const o = /^([A-E])\)\s+(.+)$/.exec(line.trim())
      if (o) {
        if (o[1] !== 'ABCDE'[options.length]) fail(`${i + 1}. soruda şıklar sıralı değil`)
        options.push(o[2].trim())
      } else if (!options.length) stem.push(line)
      else fail(`${i + 1}. soruda şıklardan sonra metin var: ${line.slice(0, 40)}`)
    }
    const cevap = 'ABCDE'.indexOf(attrs.cevap)
    const diff = Number(attrs.zorluk ?? 2)
    if (options.length !== optionCount[exam]) fail(`${i + 1}. soruda ${options.length} şık var, ${optionCount[exam]} olmalı`)
    if (cevap < 0 || cevap >= options.length) fail(`${i + 1}. soruda cevap geçersiz`)
    if (![1, 2, 3].includes(diff)) fail(`${i + 1}. soruda zorluk geçersiz`)
    if (explanation.length < 20) fail(`${i + 1}. soruda çözüm kısa`)
    if (kind !== 'konu' && !attrs.konu && subject !== '-') fail(`${i + 1}. soruda konu yok`)
    keys.push(cevap)
    rows.push({ stem: stem.join('\n').trim(), options, cevap, explanation, diff, topic: attrs.konu, subject: attrs.ders ?? subject })
  })

  if (kind === 'konu' && rows.length >= 8) {
    const n = optionCount[exam]
    const counts = Array.from({ length: n }, (_, k) => keys.filter((x) => x === k).length)
    const expected = rows.length / n
    if (counts.some((c) => Math.abs(c - expected) > Math.max(1.5, expected * 0.4))) fail(`doğru şık dağılımı dengesiz: ${counts.join(', ')}`)
  }

  const subjectSql = subject === '-' ? 'null' : `'${subject}'`
  const examSql = exam.toUpperCase()
  const values = rows
    .map((r, i) => {
      const subj = r.subject === '-' ? 'null' : `'${r.subject}'`
      const topic = kind === 'konu' ? 'null::integer' : r.topic ? `(select t.id from public.topics t where t.subject_id = ${subj} and t.name = $n$${q(r.topic)}$n$)` : 'null::integer'
      return `  (${i + 1}, ${subj}, ${topic}, $q$${q(r.stem)}$q$, array[${r.options.map((o) => `$o$${q(o)}$o$`).join(', ')}], ${r.cevap}, $e$${q(r.explanation)}$e$, ${r.diff})`
    })
    .join(',\n')

  const head =
    kind === 'konu'
      ? `insert into public.question_sets (exam, kind, subject_id, topic_id, title, duration_min, published)
  select '${examSql}', 'konu', '${subject}', t.id, $t$${q(title)}$t$, ${duration ? Number(duration) : 'null'}, true
  from public.topics t where t.subject_id = '${subject}' and t.name = $n$${q(label)}$n$
  on conflict do nothing
  returning id, topic_id`
      : `insert into public.question_sets (exam, kind, subject_id, title, duration_min, published)
  select '${examSql}', '${kind}', ${subjectSql}, $t$${q(label)}$t$, ${duration ? Number(duration) : 'null'}, true
  where not exists (select 1 from public.question_sets x where x.exam = '${examSql}' and x.kind = '${kind}' and x.title = $t$${q(label)}$t$)
  returning id, null::integer as topic_id`

  sql += `-- ${exam} | ${kind} | ${subject} | ${title}\nwith s as (\n  ${head}\n)\ninsert into public.questions (set_id, position, subject_id, topic_id, stem, options, correct, explanation, difficulty)\nselect s.id, v.position, v.subject_id, coalesce(s.topic_id, v.topic_id), v.stem, v.options, v.correct, v.explanation, v.difficulty\nfrom s, (values\n${values}\n) as v(position, subject_id, topic_id, stem, options, correct, explanation, difficulty);\n\n`
  sets++
  total += rows.length
}

if (errors.length) {
  console.error(errors.join('\n'))
  process.exit(1)
}
writeFileSync(new URL(`../../supabase/migrations/${name}.sql`, import.meta.url), sql)
console.log(`${sets} set, ${total} soru, ${name}`)
