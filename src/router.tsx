import type { ComponentType } from 'react'
import { createBrowserRouter, type RouteObject } from 'react-router'
import { FullPageSpinner, RootLayout, RouteError } from '@/components/app/root'
import { NotFound } from '@/components/app/not-found'
import { RedirectIfAuthed, RequireAuth, RequireRole } from '@/features/auth/guards'

type Loader = () => Promise<{ default: ComponentType }>
const page = (load: Loader): Pick<RouteObject, 'lazy'> => ({
  lazy: async () => ({ Component: (await load()).default }),
})

export const router = createBrowserRouter([
  {
    element: <RootLayout />,
    errorElement: <RouteError />,
    hydrateFallbackElement: <FullPageSpinner />,
    children: [
      { index: true, ...page(() => import('@/features/landing/landing-page')) },
      { path: 'kvkk', ...page(() => import('@/features/legal/kvkk-page')) },
      {
        element: <RedirectIfAuthed />,
        children: [
          { path: 'giris', ...page(() => import('@/features/auth/login-page')) },
          { path: 'ogretmen-basvurusu', ...page(() => import('@/features/auth/teacher-apply-page')) },
        ],
      },
      { path: 'katil', ...page(() => import('@/features/auth/join-page')) },
      {
        path: 'app',
        element: <RequireAuth />,
        children: [
          {
            lazy: async () => ({ Component: (await import('@/components/app/app-shell')).AppShell }),
            children: [
              { index: true, ...page(() => import('@/features/home/home-page')) },
              { path: 'bildirimler', ...page(() => import('@/features/notifications/notifications-page')) },
              { path: 'konular/:topicId', ...page(() => import('@/features/lessons/lesson-page')) },
              { path: 'ayarlar', ...page(() => import('@/features/settings/settings-page')) },
              { path: 'mesajlar', ...page(() => import('@/features/messages/inbox-page')) },
              { path: 'mesajlar/:studentId/:channel', ...page(() => import('@/features/messages/thread-page')) },
              {
                element: <RequireRole roles={['student', 'parent']} />,
                children: [
                  { path: 'plan', ...page(() => import('@/features/plan/student-plan-page')) },
                  { path: 'ilerleme', ...page(() => import('@/features/tracking/progress-page')) },
                  { path: 'denemeler', ...page(() => import('@/features/exams/exams-page')) },
                  { path: 'denemeler/:examId', ...page(() => import('@/features/exams/exam-detail-page')) },
                  { path: 'konular', ...page(() => import('@/features/topics/topics-page')) },
                  { path: 'notlar', ...page(() => import('@/features/notes/notes-page')) },
                  { path: 'yanlislar', ...page(() => import('@/features/wrong/wrong-page')) },
                ],
              },
              {
                element: <RequireRole roles={['student']} />,
                children: [
                  { path: 'sayac', ...page(() => import('@/features/tracking/timer-page')) },
                  { path: 'deneme-ekle', ...page(() => import('@/features/exams/new-exam-page')) },
                ],
              },
              {
                element: <RequireRole roles={['teacher']} />,
                children: [
                  { path: 'ogrenciler/:studentId', ...page(() => import('@/features/teacher/student-detail-page')) },
                  { path: 'ogrenciler/:studentId/deneme-ekle', ...page(() => import('@/features/exams/new-exam-page')) },
                  { path: 'planlayici', ...page(() => import('@/features/plan/planner-page')) },
                  { path: 'davetler', ...page(() => import('@/features/teacher/invites-page')) },
                ],
              },
              {
                element: <RequireRole roles={['teacher']} admin />,
                children: [{ path: 'yonetim', ...page(() => import('@/features/admin/admin-page')) }],
              },
            ],
          },
        ],
      },
      { path: '*', element: <NotFound /> },
    ],
  },
])
