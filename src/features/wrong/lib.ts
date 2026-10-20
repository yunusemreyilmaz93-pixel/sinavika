import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { todayISO } from '@/lib/dates'
import { supabase, unwrap, type Tables } from '@/lib/supabase'

export type WrongQuestion = Tables<'wrong_questions'>
export type WrongFilter = 'tekrar' | 'tumu' | 'ogrenildi'

const BUCKET = 'wrong-questions'

export const wrongKeys = {
  list: (studentId: string) => ['wrong-questions', studentId] as const,
  photo: (path: string) => ['wrong-photo', path] as const,
}

export function useWrongQuestions(studentId: string | undefined) {
  return useQuery({
    queryKey: wrongKeys.list(studentId ?? ''),
    enabled: Boolean(studentId),
    queryFn: async (): Promise<WrongQuestion[]> =>
      unwrap(
        await supabase
          .from('wrong_questions')
          .select('*')
          .eq('student_id', studentId!)
          .order('created_at', { ascending: false })
          .limit(500),
      ),
  })
}

export function filterWrong(list: WrongQuestion[], filter: WrongFilter, today = todayISO()) {
  if (filter === 'ogrenildi') return list.filter((w) => w.learned_at)
  if (filter === 'tekrar') {
    return list
      .filter((w) => !w.learned_at && w.next_review_on <= today)
      .sort((a, b) => a.next_review_on.localeCompare(b.next_review_on))
  }
  return list.filter((w) => !w.learned_at)
}

export function usePhotoUrl(path: string | null) {
  return useQuery({
    queryKey: wrongKeys.photo(path ?? ''),
    enabled: Boolean(path),
    staleTime: 50 * 60 * 1000,
    queryFn: async () => {
      const { data, error } = await supabase.storage.from(BUCKET).createSignedUrl(path!, 60 * 60)
      if (error) throw error
      return data.signedUrl
    },
  })
}

async function shrink(file: File): Promise<Blob> {
  const bitmap = await createImageBitmap(file).catch(() => null)
  if (!bitmap) return file
  const max = 1600
  const scale = Math.min(1, max / Math.max(bitmap.width, bitmap.height))
  const canvas = document.createElement('canvas')
  canvas.width = Math.round(bitmap.width * scale)
  canvas.height = Math.round(bitmap.height * scale)
  canvas.getContext('2d')?.drawImage(bitmap, 0, 0, canvas.width, canvas.height)
  bitmap.close()
  const blob = await new Promise<Blob | null>((resolve) => canvas.toBlob(resolve, 'image/jpeg', 0.82))
  return blob ?? file
}

export type NewWrong = {
  subject_id: string
  topic_id: number | null
  note: string
  source: string
  photo: File | null
}

export function useAddWrong(studentId: string) {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (input: NewWrong) => {
      let photo_path: string | null = null
      if (input.photo) {
        const blob = await shrink(input.photo)
        photo_path = `${studentId}/${crypto.randomUUID()}.jpg`
        const { error } = await supabase.storage.from(BUCKET).upload(photo_path, blob, { contentType: 'image/jpeg' })
        if (error) throw new Error('Fotoğraf yüklenemedi. Bağlantını kontrol edip tekrar dene')
      }
      const { data: auth } = await supabase.auth.getUser()
      unwrap(
        await supabase.from('wrong_questions').insert({
          student_id: studentId,
          created_by: auth.user?.id,
          subject_id: input.subject_id,
          topic_id: input.topic_id,
          note: input.note.trim() || null,
          source: input.source.trim() || null,
          photo_path,
        }),
      )
    },
    onSuccess: () => qc.invalidateQueries({ queryKey: wrongKeys.list(studentId) }),
  })
}

export function useReviewWrong(studentId: string) {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async ({ id, learned }: { id: number; learned: boolean }) =>
      unwrap(
        await supabase.rpc('review_wrong_question', {
          p_id: id,
          p_learned: learned,
        }),
      ),
    onSuccess: () => qc.invalidateQueries({ queryKey: wrongKeys.list(studentId) }),
  })
}

export function useDeleteWrong(studentId: string) {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (item: WrongQuestion) => {
      unwrap(await supabase.from('wrong_questions').delete().eq('id', item.id))
      if (item.photo_path) await supabase.storage.from(BUCKET).remove([item.photo_path])
    },
    onSuccess: () => qc.invalidateQueries({ queryKey: wrongKeys.list(studentId) }),
  })
}
