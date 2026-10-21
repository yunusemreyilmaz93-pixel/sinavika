import { readdirSync, readFileSync } from 'node:fs'
import { join } from 'node:path'
import { describe, expect, it } from 'vitest'
import { listItems, parseBlocks, parseQuestion } from './markdown/parse'

// Migration içindeki anlatımları (insert into public.lessons) bulur ve blok söz dizimini denetler
const dir = join(process.cwd(), 'supabase/migrations')
const insert = /insert into public\.lessons \(topic_id, body, reading_minutes, published\)\s*select id, \$lesson\$([\s\S]*?)\$lesson\$, (\d+), (true|false) from public\.topics where subject_id = '([\w-]+)' and name = '([^']+)'/g

const lessons = readdirSync(dir)
  .filter((f) => f.endsWith('.sql'))
  .flatMap((file) => [...readFileSync(join(dir, file), 'utf8').matchAll(insert)].map((m) => ({ file, body: m[1], subject: m[4], topic: m[5] })))

const BOXES = new Set(['hedefler', 'ipucu', 'baglanti', 'neden-sonuc', 'cizelge', 'zaman', 'formul', 'cumle-lab', 'soru', 'dene'])
const LEAVES = new Set(['video', 'sim'])

describe('konu anlatımı içeriği', () => {
  it('anlatım bulundu', () => expect(lessons.length).toBeGreaterThan(0))

  for (const { file, body, subject, topic } of lessons) {
    describe(`${subject} / ${topic} (${file})`, () => {
      const blocks = parseBlocks(body)

      it('bilinen bloklar kullanılmış, kutular kapatılmış', () => {
        for (const b of blocks) {
          if (b.type === 'box') expect(BOXES.has(b.name), `bilinmeyen kutu: ${b.name}`).toBe(true)
          if (b.type === 'leaf') expect(LEAVES.has(b.name), `bilinmeyen blok: ${b.name}`).toBe(true)
        }
        expect(body.split('\n').filter((l) => /^:::[a-zA-Z]/.test(l)).length).toBe(body.split('\n').filter((l) => /^:::\s*$/.test(l)).length)
      })

      it('sorular geçerli: seçenekler, doğru cevap ve çözüm var', () => {
        const questions = blocks.filter((b) => b.type === 'box' && b.name === 'soru')
        expect(questions.length).toBeGreaterThanOrEqual(2)
        for (const q of questions) {
          if (q.type !== 'box') continue
          const parsed = parseQuestion(q.text)
          expect(parsed.stem.length).toBeGreaterThan(10)
          expect([4, 5]).toContain(parsed.options.length)
          expect('ABCDE'.indexOf(q.attrs.cevap ?? ''), `cevap: ${q.attrs.cevap}`).toBeGreaterThanOrEqual(0)
          expect('ABCDE'.indexOf(q.attrs.cevap)).toBeLessThan(parsed.options.length)
          expect(parsed.solution.length).toBeGreaterThan(20)
          expect(new Set(parsed.options).size, 'seçenekler tekrar ediyor').toBe(parsed.options.length)
        }
      })

      it('kendini dene ve neden-sonuç satırlarında => var', () => {
        const checks = blocks.filter((b) => b.type === 'box' && (b.name === 'dene' || b.name === 'neden-sonuc'))
        expect(checks.some((b) => b.type === 'box' && b.name === 'dene')).toBe(true)
        for (const b of checks) {
          if (b.type !== 'box') continue
          for (const line of listItems(b.text)) expect(line, `=> yok: ${line}`).toContain('=>')
        }
      })

      it('hedefler ile başlar, yeterince uzun, yasak işaret içermez', () => {
        expect(body.trimStart().startsWith('## Bu konuda ne öğreneceksin')).toBe(true)
        expect(blocks.some((b) => b.type === 'box' && b.name === 'hedefler')).toBe(true)
        expect(body.split(/\s+/).length).toBeGreaterThan(700)
        expect(body).not.toMatch(/[—–]/)
        expect(body.replace(/\$[^$]*\$/g, '')).not.toContain(';')
        expect(body).not.toMatch(/\p{Extended_Pictographic}/u)
      })
    })
  }
})
