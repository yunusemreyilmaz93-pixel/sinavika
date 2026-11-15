import { createClient, type SupabaseClient } from '@supabase/supabase-js'

export class HttpError extends Error {
  status: number
  constructor(status: number, message: string) {
    super(message)
    this.status = status
  }
}

let client: SupabaseClient | undefined

export function admin() {
  if (client) return client
  const url = process.env.SUPABASE_URL || process.env.NEXT_PUBLIC_SUPABASE_URL
  const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_SECRET_KEY
  if (!url || !key) throw new HttpError(500, 'Sunucu yapılandırması eksik')
  client = createClient(url, key, { auth: { persistSession: false, autoRefreshToken: false } })
  return client
}

export function adminEmail() {
  return (process.env.ADMIN_EMAIL || 'yunusemreyilmaz93@gmail.com').trim().toLowerCase()
}

export async function callerId(request: Request) {
  const token = request.headers.get('authorization')?.replace(/^Bearer\s+/i, '')
  if (!token) throw new HttpError(401, 'Oturum bulunamadı')
  const { data, error } = await admin().auth.getUser(token)
  if (error || !data.user) throw new HttpError(401, 'Oturum sona ermiş, tekrar giriş yapın')
  return data.user.id
}

// Yönetici iki adımlı doğrulamayı açtıysa yönetici işlemleri yalnızca iki adımla açılmış oturumda (aal2) yapılır.
// Belirteç callerId içinde doğrulandığı için burada yalnızca içindeki aal okunur
export async function adminElevated(request: Request, userId: string) {
  const token = request.headers.get('authorization')?.replace(/^Bearer\s+/i, '') ?? ''
  try {
    const claims = JSON.parse(atob(token.split('.')[1].replace(/-/g, '+').replace(/_/g, '/'))) as { aal?: string }
    if (claims.aal === 'aal2') return true
  } catch {
    return false
  }
  const { data } = await admin().auth.admin.mfa.listFactors({ userId })
  return !(data?.factors ?? []).some((f) => f.status === 'verified')
}

export async function readJson(request: Request) {
  try {
    return await request.json()
  } catch {
    throw new HttpError(400, 'Geçersiz istek')
  }
}

export function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'content-type': 'application/json; charset=utf-8', 'cache-control': 'no-store' },
  })
}

export function handle(fn: (request: Request) => Promise<Response>) {
  return async (request: Request) => {
    try {
      return await fn(request)
    } catch (err) {
      if (err instanceof HttpError && err.status < 500) return json({ error: err.message }, err.status)
      console.error(err)
      await logServerError(request, err)
      if (err instanceof HttpError) return json({ error: err.message }, err.status)
      return json({ error: 'Beklenmeyen bir hata oluştu, tekrar deneyin' }, 500)
    }
  }
}

// Beklenmeyen sunucu hataları yönetici paneline ve yöneticiye bildirim olarak düşer (client_errors_notify)
async function logServerError(request: Request, err: unknown) {
  try {
    const message = err instanceof Error ? err.message : String(err)
    await admin()
      .from('client_errors')
      .insert({ message: `Sunucu: ${message}`.slice(0, 500), path: new URL(request.url).pathname.slice(0, 300), detail: err instanceof Error ? err.stack?.slice(0, 2000) : null })
  } catch {
    // Kayıt da başarısız olursa yalnızca Worker günlüğünde kalır
  }
}

export function dbMessage(error: { message?: string; hint?: string } | null) {
  return error?.message?.replace(/^.*?ERROR:\s*/, '') || 'İşlem tamamlanamadı'
}

export async function syncSiteUrl() {
  const site = process.env.SITE_URL
  if (!site) return
  await admin().from('app_settings').upsert({ key: 'site_url', value: site.replace(/\/$/, '') }, { onConflict: 'key' })
}
