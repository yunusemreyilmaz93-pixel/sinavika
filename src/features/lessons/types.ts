import type { ComponentType } from 'react'
import type { Profile } from '@/features/auth/session'

export type LessonOutline = { id: string; title: string }[]

export type LessonBodyProps = { role: Profile['role'] }

export type Lesson = {
  subjectId: string
  topic: string
  grade: string
  date: string
  readingMinutes: number
  teacherNote: { label: string; text: string }[]
  load: () => Promise<{ default: ComponentType<LessonBodyProps>; outline: LessonOutline }>
}
