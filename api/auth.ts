import { z } from 'zod'
import { PASSWORD_MAX, passwordIssueMessage, passwordProblem, USERNAME_PATTERN, usernameToEmail } from '../shared/accounts.js'
import { admin, adminEmail, dbMessage, handle, HttpError, json, readJson } from './_lib/server.js'

const teacherSchema = z.object({
  action: z.literal('register-teacher'),
  fullName: z.string().trim().min(2).max(80),
  email: z.email().max(160),
  password: z.string().max(PASSWORD_MAX),
  school: z.string().trim().max(120).optional().default(''),
  branch: z.string().trim().max(60).optional().default(''),
  note: z.string().trim().max(600).optional().default(''),
  consent: z.literal(true),
  website: z.string().max(0).optional(),
})

const joinSchema = z.object({
  action: z.literal('join'),
  code: z.string().trim().toUpperCase().regex(/^[A-Z0-9]{8}$/),
  fullName: z.string().trim().min(2).max(80),
  username: z.string().trim().toLowerCase().regex(USERNAME_PATTERN),
  password: z.string().max(PASSWORD_MAX),
  consent: z.literal(true),
})

const schema = z.discriminatedUnion('action', [teacherSchema, joinSchema])

async function createUser(email: string, password: string, fullName: string) {
  const { data, error } = await admin().auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: { full_name: fullName },
  })
  if (error || !data.user) {
    const code = (error as { code?: string } | null)?.code ?? ''
    const message = error?.message ?? ''
    if (code === 'weak_password' || /password/i.test(message)) throw new HttpError(400, passwordProblem(error))
    if (code === 'email_exists' || code === 'user_already_exists' || /already/i.test(message)) {
      throw new HttpError(409, 'Bu bilgilerle kayıtlı bir hesap zaten var')
    }
    await logServerError('Hesap oluşturulamadı', `${code} ${message}`)
    throw new HttpError(500, 'Hesap oluşturulamadı. Biraz bekleyip tekrar dene')
  }
  return data.user.id
}

async function logServerError(message: string, detail: string) {
  try {
    await admin().from('client_errors').insert({ message: `Sunucu: ${message}`, shown: message, path: '/api/auth', detail: detail.slice(0, 2000) })
  } catch {
    return
  }
}

function checkPassword(password: string) {
  const issue = passwordIssueMessage(password)
  if (issue) throw new HttpError(400, issue)
}

async function registerTeacher(input: z.infer<typeof teacherSchema>) {
  checkPassword(input.password)
  const email = input.email.toLowerCase()
  const isAdmin = email === adminEmail()
  const id = await createUser(email, input.password, input.fullName)
  const { data, error } = await admin().rpc('register_teacher', {
    p_user: id,
    p_full_name: input.fullName,
    p_email: email,
    p_school: input.school,
    p_branch: input.branch,
    p_note: input.note,
    p_admin: isAdmin,
  })
  if (error) {
    await admin().auth.admin.deleteUser(id)
    throw new HttpError(400, dbMessage(error))
  }
  return json({ status: data })
}

async function join(input: z.infer<typeof joinSchema>) {
  checkPassword(input.password)
  const { data: preview } = await admin().rpc('preview_invite', { p_code: input.code })
  if (!preview?.length) throw new HttpError(404, 'Davet kodu geçersiz veya süresi dolmuş')

  const { count } = await admin()
    .from('profiles')
    .select('id', { count: 'exact', head: true })
    .eq('username', input.username)
  if (count) throw new HttpError(409, 'Bu kullanıcı adı alınmış, başka bir tane dene')

  const id = await createUser(usernameToEmail(input.username), input.password, input.fullName)
  const { data, error } = await admin().rpc('redeem_invite', {
    p_code: input.code,
    p_user: id,
    p_full_name: input.fullName,
    p_username: input.username,
  })
  if (error) {
    await admin().auth.admin.deleteUser(id)
    if (!/[çğıöşüÇĞİÖŞÜ]/.test(error.message ?? '')) await logServerError('Davetle katılım başarısız', `${error.code ?? ''} ${error.message}`)
    throw new HttpError(400, dbMessage(error))
  }
  return json({ role: data })
}

export const POST = handle(async (request) => {
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Bilgileri kontrol edip tekrar dene')
  return parsed.data.action === 'join' ? join(parsed.data) : registerTeacher(parsed.data)
})
