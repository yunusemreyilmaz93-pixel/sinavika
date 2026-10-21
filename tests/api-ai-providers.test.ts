// @vitest-environment node
import { describe, expect, it } from 'vitest'
import { callModel, type Turn } from '../api/_lib/ai/providers.js'

const reply = (body: unknown, status = 200) => new Response(JSON.stringify(body), { status })
const tools = [{ name: 'ogrencileri_listele', description: 'liste', schema: { type: 'object', properties: {} } }]
const turns: Turn[] = [
  { role: 'user', text: 'merhaba' },
  { role: 'assistant', text: '', calls: [{ id: 't1', name: 'ogrencileri_listele', input: {} }] },
  { role: 'tool', results: [{ id: 't1', name: 'ogrencileri_listele', content: '[]' }] },
]

describe('Anthropic bağdaştırıcısı', () => {
  it('isteği doğru kurar ve araç çağrısını okur', async () => {
    let seen: { url: string; init: RequestInit } | null = null
    const fetchStub = (async (url: string, init: RequestInit) => {
      seen = { url, init }
      return reply({ content: [{ type: 'text', text: 'bakıyorum' }, { type: 'tool_use', id: 'x1', name: 'ogrencileri_listele', input: { a: 1 } }] })
    }) as unknown as typeof fetch
    const out = await callModel({ provider: 'anthropic', apiKey: 'sk-ant-xyz', model: 'm' }, { system: 'S', turns, tools, maxTokens: 100 }, fetchStub)
    expect(out).toEqual({ text: 'bakıyorum', calls: [{ id: 'x1', name: 'ogrencileri_listele', input: { a: 1 } }] })
    const body = JSON.parse(String(seen!.init.body))
    expect(seen!.url).toBe('https://api.anthropic.com/v1/messages')
    expect((seen!.init.headers as Record<string, string>)['x-api-key']).toBe('sk-ant-xyz')
    expect(body.system).toBe('S')
    expect(body.messages[1].content[0]).toMatchObject({ type: 'tool_use', id: 't1' })
    expect(body.messages[2].content[0]).toMatchObject({ type: 'tool_result', tool_use_id: 't1' })
    expect(body.tools[0].input_schema).toBeDefined()
  })
})

describe('OpenAI uyumlu bağdaştırıcı', () => {
  it('isteği doğru kurar ve araç çağrısını okur', async () => {
    let seen: { url: string; init: RequestInit } | null = null
    const fetchStub = (async (url: string, init: RequestInit) => {
      seen = { url, init }
      return reply({ choices: [{ message: { content: null, tool_calls: [{ id: 'c1', type: 'function', function: { name: 'ogrencileri_listele', arguments: '{"b":2}' } }] } }] })
    }) as unknown as typeof fetch
    const out = await callModel({ provider: 'openai', apiKey: 'sk-oai', model: 'm' }, { system: 'S', turns, tools, maxTokens: 100 }, fetchStub)
    expect(out.calls).toEqual([{ id: 'c1', name: 'ogrencileri_listele', input: { b: 2 } }])
    const body = JSON.parse(String(seen!.init.body))
    expect(seen!.url).toBe('https://api.openai.com/v1/chat/completions')
    expect(body.messages[0]).toEqual({ role: 'system', content: 'S' })
    expect(body.messages[3]).toMatchObject({ role: 'tool', tool_call_id: 't1' })
    expect(body.max_completion_tokens).toBe(100)
  })
  it('Gemini uyumlu adrese gider ve max_tokens kullanır', async () => {
    let seen: { url: string; init: RequestInit } | null = null
    const fetchStub = (async (url: string, init: RequestInit) => {
      seen = { url, init }
      return reply({ choices: [{ message: { content: 'tamam' } }] })
    }) as unknown as typeof fetch
    const out = await callModel({ provider: 'gemini', apiKey: 'g', model: 'm' }, { system: 'S', turns: [{ role: 'user', text: 'a' }], tools: [], maxTokens: 50 }, fetchStub)
    expect(out.text).toBe('tamam')
    expect(seen!.url).toContain('generativelanguage.googleapis.com')
    expect(JSON.parse(String(seen!.init.body)).max_tokens).toBe(50)
  })
})

describe('hata çevirisi', () => {
  const run = (status: number, body: unknown) =>
    callModel({ provider: 'openai', apiKey: 'SIR-ANAHTAR', model: 'm' }, { system: '', turns: [{ role: 'user', text: 'a' }], tools: [], maxTokens: 5 }, (async () => reply(body, status)) as unknown as typeof fetch)

  it('anahtar, kota ve model hatalarını Türkçe söyler, sağlayıcı gövdesini sızdırmaz', async () => {
    await expect(run(401, { error: { message: 'Incorrect API key provided: SIR-ANAHTAR' } })).rejects.toThrow(/Anahtar geçersiz/)
    await expect(run(429, { error: { code: 'insufficient_quota' } })).rejects.toThrow(/kota/)
    await expect(run(404, { error: { message: 'The model does not exist' } })).rejects.toThrow(/model/i)
    await run(401, { error: { message: 'Incorrect API key provided: SIR-ANAHTAR' } }).catch((e: Error) => expect(e.message).not.toContain('SIR-ANAHTAR'))
  })
})
