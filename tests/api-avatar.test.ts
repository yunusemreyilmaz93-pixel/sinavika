// @vitest-environment node
import { afterEach, describe, expect, it, vi } from 'vitest'
import { MAX_AVATAR_BYTES, moderateImage, validateAvatar, webpSize } from '../api/_lib/avatar.ts'

function lossless(width: number, height: number, extra = 0) {
  const bits = (width - 1) | ((height - 1) << 14)
  const payload = [0x2f, bits & 255, (bits >>> 8) & 255, (bits >>> 16) & 255, (bits >>> 24) & 255, ...new Array(extra).fill(0)]
  const chunk = [...Buffer.from('VP8L'), payload.length & 255, (payload.length >>> 8) & 255, 0, 0, ...payload]
  const total = 4 + chunk.length
  return new Uint8Array([...Buffer.from('RIFF'), total & 255, (total >>> 8) & 255, (total >>> 16) & 255, 0, ...Buffer.from('WEBP'), ...chunk])
}

function lossy(width: number, height: number) {
  const payload = [0, 0, 0, 0x9d, 0x01, 0x2a, width & 255, width >> 8, height & 255, height >> 8, 0, 0, 0, 0]
  const chunk = [...Buffer.from('VP8 '), payload.length, 0, 0, 0, ...payload]
  const total = 4 + chunk.length
  return new Uint8Array([...Buffer.from('RIFF'), total, 0, 0, 0, ...Buffer.from('WEBP'), ...chunk])
}

afterEach(() => vi.unstubAllEnvs())

describe('avatar doğrulama', () => {
  it('kayıpsız ve kayıplı WebP boyutunu okur', () => {
    expect(webpSize(lossless(256, 256))).toEqual({ width: 256, height: 256 })
    expect(webpSize(lossy(256, 300))).toEqual({ width: 256, height: 300 })
  })

  it('WebP olmayan ya da bozuk dosyayı reddeder', () => {
    expect(validateAvatar(new Uint8Array(Buffer.from('GIF89a'.padEnd(64, 'x'))))).toBe('Fotoğraf okunamadı')
    const broken = lossless(256, 256, 10)
    broken[4] = 1
    expect(validateAvatar(broken)).toBe('Fotoğraf okunamadı')
    expect(validateAvatar(new Uint8Array())).toBe('Dosya boş')
  })

  it('boyut, oran ve dosya büyüklüğü sınırlarını uygular', () => {
    expect(validateAvatar(lossless(256, 256))).toBeNull()
    expect(validateAvatar(lossless(64, 64))).toBe('Fotoğraf boyutu uygun değil')
    expect(validateAvatar(lossless(1024, 1024))).toBe('Fotoğraf boyutu uygun değil')
    expect(validateAvatar(lossless(256, 200))).toBe('Fotoğraf kare olmalı')
    expect(validateAvatar(lossless(256, 256, MAX_AVATAR_BYTES))).toBe('Fotoğraf çok büyük')
  })
})

describe('moderasyon', () => {
  const bytes = lossless(256, 256)
  const reply = (body: unknown, ok = true) => vi.fn(async () => ({ ok, json: async () => body }) as Response)

  it('anahtar yoksa yönetici onayına bırakır', async () => {
    vi.stubEnv('OPENAI_API_KEY', '')
    expect(await moderateImage(bytes, reply({}))).toEqual({ verdict: 'unavailable' })
  })

  it('temiz görüntüyü geçirir, uygunsuzu nedenleriyle işaretler', async () => {
    vi.stubEnv('OPENAI_API_KEY', 'test')
    expect(await moderateImage(bytes, reply({ results: [{ flagged: false, categories: {} }] }))).toEqual({ verdict: 'pass' })
    expect(await moderateImage(bytes, reply({ results: [{ flagged: true, categories: { sexual: true, violence: false } }] }))).toEqual({
      verdict: 'flagged',
      reason: 'sexual',
    })
  })

  it('servis hata verirse ya da yanıt bozuksa reddetmez, yönetici onayına bırakır', async () => {
    vi.stubEnv('OPENAI_API_KEY', 'test')
    expect(await moderateImage(bytes, reply({}, false))).toEqual({ verdict: 'unavailable' })
    expect(await moderateImage(bytes, reply({ results: [] }))).toEqual({ verdict: 'unavailable' })
    expect(await moderateImage(bytes, vi.fn(async () => Promise.reject(new Error('ağ'))))).toEqual({ verdict: 'unavailable' })
  })

  it('görüntüyü data URL olarak gönderir ve anahtarı başlığa koyar', async () => {
    vi.stubEnv('OPENAI_API_KEY', 'gizli')
    const fetcher = reply({ results: [{ flagged: false }] })
    await moderateImage(bytes, fetcher)
    const [url, init] = fetcher.mock.calls[0] as unknown as [string, RequestInit]
    expect(url).toBe('https://api.openai.com/v1/moderations')
    expect((init.headers as Record<string, string>).authorization).toBe('Bearer gizli')
    expect(JSON.parse(init.body as string).input[0].image_url.url).toMatch(/^data:image\/webp;base64,/)
  })
})
