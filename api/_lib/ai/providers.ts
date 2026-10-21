import { HttpError } from '../server.js'

export const PROVIDER_IDS = ['anthropic', 'openai', 'gemini', 'xai', 'mistral', 'deepseek', 'groq', 'openrouter', 'together'] as const
export type Provider = (typeof PROVIDER_IDS)[number]
type CompatibleProvider = Exclude<Provider, 'anthropic'>
export type ToolSpec = { name: string; description: string; schema: Record<string, unknown> }
export type ToolCall = { id: string; name: string; input: Record<string, unknown> }
export type Turn =
  | { role: 'user'; text: string }
  | { role: 'assistant'; text: string; calls: ToolCall[] }
  | { role: 'tool'; results: { id: string; name: string; content: string }[] }
export type ModelReply = { text: string; calls: ToolCall[] }
export type ModelConfig = { provider: Provider; apiKey: string; model: string }
export type ModelRequest = { system: string; turns: Turn[]; tools: ToolSpec[]; maxTokens: number }

const COMPATIBLE: Record<CompatibleProvider, { base: string; maxTokens: 'max_completion_tokens' | 'max_tokens' }> = {
  openai: { base: 'https://api.openai.com/v1', maxTokens: 'max_completion_tokens' },
  gemini: { base: 'https://generativelanguage.googleapis.com/v1beta/openai', maxTokens: 'max_tokens' },
  xai: { base: 'https://api.x.ai/v1', maxTokens: 'max_tokens' },
  mistral: { base: 'https://api.mistral.ai/v1', maxTokens: 'max_tokens' },
  deepseek: { base: 'https://api.deepseek.com', maxTokens: 'max_tokens' },
  groq: { base: 'https://api.groq.com/openai/v1', maxTokens: 'max_tokens' },
  openrouter: { base: 'https://openrouter.ai/api/v1', maxTokens: 'max_tokens' },
  together: { base: 'https://api.together.ai/v1', maxTokens: 'max_tokens' },
}

const baseOf = (provider: CompatibleProvider) => process.env[`AI_${provider.toUpperCase()}_BASE_URL`] || COMPATIBLE[provider].base

// Sağlayıcı yanıtının gövdesi anahtarı geri döndürebilir. Hiçbir zaman öğretmene ya da günlüğe aktarılmaz
function failure(status: number, body: string): never {
  const text = body.toLowerCase()
  if (status === 401 || status === 403 || (status === 400 && /api key|api_key|invalid_api_key|api-key/.test(text))) {
    throw new HttpError(400, 'Anahtar geçersiz görünüyor. Sağlayıcının sayfasından kopyalayıp tekrar deneyin')
  }
  if (status === 402 || /insufficient_quota|credit balance|billing|exceeded your current quota/.test(text)) {
    throw new HttpError(400, 'Sağlayıcı hesabında kota ya da bakiye bitmiş. Sağlayıcının sayfasından kontrol edin')
  }
  if (status === 404 || /model.*(not found|does not exist)|not_found_error/.test(text)) {
    throw new HttpError(400, 'Bu model bulunamadı. Model adını kontrol edin')
  }
  if (status === 429) throw new HttpError(429, 'Sağlayıcı şu an çok fazla istek aldığını söylüyor. Bir dakika sonra tekrar deneyin')
  if (status >= 500) throw new HttpError(502, 'Yapay zekâ sağlayıcısı geçici olarak yanıt vermiyor. Biraz sonra tekrar deneyin')
  throw new HttpError(400, `Sağlayıcı isteği kabul etmedi (hata ${status}). Model adını kontrol et`)
}

