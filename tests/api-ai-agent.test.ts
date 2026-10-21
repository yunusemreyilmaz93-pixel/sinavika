// @vitest-environment node
import { beforeAll, describe, expect, it, vi } from 'vitest'
import { runChat } from '../api/_lib/ai/agent.js'
import { makePrivacy } from '../api/_lib/ai/privacy.js'
import type { ToolContext } from '../api/_lib/ai/tools.js'

const teacher = '11111111-1111-1111-1111-111111111111'
const elifId = 'a0000000-0000-0000-0000-000000000001'
const people = [
  { id: elifId, name: 'Elif Yılmaz', kind: 'student' as const },
  { id: 'b0000000-0000-0000-0000-000000000001', name: 'Mehmet Yılmaz', kind: 'parent' as const },
]

beforeAll(() => {
  vi.stubEnv('AI_KEY_SECRET', 'test-secret-test-secret-test-secret')
})

function context(): ToolContext {
  return {
    db: {} as ToolContext['db'],
    privacy: makePrivacy(teacher, people),
    students: [{ id: elifId, track: 'lgs', grade: 8, field: null }],
    names: new Map([[elifId, 'Elif Yılmaz']]),
    today: '2026-10-21',
    proposals: [],
    curriculum: async () => ({
      subjects: [{ id: 'lgs-mat', exam: 'LGS', name: 'Matematik', fields: null, sort: 1 }],
      topics: [{ id: 7, subject_id: 'lgs-mat', name: 'Çarpanlar ve Katlar' }],
    }),
  }
}

const reply = (message: Record<string, unknown>) => new Response(JSON.stringify({ choices: [{ message }] }))

describe('asistan döngüsü', () => {
  it('sağlayıcıya gerçek ad gitmez, yanıtta ad geri gelir, görev yalnızca taslak olur', async () => {
    const ctx = context()
    const token = ctx.privacy.tokenOf(elifId)!
    const bodies: string[] = []
    let call = 0
    const fetchImpl = (async (_url: string, init: RequestInit) => {
      bodies.push(String(init.body))
      call++
      if (call === 1) return reply({ content: null, tool_calls: [{ id: 'c1', type: 'function', function: { name: 'ogrencileri_listele', arguments: '{}' } }] })
      if (call === 2) {
        const args = { ogrenci: token, gorevler: [{ baslik: 'Çarpanlar 20 soru', tur: 'soru', ders: 'matematik', konu: 'carpanlar', tarih: '2026-10-23', hedef_soru: 20 }] }
        return reply({ content: null, tool_calls: [{ id: 'c2', type: 'function', function: { name: 'gorev_onerisi_hazirla', arguments: JSON.stringify(args) } }] })
      }
      return reply({ content: `${token}'e Perşembe için bir görev hazırladım.` })
    }) as unknown as typeof fetch

    const out = await runChat({
      model: { provider: 'openai', apiKey: 'k', model: 'm' },
      history: [{ role: 'user', content: "Elif Yılmaz'a Perşembe matematik görevi ver. Velisi Mehmet Bey 0532 111 22 33 numarasından aradı" }],
      ctx,
      fetchImpl,
    })

    for (const body of bodies) {
      expect(body).not.toMatch(/Elif|Yılmaz|Mehmet|0532/)
    }
    expect(bodies[0]).toContain(token)
    expect(bodies[0]).toContain('[telefon]')
    expect(out.text).toBe("Elif'e Perşembe için bir görev hazırladım.")
    expect(out.proposals).toHaveLength(1)
    expect(out.proposals[0]).toMatchObject({ studentId: elifId, studentName: 'Elif Yılmaz' })
    expect(out.proposals[0].tasks[0]).toMatchObject({ kind: 'questions', subject_id: 'lgs-mat', topic_id: 7, due_on: '2026-10-23', target_questions: 20 })
    expect(JSON.stringify(out.sent)).not.toMatch(/Elif|Yılmaz|Mehmet/)
  })

  it('geçmiş tarihli ya da bilinmeyen öğrenciyle ilgili isteği reddeder, taslak oluşturmaz', async () => {
    const ctx = context()
    const token = ctx.privacy.tokenOf(elifId)!
    let call = 0
    const fetchImpl = (async () => {
      call++
      if (call === 1) {
        const args = { ogrenci: token, gorevler: [{ baslik: 'Eski', tur: 'soru', tarih: '2026-01-01' }] }
        return reply({ content: null, tool_calls: [{ id: 'c1', type: 'function', function: { name: 'gorev_onerisi_hazirla', arguments: JSON.stringify(args) } }] })
      }
      if (call === 2) return reply({ content: null, tool_calls: [{ id: 'c2', type: 'function', function: { name: 'ogrenci_ozeti', arguments: '{"ogrenci":"OGR-000000"}' } }] })
      return reply({ content: 'Yapamadım.' })
    }) as unknown as typeof fetch
    const out = await runChat({ model: { provider: 'openai', apiKey: 'k', model: 'm' }, history: [{ role: 'user', content: 'görev ver' }], ctx, fetchImpl })
    expect(out.proposals).toHaveLength(0)
    expect(out.text).toBe('Yapamadım.')
  })

  it('araç sonucundaki komut metni çıktıyı ele geçiremez, adım sayısı sınırlıdır', async () => {
    const ctx = context()
    const fetchImpl = (async () =>
      reply({ content: null, tool_calls: [{ id: 'x', type: 'function', function: { name: 'ogrencileri_listele', arguments: '{}' } }] })) as unknown as typeof fetch
    const out = await runChat({ model: { provider: 'openai', apiKey: 'k', model: 'm' }, history: [{ role: 'user', content: 'liste' }], ctx, fetchImpl })
    expect(out.text).toMatch(/çok adım/)
  })
})
