import { supabase } from './supabase'

export async function callApi<T = { ok: true }>(path: 'auth' | 'account' | 'push' | 'video', body: Record<string, unknown>): Promise<T> {
  const { data } = await supabase.auth.getSession()
  const headers: Record<string, string> = { 'content-type': 'application/json' }
  if (data.session) headers.authorization = `Bearer ${data.session.access_token}`
  let response: Response
  try {
    response = await fetch(`/api/${path}`, { method: 'POST', headers, body: JSON.stringify(body) })
  } catch {
    throw new Error('Bağlantı kurulamadı. İnternetini kontrol edip tekrar dene')
  }
  const json = await response.json().catch(() => ({}))
  if (!response.ok) throw new Error(json.error || 'İşlem tamamlanamadı')
  return json as T
}
