import { z } from 'zod'
import { callerId, handle, HttpError, json, readJson } from './_lib/server.js'

const schema = z.object({ action: z.literal('info'), id: z.string().regex(/^[A-Za-z0-9_-]{11}$/) })

export const POST = handle(async (request) => {
  await callerId(request)
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Geçersiz video bağlantısı')
  const url = `https://www.youtube.com/oembed?format=json&url=${encodeURIComponent(`https://www.youtube.com/watch?v=${parsed.data.id}`)}`
  const res = await fetch(url, { signal: AbortSignal.timeout(6000) }).catch(() => null)
  if (!res) return json({ ok: true, embeddable: true, title: null, author: null })
  if (res.status === 401 || res.status === 403) {
    return json({ ok: true, embeddable: false, title: null, author: null })
  }
  if (res.status === 404 || res.status === 400)
    throw new HttpError(404, 'Bu video bulunamadı. Bağlantıyı kontrol et ya da video gizli olabilir')
  const body = (await res.json().catch(() => null)) as { title?: string; author_name?: string } | null
  return json({ ok: true, embeddable: true, title: body?.title?.slice(0, 200) ?? null, author: body?.author_name ?? null })
})
