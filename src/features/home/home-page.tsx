import { lazy } from 'react'
import { useProfile } from '@/features/auth/session'

const StudentToday = lazy(() => import('@/features/student/today-page'))
const TeacherDashboard = lazy(() => import('@/features/teacher/dashboard-page'))
const ParentHome = lazy(() => import('@/features/parent/parent-home-page'))

export default function HomePage() {
  const profile = useProfile()
  if (profile.role === 'student') return <StudentToday />
  if (profile.role === 'parent') return <ParentHome />
  return <TeacherDashboard />
}
