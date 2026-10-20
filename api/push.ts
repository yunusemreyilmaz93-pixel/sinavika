import webpush from 'web-push'
import { z } from 'zod'
import { admin, callerId, handle, HttpError, json, readJson, syncSiteUrl } from './_lib/server.js'

const schema = z.discriminatedUnion('action', [
  z.object({ action: z.literal('key') }),
  z.object({ action: z.literal('dispatch') }),
  z.object({
    action: z.literal('subscribe'),
    endpoint: z.url().max(1000),
    keys: z.object({ p256dh: z.string().min(1).max(200), auth: z.string().min(1).max(100) }),
  }),
  z.object({ action: z.literal('unsubscribe'), endpoint: z.string().max(1000) }),
])

type Keys = { public_key: string; private_key: string }

async function vapidKeys(): Promise<Keys> {
  const db = admin()
  const { data } = await db.from('push_keys').select('public_key, private_key').maybeSingle()
  if (data) return data
  const generated = webpush.generateVAPIDKeys()
  await db.from('push_keys').upsert({ id: true, public_key: generated.publicKey, private_key: generated.privateKey }, { onConflict: 'id', ignoreDuplicates: true })
  const { data: stored, error } = await db.from('push_keys').select('public_key, private_key').single()
  if (error || !stored) throw new HttpError(500, 'Bildirim anahtarı oluşturulamadı')
  return stored
}

async function dispatch() {
  const db = admin()
  const since = new Date(Date.now() - 60 * 60 * 1000).toISOString()
  const { data: pending } = await db
    .from('notifications')
    .select('id, user_id, title, body, link')
    .is('pushed_at', null)
    .is('read_at', null)
    .gte('created_at', since)
    .order('created_at')
    .limit(200)
  if (!pending?.length) return 0

  const ids = pending.map((n) => n.id)
  await db.from('notifications').update({ pushed_at: new Date().toISOString() }).in('id', ids).is('pushed_at', null)

  const users = [...new Set(pending.map((n) => n.user_id))]
  const { data: subs } = await db.from('push_subscriptions').select('endpoint, user_id, p256dh, auth').in('user_id', users)
  if (!subs?.length) return 0

  const keys = await vapidKeys()
  webpush.setVapidDetails(`mailto:${process.env.ADMIN_EMAIL || 'yunusemreyilmaz93@gmail.com'}`, keys.public_key, keys.private_key)

  let sent = 0
  const dead: string[] = []
  await Promise.all(
    pending.flatMap((n) =>
      subs
        .filter((s) => s.user_id === n.user_id)
        .map(async (s) => {
          try {
            await webpush.sendNotification(
              { endpoint: s.endpoint, keys: { p256dh: s.p256dh, auth: s.auth } },
              JSON.stringify({ title: n.title, body: n.body ?? '', link: n.link ?? '/app', tag: `n${n.id}` }),
              { TTL: 60 * 60 * 12 },
            )
            sent++
          } catch (error) {
            const status = (error as { statusCode?: number }).statusCode
            if (status === 404 || status === 410) dead.push(s.endpoint)
          }
        }),
    ),
  )
  if (dead.length) await db.from('push_subscriptions').delete().in('endpoint', dead)
  return sent
}

export const POST = handle(async (request) => {
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Geçersiz istek')
  const input = parsed.data

  if (input.action === 'dispatch') return json({ sent: await dispatch() })
  if (input.action === 'key') return json({ key: (await vapidKeys()).public_key })

  const userId = await callerId(request)
  const db = admin()
  if (input.action === 'subscribe') {
    await syncSiteUrl()
    const { error } = await db
      .from('push_subscriptions')
      .upsert({ endpoint: input.endpoint, user_id: userId, p256dh: input.keys.p256dh, auth: input.keys.auth }, { onConflict: 'endpoint' })
    if (error) throw new HttpError(500, 'Bildirim açılamadı, tekrar dene')
    return json({ ok: true })
  }
  await db.from('push_subscriptions').delete().eq('endpoint', input.endpoint).eq('user_id', userId)
  return json({ ok: true })
})
