import type { SupabaseClient } from '@supabase/supabase-js'
import { z } from 'zod'
import type { Privacy } from './privacy.js'
import { fold } from './privacy.js'
import type { ToolSpec } from './providers.js'

export type StudentRow = { id: string; track: 'lgs' | 'yks'; grade: number; field: string | null }
export type SubjectRow = { id: string; exam: string; name: string; fields: string[] | null; sort: number }
export type TopicRow = { id: number; subject_id: string; name: string }

export type ProposalTask = {
  title: string
  kind: 'study' | 'questions' | 'reading' | 'video' | 'review' | 'other'
  subject_id: string | null
  topic_id: number | null
  due_on: string
  target_questions: number | null
  target_minutes: number | null
  note: string | null
  subjectName: string | null
  topicName: string | null
}
export type Proposal = { studentId: string; studentName: string; tasks: ProposalTask[]; warnings: string[] }

export type ToolContext = {
  db: SupabaseClient
  privacy: Privacy
  students: StudentRow[]
  names: Map<string, string>
  today: string
  proposals: Proposal[]
  curriculum: () => Promise<{ subjects: SubjectRow[]; topics: TopicRow[] }>
}

type Kind = ProposalTask['kind']
const KIND_TR: Record<string, Kind> = {
  calisma: 'study',
  konu: 'study',
  soru: 'questions',
  okuma: 'reading',
  video: 'video',
  tekrar: 'review',
  diger: 'other',
}
const KIND_LABEL = { study: 'konu çalışması', questions: 'soru çözümü', reading: 'okuma', video: 'video', review: 'tekrar', other: 'diğer' } as const

export const toolSpecs: ToolSpec[] = [
  {
    name: 'ogrencileri_listele',
    description: 'Öğretmenin aktif öğrencilerini takma kimlikle listeler. Adı vermez.',
    schema: { type: 'object', properties: {}, additionalProperties: false },
  },
  {
    name: 'ogrenci_ozeti',
    description:
      'Bir öğrencinin son durumu: bu haftanın görevleri, geciken görevler, son 7 gün çalışma ve soru, son iki deneme neti, tekrar gereken konular, açık görevler ve görev verilebilecek ders adları.',
    schema: {
      type: 'object',
      properties: { ogrenci: { type: 'string', description: 'Takma kimlik, örneğin OGR-123456' } },
      required: ['ogrenci'],
      additionalProperties: false,
    },
  },
  {
    name: 'konulari_listele',
    description: 'Bir dersin müfredattaki konu adlarını listeler. Görev önerirken konu adı seçmek için kullan.',
    schema: {
      type: 'object',
      properties: { ders: { type: 'string' }, sinav: { type: 'string', description: 'LGS, TYT, AYT ya da YDT. Ders birden çok sınavda varsa belirt' } },
      required: ['ders'],
      additionalProperties: false,
    },
  },
  {
    name: 'gorev_onerisi_hazirla',
    description:
      'Bir öğrenci için görev taslağı hazırlar. Hiçbir şey kaydetmez. Öğretmen taslağı görüp onaylarsa görevler eklenir. En fazla 10 görev.',
    schema: {
      type: 'object',
      properties: {
        ogrenci: { type: 'string', description: 'Takma kimlik' },
        gorevler: {
          type: 'array',
          maxItems: 10,
          items: {
            type: 'object',
            properties: {
              baslik: { type: 'string', description: 'En fazla 140 karakter' },
              tur: { type: 'string', enum: ['calisma', 'soru', 'okuma', 'video', 'tekrar', 'diger'] },
              ders: { type: 'string' },
              sinav: { type: 'string' },
              konu: { type: 'string' },
              tarih: { type: 'string', description: 'YYYY-AA-GG, bugünden itibaren 90 gün içinde' },
              hedef_soru: { type: 'integer' },
              hedef_dakika: { type: 'integer' },
              not: { type: 'string' },
            },
            required: ['baslik', 'tur', 'tarih'],
          },
        },
      },
      required: ['ogrenci', 'gorevler'],
      additionalProperties: false,
    },
  },
]

