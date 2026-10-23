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
    try {
      if (next === 'green') localStorage.removeItem(KEY)
      else localStorage.setItem(KEY, next)
    } catch {
      /* depolama kapalı */
    }
    applyAccent(next)
    listeners.forEach((l) => l())
  }, [])
  return [choice, setChoice] as const
}
