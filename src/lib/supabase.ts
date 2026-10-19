import { createClient } from '@supabase/supabase-js'
import type { Database } from './database.types'

const url = import.meta.env.VITE_SUPABASE_URL
const key = import.meta.env.VITE_SUPABASE_ANON_KEY

export const isConfigured = Boolean(url && key)

export const supabase = createClient<Database>(url || 'http://localhost', key || 'missing', {
  auth: { persistSession: true, autoRefreshToken: true, detectSessionInUrl: false, storageKey: 'sinavika-auth' },
})

export type Tables<T extends keyof Database['public']['Tables']> = Database['public']['Tables'][T]['Row']
export type Views<T extends keyof Database['public']['Views']> = Database['public']['Views'][T]['Row']
export type Enums<T extends keyof Database['public']['Enums']> = Database['public']['Enums'][T]
export type RpcReturn<T extends keyof Database['public']['Functions']> = Database['public']['Functions'][T]['Returns']

export class AppError extends Error {}

export function errorMessage(error: unknown) {
  if (!error) return 'Bir hata oluştu'
  const message = typeof error === 'object' && 'message' in error ? String((error as { message: unknown }).message) : String(error)
  if (/Failed to fetch|NetworkError|Load failed/i.test(message)) return 'Bağlantı kurulamadı. İnternetini kontrol edip tekrar dene'
  if (/JWT|session/i.test(message)) return 'Oturumun sona ermiş, tekrar giriş yap'
  if (/row-level security|permission denied/i.test(message)) return 'Bu işlem için yetkin yok'
  if (/duplicate key/i.test(message)) return 'Bu kayıt zaten var'
  return message
}

export function unwrap<R extends { data: unknown; error: unknown }>(result: R): Extract<R, { error: null }>['data'] {
  if (result.error) throw new AppError(errorMessage(result.error))
  return result.data as Extract<R, { error: null }>['data']
}
