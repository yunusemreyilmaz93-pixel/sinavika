import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { shiftDays, todayISO } from '@/lib/dates'
import { supabase, unwrap } from '@/lib/supabase'

export type Book = { id: number; title: string; author: string | null; total_pages: number | null; started_on: string; finished_on: string | null }
export type ReadingLog = { id: number; book_id: number; pages: number; read_on: string }

const key = (studentId: string) => ['reading', studentId] as const

export function useReading(studentId: string) {
  return useQuery({
    queryKey: key(studentId),
    queryFn: async () => {
      const [books, logs] = await Promise.all([
        supabase.from('books').select('id, title, author, total_pages, started_on, finished_on').eq('student_id', studentId).order('created_at', { ascending: false }),
        supabase.from('reading_logs').select('id, book_id, pages, read_on').eq('student_id', studentId).order('read_on', { ascending: false }).limit(1000),
      ])
      return { books: unwrap(books) as Book[], logs: unwrap(logs) as ReadingLog[] }
    },
  })
}

export function pagesRead(logs: ReadingLog[], bookId: number) {
  return logs.reduce((sum, l) => (l.book_id === bookId ? sum + l.pages : sum), 0)
}

export function pagesThisWeek(logs: ReadingLog[], today = todayISO()) {
  const from = shiftDays(today, -6)
  return logs.reduce((sum, l) => (l.read_on >= from && l.read_on <= today ? sum + l.pages : sum), 0)
}

export function useReadingActions(studentId: string) {
  const qc = useQueryClient()
  const done = () => qc.invalidateQueries({ queryKey: key(studentId) })
  return {
    addBook: useMutation({
      mutationFn: async (v: { title: string; author: string | null; total_pages: number | null }) => {
        unwrap(await supabase.from('books').insert({ student_id: studentId, ...v }))
      },
      onSuccess: done,
    }),
    addPages: useMutation({
      mutationFn: async (v: { book_id: number; pages: number; read_on?: string }) => {
        unwrap(await supabase.from('reading_logs').insert({ student_id: studentId, ...v }))
      },
      onSuccess: done,
    }),
    removeLog: useMutation({
      mutationFn: async (id: number) => {
        unwrap(await supabase.from('reading_logs').delete().eq('id', id))
      },
      onSuccess: done,
    }),
    finish: useMutation({
      mutationFn: async (v: { id: number; finished: boolean }) => {
        unwrap(await supabase.from('books').update({ finished_on: v.finished ? todayISO() : null }).eq('id', v.id))
      },
      onSuccess: done,
    }),
    removeBook: useMutation({
      mutationFn: async (id: number) => {
        unwrap(await supabase.from('books').delete().eq('id', id))
      },
      onSuccess: done,
    }),
  }
}
