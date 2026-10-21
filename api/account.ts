import { randomBytes } from 'node:crypto'
import { z } from 'zod'
import { PASSWORD_MAX, passwordIssueMessage, passwordProblem, USERNAME_EMAIL_DOMAIN, usernameToEmail } from '../shared/accounts.js'
import { admin, callerId, dbMessage, handle, HttpError, json, readJson } from './_lib/server.js'

const schema = z.discriminatedUnion('action', [
  z.object({ action: z.literal('reset-password'), userId: z.uuid(), password: z.string().max(PASSWORD_MAX) }),
  z.object({ action: z.literal('delete-student'), studentId: z.uuid() }),
  z.object({ action: z.literal('delete-teacher'), teacherId: z.uuid() }),
  z.object({ action: z.literal('delete-self') }),
  z.object({ action: z.literal('create-test') }),
  z.object({ action: z.literal('test-login'), userId: z.uuid() }),
  z.object({ action: z.literal('delete-test'), teacherId: z.uuid() }),
])

type Profile = { id: string; role: 'teacher' | 'student' | 'parent'; is_admin: boolean; status: string; is_test: boolean }

async function profile(id: string) {
  const { data } = await admin().from('profiles').select('id, role, is_admin, status, is_test').eq('id', id).maybeSingle()
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


const MAX_TEST_ENVIRONMENTS = 3

async function createTestEnvironment() {
  const { count } = await admin().from('profiles').select('id', { count: 'exact', head: true }).eq('role', 'teacher').eq('is_test', true)
  if ((count ?? 0) >= MAX_TEST_ENVIRONMENTS) throw new HttpError(409, 'En fazla 3 test ortamı olabilir. Önce birini silin')

  const suffix = randomBytes(3).toString('hex')
  const emails = {
    teacher: `test.ogretmen.${suffix}@${USERNAME_EMAIL_DOMAIN}`,
    lgs: usernameToEmail(`test.lgs.${suffix}`),
    yks: usernameToEmail(`test.yks.${suffix}`),
    parent: usernameToEmail(`test.veli.${suffix}`),
  }
  const ids: string[] = []
  try {
    const created: Record<string, string> = {}
    for (const [key, email] of Object.entries(emails)) {
      const { data, error } = await admin().auth.admin.createUser({ email, password: randomBytes(24).toString('base64url'), email_confirm: true })
      if (error || !data.user) throw new HttpError(500, 'Test hesapları oluşturulamadı')
      ids.push(data.user.id)
      created[key] = data.user.id
    }
    const { error } = await admin().rpc('create_test_environment', {
      p_teacher: created.teacher,
      p_lgs: created.lgs,
      p_yks: created.yks,
      p_parent: created.parent,
      p_suffix: suffix,
    })
    if (error) throw new HttpError(500, dbMessage(error))
  } catch (err) {
    for (const id of ids) await admin().auth.admin.deleteUser(id)
    throw err
  }
}

async function testEnvironmentUsers(teacherId: string) {
  const { data: students } = await admin().from('students').select('id').eq('teacher_id', teacherId)
  const studentIds = (students ?? []).map((s) => s.id as string)
  const { data: links } = studentIds.length ? await admin().from('parent_links').select('parent_id').in('student_id', studentIds) : { data: [] }
  return [...studentIds, ...new Set((links ?? []).map((l) => l.parent_id as string)), teacherId]
}

export const POST = handle(async (request) => {
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Bilgileri kontrol edip tekrar deneyin')
  const input = parsed.data
  const caller = await profile(await callerId(request))
  if (!caller) throw new HttpError(403, 'Hesap bulunamadı')

  if (input.action === 'delete-self') {
    if (caller.role === 'teacher' && (await hasStudents(caller.id))) {
      throw new HttpError(409, 'Hesabınızı silmeden önce öğrencilerinizi silmeniz gerekiyor')
    }
    if (caller.role === 'student') await deleteStudent(caller.id)
    else await deleteUser(caller.id)
    return json({ ok: true })
  }

  if (input.action === 'create-test' || input.action === 'test-login' || input.action === 'delete-test') {
    if (!caller.is_admin || caller.status !== 'active') throw new HttpError(403, 'Bu işlem için yetkiniz yok')
    if (input.action === 'create-test') {
      await createTestEnvironment()
      return json({ ok: true })
    }
    if (input.action === 'test-login') {
      const target = await profile(input.userId)
      if (!target?.is_test) throw new HttpError(403, 'Yalnızca test hesapları açılabilir')
      const { data: user } = await admin().auth.admin.getUserById(target.id)
      if (!user.user?.email) throw new HttpError(404, 'Hesap bulunamadı')
      const { data, error } = await admin().auth.admin.generateLink({ type: 'magiclink', email: user.user.email })
      if (error || !data.properties?.hashed_token) throw new HttpError(500, 'Giriş bağlantısı oluşturulamadı')
      return json({ tokenHash: data.properties.hashed_token })
    }
    const teacher = await profile(input.teacherId)
    if (!teacher?.is_test || teacher.role !== 'teacher') throw new HttpError(403, 'Yalnızca test hesapları silinebilir')
    for (const id of await testEnvironmentUsers(teacher.id)) {
      const target = await profile(id)
      if (target?.is_test) await deleteUser(id)
    }
    return json({ ok: true })
  }

  const targetId =
    input.action === 'reset-password' ? input.userId : input.action === 'delete-student' ? input.studentId : input.teacherId
  const target = await profile(targetId)
  if (!target || !(await canManage(caller, target))) throw new HttpError(403, 'Bu işlem için yetkiniz yok')

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
  if (await hasStudents(target.id)) throw new HttpError(409, 'Öğrencisi olan öğretmen silinemez, hesabı durdurabilirsiniz')
  await deleteUser(target.id)
  return json({ ok: true })
})
