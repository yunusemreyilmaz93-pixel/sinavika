import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { supabase, unwrap } from '@/lib/supabase'

export type Audience = 'students' | 'parents' | 'both'
export type Announcement = {
  id: number
  audience: Audience
  title: string
  body: string
  created_at: string
  teacher_id: string
  teacher: { full_name: string } | null
}

const key = ['announcements'] as const

export function useAnnouncements() {
  return useQuery({
    queryKey: key,
    queryFn: async (): Promise<Announcement[]> =>
      unwrap(
        await supabase
          .from('announcements')
          .select('id, audience, title, body, created_at, teacher_id, teacher:profiles!announcements_teacher_id_fkey(full_name)')
          .order('created_at', { ascending: false })
          .limit(50),
      ) as unknown as Announcement[],
  })
}

export function useSendAnnouncement() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (values: { audience: Audience; title: string; body: string }) => {
      unwrap(await supabase.from('announcements').insert(values))
    },
    onSuccess: () => qc.invalidateQueries({ queryKey: key }),
  })
}

export function useDeleteAnnouncement() {
  const qc = useQueryClient()
  return useMutation({
    mutationFn: async (id: number) => {
      unwrap(await supabase.from('announcements').delete().eq('id', id))
    },
    onSuccess: () => qc.invalidateQueries({ queryKey: key }),
  })
}
