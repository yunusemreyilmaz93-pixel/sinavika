import { reportError } from './error-log'
import { AppError, supabase } from './supabase'

export const SITE_HOST = 'yolumnet.vercel.app'

function unexpected(status: number, text: string) {
  if (/DEPLOYMENT_NOT_FOUND|NOT_FOUND/.test(text) || status === 404) {
    return `Sunucuya bu adresten ulaşılamıyor. Yolumnet'e ${SITE_HOST} adresinden girip tekrar dene`
  }
  if (status === 413) return 'Gönderdiğin bilgi çok büyük. Daha kısa yazıp tekrar dene'
  if (status === 429) return 'Çok fazla deneme yaptın. Biraz bekleyip tekrar dene'
  if (status >= 500) return 'Sunucuda geçici bir sorun var. Bir dakika sonra tekrar dene, sorun sürerse sayfayı yenile'
  return `İşlem tamamlanamadı (hata ${status}). Sayfayı yenileyip tekrar dene`
}

export async function callApi<T = { ok: true }>(path: 'auth' | 'account' | 'push' | 'video', body: Record<string, unknown>): Promise<T> {
  const { data } = await supabase.auth.getSession()
  const headers: Record<string, string> = { 'content-type': 'application/json' }
  if (data.session) headers.authorization = `Bearer ${data.session.access_token}`
  let response: Response
  try {
    response = await fetch(`/api/${path}`, { method: 'POST', headers, body: JSON.stringify(body) })
  } catch {
    throw new AppError('Bağlantı kurulamadı. İnternetini kontrol edip tekrar dene')
  }
  const text = await response.text().catch(() => '')
  let json: { error?: string } | null
  try {
    json = text ? JSON.parse(text) : {}
  } catch {
    json = null
  }
  if (!response.ok || !json) {
    if (json?.error) throw new AppError(json.error)
    const message = unexpected(response.status, text)
    reportError(new Error(`api/${path} ${response.status}: ${text.slice(0, 200)}`), 'api')
    throw new AppError(message)
  }
  return json as T
}
