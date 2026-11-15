import type { SupabaseClient } from '@supabase/supabase-js'
import { todayISO } from '@/lib/dates'
import { AppError, errorMessage, supabase } from '@/lib/supabase'

// KVKK kapsamında "verilerimi indir". Veri kullanıcının kendi oturumuyla okunur, yani RLS'nin izin verdiğinden fazlası dosyaya girmez
const db = supabase as unknown as SupabaseClient

type Row = Record<string, unknown>

const PAGE = 1000

async function all(table: string, column: string, values: (string | number)[]): Promise<Row[]> {
  if (!values.length) return []
  const out: Row[] = []
  for (let from = 0; ; from += PAGE) {
    const { data, error } = await db
      .from(table)
      .select('*')
      .in(column, values)
      .range(from, from + PAGE - 1)
    if (error) throw new AppError(`${table}: ${errorMessage(error)}`)
    out.push(...(data as Row[]))
    if (data.length < PAGE) return out
  }
}

const perStudent = [
  'students',
  'study_sessions',
  'question_logs',
  'tasks',
  'topic_progress',
  'lesson_progress',
  'lesson_answers',
  'video_progress',
  'wrong_questions',
  'books',
  'reading_logs',
  'student_notes',
  'student_goals',
  'student_preferences',
  'notes',
  'messages',
  'meetings',
]

export async function exportMyData(user: { id: string; role: string }) {
  const studentIds =
    user.role === 'student'
      ? [user.id]
      : user.role === 'parent'
        ? (await all('parent_links', 'parent_id', [user.id])).map((r) => r.student_id as string)
        : (await all('students', 'teacher_id', [user.id])).map((r) => r.id as string)

  const data: Record<string, Row[]> = {
    profile: await all('profiles', 'id', [user.id]),
    notifications: await all('notifications', 'user_id', [user.id]),
    notification_prefs: await all('notification_prefs', 'user_id', [user.id]),
  }
  if (user.role === 'parent') data.parent_links = await all('parent_links', 'parent_id', [user.id])
  if (user.role === 'teacher') {
    data.plan_templates = await all('plan_templates', 'teacher_id', [user.id])
    data.announcements = await all('announcements', 'teacher_id', [user.id])
    data.invites = await all('invites', 'teacher_id', [user.id])
  }
  for (const table of perStudent) data[table] = await all(table, table === 'students' ? 'id' : 'student_id', studentIds)

  const exams = await all('mock_exams', 'student_id', studentIds)
  const examIds = exams.map((e) => e.id as number)
  data.mock_exams = exams
  data.mock_exam_scores = await all('mock_exam_scores', 'mock_exam_id', examIds)
  data.mock_exam_answers = await all('mock_exam_answers', 'mock_exam_id', examIds)
  data.mock_exam_topic_misses = await all('mock_exam_topic_misses', 'mock_exam_id', examIds)

  const attempts = await all('test_attempts', 'student_id', studentIds)
  data.test_attempts = attempts
  data.test_answers = await all('test_answers', 'attempt_id', attempts.map((a) => a.id as number))

  const file = { app: 'İzlek', exported_at: new Date().toISOString(), role: user.role, data }
  const blob = new Blob([JSON.stringify(file, null, 2)], { type: 'application/json' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = `izlek-verilerim-${todayISO()}.json`
  a.click()
  setTimeout(() => URL.revokeObjectURL(url), 1000)
}
