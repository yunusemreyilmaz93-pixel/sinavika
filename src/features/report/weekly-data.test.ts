import { describe, expect, it } from 'vitest'
import type { Curriculum } from '@/lib/data'
import type { Subject, Topic } from '@/lib/exam'
import { buildWeeklyReport, type ReportInput } from './weekly-data'

const subjects = [
  { id: 'lgs-mat', exam: 'LGS', name: 'Matematik', short: 'Mat', question_count: 20, fields: null, sort: 1, color: 'sea' },
  { id: 'lgs-tr', exam: 'LGS', name: 'Türkçe', short: 'Türkçe', question_count: 20, fields: null, sort: 2, color: 'coral' },
] as unknown as Subject[]
const topics = [
  { id: 1, subject_id: 'lgs-mat', name: 'Çarpanlar', sort: 1 },
  { id: 2, subject_id: 'lgs-mat', name: 'Üslü İfadeler', sort: 2 },
  { id: 3, subject_id: 'lgs-tr', name: 'Paragraf', sort: 1 },
] as unknown as Topic[]
const curriculum: Curriculum = {
  subjects,
  topics,
  subjectById: new Map(subjects.map((s) => [s.id, s])),
  topicById: new Map(topics.map((t) => [t.id, t])),
  topicsBySubject: new Map([
    ['lgs-mat', topics.slice(0, 2)],
    ['lgs-tr', topics.slice(2)],
  ]),
}

const input = (viewer: ReportInput['viewer'] = 'parent'): ReportInput => ({
  student: { id: 's1', name: 'Elif Yıldız', track: 'lgs', grade: 8, field: null, teacher_id: 't1' },
  teacherName: 'Ayşe Öğretmen',
  weekStart: '2026-11-09',
  viewer,
  comment: '  İyi bir hafta.  ',
  curriculum,
  settings: { studentCapacity: 10, teacherCapacity: 100, applicationsOpen: true, examDates: { LGS: { date: '2027-06-12', official: false }, YKS: { date: '2027-06-19', official: false } } },
  today: '2026-11-14',
})

const empty = { sessions: [], logs: [], tasks: [], exams: [], scores: [], goals: [], progress: [], lessons: [], wrong: [], reading: [], books: [], notes: [] }

describe('haftalık rapor', () => {
  it('haftayı geçen haftayla karşılaştırır ve gün gün dağıtır', () => {
    const r = buildWeeklyReport(
      {
        ...empty,
        sessions: [
          { studied_on: '2026-11-10', minutes: 90, subject_id: 'lgs-mat', topic_id: 1 },
          { studied_on: '2026-11-12', minutes: 30, subject_id: 'lgs-tr', topic_id: 3 },
          { studied_on: '2026-11-03', minutes: 60, subject_id: 'lgs-mat', topic_id: null },
        ],
        logs: [
          { solved_on: '2026-11-10', subject_id: 'lgs-mat', topic_id: 1, correct: 6, wrong: 4, blank: 0 },
          { solved_on: '2026-11-12', subject_id: 'lgs-tr', topic_id: 3, correct: 9, wrong: 1, blank: 2 },
        ],
      },
      input(),
    )
    expect(r.summary.minutes).toBe(120)
    expect(r.summary.prevMinutes).toBe(60)
    expect(r.summary.questions).toBe(22)
    expect(r.summary.accuracy).toBe(0.75)
    expect(r.summary.activeDays).toBe(2)
    expect(r.days[1]).toMatchObject({ date: '2026-11-10', minutes: 90, questions: 10 })
    expect(r.subjects[0]).toMatchObject({ name: 'Matematik', minutes: 90, correct: 6, wrong: 4 })
    expect(r.weakTopics.map((t) => t.name)).toEqual(['Çarpanlar', 'Paragraf'])
    expect(r.comment).toBe('İyi bir hafta.')
  })

  it('denemeyi önceki denemeyle kıyaslar ve LGS puanını hesaplar', () => {
    const r = buildWeeklyReport(
      {
        ...empty,
        exams: [
          { id: 1, kind: 'LGS', title: 'Eski', taken_on: '2026-11-01' },
          { id: 2, kind: 'LGS', title: 'Yeni', taken_on: '2026-11-11' },
        ],
        scores: [
          { mock_exam_id: 1, subject_id: 'lgs-mat', correct: 10, wrong: 3, blank: 7 },
          { mock_exam_id: 2, subject_id: 'lgs-mat', correct: 15, wrong: 3, blank: 2 },
        ],
        goals: [{ kind: 'LGS', target_net: 20 }],
      },
      input(),
    )
    expect(r.exams).toHaveLength(1)
    expect(r.exams[0]).toMatchObject({ title: 'Yeni', net: 14, prevNet: 9 })
    expect(r.exams[0].score).toBeGreaterThan(0)
    expect(r.goals[0]).toMatchObject({ target: 20, last: 14, gap: 6 })
  })

  it('notları rapor sahibinin görebileceklerine göre süzer, özel not hiç girmez', () => {
    const notes = [
      { body: 'Veliye', kind: 'note' as const, visibility: 'parent' as const, met_on: null, created_at: '2026-11-10T10:00:00Z' },
      { body: 'Öğrenciye', kind: 'note' as const, visibility: 'student' as const, met_on: null, created_at: '2026-11-10T10:00:00Z' },
      { body: 'Özel', kind: 'note' as const, visibility: 'private' as const, met_on: null, created_at: '2026-11-10T10:00:00Z' },
      { body: 'Görüşme', kind: 'meeting' as const, visibility: 'both' as const, met_on: '2026-11-13', created_at: '2026-11-13T10:00:00Z' },
    ]
    expect(buildWeeklyReport({ ...empty, notes }, input('parent')).notes.map((n) => n.body)).toEqual(['Veliye', 'Görüşme'])
    expect(buildWeeklyReport({ ...empty, notes }, input('student')).notes.map((n) => n.body)).toEqual(['Öğrenciye', 'Görüşme'])
    expect(buildWeeklyReport({ ...empty, notes }, input('teacher')).notes.map((n) => n.body)).toEqual(['Veliye', 'Öğrenciye', 'Görüşme'])
  })

  it('görevleri zamanında, geç ve yapılmadı diye ayırır, gelecek haftayı ayrı listeler', () => {
    const r = buildWeeklyReport(
      {
        ...empty,
        tasks: [
          { due_on: '2026-11-10', title: 'A', kind: 'questions', subject_id: 'lgs-mat', done_at: '2026-11-10T18:00:00Z' },
          { due_on: '2026-11-10', title: 'B', kind: 'study', subject_id: null, done_at: '2026-11-12T18:00:00Z' },
          { due_on: '2026-11-11', title: 'C', kind: 'rest', subject_id: null, done_at: null },
          { due_on: '2026-11-17', title: 'D', kind: 'reading', subject_id: null, done_at: null },
        ],
      },
      input(),
    )
    expect(r.tasks.map((t) => [t.title, t.done, t.late])).toEqual([
      ['A', true, false],
      ['B', true, true],
      ['C', false, false],
    ])
    expect(r.summary).toMatchObject({ tasksDone: 2, tasksTotal: 3 })
    expect(r.nextWeek.map((t) => t.title)).toEqual(['D'])
  })
})
