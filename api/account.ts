import { z } from 'zod'
import { PASSWORD_MAX, passwordIssueMessage, passwordProblem } from '../shared/accounts.js'
import { admin, callerId, handle, HttpError, json, readJson } from './_lib/server.js'

const schema = z.discriminatedUnion('action', [
  z.object({ action: z.literal('reset-password'), userId: z.uuid(), password: z.string().max(PASSWORD_MAX) }),
  z.object({ action: z.literal('delete-student'), studentId: z.uuid() }),
  z.object({ action: z.literal('delete-teacher'), teacherId: z.uuid() }),
  z.object({ action: z.literal('delete-self') }),
])

type Profile = { id: string; role: 'teacher' | 'student' | 'parent'; is_admin: boolean; status: string }

async function profile(id: string) {
  const { data } = await admin().from('profiles').select('id, role, is_admin, status').eq('id', id).maybeSingle()
  return data as Profile | null
}

async function teacherOf(studentId: string) {
  const { data } = await admin().from('students').select('teacher_id').eq('id', studentId).maybeSingle()
  return (data?.teacher_id as string | undefined) ?? null
}

async function canManage(caller: Profile, target: Profile) {
  if (caller.status !== 'active' || caller.role !== 'teacher') return false
  if (target.role === 'teacher') return caller.is_admin && caller.id !== target.id
  if (target.role === 'student') return (await teacherOf(target.id)) === caller.id
  const { data } = await admin().from('parent_links').select('student_id').eq('parent_id', target.id)
  for (const link of data ?? []) {
    if ((await teacherOf(link.student_id)) === caller.id) return true
  }
  return false
}

async function deleteUser(id: string) {
  const { error } = await admin().auth.admin.deleteUser(id)
  if (error) throw new HttpError(500, 'Hesap silinemedi')
}

async function deleteOrphanParents(studentId: string) {
  const { data } = await admin().from('parent_links').select('parent_id').eq('student_id', studentId)
  const orphans: string[] = []
  for (const { parent_id } of data ?? []) {
    const { count } = await admin()
      .from('parent_links')
      .select('student_id', { count: 'exact', head: true })
      .eq('parent_id', parent_id)
    if (count === 1) orphans.push(parent_id)
  }
  return orphans
}

async function deleteStudent(studentId: string) {
  const orphans = await deleteOrphanParents(studentId)
  await deleteUser(studentId)
  for (const id of orphans) await deleteUser(id)
}

async function hasStudents(teacherId: string) {
  const { count } = await admin()
    .from('students')
    .select('id', { count: 'exact', head: true })
    .eq('teacher_id', teacherId)
  return Boolean(count)
}

export const POST = handle(async (request) => {
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Bilgileri kontrol edip tekrar dene')
  const input = parsed.data
  const caller = await profile(await callerId(request))
  if (!caller) throw new HttpError(403, 'Hesabın bulunamadı')

  if (input.action === 'delete-self') {
    if (caller.role === 'teacher' && (await hasStudents(caller.id))) {
      throw new HttpError(409, 'Hesabını silmeden önce öğrencilerini silmen gerekiyor')
    }
    if (caller.role === 'student') await deleteStudent(caller.id)
    else await deleteUser(caller.id)
    return json({ ok: true })
  }

  const targetId =
    input.action === 'reset-password' ? input.userId : input.action === 'delete-student' ? input.studentId : input.teacherId
  const target = await profile(targetId)
  if (!target || !(await canManage(caller, target))) throw new HttpError(403, 'Bu işlem için yetkin yok')

  if (input.action === 'reset-password') {
    const issue = passwordIssueMessage(input.password)
    if (issue) throw new HttpError(400, issue)
    const { error } = await admin().auth.admin.updateUserById(target.id, { password: input.password })
    if (error) throw new HttpError(400, passwordProblem(error))
    return json({ ok: true })
  }

  if (input.action === 'delete-student') {
    if (target.role !== 'student') throw new HttpError(400, 'Bu hesap öğrenci değil')
    await deleteStudent(target.id)
    return json({ ok: true })
  }

  if (target.role !== 'teacher') throw new HttpError(400, 'Bu hesap öğretmen değil')
  if (await hasStudents(target.id)) throw new HttpError(409, 'Öğrencisi olan öğretmen silinemez, hesabını durdurabilirsin')
  await deleteUser(target.id)
  return json({ ok: true })
})
