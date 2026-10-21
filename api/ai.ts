import { createClient } from '@supabase/supabase-js'
import { z } from 'zod'
import { runChat } from './_lib/ai/agent.js'
import { decryptKey, encryptKey, isConfigured } from './_lib/ai/crypto.js'
import { makePrivacy, type Person } from './_lib/ai/privacy.js'
import { callModel, type Provider } from './_lib/ai/providers.js'
import type { StudentRow, SubjectRow, TopicRow } from './_lib/ai/tools.js'
import { admin, callerId, dbMessage, handle, HttpError, json, readJson } from './_lib/server.js'

const DAILY_LIMIT = 60

const schema = z.discriminatedUnion('action', [
  z.object({ action: z.literal('status') }),
  z.object({
    action: z.literal('save_key'),
    provider: z.enum(['anthropic', 'openai', 'gemini']),
    model: z.string().trim().regex(/^[\w.:/-]{1,80}$/, 'Model adı geçersiz'),
    apiKey: z.string().trim().min(16, 'Anahtar çok kısa').max(400, 'Anahtar çok uzun').regex(/^\S+$/, 'Anahtarda boşluk olmamalı'),
    consent: z.literal(true, { message: 'Devam etmek için aydınlatmayı onaylamalısın' }),
  }),
  z.object({ action: z.literal('remove_key') }),
  z.object({
    action: z.literal('chat'),
    messages: z.array(z.object({ role: z.enum(['user', 'assistant']), content: z.string().max(4000) })).min(1).max(30),
  }),
])

function bearer(request: Request) {
  return request.headers.get('authorization')?.replace(/^Bearer\s+/i, '') ?? ''
}

function userClient(token: string) {
  const url = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL
  const key =
    process.env.SUPABASE_ANON_KEY ||
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ||
    process.env.SUPABASE_PUBLISHABLE_KEY ||
    process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY
  if (!url || !key) throw new HttpError(500, 'Sunucu yapılandırması eksik')
  return createClient(url, key, {
    auth: { persistSession: false, autoRefreshToken: false },
    global: { headers: { Authorization: `Bearer ${token}` } },
  })
}

async function requireTeacher(id: string) {
  const { data } = await admin().from('profiles').select('role, status').eq('id', id).maybeSingle()
  if (data?.role !== 'teacher' || data.status !== 'active') throw new HttpError(403, 'Asistan yalnızca onaylı öğretmenler için')
}

const istanbulToday = () => new Intl.DateTimeFormat('en-CA', { timeZone: 'Europe/Istanbul' }).format(new Date())

async function loadPeople(db: ReturnType<typeof userClient>) {
  const { data: all } = await db.from('students').select('id, track, grade, field, archived_at')
  const students = ((all ?? []) as (StudentRow & { archived_at: string | null })[]).filter((s) => !s.archived_at)
  const ids = (all ?? []).map((s) => s.id)
  const links = ids.length ? ((await db.from('parent_links').select('parent_id, student_id').in('student_id', ids)).data ?? []) : []
  const parentIds = [...new Set(links.map((l) => l.parent_id))]
  const profileIds = [...ids, ...parentIds]
  const profiles = profileIds.length ? ((await db.from('profiles').select('id, full_name').in('id', profileIds)).data ?? []) : []
  const nameOf = new Map(profiles.map((p) => [p.id as string, p.full_name as string]))
  const people: Person[] = [
    ...ids.flatMap((id) => (nameOf.has(id) ? [{ id, name: nameOf.get(id)!, kind: 'student' as const }] : [])),
    ...parentIds.flatMap((id) => (nameOf.has(id) ? [{ id, name: nameOf.get(id)!, kind: 'parent' as const }] : [])),
  ]
  return { students, people, nameOf }
}

export const POST = handle(async (request) => {
  const id = await callerId(request)
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, parsed.error.issues[0]?.message || 'Geçersiz istek')
  const input = parsed.data
  await requireTeacher(id)

  if (input.action === 'status') {
    const { data } = await admin().from('teacher_ai_keys').select('provider, model, key_last4, consented_at').eq('teacher_id', id).maybeSingle()
    return json({ ok: true, configured: isConfigured(), key: data ?? null, dailyLimit: DAILY_LIMIT })
  }

  if (input.action === 'remove_key') {
    const { error } = await admin().from('teacher_ai_keys').delete().eq('teacher_id', id)
    if (error) throw new HttpError(500, dbMessage(error))
    return json({ ok: true })
  }

  if (input.action === 'save_key') {
    const encrypted = (() => {
      if (!isConfigured()) throw new HttpError(503, 'Asistan henüz yapılandırılmadı. Yönetici sunucuya AI_KEY_SECRET değişkenini eklemeli')
      return encryptKey(input.apiKey, id)
    })()
    // Kaydetmeden önce küçük bir istekle anahtarı ve modeli dener
    await callModel(
      { provider: input.provider, apiKey: input.apiKey, model: input.model },
      { system: 'Kısa yanıt ver.', turns: [{ role: 'user', text: 'Merhaba' }], tools: [], maxTokens: 16 },
    )
    const { error } = await admin().from('teacher_ai_keys').upsert(
      {
        teacher_id: id,
        provider: input.provider,
        model: input.model,
        key_ciphertext: encrypted,
        key_last4: input.apiKey.slice(-4),
        consented_at: new Date().toISOString(),
      },
      { onConflict: 'teacher_id' },
    )
    if (error) throw new HttpError(500, dbMessage(error))
    return json({ ok: true })
  }

  if (input.messages[input.messages.length - 1].role !== 'user') throw new HttpError(400, 'Geçersiz istek')
  const { data: stored } = await admin().from('teacher_ai_keys').select('provider, model, key_ciphertext').eq('teacher_id', id).maybeSingle()
  if (!stored) throw new HttpError(400, 'Önce Ayarlar bölümünden yapay zekâ anahtarını ekle')
  const apiKey = decryptKey(stored.key_ciphertext, id)
  const { data: allowed } = await admin().rpc('ai_take_quota', { p_teacher: id, p_limit: DAILY_LIMIT })
  if (!allowed) throw new HttpError(429, `Bugünlük asistan sınırına ulaştın (${DAILY_LIMIT} mesaj). Yarın tekrar dene`)

  const db = userClient(bearer(request))
  const { students, people, nameOf } = await loadPeople(db)
  let curriculum: Promise<{ subjects: SubjectRow[]; topics: TopicRow[] }> | undefined
  const result = await runChat({
    model: { provider: stored.provider as Provider, apiKey, model: stored.model },
    history: input.messages,
    ctx: {
      db,
      privacy: makePrivacy(id, people),
      students,
      names: nameOf,
      today: istanbulToday(),
      proposals: [],
      curriculum: () =>
        (curriculum ??= Promise.all([db.from('subjects').select('id, exam, name, fields, sort'), db.from('topics').select('id, subject_id, name')]).then(
          ([s, t]) => ({ subjects: (s.data ?? []) as SubjectRow[], topics: (t.data ?? []) as TopicRow[] }),
        )),
    },
  })
  return json({ ok: true, ...result })
})