const daysBetween = (from: string, to: string) => Math.round((Date.parse(to) - Date.parse(from)) / 86_400_000)
const addDays = (iso: string, n: number) => new Date(Date.parse(iso) + n * 86_400_000).toISOString().slice(0, 10)

function examsOf(student: StudentRow) {
  if (student.track === 'lgs') return ['LGS']
  return student.field === 'dil' ? ['TYT', 'YDT'] : ['TYT', 'AYT']
}

function subjectsOf(student: StudentRow, subjects: SubjectRow[]) {
  const exams = examsOf(student)
  return subjects
    .filter((s) => exams.includes(s.exam) && (!s.fields || !student.field || s.fields.includes(student.field)))
    .sort((a, b) => exams.indexOf(a.exam) - exams.indexOf(b.exam) || a.sort - b.sort)
}

function findSubject(candidates: SubjectRow[], ders: string, sinav?: string) {
  const q = fold(ders.trim())
  const exact = candidates.filter((s) => fold(s.name) === q)
  const pool = exact.length ? exact : candidates.filter((s) => fold(s.name).includes(q) || q.includes(fold(s.name)))
  const byExam = sinav ? pool.filter((s) => s.exam.toLowerCase() === sinav.trim().toLowerCase()) : []
  return (byExam.length ? byExam : pool)[0] ?? null
}

function findTopic(topics: TopicRow[], subjectId: string, konu: string) {
  const q = fold(konu.trim())
  const own = topics.filter((t) => t.subject_id === subjectId)
  return own.find((t) => fold(t.name) === q) ?? own.find((t) => fold(t.name).includes(q) || q.includes(fold(t.name))) ?? null
}

function resolveStudent(ctx: ToolContext, token: unknown) {
  if (typeof token !== 'string') return null
  const person = ctx.privacy.personOf(token)
  if (!person || person.kind !== 'student') return null
  return ctx.students.find((s) => s.id === person.id) ?? null
}

const unknownStudent = { hata: 'Bu takma kimlikle bir öğrenci bulunamadı. ogrencileri_listele ile bak' }

const taskInput = z.object({
  baslik: z.string().trim().min(1).max(140),
  tur: z.string().transform((v) => KIND_TR[fold(v)] ?? 'study'),
  ders: z.string().trim().max(80).optional(),
  sinav: z.string().trim().max(10).optional(),
  konu: z.string().trim().max(120).optional(),
  tarih: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  hedef_soru: z.number().int().min(1).max(2000).optional(),
  hedef_dakika: z.number().int().min(1).max(600).optional(),
  not: z.string().trim().max(500).optional(),
})
const proposalInput = z.object({ ogrenci: z.string(), gorevler: z.array(taskInput).min(1).max(10) })

async function summary(ctx: ToolContext, student: StudentRow) {
  const { subjects, topics } = await ctx.curriculum()
  const [overview, progress, open] = await Promise.all([
    ctx.db.rpc('teacher_overview'),
    ctx.db.from('topic_progress').select('topic_id, status').eq('student_id', student.id),
    ctx.db.from('tasks').select('subject_id, topic_id, due_on, kind').eq('student_id', student.id).is('done_at', null).order('due_on').limit(12),
  ])
  const row = ((overview.data ?? []) as Record<string, unknown>[]).find((r) => r.id === student.id)
  const topicName = new Map(topics.map((t) => [t.id, t.name]))
  const subjectName = new Map(subjects.map((s) => [s.id, s.name]))
  const listBy = (status: string) =>
    (progress.data ?? []).filter((p) => p.status === status).map((p) => topicName.get(p.topic_id)).filter(Boolean).slice(0, 8)
  const last = row?.last_activity_on as string | null | undefined
  return {
    sinif: student.grade,
    sinav: student.track === 'lgs' ? 'LGS' : 'YKS',
    alan: student.field,
    son_7_gun_calisma_dakika: row?.minutes_7d ?? 0,
    son_7_gun_cozulen_soru: row?.questions_7d ?? 0,
    bu_hafta_gorev: { toplam: row?.tasks_week ?? 0, tamamlanan: row?.tasks_week_done ?? 0 },
    geciken_gorev: row?.tasks_overdue ?? 0,
    son_kayit_gun_once: last ? daysBetween(last, ctx.today) : null,
    son_deneme: row?.last_net == null ? null : { tur: row.last_exam_kind, net: Number(row.last_net), onceki_net: row.prev_net == null ? null : Number(row.prev_net) },
    tekrar_gereken_konular: listBy('review'),
    ogrenilen_konular: listBy('learning'),
    acik_gorevler: (open.data ?? []).map((t) => ({
      ders: t.subject_id ? subjectName.get(t.subject_id) ?? null : null,
      konu: t.topic_id ? topicName.get(t.topic_id) ?? null : null,
      tarih: t.due_on,
      tur: KIND_LABEL[t.kind as keyof typeof KIND_LABEL] ?? t.kind,
    })),
    gorev_verilebilecek_dersler: subjectsOf(student, subjects).map((s) => `${s.name} (${s.exam})`),
  }
}

