import { admin, handle, HttpError, json, syncSiteUrl } from './_lib/server.js'

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

  await syncSiteUrl()
  const weekday = new Intl.DateTimeFormat('en-US', { timeZone: 'Europe/Istanbul', weekday: 'short' }).format(new Date())
  const reminders = await db.rpc('send_daily_reminders')
  const reports = weekday === 'Mon' ? await db.rpc('send_weekly_reports') : { data: 0, error: null }
  const digests = weekday === 'Mon' ? await db.rpc('send_teacher_digests') : { data: 0, error: null }
  if (reminders.error) console.error('Hatırlatmalar gönderilemedi', reminders.error.message)
  if (reports.error) console.error('Veli raporları gönderilemedi', reports.error.message)
  if (digests.error) console.error('Öğretmen özetleri gönderilemedi', digests.error.message)

  const origin = new URL(request.url).origin
  await fetch(`${origin}/api/push`, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify({ action: 'dispatch' }),
  }).catch(() => undefined)

  return json({ ok: true, reminders: reminders.data ?? 0, reports: reports.data ?? 0, digests: digests.data ?? 0 })
})
