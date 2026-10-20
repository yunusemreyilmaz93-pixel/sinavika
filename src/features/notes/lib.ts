import { useQuery } from '@tanstack/react-query'
import { Eye, Lock, UserRound, Users, type LucideIcon } from 'lucide-react'
import { keys } from '@/lib/data'
import { supabase, unwrap, type Enums, type Tables } from '@/lib/supabase'

export type NoteKind = Enums<'note_kind'>
export type NoteVisibility = Enums<'note_visibility'>
export type Note = Tables<'notes'> & { author: { full_name: string } | null }

export const visibilityOptions: { value: NoteVisibility; label: string; hint: string; icon: LucideIcon }[] = [
  { value: 'private', label: 'Sadece ben', hint: 'Öğrenci ve veli görmez', icon: Lock },
  { value: 'student', label: 'Öğrenci görür', hint: 'Öğrencinin Notlar sayfasında çıkar', icon: UserRound },
  { value: 'parent', label: 'Veli görür', hint: 'Velinin Notlar sayfasında çıkar', icon: Users },
  { value: 'both', label: 'Öğrenci ve veli görür', hint: 'İkisi de görür', icon: Eye },
]

export function visibilityOf(value: NoteVisibility) {
  return visibilityOptions.find((o) => o.value === value) ?? visibilityOptions[0]
}

export function useNotes(studentId: string | undefined) {
  return useQuery({
    queryKey: keys.notes(studentId ?? ''),
    enabled: Boolean(studentId),
    queryFn: async () =>
      unwrap(
        await supabase
          .from('notes')
          .select('*, author:profiles!notes_teacher_id_fkey(full_name)')
          .eq('student_id', studentId!)
          .order('created_at', { ascending: false })
          .order('id', { ascending: false }),
      ) as Note[],
  })
}

export function useParentCount(studentId: string) {
  return useQuery({
    queryKey: [...keys.notes(studentId), 'parents'],
    queryFn: async () => {
      const { count, error } = await supabase
        .from('parent_links')
        .select('parent_id', { count: 'exact', head: true })
        .eq('student_id', studentId)
      if (error) throw error
      return count ?? 0
    },
  })
}
