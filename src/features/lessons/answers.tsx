import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { createContext, useCallback, useContext, useMemo, type ReactNode } from 'react'
import { toast } from 'sonner'
import { useProfile } from '@/features/auth/session'
import { invalidateActivity } from '@/features/tracking/stats'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'
import { completionKey } from './progress'

export function questionKey(stem: string, options: string[]) {
  const text = `${stem}\n${options.join('\n')}`.toLowerCase().replace(/\s+/g, ' ').trim()
  let hash = 0x811c9dc5
  for (let i = 0; i < text.length; i++) {
    hash ^= text.charCodeAt(i)
    hash = Math.imul(hash, 0x01000193)
  }
  return (hash >>> 0).toString(16)
}

export type LessonAnswer = { question_key: string; first_correct: boolean; last_correct: boolean }

type Track = {
  studentId: string
  topicId: number
  topicName: string
  subjectId: string
  answers: Map<string, LessonAnswer>
  answer: (key: string, correct: boolean) => void
}

const TrackContext = createContext<Track | null>(null)

export function useLessonTrack() {
  return useContext(TrackContext)
}

const answersKey = (studentId: string, topicId: number) => ['lesson-answers', studentId, topicId] as const

export function LessonTrackProvider({ topicId, topicName, subjectId, children }: { topicId: number; topicName: string; subjectId: string; children: ReactNode }) {
  const studentId = useProfile().id
  const queryClient = useQueryClient()
  const query = useQuery({
    queryKey: answersKey(studentId, topicId),
    queryFn: async () =>
      unwrap(await supabase.from('lesson_answers').select('question_key, first_correct, last_correct').eq('student_id', studentId).eq('topic_id', topicId)),
  })
  const save = useMutation({
    mutationFn: async ({ key, correct }: { key: string; correct: boolean }) =>
      unwrap(await supabase.rpc('answer_lesson_question', { p_topic: topicId, p_key: key, p_correct: correct })),
    onSuccess: (row) => {
      queryClient.setQueryData<LessonAnswer[]>(answersKey(studentId, topicId), (rows = []) => [...rows.filter((r) => r.question_key !== row.question_key), row])
      invalidateActivity(queryClient, studentId)
      void queryClient.invalidateQueries({ queryKey: completionKey(studentId) })
    },
    onError: (error) => toast.error(errorMessage(error)),
  })
  const answer = useCallback((key: string, correct: boolean) => save.mutate({ key, correct }), [save])
  const value = useMemo<Track>(
    () => ({ studentId, topicId, topicName, subjectId, answers: new Map((query.data ?? []).map((r) => [r.question_key, r])), answer }),
    [studentId, topicId, topicName, subjectId, query.data, answer],
  )
  return <TrackContext.Provider value={value}>{children}</TrackContext.Provider>
}
