import { readdirSync, readFileSync } from 'node:fs'
import { join } from 'node:path'

export type LessonSource = { file: string; body: string; subject: string; topic: string }

const dir = join(process.cwd(), 'supabase/migrations')
const name = "((?:[^']|'')*)"
const insert = new RegExp(
  `insert into public\\.lessons \\(topic_id, body, reading_minutes, published\\)\\s*select id, \\$lesson\\$([\\s\\S]*?)\\$lesson\\$, (\\d+), (?:true|false) from public\\.topics where subject_id = '([\\w-]+)' and name = '${name}'`,
  'g',
)
const edit = new RegExp(
  `update public\\.lessons l\\s+set body = replace\\(l\\.body, \\$o\\$([\\s\\S]*?)\\$o\\$, \\$n\\$([\\s\\S]*?)\\$n\\$\\)\\s+from public\\.topics t\\s+where t\\.id = l\\.topic_id and t\\.subject_id = '([\\w-]+)' and t\\.name = '${name}'`,
  'g',
)

// Migration sırasıyla anlatım eklemelerini ve `replace` ile yapılan metin düzeltmelerini uygular
export function loadLessons(): LessonSource[] {
  const lessons = new Map<string, LessonSource>()
  const files = readdirSync(dir)
    .filter((f) => f.endsWith('.sql'))
    .sort()
  for (const file of files) {
    const sql = readFileSync(join(dir, file), 'utf8')
    for (const m of sql.matchAll(insert)) {
      const topic = m[4].replace(/''/g, "'")
      lessons.set(`${m[3]}/${topic}`, { file, body: m[1], subject: m[3], topic })
    }
    for (const m of sql.matchAll(edit)) {
      const lesson = lessons.get(`${m[3]}/${m[4].replace(/''/g, "'")}`)
      if (lesson) lesson.body = lesson.body.split(m[1]).join(m[2])
    }
  }
  return [...lessons.values()]
}
