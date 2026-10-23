import { randomBytes } from 'node:crypto'
import { admin, callerId, handle, HttpError, json } from './_lib/server.js'
import { MAX_AVATAR_BYTES, moderateImage, validateAvatar } from './_lib/avatar.js'

const DAILY_LIMIT = 5

// İstemci kırpılmış WebP gönderir. Sunucu biçimi ve boyutu doğrular, moderasyondan geçirir, depolar
export const POST = handle(async (request) => {
  const userId = await callerId(request)
  if (Number(request.headers.get('content-length') ?? 0) > MAX_AVATAR_BYTES) throw new HttpError(413, 'Fotoğraf çok büyük')
  const bytes = new Uint8Array(await request.arrayBuffer())
  const invalid = validateAvatar(bytes)
  if (invalid) throw new HttpError(400, invalid)

  const db = admin()
  const since = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString()
  const recent = await db.from('avatar_uploads').select('id', { count: 'exact', head: true }).eq('user_id', userId).gte('created_at', since)
  if ((recent.count ?? 0) >= DAILY_LIMIT) throw new HttpError(429, 'Bugün çok fazla deneme yapıldı. Yarın tekrar deneyin')

  const path = `${userId}/${randomBytes(8).toString('hex')}.webp`
  const verdict = await moderateImage(bytes)

  if (verdict.verdict === 'flagged') {
    await db.from('avatar_uploads').insert({
      user_id: userId,
      path,
      status: 'rejected',
      reason: verdict.reason,
      bytes: bytes.length,
      reviewed_by: 'auto',
      reviewed_at: new Date().toISOString(),
      cleaned_at: new Date().toISOString(),
    })
    throw new HttpError(422, 'Fotoğraf uygun bulunmadı. Başka bir fotoğraf deneyin')
  }

  const stored = await db.storage.from('avatars').upload(path, bytes, { contentType: 'image/webp', cacheControl: '31536000', upsert: false })
  if (stored.error) throw new HttpError(500, 'Fotoğraf kaydedilemedi, tekrar deneyin')

  const approved = verdict.verdict === 'pass'
  const inserted = await db.from('avatar_uploads').insert({
    user_id: userId,
    path,
    status: approved ? 'approved' : 'pending',
    bytes: bytes.length,
    reviewed_by: approved ? 'auto' : null,
    reviewed_at: approved ? new Date().toISOString() : null,
  })
  if (inserted.error) {
    await db.storage.from('avatars').remove([path])
    throw new HttpError(500, 'Fotoğraf kaydedilemedi, tekrar deneyin')
  }

  if (approved) {
    await db
      .from('avatar_uploads')
      .update({ status: 'replaced', reviewed_at: new Date().toISOString() })
      .eq('user_id', userId)
      .in('status', ['approved', 'pending'])
      .neq('path', path)
    await db.from('profiles').update({ avatar: `photo:${path}` }).eq('id', userId)
  } else {
    await db
      .from('avatar_uploads')
      .update({ status: 'replaced', reviewed_at: new Date().toISOString() })
      .eq('user_id', userId)
      .eq('status', 'pending')
      .neq('path', path)
  }
  return json({ ok: true, status: approved ? 'approved' : 'pending', avatar: approved ? `photo:${path}` : null })
})
