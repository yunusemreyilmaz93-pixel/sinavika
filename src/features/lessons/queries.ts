import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { AppError, supabase, unwrap } from '@/lib/supabase'

export type Lesson = { topic_id: number; body: string; reading_minutes: number; published: boolean; updated_at: string }

export const lessonKeys = {
  all: ['lessons'] as const,
  index: ['lessons', 'index'] as const,
  one: (topicId: number) => ['lessons', topicId] as const,
}

export function useLessonIndex() {
  return useQuery({
    queryKey: lessonKeys.index,
    staleTime: 5 * 60_000,
    queryFn: async () => new Map(unwrap(await supabase.from('lessons').select('topic_id, published')).map((l) => [l.topic_id, l.published])),
  })
}

export function useLesson(topicId: number, withNote: boolean) {
  return useQuery({
    queryKey: [...lessonKeys.one(topicId), withNote],
    enabled: Number.isFinite(topicId),
    queryFn: async () => {
      const [lesson, note] = await Promise.all([
        supabase.from('lessons').select('topic_id, body, reading_minutes, published, updated_at').eq('topic_id', topicId).maybeSingle(),
        withNote ? supabase.from('lesson_notes').select('body').eq('topic_id', topicId).maybeSingle() : Promise.resolve(null),
      ])
      return { lesson: unwrap(lesson) as Lesson | null, note: note ? (unwrap(note)?.body ?? '') : '' }
    },
  })
}

export type LessonDraft = { body: string; reading_minutes: number; published: boolean; note: string }

export function useSaveLesson(topicId: number) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (draft: LessonDraft) => {
      const { note, ...lesson } = draft
      unwrap(await supabase.from('lessons').upsert({ topic_id: topicId, ...lesson }))
      unwrap(await supabase.from('lesson_notes').upsert({ topic_id: topicId, body: note }))
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: lessonKeys.all }),
  })
}

export function useDeleteLesson(topicId: number) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async () => {
      unwrap(await supabase.from('lessons').delete().eq('topic_id', topicId))
      unwrap(await supabase.from('lesson_notes').delete().eq('topic_id', topicId))
    },
    onSuccess: () => queryClient.invalidateQueries({ queryKey: lessonKeys.all }),
  })
}

const MAX_SIDE = 1600

export async function toWebp(file: File): Promise<Blob> {
  const bitmap = await createImageBitmap(file).catch(() => null)
  if (!bitmap) throw new AppError('Bu dosya bir görsel gibi görünmüyor. JPG, PNG ya da WebP yükleyin')
  const scale = Math.min(1, MAX_SIDE / Math.max(bitmap.width, bitmap.height))
  const canvas = document.createElement('canvas')
  canvas.width = Math.round(bitmap.width * scale)
  canvas.height = Math.round(bitmap.height * scale)
  canvas.getContext('2d')!.drawImage(bitmap, 0, 0, canvas.width, canvas.height)
  bitmap.close()
  const blob = await new Promise<Blob | null>((resolve) => canvas.toBlob(resolve, 'image/webp', 0.85))
  if (!blob) throw new AppError('Görsel küçültülemedi. Başka bir dosya deneyin')
  return blob
}

export async function uploadLessonImage(topicId: number, file: File) {
  const blob = await toWebp(file)
  const path = `${topicId}/${crypto.randomUUID()}.webp`
  const { error } = await supabase.storage.from('lesson-images').upload(path, blob, { contentType: 'image/webp', cacheControl: '31536000' })
  if (error) throw new AppError('Görsel yüklenemedi. Tekrar deneyin')
  return supabase.storage.from('lesson-images').getPublicUrl(path).data.publicUrl
}
