import { useMutation, useQuery, useQueryClient, type QueryClient } from '@tanstack/react-query'
import { keys } from '@/lib/data'
import type { ExamKind } from '@/lib/exam'
import { AppError, supabase, unwrap, type Tables, type Views } from '@/lib/supabase'

export type ExamResult = {
  id: number
  kind: ExamKind
  title: string
  taken_on: string
  correct: number
  wrong: number
  blank: number
  net: number
}

export type Score = Pick<Tables<'mock_exam_scores'>, 'mock_exam_id' | 'subject_id' | 'correct' | 'wrong' | 'blank'>
export type Goal = { kind: ExamKind; target_net: number }

export type ExamDetailData = {
  exam: Tables<'mock_exams'>
  scores: Score[]
  previous: { id: number; title: string; taken_on: string; scores: Score[] } | null
}

export type NewScore = { subject_id: string; correct: number; wrong: number; blank: number }

function toResults(rows: Partial<Views<'mock_exam_results'>>[]): ExamResult[] {
  return rows
    .filter((r) => r.id != null && r.kind != null && r.taken_on != null)
    .map((r) => ({
      id: Number(r.id),
      kind: r.kind as ExamKind,
      title: r.title ?? '',
      taken_on: r.taken_on as string,
      correct: Number(r.correct ?? 0),
      wrong: Number(r.wrong ?? 0),
      blank: Number(r.blank ?? 0),
      net: Number(r.net ?? 0),
    }))
    .sort((a, b) => b.taken_on.localeCompare(a.taken_on) || b.id - a.id)
}

function toGoals(rows: Partial<Tables<'student_goals'>>[]): Goal[] {
  return rows.filter((r) => r.kind && r.target_net != null).map((r) => ({ kind: r.kind as ExamKind, target_net: Number(r.target_net) }))
}

export function useExams(studentId: string) {
  return useQuery({
    queryKey: keys.exams(studentId),
    enabled: Boolean(studentId),
    queryFn: async () =>
      unwrap(
        await supabase
          .from('mock_exam_results')
          .select('*')
          .eq('student_id', studentId)
          .order('taken_on', { ascending: false })
          .order('id', { ascending: false }),
      ),
    select: toResults,
  })
}

export function useGoals(studentId: string) {
  return useQuery({
    queryKey: keys.goals(studentId),
    queryFn: async () => unwrap(await supabase.from('student_goals').select('*').eq('student_id', studentId)),
    select: toGoals,
  })
}

export function useExamScores(studentId: string, examIds: number[]) {
  return useQuery({
    queryKey: [...keys.exams(studentId), 'scores', ...examIds],
    enabled: examIds.length > 0,
    queryFn: async (): Promise<Score[]> =>
      unwrap(
        await supabase
          .from('mock_exam_scores')
          .select('mock_exam_id, subject_id, correct, wrong, blank')
          .in('mock_exam_id', examIds),
      ),
  })
}

export function useExamDetail(examId: number) {
  return useQuery({
    queryKey: keys.exam(examId),
    enabled: Number.isInteger(examId) && examId > 0,
    queryFn: async (): Promise<ExamDetailData | null> => {
      const exam = unwrap(await supabase.from('mock_exams').select('*').eq('id', examId).maybeSingle())
      if (!exam) return null
      const [scores, previous] = await Promise.all([
        supabase.from('mock_exam_scores').select('mock_exam_id, subject_id, correct, wrong, blank').eq('mock_exam_id', exam.id),
        supabase
          .from('mock_exams')
          .select('id, title, taken_on')
          .eq('student_id', exam.student_id)
          .eq('kind', exam.kind)
          .or(`taken_on.lt.${exam.taken_on},and(taken_on.eq.${exam.taken_on},id.lt.${exam.id})`)
          .order('taken_on', { ascending: false })
          .order('id', { ascending: false })
          .limit(1)
          .maybeSingle(),
      ])
      const prev = unwrap(previous)
      const prevScores = prev
        ? unwrap(
            await supabase.from('mock_exam_scores').select('mock_exam_id, subject_id, correct, wrong, blank').eq('mock_exam_id', prev.id),
          )
        : []
      return { exam, scores: unwrap(scores), previous: prev ? { ...prev, scores: prevScores } : null }
    },
  })
}

function refreshExamData(queryClient: QueryClient, studentId: string) {
  return Promise.all([
    queryClient.invalidateQueries({ queryKey: keys.exams(studentId) }),
    queryClient.invalidateQueries({ queryKey: keys.overview }),
    queryClient.invalidateQueries({ queryKey: ['exam'], refetchType: 'none' }),
  ])
}

export function useDeleteExam() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async ({ examId }: { examId: number; studentId: string }) => {
      const rows = unwrap(await supabase.from('mock_exams').delete().eq('id', examId).select('id'))
      if (!rows.length) throw new AppError('Bu deneme silinemedi')
    },
    onSuccess: (_, { studentId }) => refreshExamData(queryClient, studentId),
  })
}

export function useCreateExam() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { studentId: string; kind: ExamKind; title: string; takenOn: string; scores: NewScore[] }) =>
      unwrap(
        await supabase.rpc('create_mock_exam', {
          p_student_id: input.studentId,
          p_kind: input.kind,
          p_title: input.title,
          p_taken_on: input.takenOn,
          p_scores: input.scores,
        }),
      ),
    onSuccess: (_, { studentId }) => refreshExamData(queryClient, studentId),
  })
}

export function useSaveGoal(studentId: string) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async ({ kind, target }: { kind: ExamKind; target: number | null }) => {
      if (target == null) {
        unwrap(await supabase.from('student_goals').delete().eq('student_id', studentId).eq('kind', kind))
      } else {
        unwrap(
          await supabase
            .from('student_goals')
            .upsert({ student_id: studentId, kind, target_net: target }, { onConflict: 'student_id,kind' }),
        )
      }
    },
    onSuccess: () =>
      Promise.all([
        queryClient.invalidateQueries({ queryKey: keys.goals(studentId) }),
        queryClient.invalidateQueries({ queryKey: keys.overview }),
      ]),
  })
}
