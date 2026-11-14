import type { Curriculum, Settings } from '@/lib/data'
import type { Tables } from '@/lib/database.types'
import { daysBetween, formatDate, shiftDays, todayISO, weekDays } from '@/lib/dates'
import { gradeLabel, net, studentLabel, studentSubjects, subjectColor, type ExamKind, type Field, type Track } from '@/lib/exam'
import { lgsScore, tytScore } from '@/lib/score'
import { supabase, unwrap } from '@/lib/supabase'
import { computePace, type Pace } from '@/features/topics/pace'

export type ReportViewer = 'student' | 'teacher' | 'parent'

export type ReportStudent = { id: string; name: string; track: Track; grade: number; field: Field | null; teacher_id: string }

type Raw = {
  sessions: Pick<Tables<'study_sessions'>, 'studied_on' | 'minutes' | 'subject_id' | 'topic_id'>[]
  logs: Pick<Tables<'question_logs'>, 'solved_on' | 'subject_id' | 'topic_id' | 'correct' | 'wrong' | 'blank'>[]
  tasks: Pick<Tables<'tasks'>, 'due_on' | 'title' | 'kind' | 'subject_id' | 'done_at'>[]
  exams: Pick<Tables<'mock_exams'>, 'id' | 'kind' | 'title' | 'taken_on'>[]
  scores: Tables<'mock_exam_scores'>[]
  goals: Pick<Tables<'student_goals'>, 'kind' | 'target_net'>[]
  progress: Pick<Tables<'topic_progress'>, 'topic_id' | 'status' | 'updated_at'>[]
  lessons: Pick<Tables<'lesson_progress'>, 'topic_id' | 'active_seconds' | 'updated_at'>[]
  wrong: Pick<Tables<'wrong_questions'>, 'created_at' | 'last_reviewed_at' | 'learned_at' | 'next_review_on'>[]
  reading: Pick<Tables<'reading_logs'>, 'book_id' | 'pages' | 'read_on'>[]
  books: Pick<Tables<'books'>, 'id' | 'title' | 'author' | 'total_pages' | 'finished_on'>[]
  notes: Pick<Tables<'notes'>, 'body' | 'kind' | 'visibility' | 'met_on' | 'created_at'>[]
}

export type ReportInput = {
  student: ReportStudent
  teacherName: string | null
  weekStart: string
  viewer: ReportViewer
  comment: string
  curriculum: Curriculum
  settings: Settings | undefined
  today?: string
}

export type ReportExam = {
  title: string
  kind: ExamKind
  date: string
  net: number
  prevNet: number | null
  score: number | null
  subjects: { name: string; color: string; correct: number; wrong: number; blank: number; net: number }[]
}

export type WeeklyReport = {
  student: { name: string; label: string; grade: string }
  teacherName: string | null
  viewer: ReportViewer
  week: { start: string; end: string; label: string }
  generatedOn: string
  exam: { label: string; date: string; daysLeft: number; official: boolean } | null
  summary: {
    minutes: number
    prevMinutes: number
    questions: number
    prevQuestions: number
    accuracy: number | null
    prevAccuracy: number | null
    tasksDone: number
    tasksTotal: number
    activeDays: number
  }
  days: { date: string; label: string; minutes: number; questions: number; correct: number; wrong: number }[]
  subjects: { name: string; color: string; minutes: number; questions: number; correct: number; wrong: number; blank: number; accuracy: number | null }[]
  topics: { name: string; subject: string; color: string; questions: number; correct: number; wrong: number; accuracy: number | null; minutes: number }[]
  weakTopics: { name: string; subject: string; wrong: number; accuracy: number }[]
  tasks: { date: string; title: string; kind: Tables<'tasks'>['kind']; subject: string | null; done: boolean; late: boolean }[]
  exams: ReportExam[]
  goals: { kind: ExamKind; target: number; last: number | null; gap: number | null }[]
  pace: Pace | null
  topicsCompleted: string[]
  lessons: { name: string; minutes: number }[]
  wrong: { added: number; reviewed: number; learned: number; due: number }
  reading: { books: { title: string; author: string | null; pages: number; finished: boolean }[]; pages: number }
  rest: { days: number; heavy: boolean }
  notes: { date: string; kind: 'note' | 'meeting'; body: string }[]
  comment: string
  nextWeek: { date: string; title: string; kind: Tables<'tasks'>['kind']; subject: string | null }[]
}

