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

export const GENERIC_ERROR = 'Beklenmeyen bir hata oluştu. Tekrar deneyin, sorun sürerse sayfayı yenileyin'

function rawMessage(error: unknown) {
  if (typeof error === 'object' && error && 'message' in error) return String((error as { message: unknown }).message)
  return String(error)
}

function looksForeign(message: string) {
  if (/[çğıöşüÇĞİÖŞÜ]/.test(message)) return false
  return /\b(the|is|not|of|to|for|an?|failed|error|cannot|could|unexpected|undefined|null|invalid|unknown|denied)\b/i.test(message)
}

export function errorMessage(error: unknown) {
  if (!error) return GENERIC_ERROR
  if (error instanceof AppError) return error.message
  const message = rawMessage(error).trim()
  if (typeof navigator !== 'undefined' && navigator.onLine === false) {
    return 'İnternet bağlantısı yok. Bağlantı gelince tekrar deneyin'
  }
  if (/Failed to fetch|NetworkError|Load failed|network request failed/i.test(message)) {
    return 'Bağlantı kurulamadı. İnternet bağlantınızı kontrol edip tekrar deneyin'
  }
  if (/JWT|session|refresh token/i.test(message)) return 'Oturumunuz sona ermiş. Çıkış yapıp tekrar giriş yapın'
  if (/row-level security|permission denied/i.test(message)) return 'Bu işlem için yetkiniz yok. Sayfayı yenileyip tekrar deneyin'
  if (/duplicate key/i.test(message)) return 'Bu kayıt zaten var'
  if (/foreign key/i.test(message)) return 'İlgili kayıt artık yok. Sayfayı yenileyip tekrar deneyin'
  if (/check constraint|invalid input syntax|value too long/i.test(message)) {
    return 'Girilen bilgilerden biri geçerli değil. Kontrol edip tekrar deneyin'
  }
  if (/timeout|timed out|502|503|504|gateway|upstream/i.test(message)) {
    return 'Sunucu şu an yanıt vermiyor. Biraz bekleyip tekrar deneyin'
  }
  if (/rate limit|too many/i.test(message)) return 'Çok fazla deneme yapıldı. Biraz bekleyip tekrar deneyin'
  if (!message || looksForeign(message)) return GENERIC_ERROR
  return message
}

export function unwrap<R extends { data: unknown; error: unknown }>(result: R): Extract<R, { error: null }>['data'] {
  if (result.error) throw new AppError(errorMessage(result.error))
  return result.data as Extract<R, { error: null }>['data']
}
