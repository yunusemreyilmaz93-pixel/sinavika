import { admin, handle, HttpError, json } from './_lib/server.ts'

export const GET = handle(async (request) => {
  const secret = process.env.CRON_SECRET
  if (secret && request.headers.get('authorization') !== `Bearer ${secret}`) {
    throw new HttpError(401, 'Yetkisiz')
  }
  const db = admin()
  const now = Date.now()
  const day = 24 * 60 * 60 * 1000
  await db
    .from('invites')
    .delete()
    .is('used_at', null)
    .lt('expires_at', new Date(now - 30 * day).toISOString())
  await db
    .from('notifications')
    .delete()
    .not('read_at', 'is', null)
    .lt('created_at', new Date(now - 90 * day).toISOString())
  const { error } = await db.from('app_settings').select('key').limit(1)
  if (error) throw new HttpError(500, error.message)
  return json({ ok: true })
})
