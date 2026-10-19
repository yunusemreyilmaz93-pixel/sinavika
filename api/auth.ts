import { z } from 'zod'
import { PASSWORD_MIN, USERNAME_PATTERN, usernameToEmail } from '../shared/accounts.ts'
import { admin, adminEmail, dbMessage, handle, HttpError, json, readJson } from './_lib/server.ts'

const teacherSchema = z.object({
  action: z.literal('register-teacher'),
  fullName: z.string().trim().min(2).max(80),
  email: z.email().max(160),
  password: z.string().min(PASSWORD_MIN).max(72),
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
  password: z.string().min(PASSWORD_MIN).max(72),
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
    if (error?.status === 422 || /already/i.test(error?.message ?? '')) {
      throw new HttpError(409, 'Bu bilgilerle kayıtlı bir hesap zaten var')
    }
    if (/password/i.test(error?.message ?? '')) {
      throw new HttpError(400, 'Şifre çok zayıf, daha uzun ve tahmin edilmesi zor bir şifre seç')
    }
    throw new HttpError(500, 'Hesap oluşturulamadı')
  }
  return data.user.id
}

async function registerTeacher(input: z.infer<typeof teacherSchema>) {
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
    throw new HttpError(400, dbMessage(error))
  }
  return json({ role: data })
}

export const POST = handle(async (request) => {
  const parsed = schema.safeParse(await readJson(request))
  if (!parsed.success) throw new HttpError(400, 'Bilgileri kontrol edip tekrar dene')
  return parsed.data.action === 'join' ? join(parsed.data) : registerTeacher(parsed.data)
})
