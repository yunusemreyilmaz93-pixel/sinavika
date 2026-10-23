import { useQuery } from '@tanstack/react-query'
import { supabase, unwrap } from './supabase'

const range = (prefix: string, count: number) => Array.from({ length: count }, (_, i) => `${prefix}${String(i + 1).padStart(2, '0')}`)

export const presetGroups = [
  { value: 'insan', label: 'İnsan', ids: [...range('a', 22), ...range('l', 12), ...range('p', 12)] },
  { value: 'karakter', label: 'Karakter', ids: range('t', 12) },
  { value: 'soyut', label: 'Soyut', ids: range('s', 8) },
] as const

export const presetIds: string[] = presetGroups.flatMap((g) => g.ids)

export const avatarKeys = { all: ['avatars'] as const }

// profiles.avatar: 'preset:a07' ya da 'photo:<kullanıcı>/<anahtar>.webp'
export function avatarUrl(value: string | null | undefined) {
  if (!value) return null
  if (value.startsWith('preset:')) return `/avatars/${value.slice(7)}.svg`
  if (value.startsWith('photo:')) return `${import.meta.env.VITE_SUPABASE_URL}/storage/v1/object/public/avatars/${value.slice(6)}`
  return null
}

// Görünür profillerin avatarları tek istekte gelir. Yalnızca avatarı olanlar listelenir
export function useAvatars(enabled = true) {
  return useQuery({
    queryKey: avatarKeys.all,
    enabled,
    staleTime: 5 * 60 * 1000,
    queryFn: async () => {
      const rows = unwrap(await supabase.from('profiles').select('id, avatar').not('avatar', 'is', null))
      return new Map(rows.map((r) => [r.id, avatarUrl(r.avatar)]))
    },
  })
}
