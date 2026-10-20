import { errorMessage, supabase } from './supabase'

const recent = new Map<string, number>()
const version = import.meta.env.VITE_COMMIT ?? 'local'

function raw(error: unknown) {
  if (error instanceof Error) return { message: `${error.name}: ${error.message}`, detail: error.stack ?? null }
  if (typeof error === 'object' && error && 'message' in error) {
    const e = error as { message: unknown; code?: unknown; details?: unknown; hint?: unknown }
    const extra = [e.code, e.details, e.hint].filter(Boolean).join(' | ')
    return { message: String(e.message), detail: extra || null }
  }
  return { message: String(error), detail: null }
}

function ignorable(message: string, shown: string) {
  if (typeof navigator !== 'undefined' && navigator.onLine === false) return true
  if (/Bağlantı kurulamadı|İnternet bağlantın yok/.test(shown)) return true
  if (/ResizeObserver loop|AbortError|The operation was aborted|Script error\.?$/i.test(message)) return true
  return false
}

export function reportError(error: unknown, context?: string) {
  try {
    const { message, detail } = raw(error)
    const shown = errorMessage(error)
    if (ignorable(message, shown)) return
    const path = typeof location !== 'undefined' ? location.pathname : null
    const key = `${message}|${path}`
    const now = Date.now()
    if ((recent.get(key) ?? 0) > now - 60_000) return
    recent.set(key, now)
    void supabase.rpc('log_client_error', {
      p_message: context ? `${context}: ${message}` : message,
      p_shown: shown,
      p_path: path,
      p_detail: detail ? detail.slice(0, 2000) : null,
      p_user_agent: typeof navigator !== 'undefined' ? navigator.userAgent.slice(0, 300) : null,
      p_version: version,
    })
  } catch {
    return
  }
}

export function installGlobalErrorLogging() {
  window.addEventListener('error', (e) => reportError(e.error ?? e.message, 'window'))
  window.addEventListener('unhandledrejection', (e) => reportError(e.reason, 'promise'))
}
