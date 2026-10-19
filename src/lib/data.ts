import { useQuery } from '@tanstack/react-query'
import type { ExamKind, Subject, Topic } from './exam'
import { supabase, unwrap } from './supabase'

export const keys = {
  curriculum: ['curriculum'] as const,
  settings: ['settings'] as const,
  student: (id: string) => ['student', id] as const,
  tasks: (studentId: string, from: string, to: string) => ['tasks', studentId, from, to] as const,
  sessions: (studentId: string) => ['sessions', studentId] as const,
  questions: (studentId: string) => ['questions', studentId] as const,
  exams: (studentId: string) => ['exams', studentId] as const,
  exam: (examId: number) => ['exam', examId] as const,
  goals: (studentId: string) => ['goals', studentId] as const,
  topics: (studentId: string) => ['topic-progress', studentId] as const,
  notes: (studentId: string) => ['notes', studentId] as const,
  overview: ['teacher-overview'] as const,
  invites: ['invites'] as const,
  templates: ['templates'] as const,
  notifications: ['notifications'] as const,
  messages: (studentId: string, channel: string) => ['messages', studentId, channel] as const,
  inbox: ['inbox'] as const,
  admin: ['admin'] as const,
}

export type Curriculum = {
  subjects: Subject[]
  topics: Topic[]
  subjectById: Map<string, Subject>
  topicById: Map<number, Topic>
  topicsBySubject: Map<string, Topic[]>
}

export function useCurriculum() {
  return useQuery({
    queryKey: keys.curriculum,
    staleTime: Infinity,
    gcTime: Infinity,
    queryFn: async (): Promise<Curriculum> => {
      const [subjects, topics] = await Promise.all([
        supabase.from('subjects').select('*').order('sort'),
        supabase.from('topics').select('*').order('sort'),
      ])
      const s = unwrap(subjects)
      const t = unwrap(topics)
      const topicsBySubject = new Map<string, Topic[]>()
      for (const topic of t) {
        const list = topicsBySubject.get(topic.subject_id) ?? []
        list.push(topic)
        topicsBySubject.set(topic.subject_id, list)
      }
      return {
        subjects: s,
        topics: t,
        subjectById: new Map(s.map((x) => [x.id, x])),
        topicById: new Map(t.map((x) => [x.id, x])),
        topicsBySubject,
      }
    },
  })
}

export type Settings = {
  studentCapacity: number
  teacherCapacity: number
  applicationsOpen: boolean
  examDates: Record<'LGS' | 'YKS', { date: string; official: boolean }>
}

export function useSettings() {
  return useQuery({
    queryKey: keys.settings,
    staleTime: 10 * 60 * 1000,
    queryFn: async (): Promise<Settings> => {
      const rows = unwrap(await supabase.from('app_settings').select('key, value'))
      const map = Object.fromEntries(rows.map((r) => [r.key, r.value])) as Record<string, unknown>
      return {
        studentCapacity: Number(map.student_capacity ?? 10),
        teacherCapacity: Number(map.teacher_capacity ?? 100),
        applicationsOpen: map.applications_open !== false,
        examDates: (map.exam_dates as Settings['examDates']) ?? {
          LGS: { date: '2027-06-12', official: false },
          YKS: { date: '2027-06-19', official: false },
        },
      }
    },
  })
}

export function examDateFor(settings: Settings | undefined, track: 'lgs' | 'yks') {
  return settings?.examDates[track === 'lgs' ? 'LGS' : 'YKS']
}

export type { ExamKind }
