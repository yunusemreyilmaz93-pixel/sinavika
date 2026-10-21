import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { toast } from 'sonner'
import { keys } from '@/lib/data'
import { errorMessage, supabase, unwrap, type Tables } from '@/lib/supabase'
import type { TopicState } from './status'

type ProgressRow = Tables<'topic_progress'>
export type Accuracy = { correct: number; total: number }
export type LessonStats = { answered: number; correct: number }

const PAGE = 1000

export function useTopicProgress(studentId: string) {
  return useQuery({
    queryKey: keys.topics(studentId),
    queryFn: async (): Promise<ProgressRow[]> =>
      unwrap(await supabase.from('topic_progress').select('*').eq('student_id', studentId)),
  })
}

export function useTopicAccuracy(studentId: string) {
  return useQuery({
    queryKey: [...keys.questions(studentId), 'by-topic'],
    queryFn: async () => {
      const byTopic: Record<number, Accuracy> = {}
      for (let from = 0; ; from += PAGE) {
        const rows = unwrap(
          await supabase
            .from('question_logs')
            .select('topic_id, correct, wrong, blank')
            .eq('student_id', studentId)
            .not('topic_id', 'is', null)
            .order('id')
            .range(from, from + PAGE - 1),
        )
        for (const row of rows) {
          if (row.topic_id == null) continue
          const entry = (byTopic[row.topic_id] ??= { correct: 0, total: 0 })
          entry.correct += row.correct
          entry.total += row.correct + row.wrong + row.blank
        }
        if (rows.length < PAGE) break
      }
      return byTopic
    },
  })
}

export function useLessonStats(studentId: string) {
  return useQuery({
    queryKey: ['lesson-stats', studentId],
    queryFn: async () => {
      const byTopic = new Map<number, LessonStats>()
      const rows = unwrap(await supabase.from('lesson_answers').select('topic_id, first_correct').eq('student_id', studentId).limit(5000))
      for (const row of rows) {
        const entry = byTopic.get(row.topic_id) ?? { answered: 0, correct: 0 }
        entry.answered++
        if (row.first_correct) entry.correct++
        byTopic.set(row.topic_id, entry)
      }
      return byTopic
    },
  })
}

export function useSetTopicStatus(studentId: string) {
  const queryClient = useQueryClient()
  const queryKey = keys.topics(studentId)
  const mutationKey = ['topic-status', studentId]

  return useMutation({
    mutationKey,
    scope: { id: `topic-status:${studentId}` },
    mutationFn: async ({ topicId, status }: { topicId: number; status: TopicState }) => {
      if (status === 'none') {
        unwrap(await supabase.from('topic_progress').delete().eq('student_id', studentId).eq('topic_id', topicId))
      } else {
        unwrap(
          await supabase
            .from('topic_progress')
            .upsert({ student_id: studentId, topic_id: topicId, status, updated_at: new Date().toISOString() }),
        )
      }
    },
    onMutate: async ({ topicId, status }) => {
      await queryClient.cancelQueries({ queryKey })
      const previous = queryClient.getQueryData<ProgressRow[]>(queryKey)?.find((r) => r.topic_id === topicId) ?? null
      queryClient.setQueryData<ProgressRow[]>(queryKey, (rows = []) => {
        const rest = rows.filter((r) => r.topic_id !== topicId)
        if (status === 'none') return rest
        return [...rest, { student_id: studentId, topic_id: topicId, status, updated_at: new Date().toISOString() }]
      })
      return { previous }
    },
    onError: (error, { topicId }, context) => {
      queryClient.setQueryData<ProgressRow[]>(queryKey, (rows = []) => {
        const rest = rows.filter((r) => r.topic_id !== topicId)
        return context?.previous ? [...rest, context.previous] : rest
      })
      toast.error(errorMessage(error))
    },
    onSettled: () => {
      if (queryClient.isMutating({ mutationKey }) === 1) void queryClient.invalidateQueries({ queryKey })
    },
  })
}
