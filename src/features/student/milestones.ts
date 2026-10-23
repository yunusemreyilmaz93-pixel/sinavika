import { useQuery } from '@tanstack/react-query'
import { BookCheck, CalendarCheck, Clock, Flame, ListChecks, Trophy, type LucideIcon } from 'lucide-react'
import { supabase, unwrap } from '@/lib/supabase'

export type Milestones = {
  streak: number
  best_streak: number
  tasks_done: number
  questions: number
  minutes: number
  exams: number
  topics_done: number
}

type Metric = keyof Omit<Milestones, 'streak'>

export type BadgeDef = { id: string; title: string; hint: string; icon: LucideIcon; metric: Metric; goal: number }

export const badges: BadgeDef[] = [
  { id: 'task-1', title: 'İlk adım', hint: 'İlk görevi tamamla', icon: CalendarCheck, metric: 'tasks_done', goal: 1 },
  { id: 'task-25', title: '25 görev', hint: '25 görev tamamla', icon: CalendarCheck, metric: 'tasks_done', goal: 25 },
  { id: 'q-100', title: '100 soru', hint: '100 soru çöz', icon: ListChecks, metric: 'questions', goal: 100 },
  { id: 'q-500', title: '500 soru', hint: '500 soru çöz', icon: ListChecks, metric: 'questions', goal: 500 },
  { id: 'q-1000', title: '1000 soru', hint: '1000 soru çöz', icon: ListChecks, metric: 'questions', goal: 1000 },
  { id: 'min-600', title: '10 saat', hint: '10 saat çalış', icon: Clock, metric: 'minutes', goal: 600 },
  { id: 'min-3000', title: '50 saat', hint: '50 saat çalış', icon: Clock, metric: 'minutes', goal: 3000 },
  { id: 'streak-3', title: '3 gün üst üste', hint: '3 gün üst üste çalış', icon: Flame, metric: 'best_streak', goal: 3 },
  { id: 'streak-7', title: '7 gün üst üste', hint: '7 gün üst üste çalış', icon: Flame, metric: 'best_streak', goal: 7 },
  { id: 'streak-30', title: '30 gün üst üste', hint: '30 gün üst üste çalış', icon: Flame, metric: 'best_streak', goal: 30 },
  { id: 'exam-1', title: 'İlk deneme', hint: 'İlk denemeni ekle', icon: Trophy, metric: 'exams', goal: 1 },
  { id: 'exam-5', title: '5 deneme', hint: '5 deneme ekle', icon: Trophy, metric: 'exams', goal: 5 },
  { id: 'topic-1', title: 'İlk konu', hint: 'Bir konuyu tamamla', icon: BookCheck, metric: 'topics_done', goal: 1 },
  { id: 'topic-10', title: '10 konu', hint: '10 konu tamamla', icon: BookCheck, metric: 'topics_done', goal: 10 },
]

export function badgeState(def: BadgeDef, m: Milestones) {
  const value = m[def.metric]
  return { earned: value >= def.goal, value: Math.min(value, def.goal) }
}

export function earnedIds(m: Milestones) {
  return badges.filter((b) => badgeState(b, m).earned).map((b) => b.id)
}

export function useMilestones(studentId: string) {
  return useQuery({
    queryKey: ['milestones', studentId],
    staleTime: 60 * 1000,
    queryFn: async () => unwrap(await supabase.rpc('student_milestones', { p_student: studentId })) as unknown as Milestones,
  })
}
