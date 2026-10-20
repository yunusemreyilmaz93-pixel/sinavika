import { useQuery } from '@tanstack/react-query'
import { useMemo, useState } from 'react'
import { useAuth } from '@/features/auth/session'
import { keys, useCurriculum } from '@/lib/data'
import { studentSubjects, type Subject } from '@/lib/exam'
import { supabase, unwrap, type Tables } from '@/lib/supabase'

type StudentRecord = Pick<Tables<'students'>, 'id' | 'track' | 'field' | 'daily_minutes_goal' | 'weekly_questions_goal'>

const recentKey = (studentId: string) => `sinavika-recent-subjects:${studentId}`

export function readRecentSubjects(studentId: string): string[] {
  try {
    const parsed: unknown = JSON.parse(localStorage.getItem(recentKey(studentId)) ?? '[]')
    return Array.isArray(parsed) ? parsed.filter((x): x is string => typeof x === 'string') : []
  } catch {
    return []
  }
}

export function rememberSubject(studentId: string, subjectId: string) {
  try {
    const next = [subjectId, ...readRecentSubjects(studentId).filter((id) => id !== subjectId)].slice(0, 12)
    localStorage.setItem(recentKey(studentId), JSON.stringify(next))
  } catch {
    /* depolama kapalıysa sıralama varsayılan kalır */
  }
}

export function useStudentRecord(studentId: string) {
  const { student, children } = useAuth()
  const known = student?.id === studentId ? student : children.find((c) => c.id === studentId)
  const query = useQuery({
    queryKey: [...keys.student(studentId), 'tracking'],
    enabled: !known && Boolean(studentId),
    staleTime: 5 * 60 * 1000,
    queryFn: async (): Promise<StudentRecord> =>
      unwrap(
        await supabase
          .from('students')
          .select('id, track, field, daily_minutes_goal, weekly_questions_goal')
          .eq('id', studentId)
          .single(),
      ),
  })
  return { record: known ?? query.data, isPending: !known && query.isPending, error: query.error }
}

export function useStudentSubjects(studentId: string) {
  const curriculum = useCurriculum()
  const { record, isPending, error } = useStudentRecord(studentId)
  const [recent] = useState(() => readRecentSubjects(studentId))

  const subjects = useMemo(() => {
    if (!curriculum.data || !record) return []
    const list = studentSubjects(curriculum.data.subjects, record)
    const rank = new Map(recent.map((id, i) => [id, i]))
    return list
      .map((s, i) => ({ s, i, r: rank.get(s.id) ?? Infinity }))
      .sort((a, b) => a.r - b.r || a.i - b.i)
      .map((x) => x.s)
  }, [curriculum.data, record, recent])

  const multiExam = new Set(subjects.map((s) => s.exam)).size > 1

  return {
    subjects,
    multiExam,
    recent: recent.find((id) => subjects.some((s) => s.id === id)) ?? null,
    curriculum: curriculum.data,
    isPending: curriculum.isPending || isPending,
    error: curriculum.error ?? error,
  }
}

export function subjectName(subject: Subject | undefined, opts: { short?: boolean; exam?: boolean } = {}) {
  if (!subject) return 'Ders'
  const name = opts.short || subject.name.length > 20 ? subject.short : subject.name
  return opts.exam && subject.exam !== 'LGS' ? `${subject.exam} ${name}` : name
}