async function send(url: string, init: RequestInit, fetchImpl: typeof fetch) {
  let response: Response
  try {
    response = await fetchImpl(url, { ...init, signal: AbortSignal.timeout(45_000) })
  } catch {
    throw new HttpError(504, 'Yapay zekâ sağlayıcısına ulaşılamadı ya da yanıt çok uzun sürdü. Tekrar deneyin')
  }
  const raw = await response.text().catch(() => '')
  if (!response.ok) failure(response.status, raw)
  try {
    return JSON.parse(raw) as Record<string, unknown>
  } catch {
    throw new HttpError(502, 'Sağlayıcıdan okunamayan bir yanıt geldi')
  }
}

function anthropicMessages(turns: Turn[]) {
  return turns.flatMap((t): Record<string, unknown>[] => {
    if (t.role === 'user') return t.text.trim() ? [{ role: 'user', content: t.text }] : []
    if (t.role === 'assistant') {
      const content = [
        ...(t.text.trim() ? [{ type: 'text', text: t.text }] : []),
        ...t.calls.map((c) => ({ type: 'tool_use', id: c.id, name: c.name, input: c.input })),
      ]
      return content.length ? [{ role: 'assistant', content }] : []
    }
    return [{ role: 'user', content: t.results.map((r) => ({ type: 'tool_result', tool_use_id: r.id, content: r.content })) }]
  })
}

async function anthropic(cfg: ModelConfig, req: ModelRequest, fetchImpl: typeof fetch): Promise<ModelReply> {
  const data = await send(
    'https://api.anthropic.com/v1/messages',
    {
      method: 'POST',
      headers: { 'content-type': 'application/json', 'x-api-key': cfg.apiKey, 'anthropic-version': '2023-06-01' },
      body: JSON.stringify({
        model: cfg.model,
        max_tokens: req.maxTokens,
        system: req.system,
        messages: anthropicMessages(req.turns),
        ...(req.tools.length ? { tools: req.tools.map((t) => ({ name: t.name, description: t.description, input_schema: t.schema })) } : {}),
      }),
    },
    fetchImpl,
  )
  const blocks = Array.isArray(data.content) ? (data.content as Record<string, unknown>[]) : []
  return {
    text: blocks.filter((b) => b.type === 'text').map((b) => String(b.text ?? '')).join('\n').trim(),
    calls: blocks
      .filter((b) => b.type === 'tool_use')
      .map((b) => ({ id: String(b.id), name: String(b.name), input: (b.input ?? {}) as Record<string, unknown> })),
  }
}

function openaiMessages(system: string, turns: Turn[]) {
  return [
    { role: 'system', content: system },
    ...turns.flatMap((t): Record<string, unknown>[] => {
      if (t.role === 'user') return t.text.trim() ? [{ role: 'user', content: t.text }] : []
      if (t.role === 'assistant') {
        if (!t.text.trim() && !t.calls.length) return []
        return [
          {
            role: 'assistant',
            content: t.text.trim() || null,
            ...(t.calls.length
              ? { tool_calls: t.calls.map((c) => ({ id: c.id, type: 'function', function: { name: c.name, arguments: JSON.stringify(c.input) } })) }
              : {}),
          },
        ]
      }
      return t.results.map((r) => ({ role: 'tool', tool_call_id: r.id, content: r.content }))
    }),
  ]
}

async function openaiCompatible(cfg: ModelConfig & { provider: CompatibleProvider }, req: ModelRequest, fetchImpl: typeof fetch): Promise<ModelReply> {
  const base = baseOf(cfg.provider)
  const limit = { [COMPATIBLE[cfg.provider].maxTokens]: req.maxTokens }
  const data = await send(
    `${base}/chat/completions`,
    {
      method: 'POST',
      headers: { 'content-type': 'application/json', authorization: `Bearer ${cfg.apiKey}` },
      body: JSON.stringify({
        model: cfg.model,
        ...limit,
        messages: openaiMessages(req.system, req.turns),
        ...(req.tools.length
          ? { tools: req.tools.map((t) => ({ type: 'function', function: { name: t.name, description: t.description, parameters: t.schema } })) }
          : {}),
      }),
    },
    fetchImpl,
  )
  const choice = (Array.isArray(data.choices) ? data.choices[0] : null) as { message?: Record<string, unknown> } | null
  const message = choice?.message ?? {}
  const calls = Array.isArray(message.tool_calls) ? (message.tool_calls as Record<string, unknown>[]) : []
  return {
    text: typeof message.content === 'string' ? message.content.trim() : '',
    calls: calls.map((c, i) => {
      const fn = (c.function ?? {}) as { name?: string; arguments?: string }
      let input: Record<string, unknown>
      try {
        input = JSON.parse(fn.arguments || '{}')
      } catch {
        input = {}
      }
      return { id: String(c.id ?? `call_${i}`), name: String(fn.name ?? ''), input }
    }),
  }
}

