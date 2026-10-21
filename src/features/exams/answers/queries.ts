import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase, unwrap } from '@/lib/supabase'
import { evaluate } from './sheet'
import type { SheetState } from './subject-sheet'
import type { ExamKind } from '@/lib/exam'

export function useExamAnswers(examId: number) {
  return useQuery({
    queryKey: ['exam', examId, 'answers'],
    queryFn: async () => {
      const rows = unwrap(
        await supabase
          .from('mock_exam_answers')
          .select('subject_id, number, key, answer, topic_id')
          .eq('mock_exam_id', examId)
          .order('number'),
      )
      const sheets = new Map<string, SheetState>()
      for (const r of rows) {
        const sheet = sheets.get(r.subject_id) ?? { key: '', answers: '', topics: {} }
        sheet.key += r.key ?? ''
        sheet.answers += r.answer ?? '-'
        if (r.topic_id !== null) sheet.topics[r.number] = r.topic_id
        sheets.set(r.subject_id, sheet)
      }
      return sheets
    },
  })
}

// Yanlış ve boş olmayan sorulara konu yazılmaz
export function sheetRows(sheet: SheetState, count: number, kind: ExamKind) {
  const r = evaluate(sheet.key, sheet.answers, count, kind)
  const last = Math.max(sheet.key.length, sheet.answers.length)
  return r.items
    .slice(0, last)
    .map((x) => ({
      number: x.number,
      key: x.key,
      answer: x.answer,
      topic_id: x.status === 'wrong' || x.status === 'blank' ? (sheet.topics[x.number] ?? null) : null,
    }))
}

export async function saveExamAnswers(examId: number, subjectId: string, rows: ReturnType<typeof sheetRows>) {
  unwrap(await supabase.rpc('save_exam_answers', { p_exam_id: examId, p_subject_id: subjectId, p_rows: rows }))
}

export function useSaveExamAnswers(examId: number) {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async (input: { subjectId: string; rows: ReturnType<typeof sheetRows> }) => saveExamAnswers(examId, input.subjectId, input.rows),
    onSuccess: () =>
      Promise.all([
        queryClient.invalidateQueries({ queryKey: ['exam', examId] }),
        queryClient.invalidateQueries({ queryKey: ['topic-misses'] }),
        queryClient.invalidateQueries({ queryKey: ['teacher-overview'] }),
        queryClient.invalidateQueries({ queryKey: ['exams'] }),
      ]),
  })
}
