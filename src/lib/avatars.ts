import { useQuery } from '@tanstack/react-query'
import { supabase, unwrap } from './supabase'

export const presetIds = Array.from({ length: 22 }, (_, i) => `a${String(i + 1).padStart(2, '0')}`)

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