// Haftada 42 saatin üstünde çalışıp hiç dinlenmeyen öğrenci, öğretmen özetindeki tükenmişlik uyarısıyla aynı eşik
const HEAVY_WEEK = 42 * 60

const visibleTo: Record<ReportViewer, Tables<'notes'>['visibility'][]> = {
  student: ['student', 'both'],
  parent: ['parent', 'both'],
  teacher: ['student', 'parent', 'both'],
}

const ratio = (correct: number, total: number) => (total > 0 ? correct / total : null)

export function buildWeeklyReport(raw: Raw, input: ReportInput): WeeklyReport {
  const { student, curriculum, weekStart, viewer } = input
  const weekEnd = shiftDays(weekStart, 6)
  const prevStart = shiftDays(weekStart, -7)
  const today = input.today ?? todayISO()
  const inWeek = (d: string) => d >= weekStart && d <= weekEnd
  const inPrev = (d: string) => d >= prevStart && d < weekStart
  const subjectName = (id: string | null) => (id ? (curriculum.subjectById.get(id)?.name ?? null) : null)
  const colorOf = (id: string | null) => subjectColor(id ? curriculum.subjectById.get(id) : null)

  const sessions = raw.sessions.filter((s) => inWeek(s.studied_on))
  const logs = raw.logs.filter((l) => inWeek(l.solved_on))
  const prevSessions = raw.sessions.filter((s) => inPrev(s.studied_on))
  const prevLogs = raw.logs.filter((l) => inPrev(l.solved_on))
  const sum = <T>(list: T[], pick: (x: T) => number) => list.reduce((n, x) => n + pick(x), 0)

  const days = weekDays(weekStart).map((date) => {
    const dl = logs.filter((l) => l.solved_on === date)
    const correct = sum(dl, (l) => l.correct)
    const wrong = sum(dl, (l) => l.wrong)
    return {
      date,
      label: formatDate(date, 'EEE'),
      minutes: sum(
        sessions.filter((s) => s.studied_on === date),
        (s) => s.minutes,
      ),
      questions: correct + wrong + sum(dl, (l) => l.blank),
      correct,
      wrong,
    }
  })

  const correct = sum(logs, (l) => l.correct)
  const answered = correct + sum(logs, (l) => l.wrong)
  const prevCorrect = sum(prevLogs, (l) => l.correct)
  const prevAnswered = prevCorrect + sum(prevLogs, (l) => l.wrong)
  const weekTasks = raw.tasks.filter((t) => inWeek(t.due_on))

  const bySubject = new Map<string, WeeklyReport['subjects'][number]>()
  const subjectRow = (id: string) => {
    let row = bySubject.get(id)
    if (!row) {
      row = { name: subjectName(id) ?? 'Diğer', color: colorOf(id), minutes: 0, questions: 0, correct: 0, wrong: 0, blank: 0, accuracy: null }
      bySubject.set(id, row)
    }
    return row
  }
  for (const s of sessions) subjectRow(s.subject_id ?? 'diger').minutes += s.minutes
  for (const l of logs) {
    const row = subjectRow(l.subject_id)
    row.correct += l.correct
    row.wrong += l.wrong
    row.blank += l.blank
    row.questions += l.correct + l.wrong + l.blank
  }
  const subjects = [...bySubject.values()]
    .map((r) => ({ ...r, accuracy: ratio(r.correct, r.correct + r.wrong) }))
    .sort((a, b) => b.minutes - a.minutes || b.questions - a.questions)

  const byTopic = new Map<number, WeeklyReport['topics'][number]>()
  const topicRow = (id: number) => {
    let row = byTopic.get(id)
    if (!row) {
      const topic = curriculum.topicById.get(id)
      row = { name: topic?.name ?? 'Konu', subject: subjectName(topic?.subject_id ?? null) ?? '', color: colorOf(topic?.subject_id ?? null), questions: 0, correct: 0, wrong: 0, accuracy: null, minutes: 0 }
      byTopic.set(id, row)
    }
    return row
  }
  for (const s of sessions) if (s.topic_id) topicRow(s.topic_id).minutes += s.minutes
  for (const l of logs) {
    if (!l.topic_id) continue
    const row = topicRow(l.topic_id)
    row.correct += l.correct
    row.wrong += l.wrong
    row.questions += l.correct + l.wrong + l.blank
  }
  const topics = [...byTopic.values()]
    .map((r) => ({ ...r, accuracy: ratio(r.correct, r.correct + r.wrong) }))
    .sort((a, b) => b.questions - a.questions || b.minutes - a.minutes)
  const weakTopics = topics
    .filter((t) => t.wrong > 0 && t.correct + t.wrong >= 5)
    .map((t) => ({ name: t.name, subject: t.subject, wrong: t.wrong, accuracy: t.accuracy ?? 0 }))
    .sort((a, b) => a.accuracy - b.accuracy || b.wrong - a.wrong)
    .slice(0, 5)

  const examNets = (examId: number, kind: ExamKind) => {
    const rows = raw.scores.filter((s) => s.mock_exam_id === examId)
    const nets = Object.fromEntries(rows.map((s) => [s.subject_id, net(s.correct, s.wrong, kind)]))
    return { rows, nets, total: Math.round(Object.values(nets).reduce((a, b) => a + b, 0) * 100) / 100 }
  }
  const sortedExams = [...raw.exams].sort((a, b) => b.taken_on.localeCompare(a.taken_on) || b.id - a.id)
  const exams: ReportExam[] = sortedExams
    .filter((e) => inWeek(e.taken_on))
    .map((e) => {
      const { rows, nets, total } = examNets(e.id, e.kind)
      const prev = sortedExams.find((p) => p.kind === e.kind && (p.taken_on < e.taken_on || (p.taken_on === e.taken_on && p.id < e.id)))
      const score = e.kind === 'LGS' ? lgsScore(nets) : e.kind === 'TYT' ? tytScore(nets) || null : null
      return {
        title: e.title,
        kind: e.kind,
        date: e.taken_on,
        net: total,
        prevNet: prev ? examNets(prev.id, prev.kind).total : null,
        score,
        subjects: rows.map((s) => ({ name: subjectName(s.subject_id) ?? '', color: colorOf(s.subject_id), correct: s.correct, wrong: s.wrong, blank: s.blank, net: nets[s.subject_id] })),
      }
    })
    .reverse()

  const goals = raw.goals.map((g) => {
    const last = sortedExams.find((e) => e.kind === g.kind && e.taken_on <= weekEnd)
    const lastNet = last ? examNets(last.id, last.kind).total : null
    return { kind: g.kind, target: Number(g.target_net), last: lastNet, gap: lastNet == null ? null : Math.round((Number(g.target_net) - lastNet) * 100) / 100 }
  })

  const exam = input.settings?.examDates[student.track === 'lgs' ? 'LGS' : 'YKS']
  const asOf = today < weekEnd ? today : weekEnd
  let pace: Pace | null = null
  if (exam) {
    const paceSubjects = studentSubjects(curriculum.subjects, student)
      .map((s) => ({ id: s.id, name: s.name, topicIds: (curriculum.topicsBySubject.get(s.id) ?? []).map((t) => t.id) }))
      .filter((s) => s.topicIds.length > 0)
    const computed = computePace({ subjects: paceSubjects, progress: raw.progress.filter((p) => p.updated_at.slice(0, 10) <= weekEnd), today: asOf, examDate: exam.date })
    pace = computed.total > 0 && computed.state !== 'past' ? computed : null
  }

  const topicsCompleted = raw.progress
    .filter((p) => p.status === 'done' && inWeek(p.updated_at.slice(0, 10)))
    .map((p) => curriculum.topicById.get(p.topic_id)?.name)
    .filter((n): n is string => Boolean(n))

  const lessons = raw.lessons
    .filter((l) => inWeek(l.updated_at.slice(0, 10)) && l.active_seconds > 0)
    .map((l) => ({ name: curriculum.topicById.get(l.topic_id)?.name ?? 'Konu', minutes: Math.round(l.active_seconds / 60) }))
    .sort((a, b) => b.minutes - a.minutes)

  const day = (ts: string | null) => (ts ? ts.slice(0, 10) : '')
  const wrong = {
    added: raw.wrong.filter((w) => inWeek(day(w.created_at))).length,
    reviewed: raw.wrong.filter((w) => inWeek(day(w.last_reviewed_at))).length,
    learned: raw.wrong.filter((w) => inWeek(day(w.learned_at))).length,
    due: raw.wrong.filter((w) => !w.learned_at && w.next_review_on <= shiftDays(weekEnd, 7) && w.next_review_on > weekEnd).length,
  }

  const weekReading = raw.reading.filter((r) => inWeek(r.read_on))
  const readBooks = [...new Set(weekReading.map((r) => r.book_id))].map((id) => {
    const book = raw.books.find((b) => b.id === id)
    return {
      title: book?.title ?? 'Kitap',
      author: book?.author ?? null,
      pages: sum(
        weekReading.filter((r) => r.book_id === id),
        (r) => r.pages,
      ),
      finished: Boolean(book?.finished_on && inWeek(book.finished_on)),
    }
  })

  const restDays = new Set(weekTasks.filter((t) => t.kind === 'rest' && t.done_at).map((t) => t.due_on)).size
  const minutes = sum(sessions, (s) => s.minutes)

  const notes = raw.notes
    .filter((n) => visibleTo[viewer].includes(n.visibility) && inWeek(n.met_on ?? day(n.created_at)))
    .map((n) => ({ date: n.met_on ?? day(n.created_at), kind: n.kind, body: n.body.trim() }))
    .sort((a, b) => a.date.localeCompare(b.date))

  const nextStart = shiftDays(weekStart, 7)
  const nextEnd = shiftDays(weekStart, 13)

  return {
    student: { name: student.name, label: studentLabel(student), grade: gradeLabel[student.grade] ?? `${student.grade}. sınıf` },
    teacherName: input.teacherName,
    viewer,
    week: { start: weekStart, end: weekEnd, label: `${formatDate(weekStart, 'd MMMM')} - ${formatDate(weekEnd, 'd MMMM yyyy')}` },
    generatedOn: today,
    exam: exam ? { label: student.track === 'lgs' ? 'LGS' : 'YKS', date: exam.date, daysLeft: Math.max(0, daysBetween(asOf, exam.date)), official: exam.official } : null,
    summary: {
      minutes,
      prevMinutes: sum(prevSessions, (s) => s.minutes),
      questions: sum(logs, (l) => l.correct + l.wrong + l.blank),
      prevQuestions: sum(prevLogs, (l) => l.correct + l.wrong + l.blank),
      accuracy: ratio(correct, answered),
      prevAccuracy: ratio(prevCorrect, prevAnswered),
      tasksDone: weekTasks.filter((t) => t.done_at).length,
      tasksTotal: weekTasks.length,
      activeDays: days.filter((d) => d.minutes > 0 || d.questions > 0).length,
    },
    days,
    subjects,
    topics: topics.slice(0, 14),
    weakTopics,
    tasks: weekTasks
      .map((t) => ({ date: t.due_on, title: t.title, kind: t.kind, subject: subjectName(t.subject_id), done: Boolean(t.done_at), late: Boolean(t.done_at && t.done_at.slice(0, 10) > t.due_on) }))
      .sort((a, b) => a.date.localeCompare(b.date)),
    exams,
    goals,
    pace,
    topicsCompleted,
    lessons: lessons.slice(0, 8),
    wrong,
    reading: { books: readBooks, pages: sum(weekReading, (r) => r.pages) },
    rest: { days: restDays, heavy: minutes >= HEAVY_WEEK && restDays === 0 },
    notes,
    comment: input.comment.trim(),
    nextWeek: raw.tasks
      .filter((t) => t.due_on >= nextStart && t.due_on <= nextEnd)
      .map((t) => ({ date: t.due_on, title: t.title, kind: t.kind, subject: subjectName(t.subject_id) }))
      .sort((a, b) => a.date.localeCompare(b.date)),
  }
}

