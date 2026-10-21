import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { keys } from '@/lib/data'
import { supabase, unwrap } from '@/lib/supabase'
import type { Nets } from './reference'

export type University = {
  id: number
  name: string
  short_name: string
  kind: string
  city: string | null
}
export type ProgramRow = {
  code: number
  name: string
  group_name: string
  score_type: string
  language: string | null
  scholarship: string | null
}
export type ProgramDetail = ProgramRow & {
  city: string | null
  faculty: string | null
  university: University
}
export type ProgramResult = {
  year: number
  quota: number | null
  placed: number | null
  min_score: number | null
  rank: number | null
  nets: Nets | null
}

export function useUniversities() {
  return useQuery({
    queryKey: ['goals', 'universities'],
    staleTime: Infinity,
    queryFn: async (): Promise<University[]> =>
      unwrap(await supabase.from('universities').select('id, name, short_name, kind, city').order('short_name')),
  })
}

export function useUniversityPrograms(universityId: number | null) {
  return useQuery({
    queryKey: ['goals', 'programs', universityId],
    enabled: universityId !== null,
    staleTime: Infinity,
    queryFn: async (): Promise<ProgramRow[]> =>
      unwrap(
        await supabase
          .from('programs')
          .select('code, name, group_name, score_type, language, scholarship')
          .eq('university_id', universityId as number)
          .order('name')
          .limit(1000),
      ),
  })
}

export function useTargetProgram(code: number | null) {
  return useQuery({
    queryKey: ['goals', 'target', code],
    enabled: code !== null,
    staleTime: 10 * 60_000,
    queryFn: async () => {
      const [program, results] = await Promise.all([
        supabase
          .from('programs')
          .select(
            'code, name, group_name, score_type, language, scholarship, city, faculty, university:universities!inner(id, name, short_name, kind, city)',
          )
          .eq('code', code as number)
          .single(),
        supabase
          .from('program_results')
          .select('year, quota, placed, min_score, rank, nets')
          .eq('program_code', code as number)
          .order('year', { ascending: false }),
      ])
      return {
        program: unwrap(program) as unknown as ProgramDetail,
        results: unwrap(results) as unknown as ProgramResult[],
      }
    },
  })
}

export function useStudentTarget(studentId: string) {
  return useQuery({
    queryKey: [...keys.student(studentId), 'target'],
    queryFn: async () => unwrap(await supabase.from('students').select('target, target_program').eq('id', studentId).single()),
  })
}

export function useSetTargetProgram(studentId: string) {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (code: number | null) => {
      const rows = unwrap(await supabase.from('students').update({ target_program: code }).eq('id', studentId).select('id'))
      if (!rows.length) throw new Error('Bu işlem için yetkiniz yok')
    },
    onSuccess: () => qc.invalidateQueries({ queryKey: keys.student(studentId) }),
  })
}
