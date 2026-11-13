// @vitest-environment node
import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'
// @ts-expect-error saf JavaScript modül
import { pageHead, verificationTag } from '../scripts/seo/html.mjs'
// @ts-expect-error saf JavaScript modül
import { appPages } from '../scripts/seo/pages.mjs'

const router = readFileSync(new URL('../src/router.tsx', import.meta.url), 'utf8')
const wrangler = JSON.parse(readFileSync(new URL('../wrangler.jsonc', import.meta.url), 'utf8')) as {
  assets: { html_handling: string; not_found_handling: string; run_worker_first: string[] }
}
// Worker'ın uygulama kabuğuna yönlendirdiği yollar. Geri kalan adresler dist içindeki aynı adlı .html dosyasından sunulur
const shellRoutes = wrangler.assets.run_worker_first.filter((r) => !r.startsWith('/api'))

// Üst düzey rotalar: hizalama 6 boşlukla başlayan `{ path: '...'` satırları
const topLevel = [...router.matchAll(/^ {6}(?: {4})?\{ path: '([^*][^']*)'/gm)].map((m) => m[1])

describe('rota koruması', () => {
  it('router.tsx üst düzey rotaları okunabiliyor', () => {
    expect(topLevel).toEqual(expect.arrayContaining(['hakkinda', 'kvkk', 'giris', 'katil', 'rapor/:token']))
  })

  it('/hakkinda gibi adresler hakkinda.html dosyasından sunulur, bilinmeyen adres 404 olur', () => {
    expect(wrangler.assets.html_handling).toBe('auto-trailing-slash')
    expect(wrangler.assets.not_found_handling).toBe('404-page')
  })

  it('her uygulama rotası ya kendi HTML dosyasına ya da uygulama kabuğuna sahip, yoksa 404 olur', () => {
    const pages = (appPages as { path: string }[]).map((p) => p.path)
    const app = router.match(/path: 'app',/) ? ['app'] : []
    for (const path of [...topLevel, ...app]) {
      const root = path.split('/')[0]
      const covered = pages.includes(`/${root}`) || shellRoutes.some((r) => r === `/${root}` || r.startsWith(`/${root}/`))
      expect(covered, `/${path} yayında 404 verir`).toBe(true)
    }
  })

  it('giriş ve uygulama sayfaları arama motoruna kapalı', () => {
    for (const p of appPages.filter((p: { path: string }) => ['/giris', '/katil', '/test-giris'].includes(p.path))) expect(p.noindex).toBe(true)
  })
})

describe('pageHead', () => {
  const shell = readFileSync(new URL('../index.html', import.meta.url), 'utf8')

  it('başlık, açıklama ve canonical sayfaya göre değişir', () => {
    const html = pageHead(shell, { path: '/hakkinda', title: 'Hakkında "x"', description: 'Kısa <açıklama>', site: 'https://ornek.com' })
    expect(html).toContain('<title>Hakkında &quot;x&quot;</title>')
    expect(html).toContain('<link rel="canonical" href="https://ornek.com/hakkinda" />')
    expect(html).toContain('content="Kısa &lt;açıklama&gt;"')
    expect(html).not.toContain('noindex')
  })

  it('noindex sayfaya robots etiketi ekler', () => {
    const html = pageHead(shell, { path: '/giris', title: 'Giriş', description: 'x', noindex: true, site: 'https://ornek.com' })
    expect(html).toContain('<meta name="robots" content="noindex, nofollow" />')
  })
})

describe('herkese açık anlatım sayfaları', () => {
  it('anlatım adresleri uygulama kabuğuna gitmez, kendi HTML dosyalarından sunulur', () => {
    expect(shellRoutes.some((r) => r.startsWith('/konu-anlatimi'))).toBe(false)
  })
})

describe('araçlar ve çalışma programları', () => {
  it('bu adresler uygulama kabuğuna gitmez, kendi HTML dosyalarından sunulur', () => {
    expect(shellRoutes.some((r) => r.startsWith('/araclar') || r.startsWith('/calisma-programlari'))).toBe(false)
  })
})

describe('YKS bölümleri ve Search Console', () => {
  it('bölüm adresleri uygulama kabuğuna gitmez, kendi HTML dosyalarından sunulur', () => {
    expect(shellRoutes.some((r) => r.startsWith('/yks-bolumleri'))).toBe(false)
  })

  it('doğrulama etiketi yalnızca ortam değişkeni varsa eklenir', () => {
    const before = process.env.GOOGLE_SITE_VERIFICATION
    delete process.env.GOOGLE_SITE_VERIFICATION
    expect(verificationTag()).toBe('')
    process.env.GOOGLE_SITE_VERIFICATION = 'abc"123'
    expect(verificationTag()).toBe('<meta name="google-site-verification" content="abc&quot;123" />')
    if (before === undefined) delete process.env.GOOGLE_SITE_VERIFICATION
    else process.env.GOOGLE_SITE_VERIFICATION = before
  })
})