export async function loadWeeklyReport(input: ReportInput): Promise<WeeklyReport> {
  const id = input.student.id
  const weekEnd = shiftDays(input.weekStart, 6)
  const prevStart = shiftDays(input.weekStart, -7)
  const nextEnd = shiftDays(input.weekStart, 13)
  const weekStartTs = `${prevStart}T00:00:00`

  const [sessions, logs, tasks, exams, goals, progress, lessons, wrong, reading, notes] = await Promise.all([
    supabase.from('study_sessions').select('studied_on, minutes, subject_id, topic_id').eq('student_id', id).gte('studied_on', prevStart).lte('studied_on', weekEnd),
    supabase.from('question_logs').select('solved_on, subject_id, topic_id, correct, wrong, blank').eq('student_id', id).gte('solved_on', prevStart).lte('solved_on', weekEnd),
    supabase.from('tasks').select('due_on, title, kind, subject_id, done_at').eq('student_id', id).gte('due_on', input.weekStart).lte('due_on', nextEnd).order('sort'),
    supabase.from('mock_exams').select('id, kind, title, taken_on').eq('student_id', id).lte('taken_on', weekEnd).order('taken_on', { ascending: false }).limit(40),
    supabase.from('student_goals').select('kind, target_net').eq('student_id', id),
    supabase.from('topic_progress').select('topic_id, status, updated_at').eq('student_id', id),
    supabase.from('lesson_progress').select('topic_id, active_seconds, updated_at').eq('student_id', id).gte('updated_at', weekStartTs),
    supabase.from('wrong_questions').select('created_at, last_reviewed_at, learned_at, next_review_on').eq('student_id', id),
    supabase.from('reading_logs').select('book_id, pages, read_on').eq('student_id', id).gte('read_on', input.weekStart).lte('read_on', weekEnd),
    supabase.from('notes').select('body, kind, visibility, met_on, created_at').eq('student_id', id).neq('visibility', 'private').gte('created_at', weekStartTs),
  ])
  const examRows = unwrap(exams)
  const bookIds = [...new Set(unwrap(reading).map((r) => r.book_id))]
  const [scores, books] = await Promise.all([
    examRows.length ? supabase.from('mock_exam_scores').select('*').in('mock_exam_id', examRows.map((e) => e.id)) : Promise.resolve({ data: [], error: null }),
    bookIds.length ? supabase.from('books').select('id, title, author, total_pages, finished_on').in('id', bookIds) : Promise.resolve({ data: [], error: null }),
  ])

  return buildWeeklyReport(
    {
      sessions: unwrap(sessions),
      logs: unwrap(logs),
      tasks: unwrap(tasks),
      exams: examRows,
      scores: unwrap(scores),
      goals: unwrap(goals),
      progress: unwrap(progress),
      lessons: unwrap(lessons),
      wrong: unwrap(wrong),
      reading: unwrap(reading),
      books: unwrap(books),
      // Notlar tablosunda RLS zaten rolün görebileceğini süzer, burada ayrıca rol bazında süzülür
      notes: unwrap(notes),
    },
    input,
  )
}

