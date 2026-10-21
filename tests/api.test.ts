// @vitest-environment node
import { afterEach, describe, expect, it, vi } from 'vitest'

const keys = [
  'SUPABASE_URL',
  'NEXT_PUBLIC_SUPABASE_URL',
  'SUPABASE_SERVICE_ROLE_KEY',
  'SUPABASE_SECRET_KEY',
] as const

function withoutSupabaseEnv() {
  for (const k of keys) vi.stubEnv(k, '')
}

function post(body: unknown) {
  return new Request('http://localhost/api/auth', {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: typeof body === 'string' ? body : JSON.stringify(body),
  })
}

afterEach(() => {
  vi.unstubAllEnvs()
})

describe('api/auth', () => {
  it('bozuk isteğe JSON hata mesajıyla cevap verir', async () => {
    const { POST } = await import('../api/auth.ts')
    const res = await POST(post('{bozuk'))
    expect(res.status).toBe(400)
    expect(await res.json()).toEqual({ error: 'Geçersiz istek' })
  })

  it('eksik alanları reddeder', async () => {
    const { POST } = await import('../api/auth.ts')
    const res = await POST(post({ action: 'join', code: 'KISA' }))
    expect(res.status).toBe(400)
    expect(((await res.json()) as { error: string }).error).toBe('Bilgileri kontrol edip tekrar deneyin')
  })

  it('sunucu anahtarı yoksa bunu açıkça söyler', async () => {
    withoutSupabaseEnv()
    vi.resetModules()
    const { POST } = await import('../api/auth.ts')
    const res = await POST(
      post({
        action: 'join',
        code: 'ABCD1234',
        fullName: 'Deneme Öğrenci',
        username: 'deneme.ogrenci',
        password: 'Uzun-bir-sifre-123',
        consent: true,
      }),
    )
    expect(res.status).toBe(500)
    expect(((await res.json()) as { error: string }).error).toBe('Sunucu yapılandırması eksik')
  })
})

describe('api/health', () => {
  it('ortam değişkenleri eksikse 503 ve hangi kontrolün düştüğünü döner', async () => {
    withoutSupabaseEnv()
    vi.resetModules()
    const { GET } = await import('../api/health.ts')
    const res = await GET(new Request('http://localhost/api/health'))
    expect(res.status).toBe(503)
    const body = (await res.json()) as { ok: boolean; checks: Record<string, boolean> }
    expect(body.ok).toBe(false)
    expect(body.checks).toEqual({ supabase_url: false, service_key: false })
  })
})

describe('passwordProblem', () => {
  it('Supabase şifre hatalarını öğrencinin anlayacağı dile çevirir', async () => {
    const { passwordProblem } = await import('../shared/accounts.ts')
    expect(
      passwordProblem({
        code: 'weak_password',
        message:
          'Password should contain at least one character of each: abcdefghijklmnopqrstuvwxyz, ABCDEFGHIJKLMNOPQRSTUVWXYZ, 0123456789, !@#$%^&*()_+-=[]{};\'\\:"|<>?,./`~.',
        reasons: ['characters'],
      }),
    ).toBe('Şifre en az bir küçük harf, bir büyük harf, bir rakam, bir sembol (örneğin ! ya da ?) içermeli')
    expect(passwordProblem({ message: 'Password should be at least 10 characters.', reasons: ['length'] })).toBe('Şifre en az 10 karakter olmalı')
    expect(passwordProblem({ message: 'Password is known to be weak and easy to guess, please choose a different one.', reasons: ['pwned'] })).toMatch(
      /sızdırılmış/,
    )
  })
})

describe('api/auth şifre kuralları', () => {
  it('kurala uymayan şifreyi Supabase\'e göndermeden neyin eksik olduğunu söyler', async () => {
    const { POST } = await import('../api/auth.ts')
    const res = await POST(
      new Request('http://localhost/api/auth', {
        method: 'POST',
        headers: { 'content-type': 'application/json' },
        body: JSON.stringify({ action: 'join', code: 'ABCD1234', fullName: 'Deneme', username: 'deneme', password: 'Kalemkalem', consent: true }),
      }),
    )
    expect(res.status).toBe(400)
    expect(((await res.json()) as { error: string }).error).toBe('Şifrede eksik olanlar: bir rakam, bir sembol')
  })
})
