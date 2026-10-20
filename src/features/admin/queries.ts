import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { keys } from '@/lib/data'
import { supabase, unwrap, type Enums } from '@/lib/supabase'

export type AccountStatus = Enums<'account_status'>

export type AdminOverview = {
  teachers_active: number
  teachers_pending: number
  students_active: number
  parents: number
  sessions_7d: number
}

export type AdminTeacher = {
  id: string
  full_name: string
  email: string | null
  school: string | null
  branch: string | null
  application_note: string | null
  status: AccountStatus
  is_admin: boolean
  created_at: string
  approved_at: string | null
  last_seen_at: string | null
  student_count: number
}

export const adminKeys = {
  overview: [...keys.admin, 'overview'] as const,
  teachers: [...keys.admin, 'teachers'] as const,
}

export function useAdminOverview() {
  return useQuery({
    queryKey: adminKeys.overview,
    queryFn: async (): Promise<AdminOverview | null> => unwrap(await supabase.rpc('admin_overview'))[0] ?? null,
  })
}

export function useAdminTeachers() {
  return useQuery({
    queryKey: adminKeys.teachers,
    queryFn: async (): Promise<AdminTeacher[]> => unwrap(await supabase.rpc('admin_teachers')),
  })
}

export function useTeacherStatus() {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: async ({ id, status }: { id: string; status: AccountStatus }) => {
      unwrap(await supabase.rpc('set_teacher_status', { p_teacher: id, p_status: status }))
    },
    onSettled: () => queryClient.invalidateQueries({ queryKey: keys.admin }),
  })
}
