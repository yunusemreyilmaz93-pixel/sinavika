import { useCallback, useSyncExternalStore } from 'react'

export const accents = [
  { value: 'green', label: 'Yeşil' },
  { value: 'blue', label: 'Mavi' },
  { value: 'violet', label: 'Mor' },
  { value: 'rose', label: 'Pembe' },
  { value: 'orange', label: 'Turuncu' },
  { value: 'teal', label: 'Turkuaz' },
] as const

export type AccentChoice = (typeof accents)[number]['value']
const KEY = 'sinavika-accent'
const listeners = new Set<() => void>()

function read(): AccentChoice {
  try {
    const v = localStorage.getItem(KEY)
    return accents.some((a) => a.value === v) ? (v as AccentChoice) : 'green'
  } catch {
    return 'green'
  }
}

export function applyAccent(choice: AccentChoice = read()) {
  if (choice === 'green') document.documentElement.removeAttribute('data-accent')
  else document.documentElement.setAttribute('data-accent', choice)
}

function store(choice: AccentChoice) {
  try {
    if (choice === 'green') localStorage.removeItem(KEY)
    else localStorage.setItem(KEY, choice)
  } catch {
    /* depolama kapalı */
  }
}

// Hesaptaki renk cihazdaki seçimin önüne geçer. Giriş yapılınca çağrılır
export function syncAccent(account: string | null) {
  const choice = accents.some((a) => a.value === account) ? (account as AccentChoice) : 'green'
  if (choice === read()) return
  store(choice)
  applyAccent(choice)
  listeners.forEach((l) => l())
}

export function useAccent() {
  const choice = useSyncExternalStore(
    (cb) => {
      listeners.add(cb)
      return () => listeners.delete(cb)
    },
    read,
    () => 'green' as AccentChoice,
  )
  const setChoice = useCallback((next: AccentChoice) => {
    store(next)
    applyAccent(next)
    listeners.forEach((l) => l())
  }, [])
  return [choice, setChoice] as const
}
