// @vitest-environment node
import { describe, expect, it } from 'vitest'
import { deviceOf, isBot, normalizePath, referrerName, visitorHash } from '../api/_lib/hit.ts'

describe('ziyaret yardımcıları', () => {
  it('botları ve boş tarayıcı bilgisini ayıklar', () => {
    expect(isBot(null)).toBe(true)
    expect(isBot('Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)')).toBe(true)
    expect(isBot('Mozilla/5.0 (Linux; Android 14) Chrome/120 Mobile Safari/537.36')).toBe(false)
  })

  it('cihazı tarayıcı bilgisinden çıkarır', () => {
    expect(deviceOf('Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X)')).toBe('mobil')
    expect(deviceOf('Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/120')).toBe('masaüstü')
  })

  it('yolu temizler, kimlikleri kalıba çevirir, tehlikeli girdiyi reddeder', () => {
    expect(normalizePath('/Hakkinda/?a=1#x')).toBe('/hakkinda')
    expect(normalizePath('/konu-anlatimi/lgs/matematik/uslu-ifadeler/')).toBe('/konu-anlatimi/lgs/matematik/uslu-ifadeler')
    expect(normalizePath('/app/konular/12')).toBe('/app/konular/:id')
    expect(normalizePath('')).toBe('/')
    expect(normalizePath('javascript:alert(1)')).toBeNull()
    expect(normalizePath('/a b')).toBeNull()
    expect(normalizePath('/' + 'a'.repeat(200))).toBeNull()
    expect(normalizePath(42)).toBeNull()
  })

  it('kaynağı arama motoru, sosyal ağ ya da site adı olarak sınıflar', () => {
    expect(referrerName('https://www.google.com.tr/', null, 'yolumnet.vercel.app')).toBe('google')
    expect(referrerName('https://l.instagram.com/?u=x', null, 'yolumnet.vercel.app')).toBe('instagram')
    expect(referrerName('https://t.co/abc', null, 'yolumnet.vercel.app')).toBe('x')
    expect(referrerName('https://www.ornek-blog.com/yazi', null, 'yolumnet.vercel.app')).toBe('ornek-blog.com')
    expect(referrerName('', null, 'yolumnet.vercel.app')).toBe('doğrudan')
    expect(referrerName('https://yolumnet.vercel.app/hakkinda', null, 'yolumnet.vercel.app')).toBe('doğrudan')
    expect(referrerName('https://google.com', 'Newsletter', 'x.com')).toBe('newsletter')
    expect(referrerName('https://google.com', '<script>', 'x.com')).toBe('google')
  })

  it('aynı gün aynı kişiye aynı özet, ertesi gün farklı özet verir', () => {
    const a = visitorHash('gizli', '2026-10-23', '1.2.3.4', 'UA')
    expect(a).toBe(visitorHash('gizli', '2026-10-23', '1.2.3.4', 'UA'))
    expect(a).not.toBe(visitorHash('gizli', '2026-10-24', '1.2.3.4', 'UA'))
    expect(a).not.toBe(visitorHash('gizli', '2026-10-23', '1.2.3.5', 'UA'))
    expect(a).toMatch(/^[0-9a-f]{32}$/)
  })
})