export function callModel(cfg: ModelConfig, req: ModelRequest, fetchImpl: typeof fetch = fetch): Promise<ModelReply> {
  if (cfg.provider === 'anthropic') {
    const override = process.env.AI_ANTHROPIC_BASE_URL
    return anthropic(cfg, req, override ? ((url, init) => fetchImpl(String(url).replace('https://api.anthropic.com', override), init)) as typeof fetch : fetchImpl)
  }
  return openaiCompatible(cfg as ModelConfig & { provider: CompatibleProvider }, req, fetchImpl)
}

type ListedModel = { id?: unknown; created?: unknown; type?: unknown; supported_parameters?: unknown; architecture?: { output_modalities?: unknown } }

const NOT_CHAT = /embed|moderation|whisper|tts|transcribe|audio|realtime|image|imagen|veo|dall|speech|rerank|guard|ocr|aqa|diarize|search|vision-preview|safeguard|live|computer-use/i

function isChatModel(provider: Provider, id: string, item: ListedModel) {
  if (NOT_CHAT.test(id)) return false
  if (provider === 'openai') return /^(gpt-|o\d|chatgpt-)/.test(id)
  if (provider === 'gemini') return id.startsWith('gemini')
  if (provider === 'together') return item.type === undefined || item.type === 'chat'
  if (provider === 'openrouter') return !Array.isArray(item.supported_parameters) || item.supported_parameters.includes('tools')
  return true
}

// Anahtarla sağlayıcıdan sohbet modellerinin güncel listesini ister. Liste adresi yoksa boş döner, model elle yazılır
export async function listModels(cfg: { provider: Provider; apiKey: string }, fetchImpl: typeof fetch = fetch): Promise<string[]> {
  const anthropicBase = process.env.AI_ANTHROPIC_BASE_URL || 'https://api.anthropic.com'
  const request: { url: string; headers: Record<string, string> } =
    cfg.provider === 'anthropic'
      ? { url: `${anthropicBase}/v1/models?limit=100`, headers: { 'x-api-key': cfg.apiKey, 'anthropic-version': '2023-06-01' } }
      : { url: `${baseOf(cfg.provider)}/models`, headers: { authorization: `Bearer ${cfg.apiKey}` } }
  let data: unknown
  try {
    data = await send(request.url, { method: 'GET', headers: request.headers }, fetchImpl)
  } catch (err) {
    if (err instanceof HttpError && err.message.startsWith('Bu model bulunamadı')) return []
    throw err
  }
  const raw = Array.isArray(data) ? data : Array.isArray((data as { data?: unknown }).data) ? (data as { data: unknown[] }).data : []
  const items = (raw as ListedModel[]).filter((m) => typeof m.id === 'string')
  const listed = items
    .map((m) => ({ id: (m.id as string).replace(/^models\//, ''), created: typeof m.created === 'number' ? m.created : 0, item: m }))
    .filter((m) => isChatModel(cfg.provider, m.id, m.item))
  const dated = listed.filter((m) => m.created > 0).length > listed.length / 2
  listed.sort((a, b) => (dated ? b.created - a.created : 0) || b.id.localeCompare(a.id))
  return [...new Set(listed.map((m) => m.id))].slice(0, 80)
}
