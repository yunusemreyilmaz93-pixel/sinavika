import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { toast } from 'sonner'
import { invalidateActivity } from '@/features/tracking/stats'
import type { ExamKind } from '@/lib/exam'
import { errorMessage, supabase, unwrap } from '@/lib/supabase'

export type TestKind = 'konu' | 'brans' | 'deneme'

export type TestSet = {
  id: number
  exam: ExamKind
  kind: TestKind
  subject_id: string | null
  topic_id: number | null
  title: string
  duration_min: number | null
  sort: number
  published: boolean
  question_count: number
}

export type TestQuestion = {
  id: number
  position: number
  subject_id: string
  topic_id: number | null
  stem: string
  options: string[]
  difficulty: number
}

export type Attempt = { id: number; set_id: number; correct: number; wrong: number; blank: number; seconds: number | null; created_at: string }

export type ReviewItem = { question_id: number; position: number; choice: number | null; correct_choice: number; is_correct: boolean; explanation: string }

export type TestResult = Attempt & { first: boolean; review: ReviewItem[] }

const setsKey = ['test-sets'] as const
const attemptsKey = (studentId: string) => ['test-attempts', studentId] as const

export function useTestSets() {
  return useQuery({
    queryKey: setsKey,
    staleTime: 5 * 60_000,
    queryFn: async (): Promise<TestSet[]> => {
      const rows = unwrap(
        await supabase
          .from('question_sets')
          .select('id, exam, kind, subject_id, topic_id, title, duration_min, sort, published, questions(count)')
          .order('sort')
          .order('id'),
      )
      return rows.map((r) => ({ ...r, kind: r.kind as TestKind, question_count: r.questions[0]?.count ?? 0 })).filter((r) => r.question_count > 0)
    },
  })
}

export function useTestQuestions(setId: number) {
  return useQuery({
    queryKey: ['test-questions', setId],
    staleTime: 10 * 60_000,
    queryFn: async (): Promise<TestQuestion[]> =>
      unwrap(await supabase.from('questions').select('id, position, subject_id, topic_id, stem, options, difficulty').eq('set_id', setId).order('position')),
  })
}

export function useTestAttempts(studentId: string, enabled = true) {
  return useQuery({
    enabled,
    queryKey: attemptsKey(studentId),
    queryFn: async (): Promise<Attempt[]> =>
      unwrap(
        await supabase
          .from('test_attempts')
          .select('id, set_id, correct, wrong, blank, seconds, created_at')
          .eq('student_id', studentId)
          .order('created_at', { ascending: false }),
      ),
  })
}

export function useSubmitTest(studentId: string, setId: number) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async ({ answers, seconds }: { answers: Record<number, number | null>; seconds: number }): Promise<TestResult> =>
      (unwrap(await supabase.rpc('submit_test', { p_set: setId, p_answers: answers, p_seconds: seconds })) as unknown) as TestResult,
    onSuccess: () => {
      void queryClient.invalidateQueries({ queryKey: attemptsKey(studentId) })
      invalidateActivity(queryClient, studentId)
    },
    onError: (error) => toast.error(errorMessage(error)),
  })
}

export type PreviewQuestion = TestQuestion & { correct: number; explanation: string }
export type SetPreview = { title: string; exam: ExamKind; kind: TestKind; published: boolean; questions: PreviewQuestion[] }

// Yönetici ve öğretmen için doğru cevap ve çözümle birlikte set
export function usePreviewSet(setId: number) {
  return useQuery({
    queryKey: ['test-preview', setId],
    queryFn: async (): Promise<SetPreview | null> => (unwrap(await supabase.rpc('preview_set', { p_set: setId })) as unknown) as SetPreview | null,
  })
}