export async function runTool(ctx: ToolContext, name: string, input: Record<string, unknown>): Promise<unknown> {
  if (name === 'ogrencileri_listele') {
    return ctx.students.map((s) => ({ ogrenci: ctx.privacy.tokenOf(s.id), sinif: s.grade, sinav: s.track === 'lgs' ? 'LGS' : 'YKS', alan: s.field }))
  }
  if (name === 'ogrenci_ozeti') {
    const student = resolveStudent(ctx, input.ogrenci)
    return student ? summary(ctx, student) : unknownStudent
  }
  if (name === 'konulari_listele') {
    const { subjects, topics } = await ctx.curriculum()
    const ders = typeof input.ders === 'string' ? input.ders : ''
    const subject = findSubject(subjects, ders, typeof input.sinav === 'string' ? input.sinav : undefined)
    if (!subject) return { hata: 'Bu adla bir ders bulunamadı' }
    return { ders: subject.name, sinav: subject.exam, konular: topics.filter((t) => t.subject_id === subject.id).map((t) => t.name) }
  }
  if (name === 'gorev_onerisi_hazirla') {
    const parsed = proposalInput.safeParse(input)
    if (!parsed.success) return { hata: `Eksik ya da hatalı alan: ${parsed.error.issues[0]?.path.join('.') || 'girdi'}` }
    const student = resolveStudent(ctx, parsed.data.ogrenci)
    if (!student) return unknownStudent
    const { subjects, topics } = await ctx.curriculum()
    const candidates = subjectsOf(student, subjects)
    const warnings: string[] = []
    const tasks: ProposalTask[] = []
    const limit = addDays(ctx.today, 90)
    for (const t of parsed.data.gorevler) {
      if (t.tarih < ctx.today || t.tarih > limit) {
        warnings.push(`"${t.baslik}" atlandı, tarih bugünden itibaren 90 gün içinde olmalı`)
        continue
      }
      const subject = t.ders ? findSubject(candidates, t.ders, t.sinav) : null
      if (t.ders && !subject) warnings.push(`"${t.ders}" dersi bu öğrencinin müfredatında bulunamadı, derssiz eklenecek`)
      const topic = subject && t.konu ? findTopic(topics, subject.id, t.konu) : null
      if (subject && t.konu && !topic) warnings.push(`"${t.konu}" konusu bulunamadı, konusuz eklenecek`)
      tasks.push({
        title: ctx.privacy.restore(t.baslik),
        kind: t.tur as ProposalTask['kind'],
        subject_id: subject?.id ?? null,
        topic_id: topic?.id ?? null,
        due_on: t.tarih,
        target_questions: t.hedef_soru ?? null,
        target_minutes: t.hedef_dakika ?? null,
        note: t.not ? ctx.privacy.restore(t.not) : null,
        subjectName: subject?.name ?? null,
        topicName: topic?.name ?? null,
      })
    }
    if (!tasks.length) return { hata: 'Geçerli görev kalmadı', uyarilar: warnings }
    ctx.proposals.push({ studentId: student.id, studentName: ctx.names.get(student.id) ?? '', tasks, warnings })
    return { durum: 'Taslak hazır. Hiçbir görev eklenmedi, öğretmen onaylayınca eklenecek.', gorev_sayisi: tasks.length, uyarilar: warnings }
  }
  return { hata: 'Bilinmeyen araç' }
}
