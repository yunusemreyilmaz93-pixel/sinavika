import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { toWebp } from '@/features/lessons/queries'
import { AppError, supabase, unwrap, type Tables } from '@/lib/supabase'

export type Post = Tables<'posts'>
export type PostDraft = Pick<Post, 'slug' | 'title' | 'summary' | 'body' | 'audience' | 'reading_minutes' | 'published'>

export const audienceLabel: Record<string, string> = { genel: 'Herkes', ogrenci: 'Öğrenciler', veli: 'Veliler', ogretmen: 'Öğretmenler' }

const listKey = ['posts'] as const

export function usePosts() {
  return useQuery({
    queryKey: listKey,
    queryFn: async () =>
      unwrap(
        await supabase
          .from('posts')
          .select('id, slug, title, summary, audience, published, published_at, updated_at, reading_minutes')
          .order('updated_at', { ascending: false }),
      ),
  })
}

export function usePost(id: number | null) {
  return useQuery({
    queryKey: ['post', id],
    enabled: id !== null,
    queryFn: async () => unwrap(await supabase.from('posts').select('*').eq('id', id!).maybeSingle()),
  })
}

export function useSavePost(id: number | null) {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (draft: PostDraft) => {
      const row =
        id === null
          ? await supabase.from('posts').insert(draft).select('id').single()
          : await supabase.from('posts').update(draft).eq('id', id).select('id').single()
      if (row.error?.code === '23505') throw new AppError('Bu adres başka bir yazıda kullanılıyor. Adresi değiştirin')
      return unwrap(row)
    },
    onSuccess: (row) => {
      void qc.invalidateQueries({ queryKey: listKey })
      void qc.invalidateQueries({ queryKey: ['post', row.id] })
    },
  })
}

export function useDeletePost(id: number | null) {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async () => unwrap(await supabase.from('posts').delete().eq('id', id!)),
    onSuccess: () => qc.invalidateQueries({ queryKey: listKey }),
  })
}

export async function uploadPostImage(file: File) {
  const blob = await toWebp(file)
  const path = `blog/${crypto.randomUUID()}.webp`
  const { error } = await supabase.storage.from('lesson-images').upload(path, blob, { contentType: 'image/webp', cacheControl: '31536000' })
  if (error) throw new AppError('Görsel yüklenemedi. Tekrar deneyin')
  return supabase.storage.from('lesson-images').getPublicUrl(path).data.publicUrl
}
