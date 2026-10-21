// @vitest-environment node
import { describe, expect, it } from 'vitest'
import { callModel, listModels, type Turn } from '../api/_lib/ai/providers.js'

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

describe('model listesi', () => {
  const list = (provider: 'anthropic' | 'openai' | 'gemini' | 'together' | 'openrouter' | 'groq', body: unknown, status = 200) => {
    let url = ''
    const stub = (async (u: string) => {
      url = u
      return reply(body, status)
    }) as unknown as typeof fetch
    return listModels({ provider, apiKey: 'k' }, stub).then((models) => ({ models, url }))
  }

  it('OpenAI: yalnızca sohbet modellerini, yenisi önce getirir', async () => {
    const r = await list('openai', {
      data: [
        { id: 'text-embedding-3-large', created: 5 },
        { id: 'gpt-5.5', created: 100 },
        { id: 'gpt-5.6-sol', created: 300 },
        { id: 'whisper-1', created: 1 },
        { id: 'gpt-image-2', created: 200 },
        { id: 'o4-mini', created: 50 },
      ],
    })
    expect(r.models).toEqual(['gpt-5.6-sol', 'gpt-5.5', 'o4-mini'])
    expect(r.url).toBe('https://api.openai.com/v1/models')
  })
  it('Gemini: models/ önekini atar, gömme modellerini eler', async () => {
    const r = await list('gemini', { data: [{ id: 'models/gemini-4-argon' }, { id: 'models/gemini-3.8-flash' }, { id: 'models/text-embedding-004' }, { id: 'models/gemini-embedding-001' }] })
    expect(r.models).toEqual(['gemini-4-argon', 'gemini-3.8-flash'])
  })
  it('Anthropic: kendi adresine gider', async () => {
    const r = await list('anthropic', { data: [{ id: 'claude-sonnet-5-5' }, { id: 'claude-opus-5-5' }] })
    expect(r.url).toBe('https://api.anthropic.com/v1/models?limit=100')
    expect(r.models).toContain('claude-opus-5-5')
  })
  it('Together dizi döner ve yalnızca chat türü alınır, OpenRouter araç desteklemeyeni eler', async () => {
    expect((await list('together', [{ id: 'a/chat-1', type: 'chat' }, { id: 'a/img', type: 'image' }])).models).toEqual(['a/chat-1'])
    expect((await list('openrouter', { data: [{ id: 'x/tools', supported_parameters: ['tools'] }, { id: 'x/plain', supported_parameters: ['temperature'] }] })).models).toEqual(['x/tools'])
  })
  it('liste adresi yoksa boş döner, anahtar hatası iletilir', async () => {
    expect((await list('groq', { error: 'yok' }, 404)).models).toEqual([])
    await expect(list('groq', { error: { message: 'Invalid API Key' } }, 401)).rejects.toThrow(/Anahtar geçersiz/)
  })
})
