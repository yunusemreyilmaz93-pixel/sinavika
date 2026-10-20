import { useQuery, type QueryClient } from '@tanstack/react-query'
import { keys } from '@/lib/data'
import { supabase, unwrap, type Tables } from '@/lib/supabase'

export type StudentDetail = Tables<'students'> & {
  full_name: string
  username: string | null
  last_seen_at: string | null
}

export type LinkedParent = { id: string; full_name: string; username: string | null; last_seen_at: string | null; linked_at: string }

const uuid = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i

export const parentLinksKey = (studentId: string) => ['parent-links', studentId, 'detail'] as const
export const parentInviteKey = (studentId: string) => ['parent-invite', studentId] as const

export function useStudentDetail(studentId: string, teacherId: string) {
  return useQuery({
    queryKey: [...keys.student(studentId), 'detail'],
    queryFn: async (): Promise<StudentDetail | null> => {
      if (!uuid.test(studentId)) return null
      const [student, profile] = await Promise.all([
        supabase.from('students').select('*').eq('id', studentId).maybeSingle(),
        supabase.from('profiles').select('full_name, username, last_seen_at').eq('id', studentId).maybeSingle(),
      ])
      const s = unwrap(student)
      const p = unwrap(profile)
      if (!s || !p || s.teacher_id !== teacherId) return null
      return { ...s, full_name: p.full_name, username: p.username, last_seen_at: p.last_seen_at }
    },
  })
}

export function useLinkedParents(studentId: string) {
  return useQuery({
    queryKey: parentLinksKey(studentId),
    enabled: uuid.test(studentId),
    queryFn: async (): Promise<LinkedParent[]> => {
      const links = unwrap(await supabase.from('parent_links').select('parent_id, created_at').eq('student_id', studentId))
      if (!links.length) return []
      const people = unwrap(
        await supabase
          .from('profiles')
          .select('id, full_name, username, last_seen_at')
          .in(
            'id',
            links.map((l) => l.parent_id),
          ),
      )
      const byId = new Map(people.map((p) => [p.id, p]))
      return links
        .map((l) => {
          const p = byId.get(l.parent_id)
          return {
            id: l.parent_id,
            full_name: p?.full_name ?? 'Veli',
            username: p?.username ?? null,
            last_seen_at: p?.last_seen_at ?? null,
            linked_at: l.created_at,
          }
        })
        .sort((a, b) => a.full_name.localeCompare(b.full_name, 'tr'))
    },
  })
}

export function useParentInvite(studentId: string) {
  return useQuery({
    queryKey: parentInviteKey(studentId),
    queryFn: async () =>
      unwrap(
        await supabase
          .from('invites')
          .select('*')
          .eq('kind', 'parent')
          .eq('student_id', studentId)
          .is('used_at', null)
          .gt('expires_at', new Date().toISOString())
          .order('created_at', { ascending: false })
          .limit(1)
          .maybeSingle(),
      ),
  })
}

export function refreshStudent(queryClient: QueryClient, studentId: string) {
  return Promise.all([
    queryClient.invalidateQueries({ queryKey: keys.student(studentId) }),
    queryClient.invalidateQueries({ queryKey: keys.overview }),
  ])
}

const consonants = 'bcdfghkmnprstvyz'
const vowels = 'aeiou'

function pick(alphabet: string, bytes: Uint8Array, i: number) {
  return alphabet[bytes[i] % alphabet.length]
}

export function readablePassword() {
  const bytes = crypto.getRandomValues(new Uint8Array(10))
  const syllable = (i: number) => pick(consonants, bytes, i) + pick(vowels, bytes, i + 1)
  const digits = String(10 + ((bytes[8] * 256 + bytes[9]) % 90))
  const first = syllable(0)
  return `${first[0].toUpperCase()}${first.slice(1)}${syllable(2)}-${syllable(4)}${syllable(6)}${digits}`
}
